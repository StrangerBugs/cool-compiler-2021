from inspect import Attribute
from typing import List, Optional

import cool.semantics.utils.astnodes as ast
import cool.semantics.utils.errors as err
import cool.visitor as visitor
from cool.semantics.utils.scope import (
    Context,
    ErrorType,
    Method,
    Scope,
    SemanticError,
    Type,
)


class TypeChecker:
    def __init__(self, context: Context, errors: List[str]):
        self.context: Context = context
        self.errors: List[str] = errors
        self.current_type: Optional[Type] = None
        self.current_method: Optional[Method] = None
        self.current_attribute: Optional[Attribute] = None

    @visitor.on("node")
    def visit(self, node, scope):
        pass

    @visitor.when(ast.ProgramNode)
    def visit(self, node: ast.ProgramNode, scope: Scope = None):
        if scope is None:
            scope = Scope()

        for elem in node.declarations:
            self.visit(elem, scope.create_child())

        return scope

    @visitor.when(ast.ClassDeclarationNode)
    def visit(self, node: ast.ClassDeclarationNode, scope: Scope):
        self.current_type = self.context.get_type(node.id)

        attrs = [
            feature
            for feature in node.features
            if isinstance(feature, ast.AttrDeclarationNode)
        ]
        methods = [
            feature
            for feature in node.features
            if isinstance(feature, ast.MethodDeclarationNode)
        ]

        for attr, attr_owner in self.current_type.all_attributes():
            if attr_owner != self.current_type:
                scope.define_variable(attr.name, attr.type)

        for attr in attrs:
            self.visit(attr, scope)

        for method in methods:
            self.visit(method, scope.create_child())

    @visitor.when(ast.AttrDeclarationNode)
    def visit(self, node: ast.AttrDeclarationNode, scope: Scope):
        if node.id == "self":
            self.errors.append(err.SELF_INVALID_ATTRIBUTE_ID % (node.line, node.column))

        try:
            attr_type = (
                self.context.get_type(node.type)
                if node.type != "SELF_TYPE"
                else self.current_type
            )
        except SemanticError:
            attr_type = ErrorType()

        scope.define_variable("self", self.current_type)

        # set the current attribute for analyze the body
        # and set the self.current_method variable to None
        self.current_attribute = self.current_type.get_attribute(node.id)
        self.current_method = None

        if node.expr is not None:
            expr_type = self.visit(node.expr, scope.create_child())
            if not expr_type.conforms_to(attr_type):
                line, column = node.expr_position
                self.errors.append(
                    err.INCOMPATIBLE_TYPES
                    % (line, column, expr_type.name, attr_type.name)
                )
        scope.define_variable(node.id, attr_type)

    @visitor.when(ast.MethodDeclarationNode)
    def visit(self, node: ast.MethodDeclarationNode, scope: Scope):
        self.current_method = self.current_type.get_method(node.id)
        self.current_attribute = None

        # Parameters can hide the attribute declaration, that's why we are not checking if there is defined,
        # instead we are checking for local declaration. Also it is checked that the static type of a parameter is
        # different of SELF_TYPE.

        scope.define_variable("self", self.current_type)

        for param_name, param_type in zip(
            self.current_method.param_names, self.current_method.param_types
        ):
            if not scope.is_local(param_name):
                if param_type.name == "SELF_TYPE":
                    self.errors.append(err.INVALID_PARAM_TYPE % "SELF_TYPE")
                    scope.define_variable(param_name, ErrorType())
                else:
                    try:
                        scope.define_variable(
                            param_name, self.context.get_type(param_type.name)
                        )
                    except SemanticError:
                        scope.define_variable(param_name, ErrorType())
            else:
                self.errors.append(
                    err.LOCAL_ALREADY_DEFINED
                    % (node.line, node.column, param_name, self.current_method.name)
                )

        try:
            return_type = (
                self.context.get_type(node.return_type)
                if node.return_type != "SELF_TYPE"
                else self.current_type
            )
        except SemanticError:
            return_type = ErrorType()

        expr_type = self.visit(node.body, scope)

        if not expr_type.conforms_to(return_type):
            self.errors.append(
                err.INCOMPATIBLE_TYPES
                % (node.line, node.column, expr_type.name, return_type.name)
            )

    @visitor.when(ast.LetNode)
    def visit(self, node: ast.LetNode, scope: Scope):
        for i, (_id, _type, _expr) in enumerate(node.declarations):
            if _id == "self":
                line, column = node.declaration_names_positions[i]
                self.errors.append(err.SELF_USED_IN_LET % (line, column))
                continue

            try:
                var_static_type = (
                    self.context.get_type(_type)
                    if _type != "SELF_TYPE"
                    else self.current_type
                )
            except SemanticError:
                line, column = node.declaration_types_positions[i]
                self.errors.append(err.UNDEFINED_TYPE % (line, column, _type))
                var_static_type = ErrorType()

            # if scope.is_local(_id):
            #     feature = self.current_method or self.current_attribute
            #     self.errors.append(
            #         err.LOCAL_ALREADY_DEFINED
            #         % (node.line, node.column, _id, feature.name)
            #     )
            # else:
            scope.define_variable(_id, var_static_type)

            expr_type = (
                self.visit(_expr, scope.create_child()) if _expr is not None else None
            )
            if expr_type is not None and not expr_type.conforms_to(var_static_type):
                self.errors.append(
                    err.INCOMPATIBLE_TYPES
                    % (node.line, node.column, expr_type.name, var_static_type.name)
                )

        return self.visit(node.expr, scope.create_child())

    @visitor.when(ast.AssignNode)
    def visit(self, node: ast.AssignNode, scope: Scope):
        var_info = scope.find_variable(node.id)

        if var_info.name == "self":
            self.errors.append(err.SELF_IS_READONLY % (node.line, node.column))

        expr_type = self.visit(node.expr, scope.create_child())

        if var_info is None:
            self.errors.append(
                err.UNDEFINED_VARIABLE
                % (node.line, node.column, node.id, self.current_method.name)
            )
        else:
            if not expr_type.conforms_to(var_info.type):
                self.errors.append(
                    err.INCOMPATIBLE_TYPES
                    % (node.line, node.column, expr_type.name, var_info.type.name)
                )

        return expr_type

    @visitor.when(ast.BlockNode)
    def visit(self, node: ast.BlockNode, scope: Scope):
        child_scope = scope.create_child()
        return_type = ErrorType()
        for expr in node.expressions:
            return_type = self.visit(expr, child_scope)
        return return_type

    @visitor.when(ast.ConditionalNode)
    def visit(self, node: ast.ConditionalNode, scope: Scope):
        if_type = self.visit(node.if_expr, scope)
        then_type = self.visit(node.then_expr, scope)
        else_type = self.visit(node.else_expr, scope)
        if if_type != self.context.get_type("Bool"):
            self.errors.append(
                err.INCOMPATIBLE_TYPES % (node.line, node.column, if_type.name, "Bool")
            )
        return then_type.join(else_type)

    @visitor.when(ast.WhileNode)
    def visit(self, node: ast.WhileNode, scope: Scope):
        condition = self.visit(node.condition, scope)
        if condition != self.context.get_type("Bool"):
            self.errors.append(
                err.INCOMPATIBLE_TYPES
                % (node.line, node.column, condition.name, "Bool")
            )

        self.visit(node.body, scope.create_child())
        return self.context.get_type("Object")

    @visitor.when(ast.SwitchCaseNode)
    def visit(self, node: ast.SwitchCaseNode, scope: Scope):
        self.visit(node.expr, scope)
        types = []
        visited = set()
        for i, (identifier, type_name, expr) in enumerate(node.cases):
            new_scope = scope.create_child()
            try:
                if type_name != "SELF_TYPE":
                    new_scope.define_variable(
                        identifier, self.context.get_type(type_name)
                    )
                else:
                    self.errors.append(err.INVALID_CASE_TYPE % type_name)
            except SemanticError:
                new_scope.define_variable(identifier, ErrorType())
                line, column = node.cases_positions[i]
                self.errors.append(
                    err.UNDEFINED_TYPE_IN_BRANCH % (line, column, type_name)
                )

            # Cannot be dublicate Branches types
            if type_name in visited:
                line, column = node.cases_positions[i]
                self.errors.append(
                    err.DUPLICATE_BARNCH_IN_CASE % (line, column, type_name)
                )

            visited.add(type_name)
            types.append(self.visit(expr, new_scope))

        return Type.multi_join(types)

    @visitor.when(ast.MethodCallNode)
    def visit(self, node: ast.MethodCallNode, scope: Scope):
        if node.obj is None:
            node.obj = ast.VariableNode("self")
        obj_type = self.visit(node.obj, scope)

        if node.type is not None:
            try:
                ancestor_type = self.context.get_type(node.type)
            except SemanticError:
                ancestor_type = ErrorType()
                line, column = node.type_position
                self.errors.append(err.UNDEFINED_TYPE % (line, column, node.type))

            if not obj_type.conforms_to(ancestor_type):
                line, column = node.type_position
                self.errors.append(
                    err.INVALID_ANCESTOR
                    % (line, column, obj_type.name, ancestor_type.name)
                )
        else:
            ancestor_type = obj_type

        try:
            method = ancestor_type.get_method(node.id)
        except SemanticError:
            line, column = node.id_position
            self.errors.append(
                err.DISPATCH_UNDEFINED_METHOD % (line, column, node.id, obj_type.name)
            )

            for arg in node.args:
                self.visit(arg, scope)
            return ErrorType()

        args_count = len(node.args)
        params_count = len(method.param_names)
        if args_count != params_count:
            line, column = node.id_position
            self.errors.append(
                err.DISPATCH_WITH_WRONG_NUMBER_OF_ARGS
                % (line, column, method.name, obj_type.name, params_count, args_count)
            )

        number_of_args = min(args_count, params_count)
        for i, arg in enumerate(node.args[:number_of_args]):
            arg_type = self.visit(arg, scope)
            if not arg_type.conforms_to(method.param_types[i]):
                line, column = node.args_positions[i]
                self.errors.append(
                    err.INCOMPATIBLE_TYPES
                    % (
                        line,
                        column,
                        arg_type.name,
                        method.param_types[i].name,
                    )
                )

        return (
            method.return_type
            if method.return_type.name != "SELF_TYPE"
            else ancestor_type
        )

    @visitor.when(ast.IntegerNode)
    def visit(self, node: ast.IntegerNode, scope: Scope):
        return self.context.get_type("Int")

    @visitor.when(ast.StringNode)
    def visit(self, node: ast.StringNode, scope: Scope):
        return self.context.get_type("String")

    @visitor.when(ast.BooleanNode)
    def visit(self, node: ast.BooleanNode, scope: Scope):
        return self.context.get_type("Bool")

    @visitor.when(ast.VariableNode)
    def visit(self, node: ast.VariableNode, scope: Scope):
        variable = scope.find_variable(node.lex)
        if variable is None:
            if self.current_attribute is not None:
                name = self.current_attribute.name
            else:
                name = self.current_method.name

            self.errors.append(
                err.UNDEFINED_VARIABLE % (node.line, node.column, node.lex, name)
            )
            return ErrorType()
        return variable.type

    @visitor.when(ast.InstantiateNode)
    def visit(self, node: ast.InstantiateNode, scope: Scope):
        try:
            return (
                self.context.get_type(node.lex)
                if node.lex != "SELF_TYPE"
                else self.current_type
            )
        except SemanticError as e:
            line, column = node.type_position
            self.errors.append(err.UNDEFINED_NEW_TYPE % (line, column, node.lex))
            return ErrorType()

    @visitor.when(ast.NegationNode)
    def visit(self, node: ast.NegationNode, scope: Scope):
        return self._check_unary_operation(
            node, scope, "not", self.context.get_type("Bool")
        )

    @visitor.when(ast.ComplementNode)
    def visit(self, node: ast.ComplementNode, scope: Scope):
        return self._check_unary_operation(
            node, scope, "~", self.context.get_type("Int")
        )

    @visitor.when(ast.IsVoidNode)
    def visit(self, node: ast.IsVoidNode, scope: Scope):
        self.visit(node.expr, scope)
        return self.context.get_type("Bool")

    @visitor.when(ast.PlusNode)
    def visit(self, node: ast.PlusNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "+", self.context.get_type("Int")
        )

    @visitor.when(ast.MinusNode)
    def visit(self, node: ast.MinusNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "-", self.context.get_type("Int")
        )

    @visitor.when(ast.StarNode)
    def visit(self, node: ast.StarNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "*", self.context.get_type("Int")
        )

    @visitor.when(ast.DivNode)
    def visit(self, node: ast.DivNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "/", self.context.get_type("Int")
        )

    @visitor.when(ast.LessEqualNode)
    def visit(self, node: ast.LessEqualNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "<=", self.context.get_type("Bool")
        )

    @visitor.when(ast.LessThanNode)
    def visit(self, node: ast.LessThanNode, scope: Scope):
        return self._check_int_binary_operation(
            node, scope, "<", self.context.get_type("Bool")
        )

    @visitor.when(ast.EqualNode)
    def visit(self, node: ast.EqualNode, scope: Scope):
        left_type = self.visit(node.left, scope)
        right_type = self.visit(node.right, scope)

        basic_types = ("Int", "String", "Bool")
        if (
            left_type.name in basic_types or left_type.name in basic_types
        ) and left_type.name != right_type.name:
            self.errors.append(
                err.INVALID_EQ_COMPARISON_OPERATION % (node.line, node.column)
            )
        return self.context.get_type("Bool")

    def _check_int_binary_operation(
        self, node: ast.BinaryNode, scope: Scope, operation: str, return_type: Type
    ):
        left_type = self.visit(node.left, scope)
        right_type = self.visit(node.right, scope)

        if left_type == right_type == self.context.get_type("Int"):
            return return_type
        self.errors.append(
            err.INVALID_BINARY_OPERATION
            % (node.line, node.column, operation, left_type.name, right_type.name)
        )
        return ErrorType()

    def _check_unary_operation(
        self, node: ast.UnaryNode, scope: Scope, operation: str, expected_type: Type
    ):
        typex = self.visit(node.expr, scope)
        if typex == expected_type:
            return typex
        self.errors.append(
            err.INVALID_UNARY_OPERATION
            % (node.line, node.column, operation, typex.name)
        )
        return ErrorType()
