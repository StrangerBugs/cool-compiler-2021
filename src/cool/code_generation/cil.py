from typing import Any, List, Tuple
import cool.visitor as visitor


class Node:
    pass


class ProgramNode(Node):
    def __init__(
        self,
        dottypes: List["TypeNode"],
        dotdata: List["DataNode"],
        dotcode: List["FunctionNode"],
    ):
        self.dottypes: List[TypeNode] = dottypes
        self.dotdata: List[DataNode] = dotdata
        self.dotcode: List[FunctionNode] = dotcode


class TypeNode(Node):
    def __init__(self, name: str):
        self.name: str = name
        self.attributes: List[str] = []
        self.methods: List[Tuple[str, str]] = []


class DataNode(Node):
    def __init__(self, name: str, value: Any):
        self.name: str = name
        self.value: Any = value


class FunctionNode(Node):
    def __init__(
        self,
        name: str,
        params: List["ParamNode"],
        local_vars: List["LoadNode"],
        instructions: List["InstructionNode"],
    ):
        self.name: str = name
        self.params: List[ParamNode] = params
        self.local_vars: List[LocalNode] = local_vars
        self.instructions: List[InstructionNode] = instructions


class ParamNode(Node):
    def __init__(self, name: str):
        self.name: str = name


class LocalNode(Node):
    def __init__(self, name: str):
        self.name: str = name


class InstructionNode(Node):
    pass


class AssignNode(InstructionNode):
    def __init__(self, dest: str, source: str):
        self.dest: str = dest
        self.source: str = source


class ArithmeticNode(InstructionNode):
    def __init__(self, dest: str, left: str, right: str):
        self.dest: str = dest
        self.left: str = left
        self.right: str = right


class PlusNode(ArithmeticNode):
    pass


class MinusNode(ArithmeticNode):
    pass


class StarNode(ArithmeticNode):
    pass


class DivNode(ArithmeticNode):
    pass


class LessEqualNode(ArithmeticNode):
    pass


class LessThanNode(ArithmeticNode):
    pass


class EqualNode(ArithmeticNode):
    pass


class GetAttribNode(InstructionNode):
    def __init__(self, dest: str, instance: str, attr: str) -> None:
        self.dest: str = dest
        self.instance: str = instance
        self.attr: str = attr


class SetAttribNode(InstructionNode):
    def __init__(self, instance: str, attr: str, source: str) -> None:
        self.instance: str = instance
        self.attr: str = attr
        self.source: str = source


class GetIndexNode(InstructionNode):
    pass


class SetIndexNode(InstructionNode):
    pass


class AllocateNode(InstructionNode):
    def __init__(self, itype: str, dest: str):
        self.type: str = itype
        self.dest: str = dest


class ArrayNode(InstructionNode):
    pass


class TypeOfNode(InstructionNode):
    def __init__(self, obj: str, dest: str):
        self.obj: str = obj
        self.dest: str = dest


class LabelNode(InstructionNode):
    pass


class GotoNode(InstructionNode):
    pass


class GotoIfNode(InstructionNode):
    pass


class StaticCallNode(InstructionNode):
    def __init__(self, function, dest):
        self.function = function
        self.dest = dest


class DynamicCallNode(InstructionNode):
    def __init__(self, xtype: str, method: str, dest: str):
        self.type = xtype
        self.method = method
        self.dest = dest


class ArgNode(InstructionNode):
    def __init__(self, name: str):
        self.name: str = name


class ReturnNode(InstructionNode):
    def __init__(self, value=None):
        self.value = value


class LoadNode(InstructionNode):
    def __init__(self, dest, msg):
        self.dest = dest
        self.msg = msg


class LengthNode(InstructionNode):
    pass


class ConcatNode(InstructionNode):
    pass


class PrefixNode(InstructionNode):
    pass


class SubstringNode(InstructionNode):
    pass


class ToStrNode(InstructionNode):
    def __init__(self, dest, ivalue):
        self.dest = dest
        self.ivalue = ivalue


class ReadNode(InstructionNode):
    def __init__(self, dest):
        self.dest = dest


class PrintNode(InstructionNode):
    def __init__(self, str_addr):
        self.str_addr = str_addr


class CILFormatter(object):
    @visitor.on("node")
    def visit(self, node):
        pass

    @visitor.when(ProgramNode)
    def visit(self, node):
        dottypes = "\n".join(self.visit(t) for t in node.dottypes)
        dotdata = "\n".join(self.visit(t) for t in node.dotdata)
        dotcode = "\n".join(self.visit(t) for t in node.dotcode)

        return f".TYPES\n{dottypes}\n\n.DATA\n{dotdata}\n\n.CODE\n{dotcode}"

    @visitor.when(TypeNode)
    def visit(self, node):
        attributes = "\n\t".join(f"attribute {x}" for x in node.attributes)
        methods = "\n\t".join(f"method {x}: {y}" for x, y in node.methods)

        return f"type {node.name} {{\n\t{attributes}\n\n\t{methods}\n}}"

    @visitor.when(FunctionNode)
    def visit(self, node):
        params = "\n\t".join(self.visit(x) for x in node.params)
        local_vars = "\n\t".join(self.visit(x) for x in node.local_vars)
        instructions = "\n\t".join(self.visit(x) for x in node.instructions)

        return f"function {node.name} {{\n\t{params}\n\n\t{local_vars}\n\n\t{instructions}\n}}"

    @visitor.when(ParamNode)
    def visit(self, node):
        return f"PARAM {node.name}"

    @visitor.when(LocalNode)
    def visit(self, node):
        return f"LOCAL {node.name}"

    @visitor.when(AssignNode)
    def visit(self, node):
        return f"{node.dest} = {node.source}"

    @visitor.when(PlusNode)
    def visit(self, node):
        return f"{node.dest} = {node.left} + {node.right}"

    @visitor.when(MinusNode)
    def visit(self, node):
        return f"{node.dest} = {node.left} - {node.right}"

    @visitor.when(StarNode)
    def visit(self, node):
        return f"{node.dest} = {node.left} * {node.right}"

    @visitor.when(DivNode)
    def visit(self, node):
        return f"{node.dest} = {node.left} / {node.right}"

    @visitor.when(AllocateNode)
    def visit(self, node):
        return f"{node.dest} = ALLOCATE {node.type}"

    @visitor.when(TypeOfNode)
    def visit(self, node):
        return f"{node.dest} = TYPEOF {node.type}"

    @visitor.when(StaticCallNode)
    def visit(self, node):
        return f"{node.dest} = CALL {node.function}"

    @visitor.when(DynamicCallNode)
    def visit(self, node):
        return f"{node.dest} = VCALL {node.type} {node.method}"

    @visitor.when(GetAttribNode)
    def visit(self, node: GetAttribNode):
        return f"{node.dest} = GETATTR {node.instance} {node.attr}"

    @visitor.when(SetAttribNode)
    def visit(self, node: SetAttribNode):
        return f"SETATTR {node.instance} {node.attr} {node.source}"

    @visitor.when(ArgNode)
    def visit(self, node):
        return f"ARG {node.name}"

    @visitor.when(ReturnNode)
    def visit(self, node):
        return f'\n\tRETURN {node.value if node.value is not None else ""}'
