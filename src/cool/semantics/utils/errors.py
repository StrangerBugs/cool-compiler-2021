ATTRIBUTE_OVERRIDE_ERROR = '(%d, %d) - OverrideError: Attribute "%s" already defined in "%s", attributes cannot be overridden'
METHOD_OVERRIDE_ERROR = '(%d, %d) - OverrideError: Method "%s" already defined in "%s" with a different signature.'

INCOMPATIBLE_TYPES = '(%d, %d) - TypeError: Cannot convert "%s" into "%s".'
INVALID_PARAM_TYPE = '(%d, %d) - TypeError: "%s" cannot be a static type of a parameter.'
INVALID_CASE_TYPE = '(%d, %d) - TypeError: "%s" cannot be a static type of a case branch.'
INVALID_PARENT_TYPE = '(%d, %d) - TypeError: Class "%s" cannot inherits from "%s"'
INVALID_ANCESTOR = '(%d, %d) - TypeError: Class "%s" has no an ancestor class "%s".'

INVALID_BINARY_OPERATION = '(%d, %d) - OperationError: Operation "%s" is not defined between "%s" and "%s".'
INVALID_UNARY_OPERATION = '(%d, %d) - OperationError: Operation "%s" is not defined for "%s".'

SELF_IS_READONLY = '(%d, %d) - NameError: Variable "self" is read-only.'
SELF_INVALID_ATTRIBUTE_ID = '(%d, %d) - NameError: Cannot set "self" as attribute of a class.'
SELF_INVALID_PARAM_ID = '(%d, %d) - NameError: Cannot set "self" as parameter of a method.'
LOCAL_ALREADY_DEFINED = '(%d, %d) - NameError: Variable "%s" is already defined in method "%s".'
VARIABLE_NOT_DEFINED = '(%d, %d) - NameError: Variable "%s" is not defined in "%s".'

INFERENCE_ERROR_ATTRIBUTE = '(%d, %d) - InferenceError: Cannot infer type for attribute "%s".'
INFERENCE_ERROR_PARAMETER = '(%d, %d) - InferenceError: Cannot infer type for parameter "%s".'
INFERENCE_ERROR_VARIABLE = '(%d, %d) - InferenceError: Cannot infer type for variable "%s".'
INFERENCE_ERROR_METHOD = '(%d, %d) - InferenceError: Cannot infer return type for method "%s".'

DIVIDE_BY_ZERO = '(%d, %d) - ZeroDivisionError: Division by zero.'
INPUT_INT_ERROR = '(%d, %d) - InputError: Expected a number.'
MAIN_CLASS_NOT_FOUND = '(%d, %d) - MainClassNotFound: no Main class in program.'
MAIN_METHOD_NOT_FOUND = '(%d, %d) - MainMethodNotFound: no main method in class Main.'
VOID_EXPRESSION = '(%d, %d) - VoidReferenceError: Object reference not set to an instance of an object.'
CASE_OF_ERROR = '(%d, %d) - CaseOfError: No branch matches wit de dynamic type of the case expression.'
