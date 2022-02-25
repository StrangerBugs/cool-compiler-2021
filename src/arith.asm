.data
	type_Object: .word 8
	type_Object_inherits_from: .word 0
	type_Object_attributes: .word 0
	type_Object_name_size: .word 6
	type_Object_name: .asciiz "Object"
	
	type_IO: .word 8
	type_IO_inherits_from: .word type_Object
	type_IO_attributes: .word 0
	type_IO_name_size: .word 2
	type_IO_name: .asciiz "IO"
	
	type_Int: .word 8
	type_Int_inherits_from: .word type_Object
	type_Int_attributes: .word 0
	type_Int_name_size: .word 3
	type_Int_name: .asciiz "Int"
	
	type_String: .word 8
	type_String_inherits_from: .word type_Object
	type_String_attributes: .word 0
	type_String_name_size: .word 6
	type_String_name: .asciiz "String"
	
	type_Bool: .word 8
	type_Bool_inherits_from: .word type_Object
	type_Bool_attributes: .word 0
	type_Bool_name_size: .word 4
	type_Bool_name: .asciiz "Bool"
	
	type_A: .word 12
	type_A_inherits_from: .word type_Object
	type_A_attributes: .word 1
	type_A_name_size: .word 1
	type_A_name: .asciiz "A"
	
	type_B: .word 12
	type_B_inherits_from: .word type_A
	type_B_attributes: .word 1
	type_B_name_size: .word 1
	type_B_name: .asciiz "B"
	
	type_C: .word 12
	type_C_inherits_from: .word type_B
	type_C_attributes: .word 1
	type_C_name_size: .word 1
	type_C_name: .asciiz "C"
	
	type_D: .word 12
	type_D_inherits_from: .word type_B
	type_D_attributes: .word 1
	type_D_name_size: .word 1
	type_D_name: .asciiz "D"
	
	type_E: .word 12
	type_E_inherits_from: .word type_D
	type_E_attributes: .word 1
	type_E_name_size: .word 1
	type_E_name: .asciiz "E"
	
	type_A2I: .word 8
	type_A2I_inherits_from: .word type_Object
	type_A2I_attributes: .word 0
	type_A2I_name_size: .word 3
	type_A2I_name: .asciiz "A2I"
	
	type_Main: .word 24
	type_Main_inherits_from: .word type_IO
	type_Main_attributes: .word 4
	type_Main_name_size: .word 4
	type_Main_name: .asciiz "Main"
	
	buffer_input: .space 1024
	debug_log: .asciiz "debug_log\n"

.text
	function_add:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Addition operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_sub:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Subtraction operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		sub $t2, $t0, $t1 # $t2 = $t0 - $t1
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_mult:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Multiplication operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		mult $t0, $t1 # $t2 = $t0 * $t1
		mflo $t2
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_div:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Division operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		div $t0, $t1 # $t2 = $t0 / $t1
		mflo $t2
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_xor:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Xor operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_less_than:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Less than operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_less_than_or_equal:
		# Function parameters
		#   $ra = 12($sp)
		#   a = 8($sp)
		#   b = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Less than operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 4($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		sle $t2, $t0, $t1 # $t2 = $t0 <= $t1
		
		lw $t0, 0($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_equal:
		# Function parameters
		#   $ra = 40($sp)
		#   a = 36($sp)
		#   b = 32($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -32
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 28($sp) # internal_0 = address of allocated object Int
		
		# internal_1 = typeof a that is the first word of the object
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		sw $t1, 24($sp)
		
		# internal_2 = direction of Int
		la $t0, type_Int
		sw $t0, 20($sp)
		
		# internal_3 = direction of Bool
		la $t0, type_Bool
		sw $t0, 16($sp)
		
		# internal_4 = direction of String
		la $t0, type_String
		sw $t0, 12($sp)
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 8($sp) # internal_5 = address of allocated object Int
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 4($sp) # internal_6 = address of allocated object Int
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_7 = address of allocated object Int
		
		# internal_5 = EqualAddress(internal_1, internal_2)
		lw $t0, 24($sp)
		lw $t1, 20($sp)
		seq $t2, $t0, $t1
		lw $t0, 8($sp)
		sw $t2, 8($t0)
		
		# internal_6 = EqualAddress(internal_1, internal_3)
		lw $t0, 24($sp)
		lw $t1, 16($sp)
		seq $t2, $t0, $t1
		lw $t0, 4($sp)
		sw $t2, 8($t0)
		
		# internal_7 = EqualAddress(internal_1, internal_4)
		lw $t0, 24($sp)
		lw $t1, 12($sp)
		seq $t2, $t0, $t1
		lw $t0, 0($sp)
		sw $t2, 8($t0)
		
		# If internal_5 then goto a_is_type_int_or_bool
		lw $t0, 8($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, a_is_type_int_or_bool
		
		# If internal_6 then goto a_is_type_int_or_bool
		lw $t0, 4($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, a_is_type_int_or_bool
		
		# If internal_7 then goto a_is_type_string
		lw $t0, 0($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, a_is_type_string
		
		# Jumping to a_is_type_object
		j a_is_type_object
		
		a_is_type_int_or_bool:
		
		# internal_0 = EqualInt(a, b)
		lw $t0, 36($sp)
		lw $t0, 8($t0)
		lw $t1, 32($sp)
		lw $t1, 8($t1)
		seq $t2, $t0, $t1
		lw $t0, 28($sp)
		sw $t2, 8($t0)
		
		# Jumping to end_of_equal
		j end_of_equal
		
		a_is_type_string:
		
		# internal_0 = EqualStr(a, b)
		lw $t0, 36($sp)
		lw $t1, 32($sp)
		addi $t0, $t0, 8
		addi $t1, $t1, 8
		
		# By default we assume the strings are equals
		addi $t4, $zero, 1
		lw $t5, 28($sp)
		sw $t4, 8($t5)
		
		while_compare_strings_start:
		lb $t2, 0($t0)
		lb $t3, 0($t1)
		beq $t2, $t3, while_compare_strings_update
		
		# The strings are no equals
		lw $t5, 28($sp)
		sw $zero, 8($t5)
		j while_compare_strings_end
		
		while_compare_strings_update:
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		beq $t2, $zero, while_compare_strings_end
		j while_compare_strings_start
		while_compare_strings_end:
		
		# Jumping to end_of_equal
		j end_of_equal
		
		a_is_type_object:
		
		# Equal operation
		lw $t0, 36($sp) # Save in $t0 the left operand address
		lw $t1, 32($sp) # Save in $t1 the right operand address
		seq $t2, $t0, $t1 # $t2 = $t0 == $t1
		
		lw $t0, 28($sp) # $t0 = internal_0
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# Jumping to end_of_equal
		j end_of_equal
		
		end_of_equal:
		
		# Loading return value in $v1
		lw $v1, 28($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 32
		
		jr $ra
		
	function___init___at_Object:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_abort_at_Object:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Exit program
		li $v0, 10
		syscall
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_type_name_at_Object:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# internal_0 = name of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($t0) # $t1 = type of self
		lw $t2, 12($t1) # $t1 = length of the name of self
		lw $t3, 16($t1) # $t1 = name of self
		
		addi $t2, $t2, 9 # Setting space for the type, the size and the null byte
		li $v0, 9
		move $a0, $t2
		syscall
		addi $t2, $t2, -9 # Restoring space for the type, the size and the null byte
		
		la $t4, type_String
		sw $t4, 0($v0) # Setting type in the first word of the object
		
		sw $a0, 4($v0) # Setting length in the second word of the object
		
		move $t4, $v0 # $t4 = direction of the new string
		addi $t4, $t4, 8 # Pointer to the first character of the string
		addi $t0, $t0, 8 # Pointer to the first character of the string in self
		xor $t5, $t5, $t5 # Initializing counter
		while_copy_name_start:
		beq $t5, $t1, while_copy_name_end
		lb $t6, 0($t0) # Loading the character
		sb $t6, 0($t4)
		addi $t4, $t4, 1 # Incrementing the pointer to the new string
		addi $t0, $t0, 1 # Incrementing the pointer to the string in self
		addi $t5, $t5, 1 # Incrementing counter
		j while_copy_name_start
		while_copy_name_end:
		
		sb $zero, 0($t4) # Setting the null byte
		
		sw $t4, 0($sp) # Storing the new string in internal_0
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_copy_at_Object:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# internal_0 = copy of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($t0) # $t1 = type of self
		lw $t2, 4($t0) # $t2 = length of self in bytes
		
		# Allocating space for the new object
		li $v0, 9
		move $a0, $t2
		syscall
		move $t3, $v0 # $t3 = direction of the new object
		sw $t1, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting length in the second word of the object
		
		# Initializing the variable of the loop
		addi $t0, $t0, 8 # Pointer to the first character of the object
		addi $t3, $t3, 8 # Pointer to the first character of the object
		addi $t2, $2, -8 # Decrementing in 8 the length of the object
		xor $t4, $t4, $t4 # Initializing counter
		
		# Loop copying the object
		while_copy_start:
		beq $t4, $t2, while_copy_end
		lb $t5, 0($t0) # Loading the byte
		sb $t5, 0($t3) # Storing the byte
		addi $t0, $t0, 1 # Incrementing the pointer to the object
		addi $t3, $t3, 1 # Incrementing the pointer to the new object
		addi $t4, $t4, 1 # Incrementing counter
		j while_copy_start
		while_copy_end:
		sw $v0, 0($sp) # Storing the new object in internal_0
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function___init___at_IO:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_out_string_at_IO:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		#   x = 0($sp)
		
		lw $t0, 0($sp) # $t0 = x
		addi $t0, $t0, 8 # Pointer to the first character of the string
		
		# Printing the string x
		li $v0, 4
		move $a0, $t0
		syscall
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		jr $ra
		
	function_out_int_at_IO:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		#   x = 0($sp)
		
		# Printing the string x
		li $v0, 1
		lw $a0, 0($sp)
		lw $a0, 8($a0)
		syscall
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		jr $ra
		
	function_in_string_at_IO:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		li $v0, 8
		la $a0, buffer_input
		li $a1, 1024
		syscall
		
		xor $t0, $t0, $t0 # Initializing counter
		while_read_start:
		lw $t1, buffer_input($t0) # Loading the byte
		beq $t1, $zero, while_read_end
		addi $t0, $t0, 1 # Incrementing counter
		j while_read_start
		while_read_end:
		
		addi $t0, $t0, 9 # Adding space for the type, the size and the null byte
		li $v0, 9
		move $a0, $t0
		syscall
		la $t2, type_String
		sw $t2, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting length in the second word of the object
		
		addi $t3, $v0, 8 # Pointer to the first character of the string
		xor $t4, $t4, $t4 # Initializing counter
		
		while_copy_from_buffer_start:
		beq $t4, $t0, while_copy_from_buffer_end
		lw $t5, buffer_input($t4) # Loading the byte
		sb $t5, 0($t3) # Storing the byte
		addi $t3, $t3, 1 # Imcremeenting pointer
		addi $t4, $t4, 1 # Incrementing counter
		j while_copy_from_buffer_start
		while_copy_from_buffer_end:
		
		sb $zero, 0($t3) # Storing the null byte
		
		sw $v0, 0($sp) # Storing the new object in internal_0
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_in_int_at_IO:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		li $v0, 5
		syscall
		sw $v0, 0($sp) # Storing the new object in internal_0
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function___init___at_String:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_length_at_String:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# internal_0 = length of self
		lw $t0, 4($sp)
		lw $t1, 4($t0)
		addi $t1, $t1, -9 # Subtracting 9 for the type, length, and null-terminator
		sw $t1, 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_concat_at_String:
		# Function parameters
		#   $ra = 12($sp)
		#   self = 8($sp)
		#   s = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# internal_0 = self + s
		lw $t0, 8($sp)
		lw $t1, 4($sp)
		lw $t2, 4($t0) # $t2 = length of str1
		lw $t3, 4($t1) # $t3 = length of str2
		add $t4, $t2, $t3 # $t4 = length of str1 + str2
		addi $t4, $t4, 9 # Adding the space for the type (4bytes), the length(4bytes) and the null-terminator(1byte)
		
		li $v0, 9
		move $a0, $t4
		syscall
		addi $t4, $t4, -9 # Restoring $t4 = length of str1 + str2
		add $t5, $zero, $v0 # $t5 = address of the new string object
		addi $t5, $t5, 8 # $t5 = address of the first byte of the new string
		
		la $t8, type_String
		sw $t8, 0($v0) # Setting type in the first word of th object
		
		sw $a0, 4($v0) # Setting length of the string in the second word of the object
		
		# Copying str1 to the new string
		xor $t6, $t6, $t6 # $t6 = 0 Initializing counter
		while_copy_str1_start:
		beq $t6, $t2, while_copy_str1_end
		lb $t7, 0($t0)
		sb $t7, 0($t5)
		add $t0, $t0, 1 # $t0 = $t0 + 1 Incrementing the address of str1
		add $t5, $t5, 1 # $t5 = $t5 + 1 Incrementing the address of the new string
		addi $t6, $t6, 1 # $t6 = $t6 + 1 Incrementing counter
		j while_copy_str1_start
		while_copy_str1_end:
		
		# Copying str2 to the new string
		while_copy_str2_start:
		beq $t6, $t4, while_copy_str2_end
		lb $t7, 0($t1)
		sb $t7, 0($t5)
		add $t1, $t1, 1 # $t0 = $t0 + 1 Incrementing the address of str1
		add $t5, $t5, 1 # $t5 = $t5 + 1 Incrementing the address of the new string
		addi $t6, $t6, 1 # $t6 = $t6 + 1 Incrementing counter
		j while_copy_str2_start
		while_copy_str2_end:
		
		sb $zero, 0($t5) # Setting the null-terminator
		
		sw $v0, 0($sp) # internal_0 = self + s
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_substr_at_String:
		# Function parameters
		#   $ra = 16($sp)
		#   self = 12($sp)
		#   i = 8($sp)
		#   l = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# internal_0 = self[i:i + l]
		lw $t0, 12($sp) # $t0 = address of the string
		lw $t1, 4($t0) # $t1 = length of the string
		lw $t2, 8($sp) # $t2 = start of the substring
		lw $t3, 4($sp) # $t3 = length of the substring
		add $t4, $t2, $t3 # $t4 = start of the substring + length of the substring
		
		bge $t4, $t1, substring_out_of_bounds
		
		addi $t3, $t3, 9
		li $v0, 9
		move $a0, $t3
		syscall
		addi $t3, $t3, -9
		
		la $t5, type_String
		sw $t5, 0($v0) # Setting type in the first word of the object
		
		sw $a0, 4($v0) # Setting length in the second word of the object
		
		addi $t0, $t0, 8 # pointing to the first byte of the string
		add $t0, $t0, $t2 # pointing to the first byte of the substring
		move $t5, $v0 # $t5 = address of the new string
		add $t5, $t5, 8 # pointing to the first byte of the string
		xor $t6, $t6, $t6 # $t6 = 0 Initializing counter
		while_copy_substr_start:
		beq $t6, $t3, while_copy_substr_end
		lb $t7, 0($t0)
		sb $t7, 0($t5)
		addi $t0, $t0, 1 # $t0 = $t0 + 1 Incrementing the address of the string
		add $t5, $t5, 1 # $t5 = $t5 + 1 Incrementing the address of the new string
		addi $t6, $t6, 1 # $t6 = $t6 + 1 Incrementing counter
		j while_copy_substr_start
		while_copy_substr_end:
		
		sb $zero, 0($t5) # Setting the null-terminator
		
		sw $v0, 0($sp) # internal_0 = self[i:i + l]
		j substring_not_out_of_bounds
		
		substring_out_of_bounds:
		li $v0, 17
		addi $a0, $zero, 1
		syscall
		
		substring_not_out_of_bounds:
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function___init___at_A:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.var = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_value_at_A:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Get attribute var of self
		lw $t0, 4($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'var' from the instance
		sw $t1, 0($sp) # internal_0 = var
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_set_var_at_A:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		#   num = 0($sp)
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = num
		sw $t1, 8($t0) # self.var = num
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		jr $ra
		
	function_method1_at_A:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		#   num = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		jr $ra
		
	function_method2_at_A:
		# Function parameters
		#   $ra = 28($sp)
		#   self = 24($sp)
		#   num1 = 20($sp)
		#   num2 = 16($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -16
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num1
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing num1
		
		# Argument num2
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing num2
		
		# Calling function function_add
		jal function_add
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_1 = result of function_add
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 12($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_1
		lw $t0, 8($sp)
		sw $t0, 12($sp)
		end_assign:
		
		# Allocating B
		li $v0, 9
		lw $a0, type_B
		syscall
		la $t0, type_B # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_2 = address of allocated object B
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function___init___at_B
		jal function___init___at_B
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_2 = result of function___init___at_B
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_2
		
		# Argument x
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_3 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 16
		
		jr $ra
		
	function_method3_at_A:
		# Function parameters
		#   $ra = 32($sp)
		#   self = 28($sp)
		#   num = 24($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -24
		
		# Xor operation
		lw $t0, 24($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 12($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 8($sp) # $t0 = internal_3
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 16($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 8($sp) # $t0 = internal_3
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 20($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_3
		lw $t0, 8($sp)
		sw $t0, 20($sp)
		end_assign:
		
		# Allocating C
		li $v0, 9
		lw $a0, type_C
		syscall
		la $t0, type_C # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_4 = address of allocated object C
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_4
		
		# Calling function function___init___at_C
		jal function___init___at_C
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_4 = result of function___init___at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_4
		
		# Argument x
		lw $t0, 32($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_5 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 24
		
		jr $ra
		
	function_method4_at_A:
		# Function parameters
		#   $ra = 56($sp)
		#   self = 52($sp)
		#   num1 = 48($sp)
		#   num2 = 44($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -44
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 36($sp) # internal_1 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num2
		lw $t0, 56($sp)
		sw $t0, 4($sp) # Storing num2
		
		# Argument num1
		lw $t0, 60($sp)
		sw $t0, 0($sp) # Storing num1
		
		# Calling function function_less_than
		jal function_less_than
		lw $ra, 8($sp)
		sw $v1, 44($sp) # internal_2 = result of function_less_than
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 36($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_2
		lw $t0, 32($sp)
		sw $t0, 36($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981814074
		lw $t0, 36($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981814074
		
		# Jumping to else_8792981814074
		j else_8792981814074
		
		then_8792981814074:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num1
		lw $t0, 60($sp)
		sw $t0, 4($sp) # Storing num1
		
		# Argument num2
		lw $t0, 56($sp)
		sw $t0, 0($sp) # Storing num2
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 36($sp) # internal_4 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 24($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_4
		lw $t0, 24($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Allocating D
		li $v0, 9
		lw $a0, type_D
		syscall
		la $t0, type_D # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 20($sp) # internal_5 = address of allocated object D
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_5
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_5
		
		# Calling function function___init___at_D
		jal function___init___at_D
		lw $ra, 4($sp)
		sw $v1, 28($sp) # internal_5 = result of function___init___at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_5
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing internal_5
		
		# Argument x
		lw $t0, 40($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 28($sp) # internal_6 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 16($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_6
		lw $t0, 16($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# Jumping to endif_8792981814074
		j endif_8792981814074
		
		else_8792981814074:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num2
		lw $t0, 56($sp)
		sw $t0, 4($sp) # Storing num2
		
		# Argument num1
		lw $t0, 60($sp)
		sw $t0, 0($sp) # Storing num1
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_8 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_8
		lw $t0, 8($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Allocating D
		li $v0, 9
		lw $a0, type_D
		syscall
		la $t0, type_D # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_9 = address of allocated object D
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_9
		
		# Calling function function___init___at_D
		jal function___init___at_D
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_9 = result of function___init___at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_9
		
		# Argument x
		lw $t0, 40($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_10 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_10
		lw $t0, 0($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# Jumping to endif_8792981814074
		j endif_8792981814074
		
		endif_8792981814074:
		
		# Loading return value in $v1
		lw $v1, 40($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 44
		
		jr $ra
		
	function_method5_at_A:
		# Function parameters
		#   $ra = 52($sp)
		#   self = 48($sp)
		#   num = 44($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -44
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 36($sp) # internal_1 = address of allocated object Int
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_1
		lw $t0, 36($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 28($sp) # internal_3 = address of allocated object Int
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 32($sp)
		j end_assign
		not_is_Bool_or_Int:
		# y = internal_3
		lw $t0, 28($sp)
		sw $t0, 32($sp)
		end_assign:
		
		while_start_8792981814158:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument y
		lw $t0, 44($sp)
		sw $t0, 4($sp) # Storing y
		
		# Argument num
		lw $t0, 56($sp)
		sw $t0, 0($sp) # Storing num
		
		# Calling function function_less_than_or_equal
		jal function_less_than_or_equal
		lw $ra, 8($sp)
		sw $v1, 32($sp) # internal_5 = result of function_less_than_or_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 20($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_4 = internal_5
		lw $t0, 20($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# If internal_4 then goto while_body_8792981814158
		lw $t0, 24($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, while_body_8792981814158
		
		# Jumping to while_end_8792981814158
		j while_end_8792981814158
		
		while_body_8792981814158:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument x
		lw $t0, 52($sp)
		sw $t0, 4($sp) # Storing x
		
		# Argument y
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing y
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 28($sp) # internal_6 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 16($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_6
		lw $t0, 16($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 12($sp) # internal_7 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument y
		lw $t0, 44($sp)
		sw $t0, 4($sp) # Storing y
		
		# Argument internal_7
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_7
		
		# Calling function function_add
		jal function_add
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_8 = result of function_add
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 32($sp)
		j end_assign
		not_is_Bool_or_Int:
		# y = internal_8
		lw $t0, 8($sp)
		sw $t0, 32($sp)
		end_assign:
		
		# Jumping to while_start_8792981814158
		j while_start_8792981814158
		
		while_end_8792981814158:
		
		# Allocating E
		li $v0, 9
		lw $a0, type_E
		syscall
		la $t0, type_E # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_9 = address of allocated object E
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_9
		
		# Calling function function___init___at_E
		jal function___init___at_E
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_9 = result of function___init___at_E
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_9
		
		# Argument x
		lw $t0, 52($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_10 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 44
		
		jr $ra
		
	function___init___at_B:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.var = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_method5_at_B:
		# Function parameters
		#   $ra = 24($sp)
		#   self = 20($sp)
		#   num = 16($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -16
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num
		lw $t0, 28($sp)
		sw $t0, 4($sp) # Storing num
		
		# Argument num
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing num
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_1 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 12($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_1
		lw $t0, 8($sp)
		sw $t0, 12($sp)
		end_assign:
		
		# Allocating E
		li $v0, 9
		lw $a0, type_E
		syscall
		la $t0, type_E # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_2 = address of allocated object E
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function___init___at_E
		jal function___init___at_E
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_2 = result of function___init___at_E
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_2
		
		# Argument x
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_3 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 16
		
		jr $ra
		
	function___init___at_C:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.var = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_method6_at_C:
		# Function parameters
		#   $ra = 32($sp)
		#   self = 28($sp)
		#   num = 24($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -24
		
		# Xor operation
		lw $t0, 24($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 12($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 8($sp) # $t0 = internal_3
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 8($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 16($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 8($sp) # $t0 = internal_3
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 20($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_3
		lw $t0, 8($sp)
		sw $t0, 20($sp)
		end_assign:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_4 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_4
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_4 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_4
		
		# Argument x
		lw $t0, 32($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_5 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 24
		
		jr $ra
		
	function_method5_at_C:
		# Function parameters
		#   $ra = 28($sp)
		#   self = 24($sp)
		#   num = 20($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -20
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing num
		
		# Argument num
		lw $t0, 32($sp)
		sw $t0, 0($sp) # Storing num
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_1 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_1
		lw $t0, 24($sp)
		sw $t0, 4($sp) # Storing internal_1
		
		# Argument num
		lw $t0, 32($sp)
		sw $t0, 0($sp) # Storing num
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_2 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 16($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_2
		lw $t0, 8($sp)
		sw $t0, 16($sp)
		end_assign:
		
		# Allocating E
		li $v0, 9
		lw $a0, type_E
		syscall
		la $t0, type_E # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_3 = address of allocated object E
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_3
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function___init___at_E
		jal function___init___at_E
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_3 = result of function___init___at_E
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_3
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_3
		
		# Argument x
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_4 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 20
		
		jr $ra
		
	function___init___at_D:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.var = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_method7_at_D:
		# Function parameters
		#   $ra = 116($sp)
		#   self = 112($sp)
		#   num = 108($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -108
		
		lw $t0, 108($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 104($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = num
		lw $t0, 108($sp)
		sw $t0, 104($sp)
		end_assign:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 96($sp) # internal_2 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 92($sp) # internal_3 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument x
		lw $t0, 116($sp)
		sw $t0, 4($sp) # Storing x
		
		# Argument internal_3
		lw $t0, 104($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function_less_than
		jal function_less_than
		lw $ra, 8($sp)
		sw $v1, 100($sp) # internal_4 = result of function_less_than
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 88($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 96($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_2 = internal_4
		lw $t0, 88($sp)
		sw $t0, 96($sp)
		end_assign:
		
		# If internal_2 then goto then_8792981815568
		lw $t0, 96($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981815568
		
		# Jumping to else_8792981815568
		j else_8792981815568
		
		then_8792981815568:
		
		# Xor operation
		lw $t0, 104($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 80($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 76($sp) # $t0 = internal_7
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 76($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 84($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 76($sp) # $t0 = internal_7
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 124($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_7
		lw $t0, 88($sp)
		sw $t0, 0($sp) # Storing internal_7
		
		# Calling function function_method7_at_D
		jal function_method7_at_D
		lw $ra, 8($sp)
		sw $v1, 84($sp) # internal_8 = result of function_method7_at_D
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 72($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 100($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_8
		lw $t0, 72($sp)
		sw $t0, 100($sp)
		end_assign:
		
		# Jumping to endif_8792981815568
		j endif_8792981815568
		
		else_8792981815568:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 64($sp) # internal_10 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 60($sp) # internal_11 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_11
		lw $t0, 72($sp)
		sw $t0, 4($sp) # Storing internal_11
		
		# Argument x
		lw $t0, 116($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 68($sp) # internal_12 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 56($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_12
		lw $t0, 56($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# If internal_10 then goto then_8792981815559
		lw $t0, 64($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981815559
		
		# Jumping to else_8792981815559
		j else_8792981815559
		
		then_8792981815559:
		
		# Allocating Bool 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 52($sp) # internal_13 = address of allocated object Int
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 68($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_9 = internal_13
		lw $t0, 52($sp)
		sw $t0, 68($sp)
		end_assign:
		
		# Jumping to endif_8792981815559
		j endif_8792981815559
		
		else_8792981815559:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 44($sp) # internal_15 = address of allocated object Int
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_16 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_16
		lw $t0, 52($sp)
		sw $t0, 4($sp) # Storing internal_16
		
		# Argument x
		lw $t0, 116($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 48($sp) # internal_17 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_17
		lw $t0, 36($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# If internal_15 then goto then_8792981815290
		lw $t0, 44($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981815290
		
		# Jumping to else_8792981815290
		j else_8792981815290
		
		then_8792981815290:
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 32($sp) # internal_18 = address of allocated object Int
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_14 = internal_18
		lw $t0, 32($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981815290
		j endif_8792981815290
		
		else_8792981815290:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 24($sp) # internal_20 = address of allocated object Int
		
		# Allocating Int 2
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 2
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 20($sp) # internal_21 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_21
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing internal_21
		
		# Argument x
		lw $t0, 116($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 28($sp) # internal_22 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 16($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_22
		lw $t0, 16($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# If internal_20 then goto then_8792981815556
		lw $t0, 24($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981815556
		
		# Jumping to else_8792981815556
		j else_8792981815556
		
		then_8792981815556:
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 12($sp) # internal_23 = address of allocated object Int
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_19 = internal_23
		lw $t0, 12($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Jumping to endif_8792981815556
		j endif_8792981815556
		
		else_8792981815556:
		
		# Allocating Int 3
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 3
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 8($sp) # internal_24 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument x
		lw $t0, 116($sp)
		sw $t0, 4($sp) # Storing x
		
		# Argument internal_24
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_24
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_25 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 124($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_25
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_25
		
		# Calling function function_method7_at_D
		jal function_method7_at_D
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_26 = result of function_method7_at_D
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_19 = internal_26
		lw $t0, 0($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Jumping to endif_8792981815556
		j endif_8792981815556
		
		endif_8792981815556:
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_14 = internal_19
		lw $t0, 28($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981815290
		j endif_8792981815290
		
		endif_8792981815290:
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 68($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_9 = internal_14
		lw $t0, 48($sp)
		sw $t0, 68($sp)
		end_assign:
		
		# Jumping to endif_8792981815559
		j endif_8792981815559
		
		endif_8792981815559:
		
		lw $t0, 68($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 100($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_9
		lw $t0, 68($sp)
		sw $t0, 100($sp)
		end_assign:
		
		# Jumping to endif_8792981815568
		j endif_8792981815568
		
		endif_8792981815568:
		
		# Loading return value in $v1
		lw $v1, 100($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 108
		
		jr $ra
		
	function___init___at_E:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_0 = address of allocated object Int
		
		# Set attribute var of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.var = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_method6_at_E:
		# Function parameters
		#   $ra = 28($sp)
		#   self = 24($sp)
		#   num = 20($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -20
		
		# Allocating Int 8
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 8
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 12($sp) # internal_1 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument num
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing num
		
		# Argument internal_1
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_1
		
		# Calling function function_div
		jal function_div
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_2 = result of function_div
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 16($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_2
		lw $t0, 8($sp)
		sw $t0, 16($sp)
		end_assign:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_3 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_3
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_3 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_3
		lw $t0, 16($sp)
		sw $t0, 4($sp) # Storing internal_3
		
		# Argument x
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_4 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 20
		
		jr $ra
		
	function___init___at_A2I:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_c2i_at_A2I:
		# Function parameters
		#   $ra = 216($sp)
		#   self = 212($sp)
		#   char = 208($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -208
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 200($sp) # internal_1 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 48
		sb $t0, 8($v0) # internal_2[0] = '0'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 196($sp) # internal_2 = "0"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_2
		lw $t0, 208($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 204($sp) # internal_3 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 192($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 200($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_3
		lw $t0, 192($sp)
		sw $t0, 200($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981816474
		lw $t0, 200($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816474
		
		# Jumping to else_8792981816474
		j else_8792981816474
		
		then_8792981816474:
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 188($sp) # internal_4 = address of allocated object Int
		
		lw $t0, 188($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 204($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_4
		lw $t0, 188($sp)
		sw $t0, 204($sp)
		end_assign:
		
		# Jumping to endif_8792981816474
		j endif_8792981816474
		
		else_8792981816474:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 180($sp) # internal_6 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 49
		sb $t0, 8($v0) # internal_7[0] = '1'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 176($sp) # internal_7 = "1"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_7
		lw $t0, 188($sp)
		sw $t0, 0($sp) # Storing internal_7
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 184($sp) # internal_8 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 172($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 180($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_8
		lw $t0, 172($sp)
		sw $t0, 180($sp)
		end_assign:
		
		# If internal_6 then goto then_8792981816468
		lw $t0, 180($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816468
		
		# Jumping to else_8792981816468
		j else_8792981816468
		
		then_8792981816468:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 168($sp) # internal_9 = address of allocated object Int
		
		lw $t0, 168($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 184($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_9
		lw $t0, 168($sp)
		sw $t0, 184($sp)
		end_assign:
		
		# Jumping to endif_8792981816468
		j endif_8792981816468
		
		else_8792981816468:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 160($sp) # internal_11 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 50
		sb $t0, 8($v0) # internal_12[0] = '2'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 156($sp) # internal_12 = "2"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_12
		lw $t0, 168($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 164($sp) # internal_13 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 152($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 160($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_11 = internal_13
		lw $t0, 152($sp)
		sw $t0, 160($sp)
		end_assign:
		
		# If internal_11 then goto then_8792981816462
		lw $t0, 160($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816462
		
		# Jumping to else_8792981816462
		j else_8792981816462
		
		then_8792981816462:
		
		# Allocating Int 2
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 2
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 148($sp) # internal_14 = address of allocated object Int
		
		lw $t0, 148($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 164($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_14
		lw $t0, 148($sp)
		sw $t0, 164($sp)
		end_assign:
		
		# Jumping to endif_8792981816462
		j endif_8792981816462
		
		else_8792981816462:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 140($sp) # internal_16 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 51
		sb $t0, 8($v0) # internal_17[0] = '3'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 136($sp) # internal_17 = "3"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_17
		lw $t0, 148($sp)
		sw $t0, 0($sp) # Storing internal_17
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 144($sp) # internal_18 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 132($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 140($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_16 = internal_18
		lw $t0, 132($sp)
		sw $t0, 140($sp)
		end_assign:
		
		# If internal_16 then goto then_8792981816456
		lw $t0, 140($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816456
		
		# Jumping to else_8792981816456
		j else_8792981816456
		
		then_8792981816456:
		
		# Allocating Int 3
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 3
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 128($sp) # internal_19 = address of allocated object Int
		
		lw $t0, 128($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 144($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_19
		lw $t0, 128($sp)
		sw $t0, 144($sp)
		end_assign:
		
		# Jumping to endif_8792981816456
		j endif_8792981816456
		
		else_8792981816456:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 120($sp) # internal_21 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 52
		sb $t0, 8($v0) # internal_22[0] = '4'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 116($sp) # internal_22 = "4"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_22
		lw $t0, 128($sp)
		sw $t0, 0($sp) # Storing internal_22
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 124($sp) # internal_23 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 112($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 120($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_21 = internal_23
		lw $t0, 112($sp)
		sw $t0, 120($sp)
		end_assign:
		
		# If internal_21 then goto then_8792981816450
		lw $t0, 120($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816450
		
		# Jumping to else_8792981816450
		j else_8792981816450
		
		then_8792981816450:
		
		# Allocating Int 4
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 4
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 108($sp) # internal_24 = address of allocated object Int
		
		lw $t0, 108($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 124($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_24
		lw $t0, 108($sp)
		sw $t0, 124($sp)
		end_assign:
		
		# Jumping to endif_8792981816450
		j endif_8792981816450
		
		else_8792981816450:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 100($sp) # internal_26 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 53
		sb $t0, 8($v0) # internal_27[0] = '5'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 96($sp) # internal_27 = "5"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_27
		lw $t0, 108($sp)
		sw $t0, 0($sp) # Storing internal_27
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 104($sp) # internal_28 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 92($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 100($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_26 = internal_28
		lw $t0, 92($sp)
		sw $t0, 100($sp)
		end_assign:
		
		# If internal_26 then goto then_8792981816444
		lw $t0, 100($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816444
		
		# Jumping to else_8792981816444
		j else_8792981816444
		
		then_8792981816444:
		
		# Allocating Int 5
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 5
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 88($sp) # internal_29 = address of allocated object Int
		
		lw $t0, 88($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 104($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_25 = internal_29
		lw $t0, 88($sp)
		sw $t0, 104($sp)
		end_assign:
		
		# Jumping to endif_8792981816444
		j endif_8792981816444
		
		else_8792981816444:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 80($sp) # internal_31 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 54
		sb $t0, 8($v0) # internal_32[0] = '6'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 76($sp) # internal_32 = "6"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_32
		lw $t0, 88($sp)
		sw $t0, 0($sp) # Storing internal_32
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 84($sp) # internal_33 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 72($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 80($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_31 = internal_33
		lw $t0, 72($sp)
		sw $t0, 80($sp)
		end_assign:
		
		# If internal_31 then goto then_8792981816438
		lw $t0, 80($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816438
		
		# Jumping to else_8792981816438
		j else_8792981816438
		
		then_8792981816438:
		
		# Allocating Int 6
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 6
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 68($sp) # internal_34 = address of allocated object Int
		
		lw $t0, 68($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 84($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_30 = internal_34
		lw $t0, 68($sp)
		sw $t0, 84($sp)
		end_assign:
		
		# Jumping to endif_8792981816438
		j endif_8792981816438
		
		else_8792981816438:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 60($sp) # internal_36 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 55
		sb $t0, 8($v0) # internal_37[0] = '7'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 56($sp) # internal_37 = "7"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_37
		lw $t0, 68($sp)
		sw $t0, 0($sp) # Storing internal_37
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 64($sp) # internal_38 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_36 = internal_38
		lw $t0, 52($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# If internal_36 then goto then_8792981816432
		lw $t0, 60($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816432
		
		# Jumping to else_8792981816432
		j else_8792981816432
		
		then_8792981816432:
		
		# Allocating Int 7
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 7
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 48($sp) # internal_39 = address of allocated object Int
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_35 = internal_39
		lw $t0, 48($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# Jumping to endif_8792981816432
		j endif_8792981816432
		
		else_8792981816432:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_41 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 56
		sb $t0, 8($v0) # internal_42[0] = '8'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 36($sp) # internal_42 = "8"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_42
		lw $t0, 48($sp)
		sw $t0, 0($sp) # Storing internal_42
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 44($sp) # internal_43 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_41 = internal_43
		lw $t0, 32($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# If internal_41 then goto then_8792981816426
		lw $t0, 40($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816426
		
		# Jumping to else_8792981816426
		j else_8792981816426
		
		then_8792981816426:
		
		# Allocating Int 8
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 8
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 28($sp) # internal_44 = address of allocated object Int
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_40 = internal_44
		lw $t0, 28($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# Jumping to endif_8792981816426
		j endif_8792981816426
		
		else_8792981816426:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 20($sp) # internal_46 = address of allocated object Int
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 57
		sb $t0, 8($v0) # internal_47[0] = '9'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 16($sp) # internal_47 = "9"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument char
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing char
		
		# Argument internal_47
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_47
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_48 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 20($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_46 = internal_48
		lw $t0, 12($sp)
		sw $t0, 20($sp)
		end_assign:
		
		# If internal_46 then goto then_8792981816405
		lw $t0, 20($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981816405
		
		# Jumping to else_8792981816405
		j else_8792981816405
		
		then_8792981816405:
		
		# Allocating Int 9
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 9
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 8($sp) # internal_49 = address of allocated object Int
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_45 = internal_49
		lw $t0, 8($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# Jumping to endif_8792981816405
		j endif_8792981816405
		
		else_8792981816405:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_abort_at_Object
		jal function_abort_at_Object
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_50 = result of function_abort_at_Object
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_51 = address of allocated object Int
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_45 = internal_51
		lw $t0, 0($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# Jumping to endif_8792981816405
		j endif_8792981816405
		
		endif_8792981816405:
		
		lw $t0, 24($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_40 = internal_45
		lw $t0, 24($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# Jumping to endif_8792981816426
		j endif_8792981816426
		
		endif_8792981816426:
		
		lw $t0, 44($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_35 = internal_40
		lw $t0, 44($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# Jumping to endif_8792981816432
		j endif_8792981816432
		
		endif_8792981816432:
		
		lw $t0, 64($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 84($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_30 = internal_35
		lw $t0, 64($sp)
		sw $t0, 84($sp)
		end_assign:
		
		# Jumping to endif_8792981816438
		j endif_8792981816438
		
		endif_8792981816438:
		
		lw $t0, 84($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 104($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_25 = internal_30
		lw $t0, 84($sp)
		sw $t0, 104($sp)
		end_assign:
		
		# Jumping to endif_8792981816444
		j endif_8792981816444
		
		endif_8792981816444:
		
		lw $t0, 104($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 124($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_25
		lw $t0, 104($sp)
		sw $t0, 124($sp)
		end_assign:
		
		# Jumping to endif_8792981816450
		j endif_8792981816450
		
		endif_8792981816450:
		
		lw $t0, 124($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 144($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_20
		lw $t0, 124($sp)
		sw $t0, 144($sp)
		end_assign:
		
		# Jumping to endif_8792981816456
		j endif_8792981816456
		
		endif_8792981816456:
		
		lw $t0, 144($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 164($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_15
		lw $t0, 144($sp)
		sw $t0, 164($sp)
		end_assign:
		
		# Jumping to endif_8792981816462
		j endif_8792981816462
		
		endif_8792981816462:
		
		lw $t0, 164($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 184($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_10
		lw $t0, 164($sp)
		sw $t0, 184($sp)
		end_assign:
		
		# Jumping to endif_8792981816468
		j endif_8792981816468
		
		endif_8792981816468:
		
		lw $t0, 184($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 204($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_5
		lw $t0, 184($sp)
		sw $t0, 204($sp)
		end_assign:
		
		# Jumping to endif_8792981816474
		j endif_8792981816474
		
		endif_8792981816474:
		
		# Loading return value in $v1
		lw $v1, 204($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 208
		
		jr $ra
		
	function_i2c_at_A2I:
		# Function parameters
		#   $ra = 216($sp)
		#   self = 212($sp)
		#   i = 208($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -208
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 200($sp) # internal_1 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 196($sp) # internal_2 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_2
		lw $t0, 208($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 204($sp) # internal_3 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 192($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 200($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_3
		lw $t0, 192($sp)
		sw $t0, 200($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981817308
		lw $t0, 200($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817308
		
		# Jumping to else_8792981817308
		j else_8792981817308
		
		then_8792981817308:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 48
		sb $t0, 8($v0) # internal_4[0] = '0'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 188($sp) # internal_4 = "0"
		
		lw $t0, 188($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 204($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_4
		lw $t0, 188($sp)
		sw $t0, 204($sp)
		end_assign:
		
		# Jumping to endif_8792981817308
		j endif_8792981817308
		
		else_8792981817308:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 180($sp) # internal_6 = address of allocated object Int
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 176($sp) # internal_7 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_7
		lw $t0, 188($sp)
		sw $t0, 0($sp) # Storing internal_7
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 184($sp) # internal_8 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 172($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 180($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_8
		lw $t0, 172($sp)
		sw $t0, 180($sp)
		end_assign:
		
		# If internal_6 then goto then_8792981817302
		lw $t0, 180($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817302
		
		# Jumping to else_8792981817302
		j else_8792981817302
		
		then_8792981817302:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 49
		sb $t0, 8($v0) # internal_9[0] = '1'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 168($sp) # internal_9 = "1"
		
		lw $t0, 168($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 184($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_9
		lw $t0, 168($sp)
		sw $t0, 184($sp)
		end_assign:
		
		# Jumping to endif_8792981817302
		j endif_8792981817302
		
		else_8792981817302:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 160($sp) # internal_11 = address of allocated object Int
		
		# Allocating Int 2
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 2
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 156($sp) # internal_12 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_12
		lw $t0, 168($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 164($sp) # internal_13 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 152($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 160($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_11 = internal_13
		lw $t0, 152($sp)
		sw $t0, 160($sp)
		end_assign:
		
		# If internal_11 then goto then_8792981817296
		lw $t0, 160($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817296
		
		# Jumping to else_8792981817296
		j else_8792981817296
		
		then_8792981817296:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 50
		sb $t0, 8($v0) # internal_14[0] = '2'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 148($sp) # internal_14 = "2"
		
		lw $t0, 148($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 164($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_14
		lw $t0, 148($sp)
		sw $t0, 164($sp)
		end_assign:
		
		# Jumping to endif_8792981817296
		j endif_8792981817296
		
		else_8792981817296:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 140($sp) # internal_16 = address of allocated object Int
		
		# Allocating Int 3
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 3
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 136($sp) # internal_17 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_17
		lw $t0, 148($sp)
		sw $t0, 0($sp) # Storing internal_17
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 144($sp) # internal_18 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 132($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 140($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_16 = internal_18
		lw $t0, 132($sp)
		sw $t0, 140($sp)
		end_assign:
		
		# If internal_16 then goto then_8792981817290
		lw $t0, 140($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817290
		
		# Jumping to else_8792981817290
		j else_8792981817290
		
		then_8792981817290:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 51
		sb $t0, 8($v0) # internal_19[0] = '3'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 128($sp) # internal_19 = "3"
		
		lw $t0, 128($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 144($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_19
		lw $t0, 128($sp)
		sw $t0, 144($sp)
		end_assign:
		
		# Jumping to endif_8792981817290
		j endif_8792981817290
		
		else_8792981817290:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 120($sp) # internal_21 = address of allocated object Int
		
		# Allocating Int 4
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 4
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 116($sp) # internal_22 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_22
		lw $t0, 128($sp)
		sw $t0, 0($sp) # Storing internal_22
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 124($sp) # internal_23 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 112($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 120($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_21 = internal_23
		lw $t0, 112($sp)
		sw $t0, 120($sp)
		end_assign:
		
		# If internal_21 then goto then_8792981817284
		lw $t0, 120($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817284
		
		# Jumping to else_8792981817284
		j else_8792981817284
		
		then_8792981817284:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 52
		sb $t0, 8($v0) # internal_24[0] = '4'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 108($sp) # internal_24 = "4"
		
		lw $t0, 108($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 124($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_24
		lw $t0, 108($sp)
		sw $t0, 124($sp)
		end_assign:
		
		# Jumping to endif_8792981817284
		j endif_8792981817284
		
		else_8792981817284:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 100($sp) # internal_26 = address of allocated object Int
		
		# Allocating Int 5
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 5
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 96($sp) # internal_27 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_27
		lw $t0, 108($sp)
		sw $t0, 0($sp) # Storing internal_27
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 104($sp) # internal_28 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 92($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 100($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_26 = internal_28
		lw $t0, 92($sp)
		sw $t0, 100($sp)
		end_assign:
		
		# If internal_26 then goto then_8792981817278
		lw $t0, 100($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817278
		
		# Jumping to else_8792981817278
		j else_8792981817278
		
		then_8792981817278:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 53
		sb $t0, 8($v0) # internal_29[0] = '5'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 88($sp) # internal_29 = "5"
		
		lw $t0, 88($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 104($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_25 = internal_29
		lw $t0, 88($sp)
		sw $t0, 104($sp)
		end_assign:
		
		# Jumping to endif_8792981817278
		j endif_8792981817278
		
		else_8792981817278:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 80($sp) # internal_31 = address of allocated object Int
		
		# Allocating Int 6
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 6
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 76($sp) # internal_32 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_32
		lw $t0, 88($sp)
		sw $t0, 0($sp) # Storing internal_32
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 84($sp) # internal_33 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 72($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 80($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_31 = internal_33
		lw $t0, 72($sp)
		sw $t0, 80($sp)
		end_assign:
		
		# If internal_31 then goto then_8792981817272
		lw $t0, 80($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817272
		
		# Jumping to else_8792981817272
		j else_8792981817272
		
		then_8792981817272:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 54
		sb $t0, 8($v0) # internal_34[0] = '6'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 68($sp) # internal_34 = "6"
		
		lw $t0, 68($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 84($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_30 = internal_34
		lw $t0, 68($sp)
		sw $t0, 84($sp)
		end_assign:
		
		# Jumping to endif_8792981817272
		j endif_8792981817272
		
		else_8792981817272:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 60($sp) # internal_36 = address of allocated object Int
		
		# Allocating Int 7
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 7
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 56($sp) # internal_37 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_37
		lw $t0, 68($sp)
		sw $t0, 0($sp) # Storing internal_37
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 64($sp) # internal_38 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_36 = internal_38
		lw $t0, 52($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# If internal_36 then goto then_8792981817266
		lw $t0, 60($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817266
		
		# Jumping to else_8792981817266
		j else_8792981817266
		
		then_8792981817266:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 55
		sb $t0, 8($v0) # internal_39[0] = '7'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 48($sp) # internal_39 = "7"
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_35 = internal_39
		lw $t0, 48($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# Jumping to endif_8792981817266
		j endif_8792981817266
		
		else_8792981817266:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_41 = address of allocated object Int
		
		# Allocating Int 8
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 8
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 36($sp) # internal_42 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_42
		lw $t0, 48($sp)
		sw $t0, 0($sp) # Storing internal_42
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 44($sp) # internal_43 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 40($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_41 = internal_43
		lw $t0, 32($sp)
		sw $t0, 40($sp)
		end_assign:
		
		# If internal_41 then goto then_8792981817260
		lw $t0, 40($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817260
		
		# Jumping to else_8792981817260
		j else_8792981817260
		
		then_8792981817260:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 56
		sb $t0, 8($v0) # internal_44[0] = '8'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 28($sp) # internal_44 = "8"
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_40 = internal_44
		lw $t0, 28($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# Jumping to endif_8792981817260
		j endif_8792981817260
		
		else_8792981817260:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 20($sp) # internal_46 = address of allocated object Int
		
		# Allocating Int 9
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 9
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 16($sp) # internal_47 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_47
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_47
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_48 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 20($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_46 = internal_48
		lw $t0, 12($sp)
		sw $t0, 20($sp)
		end_assign:
		
		# If internal_46 then goto then_8792981817239
		lw $t0, 20($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817239
		
		# Jumping to else_8792981817239
		j else_8792981817239
		
		then_8792981817239:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 57
		sb $t0, 8($v0) # internal_49[0] = '9'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 8($sp) # internal_49 = "9"
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_45 = internal_49
		lw $t0, 8($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# Jumping to endif_8792981817239
		j endif_8792981817239
		
		else_8792981817239:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_abort_at_Object
		jal function_abort_at_Object
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_50 = result of function_abort_at_Object
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 9 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 0
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		sb $zero, 8($v0) # Null-terminator at the end of the string
		
		sw $v0, 0($sp) # internal_51 = ""
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_45 = internal_51
		lw $t0, 0($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# Jumping to endif_8792981817239
		j endif_8792981817239
		
		endif_8792981817239:
		
		lw $t0, 24($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_40 = internal_45
		lw $t0, 24($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# Jumping to endif_8792981817260
		j endif_8792981817260
		
		endif_8792981817260:
		
		lw $t0, 44($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_35 = internal_40
		lw $t0, 44($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# Jumping to endif_8792981817266
		j endif_8792981817266
		
		endif_8792981817266:
		
		lw $t0, 64($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 84($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_30 = internal_35
		lw $t0, 64($sp)
		sw $t0, 84($sp)
		end_assign:
		
		# Jumping to endif_8792981817272
		j endif_8792981817272
		
		endif_8792981817272:
		
		lw $t0, 84($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 104($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_25 = internal_30
		lw $t0, 84($sp)
		sw $t0, 104($sp)
		end_assign:
		
		# Jumping to endif_8792981817278
		j endif_8792981817278
		
		endif_8792981817278:
		
		lw $t0, 104($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 124($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_25
		lw $t0, 104($sp)
		sw $t0, 124($sp)
		end_assign:
		
		# Jumping to endif_8792981817284
		j endif_8792981817284
		
		endif_8792981817284:
		
		lw $t0, 124($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 144($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_20
		lw $t0, 124($sp)
		sw $t0, 144($sp)
		end_assign:
		
		# Jumping to endif_8792981817290
		j endif_8792981817290
		
		endif_8792981817290:
		
		lw $t0, 144($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 164($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_15
		lw $t0, 144($sp)
		sw $t0, 164($sp)
		end_assign:
		
		# Jumping to endif_8792981817296
		j endif_8792981817296
		
		endif_8792981817296:
		
		lw $t0, 164($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 184($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_10
		lw $t0, 164($sp)
		sw $t0, 184($sp)
		end_assign:
		
		# Jumping to endif_8792981817302
		j endif_8792981817302
		
		endif_8792981817302:
		
		lw $t0, 184($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 204($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_5
		lw $t0, 184($sp)
		sw $t0, 204($sp)
		end_assign:
		
		# Jumping to endif_8792981817308
		j endif_8792981817308
		
		endif_8792981817308:
		
		# Loading return value in $v1
		lw $v1, 204($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 208
		
		jr $ra
		
	function_a2i_at_A2I:
		# Function parameters
		#   $ra = 152($sp)
		#   self = 148($sp)
		#   s = 144($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -144
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 136($sp) # internal_1 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument s
		lw $t0, 152($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_length_at_String
		jal function_length_at_String
		lw $ra, 4($sp)
		sw $v1, 140($sp) # internal_2 = result of function_length_at_String
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 128($sp) # internal_3 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 144($sp)
		sw $t0, 4($sp) # Storing internal_2
		
		# Argument internal_3
		lw $t0, 140($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 136($sp) # internal_4 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 124($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 136($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_4
		lw $t0, 124($sp)
		sw $t0, 136($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981817498
		lw $t0, 136($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817498
		
		# Jumping to else_8792981817498
		j else_8792981817498
		
		then_8792981817498:
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 120($sp) # internal_5 = address of allocated object Int
		
		lw $t0, 120($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 140($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_5
		lw $t0, 120($sp)
		sw $t0, 140($sp)
		end_assign:
		
		# Jumping to endif_8792981817498
		j endif_8792981817498
		
		else_8792981817498:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 112($sp) # internal_7 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 108($sp) # internal_8 = address of allocated object Int
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 104($sp) # internal_9 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument s
		lw $t0, 160($sp)
		sw $t0, 8($sp) # Storing s
		
		# Argument internal_8
		lw $t0, 124($sp)
		sw $t0, 4($sp) # Storing internal_8
		
		# Argument internal_9
		lw $t0, 120($sp)
		sw $t0, 0($sp) # Storing internal_9
		
		# Calling function function_substr_at_String
		jal function_substr_at_String
		lw $ra, 12($sp)
		sw $v1, 116($sp) # internal_10 = result of function_substr_at_String
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 45
		sb $t0, 8($v0) # internal_11[0] = '-'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 96($sp) # internal_11 = "-"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_10
		lw $t0, 112($sp)
		sw $t0, 4($sp) # Storing internal_10
		
		# Argument internal_11
		lw $t0, 108($sp)
		sw $t0, 0($sp) # Storing internal_11
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 104($sp) # internal_12 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 92($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 112($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_7 = internal_12
		lw $t0, 92($sp)
		sw $t0, 112($sp)
		end_assign:
		
		# If internal_7 then goto then_8792981817513
		lw $t0, 112($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817513
		
		# Jumping to else_8792981817513
		j else_8792981817513
		
		then_8792981817513:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 88($sp) # internal_13 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument s
		lw $t0, 152($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_length_at_String
		jal function_length_at_String
		lw $ra, 4($sp)
		sw $v1, 92($sp) # internal_14 = result of function_length_at_String
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 80($sp) # internal_15 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_14
		lw $t0, 96($sp)
		sw $t0, 4($sp) # Storing internal_14
		
		# Argument internal_15
		lw $t0, 92($sp)
		sw $t0, 0($sp) # Storing internal_15
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 88($sp) # internal_16 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument s
		lw $t0, 160($sp)
		sw $t0, 8($sp) # Storing s
		
		# Argument internal_13
		lw $t0, 104($sp)
		sw $t0, 4($sp) # Storing internal_13
		
		# Argument internal_16
		lw $t0, 92($sp)
		sw $t0, 0($sp) # Storing internal_16
		
		# Calling function function_substr_at_String
		jal function_substr_at_String
		lw $ra, 12($sp)
		sw $v1, 88($sp) # internal_17 = result of function_substr_at_String
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 160($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_17
		lw $t0, 84($sp)
		sw $t0, 0($sp) # Storing internal_17
		
		# Calling function function_a2i_aux_at_A2I
		jal function_a2i_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 80($sp) # internal_18 = result of function_a2i_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Xor operation
		lw $t0, 68($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 60($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 56($sp) # $t0 = internal_21
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 56($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 64($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 56($sp) # $t0 = internal_21
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		lw $t0, 56($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 116($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_21
		lw $t0, 56($sp)
		sw $t0, 116($sp)
		end_assign:
		
		# Jumping to endif_8792981817513
		j endif_8792981817513
		
		else_8792981817513:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 48($sp) # internal_23 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 44($sp) # internal_24 = address of allocated object Int
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_25 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument s
		lw $t0, 160($sp)
		sw $t0, 8($sp) # Storing s
		
		# Argument internal_24
		lw $t0, 60($sp)
		sw $t0, 4($sp) # Storing internal_24
		
		# Argument internal_25
		lw $t0, 56($sp)
		sw $t0, 0($sp) # Storing internal_25
		
		# Calling function function_substr_at_String
		jal function_substr_at_String
		lw $ra, 12($sp)
		sw $v1, 52($sp) # internal_26 = result of function_substr_at_String
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 43
		sb $t0, 8($v0) # internal_27[0] = '+'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 32($sp) # internal_27 = "+"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_26
		lw $t0, 48($sp)
		sw $t0, 4($sp) # Storing internal_26
		
		# Argument internal_27
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing internal_27
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 40($sp) # internal_28 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_23 = internal_28
		lw $t0, 28($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# If internal_23 then goto then_8792981817507
		lw $t0, 48($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981817507
		
		# Jumping to else_8792981817507
		j else_8792981817507
		
		then_8792981817507:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 24($sp) # internal_29 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument s
		lw $t0, 152($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_length_at_String
		jal function_length_at_String
		lw $ra, 4($sp)
		sw $v1, 28($sp) # internal_30 = result of function_length_at_String
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 16($sp) # internal_31 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_30
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing internal_30
		
		# Argument internal_31
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_31
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_32 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument s
		lw $t0, 160($sp)
		sw $t0, 8($sp) # Storing s
		
		# Argument internal_29
		lw $t0, 40($sp)
		sw $t0, 4($sp) # Storing internal_29
		
		# Argument internal_32
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_32
		
		# Calling function function_substr_at_String
		jal function_substr_at_String
		lw $ra, 12($sp)
		sw $v1, 24($sp) # internal_33 = result of function_substr_at_String
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 160($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_33
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_33
		
		# Calling function function_a2i_aux_at_A2I
		jal function_a2i_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_34 = result of function_a2i_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 4($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 52($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_22 = internal_34
		lw $t0, 4($sp)
		sw $t0, 52($sp)
		end_assign:
		
		# Jumping to endif_8792981817507
		j endif_8792981817507
		
		else_8792981817507:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 160($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument s
		lw $t0, 156($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_a2i_aux_at_A2I
		jal function_a2i_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_35 = result of function_a2i_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 52($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_22 = internal_35
		lw $t0, 0($sp)
		sw $t0, 52($sp)
		end_assign:
		
		# Jumping to endif_8792981817507
		j endif_8792981817507
		
		endif_8792981817507:
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 116($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_22
		lw $t0, 52($sp)
		sw $t0, 116($sp)
		end_assign:
		
		# Jumping to endif_8792981817513
		j endif_8792981817513
		
		endif_8792981817513:
		
		lw $t0, 116($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 140($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_6
		lw $t0, 116($sp)
		sw $t0, 140($sp)
		end_assign:
		
		# Jumping to endif_8792981817498
		j endif_8792981817498
		
		endif_8792981817498:
		
		# Loading return value in $v1
		lw $v1, 140($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 144
		
		jr $ra
		
	function_a2i_aux_at_A2I:
		# Function parameters
		#   $ra = 72($sp)
		#   self = 68($sp)
		#   s = 64($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -64
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 56($sp) # internal_1 = address of allocated object Int
		
		lw $t0, 56($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# int = internal_1
		lw $t0, 56($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument s
		lw $t0, 72($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_length_at_String
		jal function_length_at_String
		lw $ra, 4($sp)
		sw $v1, 56($sp) # internal_3 = result of function_length_at_String
		addi $sp, $sp, 8 # Freeing space for arguments
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 52($sp)
		j end_assign
		not_is_Bool_or_Int:
		# j = internal_3
		lw $t0, 48($sp)
		sw $t0, 52($sp)
		end_assign:
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_5 = address of allocated object Int
		
		lw $t0, 40($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# i = internal_5
		lw $t0, 40($sp)
		sw $t0, 44($sp)
		end_assign:
		
		while_start_8792981818167:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 56($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument j
		lw $t0, 64($sp)
		sw $t0, 0($sp) # Storing j
		
		# Calling function function_less_than
		jal function_less_than
		lw $ra, 8($sp)
		sw $v1, 44($sp) # internal_7 = result of function_less_than
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 36($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_7
		lw $t0, 32($sp)
		sw $t0, 36($sp)
		end_assign:
		
		# If internal_6 then goto while_body_8792981818167
		lw $t0, 36($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, while_body_8792981818167
		
		# Jumping to while_end_8792981818167
		j while_end_8792981818167
		
		while_body_8792981818167:
		
		# Allocating Int 10
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 10
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 28($sp) # internal_8 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument int
		lw $t0, 72($sp)
		sw $t0, 4($sp) # Storing int
		
		# Argument internal_8
		lw $t0, 40($sp)
		sw $t0, 0($sp) # Storing internal_8
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 36($sp) # internal_9 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 20($sp) # internal_10 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument s
		lw $t0, 80($sp)
		sw $t0, 8($sp) # Storing s
		
		# Argument i
		lw $t0, 60($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_10
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing internal_10
		
		# Calling function function_substr_at_String
		jal function_substr_at_String
		lw $ra, 12($sp)
		sw $v1, 32($sp) # internal_11 = result of function_substr_at_String
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 80($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_11
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_11
		
		# Calling function function_c2i_at_A2I
		jal function_c2i_at_A2I
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_12 = result of function_c2i_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 36($sp)
		sw $t0, 4($sp) # Storing internal_9
		
		# Argument internal_12
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_add
		jal function_add
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_13 = result of function_add
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 8($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# int = internal_13
		lw $t0, 8($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 4($sp) # internal_14 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 56($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_14
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_14
		
		# Calling function function_add
		jal function_add
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_15 = result of function_add
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# i = internal_15
		lw $t0, 0($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# Jumping to while_start_8792981818167
		j while_start_8792981818167
		
		while_end_8792981818167:
		
		# Loading return value in $v1
		lw $v1, 60($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 64
		
		jr $ra
		
	function_i2a_at_A2I:
		# Function parameters
		#   $ra = 80($sp)
		#   self = 76($sp)
		#   i = 72($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -72
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 64($sp) # internal_1 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 60($sp) # internal_2 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 84($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_2
		lw $t0, 72($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 68($sp) # internal_3 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 56($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 64($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_3
		lw $t0, 56($sp)
		sw $t0, 64($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981818296
		lw $t0, 64($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981818296
		
		# Jumping to else_8792981818296
		j else_8792981818296
		
		then_8792981818296:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 48
		sb $t0, 8($v0) # internal_4[0] = '0'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 52($sp) # internal_4 = "0"
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 68($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_4
		lw $t0, 52($sp)
		sw $t0, 68($sp)
		end_assign:
		
		# Jumping to endif_8792981818296
		j endif_8792981818296
		
		else_8792981818296:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 44($sp) # internal_6 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_7 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_7
		lw $t0, 52($sp)
		sw $t0, 4($sp) # Storing internal_7
		
		# Argument i
		lw $t0, 84($sp)
		sw $t0, 0($sp) # Storing i
		
		# Calling function function_less_than
		jal function_less_than
		lw $ra, 8($sp)
		sw $v1, 48($sp) # internal_8 = result of function_less_than
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_6 = internal_8
		lw $t0, 36($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# If internal_6 then goto then_8792981818302
		lw $t0, 44($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981818302
		
		# Jumping to else_8792981818302
		j else_8792981818302
		
		then_8792981818302:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 88($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument i
		lw $t0, 84($sp)
		sw $t0, 0($sp) # Storing i
		
		# Calling function function_i2a_aux_at_A2I
		jal function_i2a_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 44($sp) # internal_9 = result of function_i2a_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_9
		lw $t0, 32($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981818302
		j endif_8792981818302
		
		else_8792981818302:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 45
		sb $t0, 8($v0) # internal_10[0] = '-'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 28($sp) # internal_10 = "-"
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 24($sp) # internal_11 = address of allocated object Int
		
		# Xor operation
		lw $t0, 24($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 16($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 12($sp) # $t0 = internal_14
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 12($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 20($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 12($sp) # $t0 = internal_14
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 84($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_14
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_14
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_15 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 88($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_15
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_15
		
		# Calling function function_i2a_aux_at_A2I
		jal function_i2a_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_16 = result of function_i2a_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_10
		lw $t0, 40($sp)
		sw $t0, 4($sp) # Storing internal_10
		
		# Argument internal_16
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_16
		
		# Calling function function_concat_at_String
		jal function_concat_at_String
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_17 = result of function_concat_at_String
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_5 = internal_17
		lw $t0, 0($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981818302
		j endif_8792981818302
		
		endif_8792981818302:
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 68($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_5
		lw $t0, 48($sp)
		sw $t0, 68($sp)
		end_assign:
		
		# Jumping to endif_8792981818296
		j endif_8792981818296
		
		endif_8792981818296:
		
		# Loading return value in $v1
		lw $v1, 68($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 72
		
		jr $ra
		
	function_i2a_aux_at_A2I:
		# Function parameters
		#   $ra = 64($sp)
		#   self = 60($sp)
		#   i = 56($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -56
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 48($sp) # internal_1 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 44($sp) # internal_2 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 68($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_2
		lw $t0, 56($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 52($sp) # internal_3 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 40($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_3
		lw $t0, 40($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# If internal_1 then goto then_8792981818670
		lw $t0, 48($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981818670
		
		# Jumping to else_8792981818670
		j else_8792981818670
		
		then_8792981818670:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 9 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 0
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		sb $zero, 8($v0) # Null-terminator at the end of the string
		
		sw $v0, 36($sp) # internal_4 = ""
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 52($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_4
		lw $t0, 36($sp)
		sw $t0, 52($sp)
		end_assign:
		
		# Jumping to endif_8792981818670
		j endif_8792981818670
		
		else_8792981818670:
		
		# Allocating Int 10
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 10
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 28($sp) # internal_6 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 68($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_6
		lw $t0, 40($sp)
		sw $t0, 0($sp) # Storing internal_6
		
		# Calling function function_div
		jal function_div
		lw $ra, 8($sp)
		sw $v1, 36($sp) # internal_7 = result of function_div
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 24($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 32($sp)
		j end_assign
		not_is_Bool_or_Int:
		# next = internal_7
		lw $t0, 24($sp)
		sw $t0, 32($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 72($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument next
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing next
		
		# Calling function function_i2a_aux_at_A2I
		jal function_i2a_aux_at_A2I
		lw $ra, 8($sp)
		sw $v1, 32($sp) # internal_8 = result of function_i2a_aux_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating Int 10
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 10
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 16($sp) # internal_9 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument next
		lw $t0, 44($sp)
		sw $t0, 4($sp) # Storing next
		
		# Argument internal_9
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_9
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_10 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument i
		lw $t0, 68($sp)
		sw $t0, 4($sp) # Storing i
		
		# Argument internal_10
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_10
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_11 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 72($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_11
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_11
		
		# Calling function function_i2c_at_A2I
		jal function_i2c_at_A2I
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_12 = result of function_i2c_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_8
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing internal_8
		
		# Argument internal_12
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_concat_at_String
		jal function_concat_at_String
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_13 = result of function_concat_at_String
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 52($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_13
		lw $t0, 0($sp)
		sw $t0, 52($sp)
		end_assign:
		
		# Jumping to endif_8792981818670
		j endif_8792981818670
		
		endif_8792981818670:
		
		# Loading return value in $v1
		lw $v1, 52($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 56
		
		jr $ra
		
	function___init___at_Main:
		# Function parameters
		#   $ra = 12($sp)
		#   self = 8($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -8
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 9 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 0
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		sb $zero, 8($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_0 = ""
		
		# Set attribute char of self
		lw $t0, 8($sp) # $t0 = self
		lw $t1, 4($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.char = internal_0
		
		# Set attribute avar of self
		lw $t0, 8($sp) # $t0 = self
		sw $zero, 12($t0) # Set the attribute avar of self
		
		# Set attribute a_var of self
		lw $t0, 8($sp) # $t0 = self
		sw $zero, 16($t0) # Set the attribute a_var of self
		
		# Allocating Bool 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 0($sp) # internal_1 = address of allocated object Int
		
		# Set attribute flag of self
		lw $t0, 8($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_1
		sw $t1, 20($t0) # self.flag = internal_1
		
		# Loading return value in $v1
		lw $v1, 8($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 8
		
		jr $ra
		
	function_menu_at_Main:
		# Function parameters
		#   $ra = 216($sp)
		#   self = 212($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -212
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 30 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 21
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 10
		sb $t0, 8($v0) # internal_0[0] = '\n'
		
		addi $t0, $zero, 9
		sb $t0, 9($v0) # internal_0[1] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 10($v0) # internal_0[2] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 11($v0) # internal_0[3] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 12($v0) # internal_0[4] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 13($v0) # internal_0[5] = 'a'
		
		addi $t0, $zero, 100
		sb $t0, 14($v0) # internal_0[6] = 'd'
		
		addi $t0, $zero, 100
		sb $t0, 15($v0) # internal_0[7] = 'd'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_0[8] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 17($v0) # internal_0[9] = 'a'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_0[10] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 19($v0) # internal_0[11] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 20($v0) # internal_0[12] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 21($v0) # internal_0[13] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 22($v0) # internal_0[14] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 23($v0) # internal_0[15] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 24($v0) # internal_0[16] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_0[17] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 26($v0) # internal_0[18] = 't'
		
		addi $t0, $zero, 111
		sb $t0, 27($v0) # internal_0[19] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 28($v0) # internal_0[20] = ' '
		
		sb $zero, 29($v0) # Null-terminator at the end of the string
		
		sw $v0, 208($sp) # internal_0 = "\n\tTo add a number to "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_0
		lw $t0, 220($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 216($sp) # internal_1 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 200($sp) # internal_2 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_2
		lw $t0, 212($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 208($sp) # internal_3 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 46
		sb $t0, 8($v0) # internal_4[0] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 9($v0) # internal_4[1] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 10($v0) # internal_4[2] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_4[3] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_4[4] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_4[5] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 14($v0) # internal_4[6] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 15($v0) # internal_4[7] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_4[8] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 17($v0) # internal_4[9] = 'a'
		
		addi $t0, $zero, 58
		sb $t0, 18($v0) # internal_4[10] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 19($v0) # internal_4[11] = '\n'
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 192($sp) # internal_4 = "...enter a:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_4
		lw $t0, 204($sp)
		sw $t0, 0($sp) # Storing internal_4
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 200($sp) # internal_5 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 20 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 11
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_6[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_6[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_6[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_6[3] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_6[4] = 'n'
		
		addi $t0, $zero, 101
		sb $t0, 13($v0) # internal_6[5] = 'e'
		
		addi $t0, $zero, 103
		sb $t0, 14($v0) # internal_6[6] = 'g'
		
		addi $t0, $zero, 97
		sb $t0, 15($v0) # internal_6[7] = 'a'
		
		addi $t0, $zero, 116
		sb $t0, 16($v0) # internal_6[8] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_6[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_6[10] = ' '
		
		sb $zero, 19($v0) # Null-terminator at the end of the string
		
		sw $v0, 184($sp) # internal_6 = "\tTo negate "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_6
		lw $t0, 196($sp)
		sw $t0, 0($sp) # Storing internal_6
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 192($sp) # internal_7 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 176($sp) # internal_8 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_8
		lw $t0, 188($sp)
		sw $t0, 0($sp) # Storing internal_8
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 184($sp) # internal_9 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 46
		sb $t0, 8($v0) # internal_10[0] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 9($v0) # internal_10[1] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 10($v0) # internal_10[2] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_10[3] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_10[4] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_10[5] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 14($v0) # internal_10[6] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 15($v0) # internal_10[7] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_10[8] = ' '
		
		addi $t0, $zero, 98
		sb $t0, 17($v0) # internal_10[9] = 'b'
		
		addi $t0, $zero, 58
		sb $t0, 18($v0) # internal_10[10] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 19($v0) # internal_10[11] = '\n'
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 168($sp) # internal_10 = "...enter b:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_10
		lw $t0, 180($sp)
		sw $t0, 0($sp) # Storing internal_10
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 176($sp) # internal_11 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 41 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 32
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_12[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_12[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_12[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_12[3] = ' '
		
		addi $t0, $zero, 102
		sb $t0, 12($v0) # internal_12[4] = 'f'
		
		addi $t0, $zero, 105
		sb $t0, 13($v0) # internal_12[5] = 'i'
		
		addi $t0, $zero, 110
		sb $t0, 14($v0) # internal_12[6] = 'n'
		
		addi $t0, $zero, 100
		sb $t0, 15($v0) # internal_12[7] = 'd'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_12[8] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 17($v0) # internal_12[9] = 't'
		
		addi $t0, $zero, 104
		sb $t0, 18($v0) # internal_12[10] = 'h'
		
		addi $t0, $zero, 101
		sb $t0, 19($v0) # internal_12[11] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_12[12] = ' '
		
		addi $t0, $zero, 100
		sb $t0, 21($v0) # internal_12[13] = 'd'
		
		addi $t0, $zero, 105
		sb $t0, 22($v0) # internal_12[14] = 'i'
		
		addi $t0, $zero, 102
		sb $t0, 23($v0) # internal_12[15] = 'f'
		
		addi $t0, $zero, 102
		sb $t0, 24($v0) # internal_12[16] = 'f'
		
		addi $t0, $zero, 101
		sb $t0, 25($v0) # internal_12[17] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 26($v0) # internal_12[18] = 'r'
		
		addi $t0, $zero, 101
		sb $t0, 27($v0) # internal_12[19] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 28($v0) # internal_12[20] = 'n'
		
		addi $t0, $zero, 99
		sb $t0, 29($v0) # internal_12[21] = 'c'
		
		addi $t0, $zero, 101
		sb $t0, 30($v0) # internal_12[22] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 31($v0) # internal_12[23] = ' '
		
		addi $t0, $zero, 98
		sb $t0, 32($v0) # internal_12[24] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 33($v0) # internal_12[25] = 'e'
		
		addi $t0, $zero, 116
		sb $t0, 34($v0) # internal_12[26] = 't'
		
		addi $t0, $zero, 119
		sb $t0, 35($v0) # internal_12[27] = 'w'
		
		addi $t0, $zero, 101
		sb $t0, 36($v0) # internal_12[28] = 'e'
		
		addi $t0, $zero, 101
		sb $t0, 37($v0) # internal_12[29] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 38($v0) # internal_12[30] = 'n'
		
		addi $t0, $zero, 32
		sb $t0, 39($v0) # internal_12[31] = ' '
		
		sb $zero, 40($v0) # Null-terminator at the end of the string
		
		sw $v0, 160($sp) # internal_12 = "\tTo find the difference between "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_12
		lw $t0, 172($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 168($sp) # internal_13 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 152($sp) # internal_14 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_14
		lw $t0, 164($sp)
		sw $t0, 0($sp) # Storing internal_14
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 160($sp) # internal_15 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 39 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 30
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 97
		sb $t0, 8($v0) # internal_16[0] = 'a'
		
		addi $t0, $zero, 110
		sb $t0, 9($v0) # internal_16[1] = 'n'
		
		addi $t0, $zero, 100
		sb $t0, 10($v0) # internal_16[2] = 'd'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_16[3] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 12($v0) # internal_16[4] = 'a'
		
		addi $t0, $zero, 110
		sb $t0, 13($v0) # internal_16[5] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 14($v0) # internal_16[6] = 'o'
		
		addi $t0, $zero, 116
		sb $t0, 15($v0) # internal_16[7] = 't'
		
		addi $t0, $zero, 104
		sb $t0, 16($v0) # internal_16[8] = 'h'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_16[9] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 18($v0) # internal_16[10] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 19($v0) # internal_16[11] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 20($v0) # internal_16[12] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 21($v0) # internal_16[13] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 22($v0) # internal_16[14] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 23($v0) # internal_16[15] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 24($v0) # internal_16[16] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 25($v0) # internal_16[17] = 'r'
		
		addi $t0, $zero, 46
		sb $t0, 26($v0) # internal_16[18] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 27($v0) # internal_16[19] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 28($v0) # internal_16[20] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 29($v0) # internal_16[21] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 30($v0) # internal_16[22] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 31($v0) # internal_16[23] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 32($v0) # internal_16[24] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 33($v0) # internal_16[25] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 34($v0) # internal_16[26] = ' '
		
		addi $t0, $zero, 99
		sb $t0, 35($v0) # internal_16[27] = 'c'
		
		addi $t0, $zero, 58
		sb $t0, 36($v0) # internal_16[28] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 37($v0) # internal_16[29] = '\n'
		
		sb $zero, 38($v0) # Null-terminator at the end of the string
		
		sw $v0, 144($sp) # internal_16 = "and another number...enter c:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_16
		lw $t0, 156($sp)
		sw $t0, 0($sp) # Storing internal_16
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 152($sp) # internal_17 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 35 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 26
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_18[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_18[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_18[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_18[3] = ' '
		
		addi $t0, $zero, 102
		sb $t0, 12($v0) # internal_18[4] = 'f'
		
		addi $t0, $zero, 105
		sb $t0, 13($v0) # internal_18[5] = 'i'
		
		addi $t0, $zero, 110
		sb $t0, 14($v0) # internal_18[6] = 'n'
		
		addi $t0, $zero, 100
		sb $t0, 15($v0) # internal_18[7] = 'd'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_18[8] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 17($v0) # internal_18[9] = 't'
		
		addi $t0, $zero, 104
		sb $t0, 18($v0) # internal_18[10] = 'h'
		
		addi $t0, $zero, 101
		sb $t0, 19($v0) # internal_18[11] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_18[12] = ' '
		
		addi $t0, $zero, 102
		sb $t0, 21($v0) # internal_18[13] = 'f'
		
		addi $t0, $zero, 97
		sb $t0, 22($v0) # internal_18[14] = 'a'
		
		addi $t0, $zero, 99
		sb $t0, 23($v0) # internal_18[15] = 'c'
		
		addi $t0, $zero, 116
		sb $t0, 24($v0) # internal_18[16] = 't'
		
		addi $t0, $zero, 111
		sb $t0, 25($v0) # internal_18[17] = 'o'
		
		addi $t0, $zero, 114
		sb $t0, 26($v0) # internal_18[18] = 'r'
		
		addi $t0, $zero, 105
		sb $t0, 27($v0) # internal_18[19] = 'i'
		
		addi $t0, $zero, 97
		sb $t0, 28($v0) # internal_18[20] = 'a'
		
		addi $t0, $zero, 108
		sb $t0, 29($v0) # internal_18[21] = 'l'
		
		addi $t0, $zero, 32
		sb $t0, 30($v0) # internal_18[22] = ' '
		
		addi $t0, $zero, 111
		sb $t0, 31($v0) # internal_18[23] = 'o'
		
		addi $t0, $zero, 102
		sb $t0, 32($v0) # internal_18[24] = 'f'
		
		addi $t0, $zero, 32
		sb $t0, 33($v0) # internal_18[25] = ' '
		
		sb $zero, 34($v0) # Null-terminator at the end of the string
		
		sw $v0, 136($sp) # internal_18 = "\tTo find the factorial of "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_18
		lw $t0, 148($sp)
		sw $t0, 0($sp) # Storing internal_18
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 144($sp) # internal_19 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 128($sp) # internal_20 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_20
		lw $t0, 140($sp)
		sw $t0, 0($sp) # Storing internal_20
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 136($sp) # internal_21 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 46
		sb $t0, 8($v0) # internal_22[0] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 9($v0) # internal_22[1] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 10($v0) # internal_22[2] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_22[3] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_22[4] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_22[5] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 14($v0) # internal_22[6] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 15($v0) # internal_22[7] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_22[8] = ' '
		
		addi $t0, $zero, 100
		sb $t0, 17($v0) # internal_22[9] = 'd'
		
		addi $t0, $zero, 58
		sb $t0, 18($v0) # internal_22[10] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 19($v0) # internal_22[11] = '\n'
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 120($sp) # internal_22 = "...enter d:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_22
		lw $t0, 132($sp)
		sw $t0, 0($sp) # Storing internal_22
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 128($sp) # internal_23 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 20 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 11
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_24[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_24[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_24[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_24[3] = ' '
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_24[4] = 's'
		
		addi $t0, $zero, 113
		sb $t0, 13($v0) # internal_24[5] = 'q'
		
		addi $t0, $zero, 117
		sb $t0, 14($v0) # internal_24[6] = 'u'
		
		addi $t0, $zero, 97
		sb $t0, 15($v0) # internal_24[7] = 'a'
		
		addi $t0, $zero, 114
		sb $t0, 16($v0) # internal_24[8] = 'r'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_24[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_24[10] = ' '
		
		sb $zero, 19($v0) # Null-terminator at the end of the string
		
		sw $v0, 112($sp) # internal_24 = "\tTo square "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_24
		lw $t0, 124($sp)
		sw $t0, 0($sp) # Storing internal_24
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 120($sp) # internal_25 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 104($sp) # internal_26 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_26
		lw $t0, 116($sp)
		sw $t0, 0($sp) # Storing internal_26
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 112($sp) # internal_27 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 46
		sb $t0, 8($v0) # internal_28[0] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 9($v0) # internal_28[1] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 10($v0) # internal_28[2] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_28[3] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_28[4] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_28[5] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 14($v0) # internal_28[6] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 15($v0) # internal_28[7] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_28[8] = ' '
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_28[9] = 'e'
		
		addi $t0, $zero, 58
		sb $t0, 18($v0) # internal_28[10] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 19($v0) # internal_28[11] = '\n'
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 96($sp) # internal_28 = "...enter e:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_28
		lw $t0, 108($sp)
		sw $t0, 0($sp) # Storing internal_28
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 104($sp) # internal_29 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 18 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 9
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_30[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_30[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_30[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_30[3] = ' '
		
		addi $t0, $zero, 99
		sb $t0, 12($v0) # internal_30[4] = 'c'
		
		addi $t0, $zero, 117
		sb $t0, 13($v0) # internal_30[5] = 'u'
		
		addi $t0, $zero, 98
		sb $t0, 14($v0) # internal_30[6] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 15($v0) # internal_30[7] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_30[8] = ' '
		
		sb $zero, 17($v0) # Null-terminator at the end of the string
		
		sw $v0, 88($sp) # internal_30 = "\tTo cube "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_30
		lw $t0, 100($sp)
		sw $t0, 0($sp) # Storing internal_30
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 96($sp) # internal_31 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 80($sp) # internal_32 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_32
		lw $t0, 92($sp)
		sw $t0, 0($sp) # Storing internal_32
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 88($sp) # internal_33 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 46
		sb $t0, 8($v0) # internal_34[0] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 9($v0) # internal_34[1] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 10($v0) # internal_34[2] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_34[3] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 12($v0) # internal_34[4] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_34[5] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 14($v0) # internal_34[6] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 15($v0) # internal_34[7] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_34[8] = ' '
		
		addi $t0, $zero, 102
		sb $t0, 17($v0) # internal_34[9] = 'f'
		
		addi $t0, $zero, 58
		sb $t0, 18($v0) # internal_34[10] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 19($v0) # internal_34[11] = '\n'
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 72($sp) # internal_34 = "...enter f:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_34
		lw $t0, 84($sp)
		sw $t0, 0($sp) # Storing internal_34
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 80($sp) # internal_35 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 25 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 16
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_36[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_36[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_36[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_36[3] = ' '
		
		addi $t0, $zero, 102
		sb $t0, 12($v0) # internal_36[4] = 'f'
		
		addi $t0, $zero, 105
		sb $t0, 13($v0) # internal_36[5] = 'i'
		
		addi $t0, $zero, 110
		sb $t0, 14($v0) # internal_36[6] = 'n'
		
		addi $t0, $zero, 100
		sb $t0, 15($v0) # internal_36[7] = 'd'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_36[8] = ' '
		
		addi $t0, $zero, 111
		sb $t0, 17($v0) # internal_36[9] = 'o'
		
		addi $t0, $zero, 117
		sb $t0, 18($v0) # internal_36[10] = 'u'
		
		addi $t0, $zero, 116
		sb $t0, 19($v0) # internal_36[11] = 't'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_36[12] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 21($v0) # internal_36[13] = 'i'
		
		addi $t0, $zero, 102
		sb $t0, 22($v0) # internal_36[14] = 'f'
		
		addi $t0, $zero, 32
		sb $t0, 23($v0) # internal_36[15] = ' '
		
		sb $zero, 24($v0) # Null-terminator at the end of the string
		
		sw $v0, 64($sp) # internal_36 = "\tTo find out if "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_36
		lw $t0, 76($sp)
		sw $t0, 0($sp) # Storing internal_36
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 72($sp) # internal_37 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 56($sp) # internal_38 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_38
		lw $t0, 68($sp)
		sw $t0, 0($sp) # Storing internal_38
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 64($sp) # internal_39 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 39 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 30
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_40[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_40[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_40[2] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 11($v0) # internal_40[3] = 'a'
		
		addi $t0, $zero, 32
		sb $t0, 12($v0) # internal_40[4] = ' '
		
		addi $t0, $zero, 109
		sb $t0, 13($v0) # internal_40[5] = 'm'
		
		addi $t0, $zero, 117
		sb $t0, 14($v0) # internal_40[6] = 'u'
		
		addi $t0, $zero, 108
		sb $t0, 15($v0) # internal_40[7] = 'l'
		
		addi $t0, $zero, 116
		sb $t0, 16($v0) # internal_40[8] = 't'
		
		addi $t0, $zero, 105
		sb $t0, 17($v0) # internal_40[9] = 'i'
		
		addi $t0, $zero, 112
		sb $t0, 18($v0) # internal_40[10] = 'p'
		
		addi $t0, $zero, 108
		sb $t0, 19($v0) # internal_40[11] = 'l'
		
		addi $t0, $zero, 101
		sb $t0, 20($v0) # internal_40[12] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_40[13] = ' '
		
		addi $t0, $zero, 111
		sb $t0, 22($v0) # internal_40[14] = 'o'
		
		addi $t0, $zero, 102
		sb $t0, 23($v0) # internal_40[15] = 'f'
		
		addi $t0, $zero, 32
		sb $t0, 24($v0) # internal_40[16] = ' '
		
		addi $t0, $zero, 51
		sb $t0, 25($v0) # internal_40[17] = '3'
		
		addi $t0, $zero, 46
		sb $t0, 26($v0) # internal_40[18] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 27($v0) # internal_40[19] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 28($v0) # internal_40[20] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 29($v0) # internal_40[21] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 30($v0) # internal_40[22] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 31($v0) # internal_40[23] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 32($v0) # internal_40[24] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 33($v0) # internal_40[25] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 34($v0) # internal_40[26] = ' '
		
		addi $t0, $zero, 103
		sb $t0, 35($v0) # internal_40[27] = 'g'
		
		addi $t0, $zero, 58
		sb $t0, 36($v0) # internal_40[28] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 37($v0) # internal_40[29] = '\n'
		
		sb $zero, 38($v0) # Null-terminator at the end of the string
		
		sw $v0, 48($sp) # internal_40 = "is a multiple of 3...enter g:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_40
		lw $t0, 60($sp)
		sw $t0, 0($sp) # Storing internal_40
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 56($sp) # internal_41 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 20 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 11
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_42[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_42[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_42[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_42[3] = ' '
		
		addi $t0, $zero, 100
		sb $t0, 12($v0) # internal_42[4] = 'd'
		
		addi $t0, $zero, 105
		sb $t0, 13($v0) # internal_42[5] = 'i'
		
		addi $t0, $zero, 118
		sb $t0, 14($v0) # internal_42[6] = 'v'
		
		addi $t0, $zero, 105
		sb $t0, 15($v0) # internal_42[7] = 'i'
		
		addi $t0, $zero, 100
		sb $t0, 16($v0) # internal_42[8] = 'd'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_42[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_42[10] = ' '
		
		sb $zero, 19($v0) # Null-terminator at the end of the string
		
		sw $v0, 40($sp) # internal_42 = "\tTo divide "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_42
		lw $t0, 52($sp)
		sw $t0, 0($sp) # Storing internal_42
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 48($sp) # internal_43 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 212($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 32($sp) # internal_44 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_44
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing internal_44
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 40($sp) # internal_45 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 25 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 16
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 98
		sb $t0, 8($v0) # internal_46[0] = 'b'
		
		addi $t0, $zero, 121
		sb $t0, 9($v0) # internal_46[1] = 'y'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_46[2] = ' '
		
		addi $t0, $zero, 56
		sb $t0, 11($v0) # internal_46[3] = '8'
		
		addi $t0, $zero, 46
		sb $t0, 12($v0) # internal_46[4] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 13($v0) # internal_46[5] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 14($v0) # internal_46[6] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 15($v0) # internal_46[7] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 16($v0) # internal_46[8] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 17($v0) # internal_46[9] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 18($v0) # internal_46[10] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_46[11] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_46[12] = ' '
		
		addi $t0, $zero, 104
		sb $t0, 21($v0) # internal_46[13] = 'h'
		
		addi $t0, $zero, 58
		sb $t0, 22($v0) # internal_46[14] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 23($v0) # internal_46[15] = '\n'
		
		sb $zero, 24($v0) # Null-terminator at the end of the string
		
		sw $v0, 24($sp) # internal_46 = "by 8...enter h:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_46
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing internal_46
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 32($sp) # internal_47 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 41 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 32
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_48[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_48[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_48[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_48[3] = ' '
		
		addi $t0, $zero, 103
		sb $t0, 12($v0) # internal_48[4] = 'g'
		
		addi $t0, $zero, 101
		sb $t0, 13($v0) # internal_48[5] = 'e'
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_48[6] = 't'
		
		addi $t0, $zero, 32
		sb $t0, 15($v0) # internal_48[7] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 16($v0) # internal_48[8] = 'a'
		
		addi $t0, $zero, 32
		sb $t0, 17($v0) # internal_48[9] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 18($v0) # internal_48[10] = 'n'
		
		addi $t0, $zero, 101
		sb $t0, 19($v0) # internal_48[11] = 'e'
		
		addi $t0, $zero, 119
		sb $t0, 20($v0) # internal_48[12] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_48[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_48[14] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 23($v0) # internal_48[15] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 24($v0) # internal_48[16] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 25($v0) # internal_48[17] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 26($v0) # internal_48[18] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 27($v0) # internal_48[19] = 'r'
		
		addi $t0, $zero, 46
		sb $t0, 28($v0) # internal_48[20] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 29($v0) # internal_48[21] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 30($v0) # internal_48[22] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 31($v0) # internal_48[23] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 32($v0) # internal_48[24] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 33($v0) # internal_48[25] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 34($v0) # internal_48[26] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 35($v0) # internal_48[27] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 36($v0) # internal_48[28] = ' '
		
		addi $t0, $zero, 106
		sb $t0, 37($v0) # internal_48[29] = 'j'
		
		addi $t0, $zero, 58
		sb $t0, 38($v0) # internal_48[30] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 39($v0) # internal_48[31] = '\n'
		
		sb $zero, 40($v0) # Null-terminator at the end of the string
		
		sw $v0, 16($sp) # internal_48 = "\tTo get a new number...enter j:\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_48
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_48
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_49 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 30 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 21
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 9
		sb $t0, 8($v0) # internal_50[0] = '\t'
		
		addi $t0, $zero, 84
		sb $t0, 9($v0) # internal_50[1] = 'T'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_50[2] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 11($v0) # internal_50[3] = ' '
		
		addi $t0, $zero, 113
		sb $t0, 12($v0) # internal_50[4] = 'q'
		
		addi $t0, $zero, 117
		sb $t0, 13($v0) # internal_50[5] = 'u'
		
		addi $t0, $zero, 105
		sb $t0, 14($v0) # internal_50[6] = 'i'
		
		addi $t0, $zero, 116
		sb $t0, 15($v0) # internal_50[7] = 't'
		
		addi $t0, $zero, 46
		sb $t0, 16($v0) # internal_50[8] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 17($v0) # internal_50[9] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 18($v0) # internal_50[10] = '.'
		
		addi $t0, $zero, 101
		sb $t0, 19($v0) # internal_50[11] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 20($v0) # internal_50[12] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 21($v0) # internal_50[13] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 22($v0) # internal_50[14] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 23($v0) # internal_50[15] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 24($v0) # internal_50[16] = ' '
		
		addi $t0, $zero, 113
		sb $t0, 25($v0) # internal_50[17] = 'q'
		
		addi $t0, $zero, 58
		sb $t0, 26($v0) # internal_50[18] = ':'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_50[19] = '\n'
		
		addi $t0, $zero, 10
		sb $t0, 28($v0) # internal_50[20] = '\n'
		
		sb $zero, 29($v0) # Null-terminator at the end of the string
		
		sw $v0, 8($sp) # internal_50 = "\tTo quit...enter q:\n\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 224($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_50
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_50
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_51 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_in_string_at_IO
		jal function_in_string_at_IO
		lw $ra, 4($sp)
		sw $v1, 8($sp) # internal_52 = result of function_in_string_at_IO
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 212
		
		jr $ra
		
	function_prompt_at_Main:
		# Function parameters
		#   $ra = 24($sp)
		#   self = 20($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -20
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 10
		sb $t0, 8($v0) # internal_0[0] = '\n'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 16($sp) # internal_0 = "\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_0
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_1 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 35 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 26
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 80
		sb $t0, 8($v0) # internal_2[0] = 'P'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_2[1] = 'l'
		
		addi $t0, $zero, 101
		sb $t0, 10($v0) # internal_2[2] = 'e'
		
		addi $t0, $zero, 97
		sb $t0, 11($v0) # internal_2[3] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_2[4] = 's'
		
		addi $t0, $zero, 101
		sb $t0, 13($v0) # internal_2[5] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_2[6] = ' '
		
		addi $t0, $zero, 101
		sb $t0, 15($v0) # internal_2[7] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 16($v0) # internal_2[8] = 'n'
		
		addi $t0, $zero, 116
		sb $t0, 17($v0) # internal_2[9] = 't'
		
		addi $t0, $zero, 101
		sb $t0, 18($v0) # internal_2[10] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_2[11] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_2[12] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 21($v0) # internal_2[13] = 'a'
		
		addi $t0, $zero, 32
		sb $t0, 22($v0) # internal_2[14] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 23($v0) # internal_2[15] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 24($v0) # internal_2[16] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 25($v0) # internal_2[17] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 26($v0) # internal_2[18] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 27($v0) # internal_2[19] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 28($v0) # internal_2[20] = 'r'
		
		addi $t0, $zero, 46
		sb $t0, 29($v0) # internal_2[21] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 30($v0) # internal_2[22] = '.'
		
		addi $t0, $zero, 46
		sb $t0, 31($v0) # internal_2[23] = '.'
		
		addi $t0, $zero, 32
		sb $t0, 32($v0) # internal_2[24] = ' '
		
		addi $t0, $zero, 32
		sb $t0, 33($v0) # internal_2[25] = ' '
		
		sb $zero, 34($v0) # Null-terminator at the end of the string
		
		sw $v0, 8($sp) # internal_2 = "Please enter a number...  "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_2
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_3 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_in_string_at_IO
		jal function_in_string_at_IO
		lw $ra, 4($sp)
		sw $v1, 8($sp) # internal_4 = result of function_in_string_at_IO
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 20
		
		jr $ra
		
	function_get_int_at_Main:
		# Function parameters
		#   $ra = 24($sp)
		#   self = 20($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -20
		
		# Allocating A2I
		li $v0, 9
		lw $a0, type_A2I
		syscall
		la $t0, type_A2I # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 12($sp) # internal_1 = address of allocated object A2I
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_1
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_1
		
		# Calling function function___init___at_A2I
		jal function___init___at_A2I
		lw $ra, 4($sp)
		sw $v1, 20($sp) # internal_1 = result of function___init___at_A2I
		addi $sp, $sp, 8 # Freeing space for arguments
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 16($sp)
		j end_assign
		not_is_Bool_or_Int:
		# z = internal_1
		lw $t0, 12($sp)
		sw $t0, 16($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_prompt_at_Main
		jal function_prompt_at_Main
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_3 = result of function_prompt_at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		lw $t0, 4($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 8($sp)
		j end_assign
		not_is_Bool_or_Int:
		# s = internal_3
		lw $t0, 4($sp)
		sw $t0, 8($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument z
		lw $t0, 28($sp)
		sw $t0, 4($sp) # Storing z
		
		# Argument s
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing s
		
		# Calling function function_a2i_at_A2I
		jal function_a2i_at_A2I
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_4 = result of function_a2i_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 20
		
		jr $ra
		
	function_is_even_at_Main:
		# Function parameters
		#   $ra = 96($sp)
		#   self = 92($sp)
		#   num = 88($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -88
		
		lw $t0, 88($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 84($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = num
		lw $t0, 88($sp)
		sw $t0, 84($sp)
		end_assign:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 76($sp) # internal_2 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 72($sp) # internal_3 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument x
		lw $t0, 96($sp)
		sw $t0, 4($sp) # Storing x
		
		# Argument internal_3
		lw $t0, 84($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function_less_than
		jal function_less_than
		lw $ra, 8($sp)
		sw $v1, 80($sp) # internal_4 = result of function_less_than
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 68($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 76($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_2 = internal_4
		lw $t0, 68($sp)
		sw $t0, 76($sp)
		end_assign:
		
		# If internal_2 then goto then_8792981820167
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981820167
		
		# Jumping to else_8792981820167
		j else_8792981820167
		
		then_8792981820167:
		
		# Xor operation
		lw $t0, 84($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 60($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		xor $t2, $t0, $t1 # $t0 = $t0 ^ $t1
		
		lw $t0, 56($sp) # $t0 = internal_7
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Addition operation
		lw $t0, 56($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 64($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		add $t2, $t0, $t1 # $t2 = $t0 + $t1
		
		lw $t0, 56($sp) # $t0 = internal_7
		sw $t2, 8($t0) # Setting value in the third word of the Int object
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 104($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_7
		lw $t0, 68($sp)
		sw $t0, 0($sp) # Storing internal_7
		
		# Calling function function_is_even_at_Main
		jal function_is_even_at_Main
		lw $ra, 8($sp)
		sw $v1, 64($sp) # internal_8 = result of function_is_even_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 52($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 80($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_8
		lw $t0, 52($sp)
		sw $t0, 80($sp)
		end_assign:
		
		# Jumping to endif_8792981820167
		j endif_8792981820167
		
		else_8792981820167:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 44($sp) # internal_10 = address of allocated object Int
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 40($sp) # internal_11 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_11
		lw $t0, 52($sp)
		sw $t0, 4($sp) # Storing internal_11
		
		# Argument x
		lw $t0, 96($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 48($sp) # internal_12 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 44($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_10 = internal_12
		lw $t0, 36($sp)
		sw $t0, 44($sp)
		end_assign:
		
		# If internal_10 then goto then_8792981820170
		lw $t0, 44($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981820170
		
		# Jumping to else_8792981820170
		j else_8792981820170
		
		then_8792981820170:
		
		# Allocating Bool 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 32($sp) # internal_13 = address of allocated object Int
		
		lw $t0, 32($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_9 = internal_13
		lw $t0, 32($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981820170
		j endif_8792981820170
		
		else_8792981820170:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 24($sp) # internal_15 = address of allocated object Int
		
		# Allocating Int 1
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 1
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 20($sp) # internal_16 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_16
		lw $t0, 32($sp)
		sw $t0, 4($sp) # Storing internal_16
		
		# Argument x
		lw $t0, 96($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 28($sp) # internal_17 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 16($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_15 = internal_17
		lw $t0, 16($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# If internal_15 then goto then_8792981820176
		lw $t0, 24($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981820176
		
		# Jumping to else_8792981820176
		j else_8792981820176
		
		then_8792981820176:
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 12($sp) # internal_18 = address of allocated object Int
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_14 = internal_18
		lw $t0, 12($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Jumping to endif_8792981820176
		j endif_8792981820176
		
		else_8792981820176:
		
		# Allocating Int 2
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 2
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 8($sp) # internal_19 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument x
		lw $t0, 96($sp)
		sw $t0, 4($sp) # Storing x
		
		# Argument internal_19
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_19
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 16($sp) # internal_20 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 104($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_20
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_20
		
		# Calling function function_is_even_at_Main
		jal function_is_even_at_Main
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_21 = result of function_is_even_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 28($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_14 = internal_21
		lw $t0, 0($sp)
		sw $t0, 28($sp)
		end_assign:
		
		# Jumping to endif_8792981820176
		j endif_8792981820176
		
		endif_8792981820176:
		
		lw $t0, 28($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 48($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_9 = internal_14
		lw $t0, 28($sp)
		sw $t0, 48($sp)
		end_assign:
		
		# Jumping to endif_8792981820170
		j endif_8792981820170
		
		endif_8792981820170:
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 80($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_9
		lw $t0, 48($sp)
		sw $t0, 80($sp)
		end_assign:
		
		# Jumping to endif_8792981820167
		j endif_8792981820167
		
		endif_8792981820167:
		
		# Loading return value in $v1
		lw $v1, 80($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 88
		
		jr $ra
		
	function_class_type_at_Main:
		# Function parameters
		#   $ra = 212($sp)
		#   self = 208($sp)
		#   var = 204($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -204
		
		
		
		
		
		
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 180($sp) # internal_5 = address of allocated object Int
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 188($sp) # internal_3 = address of allocated object Int
		
		
		
		
		# internal_1 = typeof var that is the first word of the object
		lw $t0, 204($sp)
		lw $t1, 0($t0)
		sw $t1, 196($sp)
		
		lw $t0, 196($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 192($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_2 = internal_1
		lw $t0, 196($sp)
		sw $t0, 192($sp)
		end_assign:
		
		lw $t0, 180($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 200($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_0 = internal_5
		lw $t0, 180($sp)
		sw $t0, 200($sp)
		end_assign:
		
		while_start_8792981820269:
		
		# Equal operation
		lw $t0, 192($sp) # Save in $t0 the left operand address
		# If internal_3 then goto while_end_8792981820269
		lw $t0, 188($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, while_end_8792981820269
		
		# Addition operation
		lw $t0, 200($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# internal_2 = ancestor of internal_2 that is the first word of the object
		lw $t0, 192($sp)
		lw $t1, 4($t0)
		sw $t1, 192($sp)
		
		# Jumping to while_start_8792981820269
		j while_start_8792981820269
		
		while_end_8792981820269:
		
		
		
		
		lw $t0, 196($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 192($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_2 = internal_1
		lw $t0, 196($sp)
		sw $t0, 192($sp)
		end_assign:
		
		
		foreach_start_8792981820269:
		
		# Less than operation
		lw $t0, 172($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 200($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 168($sp) # $t0 = internal_8
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_8 then goto foreach_body_8792981820269
		lw $t0, 168($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_body_8792981820269
		
		# Jumping to foreach_end_8792981820269
		j foreach_end_8792981820269
		
		foreach_body_8792981820269:
		
		
		# internal_2 = ancestor of internal_2 that is the first word of the object
		lw $t0, 192($sp)
		lw $t1, 4($t0)
		sw $t1, 192($sp)
		
		# Addition operation
		lw $t0, 172($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_start_8792981820269
		j foreach_start_8792981820269
		
		foreach_end_8792981820269:
		
		
		
		
		
		
		# internal_11 = direction of A
		la $t0, type_A
		sw $t0, 156($sp)
		
		
		
		# internal_12 = direction of B
		la $t0, type_B
		sw $t0, 152($sp)
		
		
		
		# internal_13 = direction of C
		la $t0, type_C
		sw $t0, 148($sp)
		
		
		
		# internal_14 = direction of D
		la $t0, type_D
		sw $t0, 144($sp)
		
		
		
		# internal_15 = direction of E
		la $t0, type_E
		sw $t0, 140($sp)
		
		
		
		# internal_16 = direction of Object
		la $t0, type_Object
		sw $t0, 136($sp)
		
		
		
		
		
		
		foreach_type_start_8792981820269:
		
		# Less than operation
		lw $t0, 132($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# If internal_18 then goto foreach_type_body_8792981820269
		lw $t0, 128($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_type_body_8792981820269
		
		# Jumping to foreach_type_end_8792981820269
		j foreach_type_end_8792981820269
		
		foreach_type_body_8792981820269:
		
		
		
		
		
		foreach_ancestor_start_8792981820269:
		
		# Less than operation
		lw $t0, 120($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 200($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 116($sp) # $t0 = internal_21
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_21 then goto foreach_ancestor_body_8792981820269
		lw $t0, 116($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_ancestor_body_8792981820269
		
		# Jumping to foreach_ancestor_end_8792981820269
		j foreach_ancestor_end_8792981820269
		
		foreach_ancestor_body_8792981820269:
		
		
		# Equal operation
		lw $t0, 124($sp) # Save in $t0 the left operand address
		lw $t1, 112($sp) # Save in $t1 the right operand address
		seq $t2, $t0, $t1 # $t2 = $t0 == $t1
		
		lw $t0, 108($sp) # $t0 = internal_23
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_23 then goto foreach_ancestor_end_8792981820269
		lw $t0, 108($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_ancestor_end_8792981820269
		
		# Addition operation
		lw $t0, 120($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_ancestor_start_8792981820269
		j foreach_ancestor_start_8792981820269
		
		foreach_ancestor_end_8792981820269:
		
		
		
		
		
		# Addition operation
		lw $t0, 132($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_type_start_8792981820269
		j foreach_type_start_8792981820269
		
		foreach_type_end_8792981820269:
		
		
		
		
		
		
		
		lw $t0, 200($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 92($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_27 = internal_0
		lw $t0, 200($sp)
		sw $t0, 92($sp)
		end_assign:
		
		foreach_min_start_8792981820269:
		
		# Less than operation
		lw $t0, 104($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# If internal_28 then goto foreach_min_body_8792981820269
		lw $t0, 88($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_min_body_8792981820269
		
		# Jumping to foreach_min_end_8792981820269
		j foreach_min_end_8792981820269
		
		foreach_min_body_8792981820269:
		
		
		# Less than operation
		lw $t0, 96($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 92($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 88($sp) # $t0 = internal_28
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_28 then goto update_min_8792981820269
		lw $t0, 88($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, update_min_8792981820269
		
		# Jumping to foreach_min_end_8792981820269
		j foreach_min_end_8792981820269
		
		update_min_8792981820269:
		
		lw $t0, 96($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 92($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_27 = internal_26
		lw $t0, 96($sp)
		sw $t0, 92($sp)
		end_assign:
		
		lw $t0, 104($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 100($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_25 = internal_24
		lw $t0, 104($sp)
		sw $t0, 100($sp)
		end_assign:
		
		update_min_end_8792981820269:
		
		# Addition operation
		lw $t0, 104($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_min_start_8792981820269
		j foreach_min_start_8792981820269
		
		foreach_min_end_8792981820269:
		
		
		
		
		
		
		
		
		
		
		
		# Equal operation
		lw $t0, 100($sp) # Save in $t0 the left operand address
		lw $t1, 200($sp) # Save in $t1 the right operand address
		seq $t2, $t0, $t1 # $t2 = $t0 == $t1
		
		lw $t0, 80($sp) # $t0 = internal_30
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_30 then goto error_branch_8792981820269
		lw $t0, 80($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, error_branch_8792981820269
		
		
		
		# If internal_31 then goto branch_A_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_A_8792981820269
		
		
		# If internal_31 then goto branch_B_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_B_8792981820269
		
		
		# If internal_31 then goto branch_C_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_C_8792981820269
		
		
		# If internal_31 then goto branch_D_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_D_8792981820269
		
		
		# If internal_31 then goto branch_E_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_E_8792981820269
		
		
		# If internal_31 then goto branch_Object_8792981820269
		lw $t0, 76($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_Object_8792981820269
		
		branch_A_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 29 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 20
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_34[0] = 'C'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_34[1] = 'l'
		
		addi $t0, $zero, 97
		sb $t0, 10($v0) # internal_34[2] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 11($v0) # internal_34[3] = 's'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_34[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_34[5] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_34[6] = 't'
		
		addi $t0, $zero, 121
		sb $t0, 15($v0) # internal_34[7] = 'y'
		
		addi $t0, $zero, 112
		sb $t0, 16($v0) # internal_34[8] = 'p'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_34[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_34[10] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 19($v0) # internal_34[11] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 20($v0) # internal_34[12] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_34[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_34[14] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 23($v0) # internal_34[15] = 'o'
		
		addi $t0, $zero, 119
		sb $t0, 24($v0) # internal_34[16] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_34[17] = ' '
		
		addi $t0, $zero, 65
		sb $t0, 26($v0) # internal_34[18] = 'A'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_34[19] = '\n'
		
		sb $zero, 28($v0) # Null-terminator at the end of the string
		
		sw $v0, 64($sp) # internal_34 = "Class type is now A\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_34
		lw $t0, 76($sp)
		sw $t0, 0($sp) # Storing internal_34
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 72($sp) # internal_35 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 60($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_35
		lw $t0, 60($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		branch_B_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 29 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 20
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_37[0] = 'C'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_37[1] = 'l'
		
		addi $t0, $zero, 97
		sb $t0, 10($v0) # internal_37[2] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 11($v0) # internal_37[3] = 's'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_37[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_37[5] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_37[6] = 't'
		
		addi $t0, $zero, 121
		sb $t0, 15($v0) # internal_37[7] = 'y'
		
		addi $t0, $zero, 112
		sb $t0, 16($v0) # internal_37[8] = 'p'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_37[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_37[10] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 19($v0) # internal_37[11] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 20($v0) # internal_37[12] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_37[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_37[14] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 23($v0) # internal_37[15] = 'o'
		
		addi $t0, $zero, 119
		sb $t0, 24($v0) # internal_37[16] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_37[17] = ' '
		
		addi $t0, $zero, 66
		sb $t0, 26($v0) # internal_37[18] = 'B'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_37[19] = '\n'
		
		sb $zero, 28($v0) # Null-terminator at the end of the string
		
		sw $v0, 52($sp) # internal_37 = "Class type is now B\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_37
		lw $t0, 64($sp)
		sw $t0, 0($sp) # Storing internal_37
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 60($sp) # internal_38 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 48($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_38
		lw $t0, 48($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		branch_C_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 29 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 20
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_40[0] = 'C'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_40[1] = 'l'
		
		addi $t0, $zero, 97
		sb $t0, 10($v0) # internal_40[2] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 11($v0) # internal_40[3] = 's'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_40[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_40[5] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_40[6] = 't'
		
		addi $t0, $zero, 121
		sb $t0, 15($v0) # internal_40[7] = 'y'
		
		addi $t0, $zero, 112
		sb $t0, 16($v0) # internal_40[8] = 'p'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_40[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_40[10] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 19($v0) # internal_40[11] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 20($v0) # internal_40[12] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_40[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_40[14] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 23($v0) # internal_40[15] = 'o'
		
		addi $t0, $zero, 119
		sb $t0, 24($v0) # internal_40[16] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_40[17] = ' '
		
		addi $t0, $zero, 67
		sb $t0, 26($v0) # internal_40[18] = 'C'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_40[19] = '\n'
		
		sb $zero, 28($v0) # Null-terminator at the end of the string
		
		sw $v0, 40($sp) # internal_40 = "Class type is now C\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_40
		lw $t0, 52($sp)
		sw $t0, 0($sp) # Storing internal_40
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 48($sp) # internal_41 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_41
		lw $t0, 36($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		branch_D_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 29 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 20
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_43[0] = 'C'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_43[1] = 'l'
		
		addi $t0, $zero, 97
		sb $t0, 10($v0) # internal_43[2] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 11($v0) # internal_43[3] = 's'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_43[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_43[5] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_43[6] = 't'
		
		addi $t0, $zero, 121
		sb $t0, 15($v0) # internal_43[7] = 'y'
		
		addi $t0, $zero, 112
		sb $t0, 16($v0) # internal_43[8] = 'p'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_43[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_43[10] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 19($v0) # internal_43[11] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 20($v0) # internal_43[12] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_43[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_43[14] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 23($v0) # internal_43[15] = 'o'
		
		addi $t0, $zero, 119
		sb $t0, 24($v0) # internal_43[16] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_43[17] = ' '
		
		addi $t0, $zero, 68
		sb $t0, 26($v0) # internal_43[18] = 'D'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_43[19] = '\n'
		
		sb $zero, 28($v0) # Null-terminator at the end of the string
		
		sw $v0, 28($sp) # internal_43 = "Class type is now D\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_43
		lw $t0, 40($sp)
		sw $t0, 0($sp) # Storing internal_43
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 36($sp) # internal_44 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 24($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_44
		lw $t0, 24($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		branch_E_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 29 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 20
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_46[0] = 'C'
		
		addi $t0, $zero, 108
		sb $t0, 9($v0) # internal_46[1] = 'l'
		
		addi $t0, $zero, 97
		sb $t0, 10($v0) # internal_46[2] = 'a'
		
		addi $t0, $zero, 115
		sb $t0, 11($v0) # internal_46[3] = 's'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_46[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_46[5] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 14($v0) # internal_46[6] = 't'
		
		addi $t0, $zero, 121
		sb $t0, 15($v0) # internal_46[7] = 'y'
		
		addi $t0, $zero, 112
		sb $t0, 16($v0) # internal_46[8] = 'p'
		
		addi $t0, $zero, 101
		sb $t0, 17($v0) # internal_46[9] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 18($v0) # internal_46[10] = ' '
		
		addi $t0, $zero, 105
		sb $t0, 19($v0) # internal_46[11] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 20($v0) # internal_46[12] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 21($v0) # internal_46[13] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 22($v0) # internal_46[14] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 23($v0) # internal_46[15] = 'o'
		
		addi $t0, $zero, 119
		sb $t0, 24($v0) # internal_46[16] = 'w'
		
		addi $t0, $zero, 32
		sb $t0, 25($v0) # internal_46[17] = ' '
		
		addi $t0, $zero, 69
		sb $t0, 26($v0) # internal_46[18] = 'E'
		
		addi $t0, $zero, 10
		sb $t0, 27($v0) # internal_46[19] = '\n'
		
		sb $zero, 28($v0) # Null-terminator at the end of the string
		
		sw $v0, 16($sp) # internal_46 = "Class type is now E\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_46
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_46
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_47 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 12($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_47
		lw $t0, 12($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		branch_Object_8792981820269:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 79
		sb $t0, 8($v0) # internal_49[0] = 'O'
		
		addi $t0, $zero, 111
		sb $t0, 9($v0) # internal_49[1] = 'o'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_49[2] = 'o'
		
		addi $t0, $zero, 111
		sb $t0, 11($v0) # internal_49[3] = 'o'
		
		addi $t0, $zero, 112
		sb $t0, 12($v0) # internal_49[4] = 'p'
		
		addi $t0, $zero, 115
		sb $t0, 13($v0) # internal_49[5] = 's'
		
		addi $t0, $zero, 10
		sb $t0, 14($v0) # internal_49[6] = '\n'
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_49 = "Oooops\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 220($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_49
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_49
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_50 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 72($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_32 = internal_50
		lw $t0, 0($sp)
		sw $t0, 72($sp)
		end_assign:
		
		# Jumping to branch_end_8792981820269
		j branch_end_8792981820269
		
		error_branch_8792981820269:
		
		
		branch_end_8792981820269:
		
		# Loading return value in $v1
		lw $v1, 72($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 204
		
		jr $ra
		
	function_print_at_Main:
		# Function parameters
		#   $ra = 36($sp)
		#   self = 32($sp)
		#   var = 28($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -28
		
		# Allocating A2I
		li $v0, 9
		lw $a0, type_A2I
		syscall
		la $t0, type_A2I # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 20($sp) # internal_1 = address of allocated object A2I
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_1
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_1
		
		# Calling function function___init___at_A2I
		jal function___init___at_A2I
		lw $ra, 4($sp)
		sw $v1, 28($sp) # internal_1 = result of function___init___at_A2I
		addi $sp, $sp, 8 # Freeing space for arguments
		
		lw $t0, 20($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 24($sp)
		j end_assign
		not_is_Bool_or_Int:
		# z = internal_1
		lw $t0, 20($sp)
		sw $t0, 24($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument var
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing var
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 24($sp) # internal_2 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument z
		lw $t0, 36($sp)
		sw $t0, 4($sp) # Storing z
		
		# Argument internal_2
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_i2a_at_A2I
		jal function_i2a_at_A2I
		lw $ra, 8($sp)
		sw $v1, 24($sp) # internal_3 = result of function_i2a_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 44($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_3
		lw $t0, 24($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 20($sp) # internal_4 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 32
		sb $t0, 8($v0) # internal_5[0] = ' '
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_5 = " "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 44($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_5
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_5
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_6 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 28
		
		jr $ra
		
	function_main_at_Main:
		# Function parameters
		#   $ra = 772($sp)
		#   self = 768($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -768
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 764($sp) # internal_0 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 772($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 772($sp) # internal_0 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 764($sp) # $t1 = internal_0
		sw $t1, 12($t0) # self.avar = internal_0
		
		while_start_8792981790296:
		
		# Get attribute flag of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 20($t0) # Get the attribute 'flag' from the instance
		sw $t1, 756($sp) # internal_2 = flag
		
		lw $t0, 756($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 760($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_1 = internal_2
		lw $t0, 756($sp)
		sw $t0, 760($sp)
		end_assign:
		
		# If internal_1 then goto while_body_8792981790296
		lw $t0, 760($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, while_body_8792981790296
		
		# Jumping to while_end_8792981790296
		j while_end_8792981790296
		
		while_body_8792981790296:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 110
		sb $t0, 8($v0) # internal_3[0] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 9($v0) # internal_3[1] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 10($v0) # internal_3[2] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 11($v0) # internal_3[3] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_3[4] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 13($v0) # internal_3[5] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_3[6] = ' '
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 752($sp) # internal_3 = "number "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_3
		lw $t0, 764($sp)
		sw $t0, 0($sp) # Storing internal_3
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 760($sp) # internal_4 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 744($sp) # internal_5 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_5
		lw $t0, 756($sp)
		sw $t0, 0($sp) # Storing internal_5
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 752($sp) # internal_6 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 732($sp) # internal_8 = address of allocated object Int
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 728($sp) # internal_9 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_9
		lw $t0, 736($sp)
		sw $t0, 0($sp) # Storing internal_9
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 732($sp) # internal_10 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_10
		lw $t0, 736($sp)
		sw $t0, 0($sp) # Storing internal_10
		
		# Calling function function_is_even_at_Main
		jal function_is_even_at_Main
		lw $ra, 8($sp)
		sw $v1, 732($sp) # internal_11 = result of function_is_even_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 720($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 732($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_8 = internal_11
		lw $t0, 720($sp)
		sw $t0, 732($sp)
		end_assign:
		
		# If internal_8 then goto then_8792981820386
		lw $t0, 732($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981820386
		
		# Jumping to else_8792981820386
		j else_8792981820386
		
		then_8792981820386:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 18 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 9
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_12[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_12[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_12[2] = ' '
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_12[3] = 'e'
		
		addi $t0, $zero, 118
		sb $t0, 12($v0) # internal_12[4] = 'v'
		
		addi $t0, $zero, 101
		sb $t0, 13($v0) # internal_12[5] = 'e'
		
		addi $t0, $zero, 110
		sb $t0, 14($v0) # internal_12[6] = 'n'
		
		addi $t0, $zero, 33
		sb $t0, 15($v0) # internal_12[7] = '!'
		
		addi $t0, $zero, 10
		sb $t0, 16($v0) # internal_12[8] = '\n'
		
		sb $zero, 17($v0) # Null-terminator at the end of the string
		
		sw $v0, 716($sp) # internal_12 = "is even!\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_12
		lw $t0, 728($sp)
		sw $t0, 0($sp) # Storing internal_12
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 724($sp) # internal_13 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 712($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 736($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_7 = internal_13
		lw $t0, 712($sp)
		sw $t0, 736($sp)
		end_assign:
		
		# Jumping to endif_8792981820386
		j endif_8792981820386
		
		else_8792981820386:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 17 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 8
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_14[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_14[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_14[2] = ' '
		
		addi $t0, $zero, 111
		sb $t0, 11($v0) # internal_14[3] = 'o'
		
		addi $t0, $zero, 100
		sb $t0, 12($v0) # internal_14[4] = 'd'
		
		addi $t0, $zero, 100
		sb $t0, 13($v0) # internal_14[5] = 'd'
		
		addi $t0, $zero, 33
		sb $t0, 14($v0) # internal_14[6] = '!'
		
		addi $t0, $zero, 10
		sb $t0, 15($v0) # internal_14[7] = '\n'
		
		sb $zero, 16($v0) # Null-terminator at the end of the string
		
		sw $v0, 708($sp) # internal_14 = "is odd!\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_14
		lw $t0, 720($sp)
		sw $t0, 0($sp) # Storing internal_14
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 716($sp) # internal_15 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 704($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 736($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_7 = internal_15
		lw $t0, 704($sp)
		sw $t0, 736($sp)
		end_assign:
		
		# Jumping to endif_8792981820386
		j endif_8792981820386
		
		endif_8792981820386:
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 700($sp) # internal_16 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_16
		lw $t0, 712($sp)
		sw $t0, 0($sp) # Storing internal_16
		
		# Calling function function_class_type_at_Main
		jal function_class_type_at_Main
		lw $ra, 8($sp)
		sw $v1, 708($sp) # internal_17 = result of function_class_type_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 776($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_menu_at_Main
		jal function_menu_at_Main
		lw $ra, 4($sp)
		sw $v1, 700($sp) # internal_18 = result of function_menu_at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Set attribute char of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 692($sp) # $t1 = internal_18
		sw $t1, 8($t0) # self.char = internal_18
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 684($sp) # internal_20 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 680($sp) # internal_21 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 97
		sb $t0, 8($v0) # internal_22[0] = 'a'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 676($sp) # internal_22 = "a"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_21
		lw $t0, 692($sp)
		sw $t0, 4($sp) # Storing internal_21
		
		# Argument internal_22
		lw $t0, 688($sp)
		sw $t0, 0($sp) # Storing internal_22
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 684($sp) # internal_23 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 672($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 684($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_20 = internal_23
		lw $t0, 672($sp)
		sw $t0, 684($sp)
		end_assign:
		
		# If internal_20 then goto then_8792981790281
		lw $t0, 684($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790281
		
		# Jumping to else_8792981790281
		j else_8792981790281
		
		then_8792981790281:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 668($sp) # internal_24 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_24
		lw $t0, 676($sp)
		sw $t0, 0($sp) # Storing internal_24
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 676($sp) # internal_24 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 776($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_get_int_at_Main
		jal function_get_int_at_Main
		lw $ra, 4($sp)
		sw $v1, 672($sp) # internal_25 = result of function_get_int_at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_24
		lw $t0, 680($sp)
		sw $t0, 4($sp) # Storing internal_24
		
		# Argument internal_25
		lw $t0, 676($sp)
		sw $t0, 0($sp) # Storing internal_25
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 672($sp) # internal_26 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute a_var of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 660($sp) # $t1 = internal_26
		sw $t1, 16($t0) # self.a_var = internal_26
		
		# Allocating B
		li $v0, 9
		lw $a0, type_B
		syscall
		la $t0, type_B # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 656($sp) # internal_27 = address of allocated object B
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_27
		lw $t0, 664($sp)
		sw $t0, 0($sp) # Storing internal_27
		
		# Calling function function___init___at_B
		jal function___init___at_B
		lw $ra, 4($sp)
		sw $v1, 664($sp) # internal_27 = result of function___init___at_B
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 652($sp) # internal_28 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_28
		lw $t0, 660($sp)
		sw $t0, 0($sp) # Storing internal_28
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 656($sp) # internal_29 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute a_var of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 16($t0) # Get the attribute 'a_var' from the instance
		sw $t1, 644($sp) # internal_30 = a_var
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_30
		lw $t0, 652($sp)
		sw $t0, 0($sp) # Storing internal_30
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 648($sp) # internal_31 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument internal_27
		lw $t0, 672($sp)
		sw $t0, 8($sp) # Storing internal_27
		
		# Argument internal_29
		lw $t0, 664($sp)
		sw $t0, 4($sp) # Storing internal_29
		
		# Argument internal_31
		lw $t0, 656($sp)
		sw $t0, 0($sp) # Storing internal_31
		
		# Calling function function_method2_at_A
		jal function_method2_at_A
		lw $ra, 12($sp)
		sw $v1, 652($sp) # internal_32 = result of function_method2_at_A
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 636($sp) # $t1 = internal_32
		sw $t1, 12($t0) # self.avar = internal_32
		
		lw $t0, 636($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 688($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_19 = internal_32
		lw $t0, 636($sp)
		sw $t0, 688($sp)
		end_assign:
		
		# Jumping to endif_8792981790281
		j endif_8792981790281
		
		else_8792981790281:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 628($sp) # internal_34 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 624($sp) # internal_35 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 98
		sb $t0, 8($v0) # internal_36[0] = 'b'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 620($sp) # internal_36 = "b"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_35
		lw $t0, 636($sp)
		sw $t0, 4($sp) # Storing internal_35
		
		# Argument internal_36
		lw $t0, 632($sp)
		sw $t0, 0($sp) # Storing internal_36
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 628($sp) # internal_37 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 616($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 628($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_34 = internal_37
		lw $t0, 616($sp)
		sw $t0, 628($sp)
		end_assign:
		
		# If internal_34 then goto then_8792981790275
		lw $t0, 628($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790275
		
		# Jumping to else_8792981790275
		j else_8792981790275
		
		then_8792981790275:
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 612($sp) # internal_38 = avar
		
		
		
		
		
		
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 588($sp) # internal_44 = address of allocated object Int
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 596($sp) # internal_42 = address of allocated object Int
		
		
		
		
		# internal_40 = typeof internal_38 that is the first word of the object
		lw $t0, 612($sp)
		lw $t1, 0($t0)
		sw $t1, 604($sp)
		
		lw $t0, 604($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 600($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_41 = internal_40
		lw $t0, 604($sp)
		sw $t0, 600($sp)
		end_assign:
		
		lw $t0, 588($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 608($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_39 = internal_44
		lw $t0, 588($sp)
		sw $t0, 608($sp)
		end_assign:
		
		while_start_8792981788591:
		
		# Equal operation
		lw $t0, 600($sp) # Save in $t0 the left operand address
		# If internal_42 then goto while_end_8792981788591
		lw $t0, 596($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, while_end_8792981788591
		
		# Addition operation
		lw $t0, 608($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# internal_41 = ancestor of internal_41 that is the first word of the object
		lw $t0, 600($sp)
		lw $t1, 4($t0)
		sw $t1, 600($sp)
		
		# Jumping to while_start_8792981788591
		j while_start_8792981788591
		
		while_end_8792981788591:
		
		
		
		
		lw $t0, 604($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 600($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_41 = internal_40
		lw $t0, 604($sp)
		sw $t0, 600($sp)
		end_assign:
		
		
		foreach_start_8792981788591:
		
		# Less than operation
		lw $t0, 580($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 608($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 576($sp) # $t0 = internal_47
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_47 then goto foreach_body_8792981788591
		lw $t0, 576($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_body_8792981788591
		
		# Jumping to foreach_end_8792981788591
		j foreach_end_8792981788591
		
		foreach_body_8792981788591:
		
		
		# internal_41 = ancestor of internal_41 that is the first word of the object
		lw $t0, 600($sp)
		lw $t1, 4($t0)
		sw $t1, 600($sp)
		
		# Addition operation
		lw $t0, 580($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_start_8792981788591
		j foreach_start_8792981788591
		
		foreach_end_8792981788591:
		
		
		
		
		
		
		# internal_50 = direction of C
		la $t0, type_C
		sw $t0, 564($sp)
		
		
		
		# internal_51 = direction of A
		la $t0, type_A
		sw $t0, 560($sp)
		
		
		
		# internal_52 = direction of Object
		la $t0, type_Object
		sw $t0, 556($sp)
		
		
		
		
		
		
		foreach_type_start_8792981788591:
		
		# Less than operation
		lw $t0, 552($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# If internal_54 then goto foreach_type_body_8792981788591
		lw $t0, 548($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_type_body_8792981788591
		
		# Jumping to foreach_type_end_8792981788591
		j foreach_type_end_8792981788591
		
		foreach_type_body_8792981788591:
		
		
		
		
		
		foreach_ancestor_start_8792981788591:
		
		# Less than operation
		lw $t0, 540($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 608($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 536($sp) # $t0 = internal_57
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_57 then goto foreach_ancestor_body_8792981788591
		lw $t0, 536($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_ancestor_body_8792981788591
		
		# Jumping to foreach_ancestor_end_8792981788591
		j foreach_ancestor_end_8792981788591
		
		foreach_ancestor_body_8792981788591:
		
		
		# Equal operation
		lw $t0, 544($sp) # Save in $t0 the left operand address
		lw $t1, 532($sp) # Save in $t1 the right operand address
		seq $t2, $t0, $t1 # $t2 = $t0 == $t1
		
		lw $t0, 528($sp) # $t0 = internal_59
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_59 then goto foreach_ancestor_end_8792981788591
		lw $t0, 528($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_ancestor_end_8792981788591
		
		# Addition operation
		lw $t0, 540($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_ancestor_start_8792981788591
		j foreach_ancestor_start_8792981788591
		
		foreach_ancestor_end_8792981788591:
		
		
		
		
		
		# Addition operation
		lw $t0, 552($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_type_start_8792981788591
		j foreach_type_start_8792981788591
		
		foreach_type_end_8792981788591:
		
		
		
		
		
		
		
		lw $t0, 608($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 512($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_63 = internal_39
		lw $t0, 608($sp)
		sw $t0, 512($sp)
		end_assign:
		
		foreach_min_start_8792981788591:
		
		# Less than operation
		lw $t0, 524($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# If internal_64 then goto foreach_min_body_8792981788591
		lw $t0, 508($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, foreach_min_body_8792981788591
		
		# Jumping to foreach_min_end_8792981788591
		j foreach_min_end_8792981788591
		
		foreach_min_body_8792981788591:
		
		
		# Less than operation
		lw $t0, 516($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		lw $t1, 512($sp) # Save in $t1 the right operand address
		lw $t1, 8($t1) # Save in $t1 the rigth operand value
		slt $t2, $t0, $t1 # $t2 = $t0 < $t1
		
		lw $t0, 508($sp) # $t0 = internal_64
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_64 then goto update_min_8792981788591
		lw $t0, 508($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, update_min_8792981788591
		
		# Jumping to foreach_min_end_8792981788591
		j foreach_min_end_8792981788591
		
		update_min_8792981788591:
		
		lw $t0, 516($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 512($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_63 = internal_62
		lw $t0, 516($sp)
		sw $t0, 512($sp)
		end_assign:
		
		lw $t0, 524($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 520($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_61 = internal_60
		lw $t0, 524($sp)
		sw $t0, 520($sp)
		end_assign:
		
		update_min_end_8792981788591:
		
		# Addition operation
		lw $t0, 524($sp) # Save in $t0 the left operand address
		lw $t0, 8($t0) # Save in $t0 the left operand value
		# Jumping to foreach_min_start_8792981788591
		j foreach_min_start_8792981788591
		
		foreach_min_end_8792981788591:
		
		
		
		
		
		
		
		
		# Equal operation
		lw $t0, 520($sp) # Save in $t0 the left operand address
		lw $t1, 608($sp) # Save in $t1 the right operand address
		seq $t2, $t0, $t1 # $t2 = $t0 == $t1
		
		lw $t0, 500($sp) # $t0 = internal_66
		sw $t2, 8($t0) # Setting value in the third word of the Bool object
		
		# If internal_66 then goto error_branch_8792981788591
		lw $t0, 500($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, error_branch_8792981788591
		
		
		
		# If internal_67 then goto branch_C_8792981788591
		lw $t0, 496($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_C_8792981788591
		
		
		# If internal_67 then goto branch_A_8792981788591
		lw $t0, 496($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_A_8792981788591
		
		
		# If internal_67 then goto branch_Object_8792981788591
		lw $t0, 496($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, branch_Object_8792981788591
		
		branch_C_8792981788591:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument c
		lw $t0, 496($sp)
		sw $t0, 0($sp) # Storing c
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 492($sp) # internal_70 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument c
		lw $t0, 500($sp)
		sw $t0, 4($sp) # Storing c
		
		# Argument internal_70
		lw $t0, 496($sp)
		sw $t0, 0($sp) # Storing internal_70
		
		# Calling function function_method6_at_C
		jal function_method6_at_C
		lw $ra, 8($sp)
		sw $v1, 492($sp) # internal_71 = result of function_method6_at_C
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 480($sp) # $t1 = internal_71
		sw $t1, 12($t0) # self.avar = internal_71
		
		lw $t0, 480($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 492($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_68 = internal_71
		lw $t0, 480($sp)
		sw $t0, 492($sp)
		end_assign:
		
		# Jumping to branch_end_8792981788591
		j branch_end_8792981788591
		
		branch_A_8792981788591:
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument a
		lw $t0, 484($sp)
		sw $t0, 0($sp) # Storing a
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 480($sp) # internal_73 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument a
		lw $t0, 488($sp)
		sw $t0, 4($sp) # Storing a
		
		# Argument internal_73
		lw $t0, 484($sp)
		sw $t0, 0($sp) # Storing internal_73
		
		# Calling function function_method3_at_A
		jal function_method3_at_A
		lw $ra, 8($sp)
		sw $v1, 480($sp) # internal_74 = result of function_method3_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 468($sp) # $t1 = internal_74
		sw $t1, 12($t0) # self.avar = internal_74
		
		lw $t0, 468($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 492($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_68 = internal_74
		lw $t0, 468($sp)
		sw $t0, 492($sp)
		end_assign:
		
		# Jumping to branch_end_8792981788591
		j branch_end_8792981788591
		
		branch_Object_8792981788591:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 79
		sb $t0, 8($v0) # internal_76[0] = 'O'
		
		addi $t0, $zero, 111
		sb $t0, 9($v0) # internal_76[1] = 'o'
		
		addi $t0, $zero, 111
		sb $t0, 10($v0) # internal_76[2] = 'o'
		
		addi $t0, $zero, 111
		sb $t0, 11($v0) # internal_76[3] = 'o'
		
		addi $t0, $zero, 112
		sb $t0, 12($v0) # internal_76[4] = 'p'
		
		addi $t0, $zero, 115
		sb $t0, 13($v0) # internal_76[5] = 's'
		
		addi $t0, $zero, 10
		sb $t0, 14($v0) # internal_76[6] = '\n'
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 460($sp) # internal_76 = "Oooops\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_76
		lw $t0, 472($sp)
		sw $t0, 0($sp) # Storing internal_76
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 468($sp) # internal_77 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 776($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_abort_at_Object
		jal function_abort_at_Object
		lw $ra, 4($sp)
		sw $v1, 460($sp) # internal_78 = result of function_abort_at_Object
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 448($sp) # internal_79 = address of allocated object Int
		
		lw $t0, 448($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 492($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_68 = internal_79
		lw $t0, 448($sp)
		sw $t0, 492($sp)
		end_assign:
		
		# Jumping to branch_end_8792981788591
		j branch_end_8792981788591
		
		error_branch_8792981788591:
		
		
		branch_end_8792981788591:
		
		lw $t0, 492($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 632($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_33 = internal_68
		lw $t0, 492($sp)
		sw $t0, 632($sp)
		end_assign:
		
		# Jumping to endif_8792981790275
		j endif_8792981790275
		
		else_8792981790275:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 440($sp) # internal_81 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 436($sp) # internal_82 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 99
		sb $t0, 8($v0) # internal_83[0] = 'c'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 432($sp) # internal_83 = "c"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_82
		lw $t0, 448($sp)
		sw $t0, 4($sp) # Storing internal_82
		
		# Argument internal_83
		lw $t0, 444($sp)
		sw $t0, 0($sp) # Storing internal_83
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 440($sp) # internal_84 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 428($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 440($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_81 = internal_84
		lw $t0, 428($sp)
		sw $t0, 440($sp)
		end_assign:
		
		# If internal_81 then goto then_8792981790269
		lw $t0, 440($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790269
		
		# Jumping to else_8792981790269
		j else_8792981790269
		
		then_8792981790269:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 424($sp) # internal_85 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_85
		lw $t0, 432($sp)
		sw $t0, 0($sp) # Storing internal_85
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 432($sp) # internal_85 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument self
		lw $t0, 776($sp)
		sw $t0, 0($sp) # Storing self
		
		# Calling function function_get_int_at_Main
		jal function_get_int_at_Main
		lw $ra, 4($sp)
		sw $v1, 428($sp) # internal_86 = result of function_get_int_at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_85
		lw $t0, 436($sp)
		sw $t0, 4($sp) # Storing internal_85
		
		# Argument internal_86
		lw $t0, 432($sp)
		sw $t0, 0($sp) # Storing internal_86
		
		# Calling function function_set_var_at_A
		jal function_set_var_at_A
		lw $ra, 8($sp)
		sw $v1, 428($sp) # internal_87 = result of function_set_var_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute a_var of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 416($sp) # $t1 = internal_87
		sw $t1, 16($t0) # self.a_var = internal_87
		
		# Allocating D
		li $v0, 9
		lw $a0, type_D
		syscall
		la $t0, type_D # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 412($sp) # internal_88 = address of allocated object D
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_88
		lw $t0, 420($sp)
		sw $t0, 0($sp) # Storing internal_88
		
		# Calling function function___init___at_D
		jal function___init___at_D
		lw $ra, 4($sp)
		sw $v1, 420($sp) # internal_88 = result of function___init___at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 408($sp) # internal_89 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_89
		lw $t0, 416($sp)
		sw $t0, 0($sp) # Storing internal_89
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 412($sp) # internal_90 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute a_var of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 16($t0) # Get the attribute 'a_var' from the instance
		sw $t1, 400($sp) # internal_91 = a_var
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_91
		lw $t0, 408($sp)
		sw $t0, 0($sp) # Storing internal_91
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 404($sp) # internal_92 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -16 # Reserving space for arguments
		sw $ra, 12($sp) # Storing return address
		
		# Argument internal_88
		lw $t0, 428($sp)
		sw $t0, 8($sp) # Storing internal_88
		
		# Argument internal_90
		lw $t0, 420($sp)
		sw $t0, 4($sp) # Storing internal_90
		
		# Argument internal_92
		lw $t0, 412($sp)
		sw $t0, 0($sp) # Storing internal_92
		
		# Calling function function_method4_at_A
		jal function_method4_at_A
		lw $ra, 12($sp)
		sw $v1, 408($sp) # internal_93 = result of function_method4_at_A
		addi $sp, $sp, 16 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 392($sp) # $t1 = internal_93
		sw $t1, 12($t0) # self.avar = internal_93
		
		lw $t0, 392($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 444($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_80 = internal_93
		lw $t0, 392($sp)
		sw $t0, 444($sp)
		end_assign:
		
		# Jumping to endif_8792981790269
		j endif_8792981790269
		
		else_8792981790269:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 384($sp) # internal_95 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 380($sp) # internal_96 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 100
		sb $t0, 8($v0) # internal_97[0] = 'd'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 376($sp) # internal_97 = "d"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_96
		lw $t0, 392($sp)
		sw $t0, 4($sp) # Storing internal_96
		
		# Argument internal_97
		lw $t0, 388($sp)
		sw $t0, 0($sp) # Storing internal_97
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 384($sp) # internal_98 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 372($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 384($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_95 = internal_98
		lw $t0, 372($sp)
		sw $t0, 384($sp)
		end_assign:
		
		# If internal_95 then goto then_8792981790263
		lw $t0, 384($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790263
		
		# Jumping to else_8792981790263
		j else_8792981790263
		
		then_8792981790263:
		
		# Allocating C
		li $v0, 9
		lw $a0, type_C
		syscall
		la $t0, type_C # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 368($sp) # internal_99 = address of allocated object C
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_99
		lw $t0, 376($sp)
		sw $t0, 0($sp) # Storing internal_99
		
		# Calling function function___init___at_C
		jal function___init___at_C
		lw $ra, 4($sp)
		sw $v1, 376($sp) # internal_99 = result of function___init___at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 364($sp) # internal_100 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_100
		lw $t0, 372($sp)
		sw $t0, 0($sp) # Storing internal_100
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 368($sp) # internal_101 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_99
		lw $t0, 380($sp)
		sw $t0, 4($sp) # Storing internal_99
		
		# Argument internal_101
		lw $t0, 372($sp)
		sw $t0, 0($sp) # Storing internal_101
		
		# Calling function function_method5_at_C
		jal function_method5_at_C
		lw $ra, 8($sp)
		sw $v1, 368($sp) # internal_102 = result of function_method5_at_C
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 356($sp) # $t1 = internal_102
		sw $t1, 12($t0) # self.avar = internal_102
		
		lw $t0, 356($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 388($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_94 = internal_102
		lw $t0, 356($sp)
		sw $t0, 388($sp)
		end_assign:
		
		# Jumping to endif_8792981790263
		j endif_8792981790263
		
		else_8792981790263:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 348($sp) # internal_104 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 344($sp) # internal_105 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 101
		sb $t0, 8($v0) # internal_106[0] = 'e'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 340($sp) # internal_106 = "e"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_105
		lw $t0, 356($sp)
		sw $t0, 4($sp) # Storing internal_105
		
		# Argument internal_106
		lw $t0, 352($sp)
		sw $t0, 0($sp) # Storing internal_106
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 348($sp) # internal_107 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 336($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 348($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_104 = internal_107
		lw $t0, 336($sp)
		sw $t0, 348($sp)
		end_assign:
		
		# If internal_104 then goto then_8792981790257
		lw $t0, 348($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790257
		
		# Jumping to else_8792981790257
		j else_8792981790257
		
		then_8792981790257:
		
		# Allocating C
		li $v0, 9
		lw $a0, type_C
		syscall
		la $t0, type_C # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 332($sp) # internal_108 = address of allocated object C
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_108
		lw $t0, 340($sp)
		sw $t0, 0($sp) # Storing internal_108
		
		# Calling function function___init___at_C
		jal function___init___at_C
		lw $ra, 4($sp)
		sw $v1, 340($sp) # internal_108 = result of function___init___at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 328($sp) # internal_109 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_109
		lw $t0, 336($sp)
		sw $t0, 0($sp) # Storing internal_109
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 332($sp) # internal_110 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_108
		lw $t0, 344($sp)
		sw $t0, 4($sp) # Storing internal_108
		
		# Argument internal_110
		lw $t0, 336($sp)
		sw $t0, 0($sp) # Storing internal_110
		
		# Calling function function_method5_at_C
		jal function_method5_at_C
		lw $ra, 8($sp)
		sw $v1, 332($sp) # internal_111 = result of function_method5_at_C
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 320($sp) # $t1 = internal_111
		sw $t1, 12($t0) # self.avar = internal_111
		
		lw $t0, 320($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 352($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_103 = internal_111
		lw $t0, 320($sp)
		sw $t0, 352($sp)
		end_assign:
		
		# Jumping to endif_8792981790257
		j endif_8792981790257
		
		else_8792981790257:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 312($sp) # internal_113 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 308($sp) # internal_114 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 102
		sb $t0, 8($v0) # internal_115[0] = 'f'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 304($sp) # internal_115 = "f"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_114
		lw $t0, 320($sp)
		sw $t0, 4($sp) # Storing internal_114
		
		# Argument internal_115
		lw $t0, 316($sp)
		sw $t0, 0($sp) # Storing internal_115
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 312($sp) # internal_116 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 300($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 312($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_113 = internal_116
		lw $t0, 300($sp)
		sw $t0, 312($sp)
		end_assign:
		
		# If internal_113 then goto then_8792981790251
		lw $t0, 312($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790251
		
		# Jumping to else_8792981790251
		j else_8792981790251
		
		then_8792981790251:
		
		# Allocating C
		li $v0, 9
		lw $a0, type_C
		syscall
		la $t0, type_C # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 296($sp) # internal_117 = address of allocated object C
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_117
		lw $t0, 304($sp)
		sw $t0, 0($sp) # Storing internal_117
		
		# Calling function function___init___at_C
		jal function___init___at_C
		lw $ra, 4($sp)
		sw $v1, 304($sp) # internal_117 = result of function___init___at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 292($sp) # internal_118 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_118
		lw $t0, 300($sp)
		sw $t0, 0($sp) # Storing internal_118
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 296($sp) # internal_119 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_117
		lw $t0, 308($sp)
		sw $t0, 4($sp) # Storing internal_117
		
		# Argument internal_119
		lw $t0, 300($sp)
		sw $t0, 0($sp) # Storing internal_119
		
		# Calling function function_method5_at_C
		jal function_method5_at_C
		lw $ra, 8($sp)
		sw $v1, 296($sp) # internal_120 = result of function_method5_at_C
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 284($sp) # $t1 = internal_120
		sw $t1, 12($t0) # self.avar = internal_120
		
		lw $t0, 284($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 316($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_112 = internal_120
		lw $t0, 284($sp)
		sw $t0, 316($sp)
		end_assign:
		
		# Jumping to endif_8792981790251
		j endif_8792981790251
		
		else_8792981790251:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 276($sp) # internal_122 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 272($sp) # internal_123 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 103
		sb $t0, 8($v0) # internal_124[0] = 'g'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 268($sp) # internal_124 = "g"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_123
		lw $t0, 284($sp)
		sw $t0, 4($sp) # Storing internal_123
		
		# Argument internal_124
		lw $t0, 280($sp)
		sw $t0, 0($sp) # Storing internal_124
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 276($sp) # internal_125 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 264($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 276($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_122 = internal_125
		lw $t0, 264($sp)
		sw $t0, 276($sp)
		end_assign:
		
		# If internal_122 then goto then_8792981790245
		lw $t0, 276($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790245
		
		# Jumping to else_8792981790245
		j else_8792981790245
		
		then_8792981790245:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 256($sp) # internal_127 = address of allocated object Int
		
		# Allocating D
		li $v0, 9
		lw $a0, type_D
		syscall
		la $t0, type_D # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 252($sp) # internal_128 = address of allocated object D
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_128
		lw $t0, 260($sp)
		sw $t0, 0($sp) # Storing internal_128
		
		# Calling function function___init___at_D
		jal function___init___at_D
		lw $ra, 4($sp)
		sw $v1, 260($sp) # internal_128 = result of function___init___at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 248($sp) # internal_129 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_129
		lw $t0, 256($sp)
		sw $t0, 0($sp) # Storing internal_129
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 252($sp) # internal_130 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_128
		lw $t0, 264($sp)
		sw $t0, 4($sp) # Storing internal_128
		
		# Argument internal_130
		lw $t0, 256($sp)
		sw $t0, 0($sp) # Storing internal_130
		
		# Calling function function_method7_at_D
		jal function_method7_at_D
		lw $ra, 8($sp)
		sw $v1, 252($sp) # internal_131 = result of function_method7_at_D
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 240($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 256($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_127 = internal_131
		lw $t0, 240($sp)
		sw $t0, 256($sp)
		end_assign:
		
		# If internal_127 then goto then_8792981789148
		lw $t0, 256($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981789148
		
		# Jumping to else_8792981789148
		j else_8792981789148
		
		then_8792981789148:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 110
		sb $t0, 8($v0) # internal_132[0] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 9($v0) # internal_132[1] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 10($v0) # internal_132[2] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 11($v0) # internal_132[3] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_132[4] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 13($v0) # internal_132[5] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_132[6] = ' '
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 236($sp) # internal_132 = "number "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_132
		lw $t0, 248($sp)
		sw $t0, 0($sp) # Storing internal_132
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 244($sp) # internal_133 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 228($sp) # internal_134 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_134
		lw $t0, 240($sp)
		sw $t0, 0($sp) # Storing internal_134
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 236($sp) # internal_135 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 28 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 19
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_136[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_136[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_136[2] = ' '
		
		addi $t0, $zero, 100
		sb $t0, 11($v0) # internal_136[3] = 'd'
		
		addi $t0, $zero, 105
		sb $t0, 12($v0) # internal_136[4] = 'i'
		
		addi $t0, $zero, 118
		sb $t0, 13($v0) # internal_136[5] = 'v'
		
		addi $t0, $zero, 105
		sb $t0, 14($v0) # internal_136[6] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 15($v0) # internal_136[7] = 's'
		
		addi $t0, $zero, 105
		sb $t0, 16($v0) # internal_136[8] = 'i'
		
		addi $t0, $zero, 98
		sb $t0, 17($v0) # internal_136[9] = 'b'
		
		addi $t0, $zero, 108
		sb $t0, 18($v0) # internal_136[10] = 'l'
		
		addi $t0, $zero, 101
		sb $t0, 19($v0) # internal_136[11] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_136[12] = ' '
		
		addi $t0, $zero, 98
		sb $t0, 21($v0) # internal_136[13] = 'b'
		
		addi $t0, $zero, 121
		sb $t0, 22($v0) # internal_136[14] = 'y'
		
		addi $t0, $zero, 32
		sb $t0, 23($v0) # internal_136[15] = ' '
		
		addi $t0, $zero, 51
		sb $t0, 24($v0) # internal_136[16] = '3'
		
		addi $t0, $zero, 46
		sb $t0, 25($v0) # internal_136[17] = '.'
		
		addi $t0, $zero, 10
		sb $t0, 26($v0) # internal_136[18] = '\n'
		
		sb $zero, 27($v0) # Null-terminator at the end of the string
		
		sw $v0, 220($sp) # internal_136 = "is divisible by 3.\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_136
		lw $t0, 232($sp)
		sw $t0, 0($sp) # Storing internal_136
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 228($sp) # internal_137 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 216($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 260($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_126 = internal_137
		lw $t0, 216($sp)
		sw $t0, 260($sp)
		end_assign:
		
		# Jumping to endif_8792981789148
		j endif_8792981789148
		
		else_8792981789148:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 110
		sb $t0, 8($v0) # internal_138[0] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 9($v0) # internal_138[1] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 10($v0) # internal_138[2] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 11($v0) # internal_138[3] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_138[4] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 13($v0) # internal_138[5] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_138[6] = ' '
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 212($sp) # internal_138 = "number "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_138
		lw $t0, 224($sp)
		sw $t0, 0($sp) # Storing internal_138
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 220($sp) # internal_139 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 204($sp) # internal_140 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_140
		lw $t0, 216($sp)
		sw $t0, 0($sp) # Storing internal_140
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 212($sp) # internal_141 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 32 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 23
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_142[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_142[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_142[2] = ' '
		
		addi $t0, $zero, 110
		sb $t0, 11($v0) # internal_142[3] = 'n'
		
		addi $t0, $zero, 111
		sb $t0, 12($v0) # internal_142[4] = 'o'
		
		addi $t0, $zero, 116
		sb $t0, 13($v0) # internal_142[5] = 't'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_142[6] = ' '
		
		addi $t0, $zero, 100
		sb $t0, 15($v0) # internal_142[7] = 'd'
		
		addi $t0, $zero, 105
		sb $t0, 16($v0) # internal_142[8] = 'i'
		
		addi $t0, $zero, 118
		sb $t0, 17($v0) # internal_142[9] = 'v'
		
		addi $t0, $zero, 105
		sb $t0, 18($v0) # internal_142[10] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 19($v0) # internal_142[11] = 's'
		
		addi $t0, $zero, 105
		sb $t0, 20($v0) # internal_142[12] = 'i'
		
		addi $t0, $zero, 98
		sb $t0, 21($v0) # internal_142[13] = 'b'
		
		addi $t0, $zero, 108
		sb $t0, 22($v0) # internal_142[14] = 'l'
		
		addi $t0, $zero, 101
		sb $t0, 23($v0) # internal_142[15] = 'e'
		
		addi $t0, $zero, 32
		sb $t0, 24($v0) # internal_142[16] = ' '
		
		addi $t0, $zero, 98
		sb $t0, 25($v0) # internal_142[17] = 'b'
		
		addi $t0, $zero, 121
		sb $t0, 26($v0) # internal_142[18] = 'y'
		
		addi $t0, $zero, 32
		sb $t0, 27($v0) # internal_142[19] = ' '
		
		addi $t0, $zero, 51
		sb $t0, 28($v0) # internal_142[20] = '3'
		
		addi $t0, $zero, 46
		sb $t0, 29($v0) # internal_142[21] = '.'
		
		addi $t0, $zero, 10
		sb $t0, 30($v0) # internal_142[22] = '\n'
		
		sb $zero, 31($v0) # Null-terminator at the end of the string
		
		sw $v0, 196($sp) # internal_142 = "is not divisible by 3.\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_142
		lw $t0, 208($sp)
		sw $t0, 0($sp) # Storing internal_142
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 204($sp) # internal_143 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 192($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 260($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_126 = internal_143
		lw $t0, 192($sp)
		sw $t0, 260($sp)
		end_assign:
		
		# Jumping to endif_8792981789148
		j endif_8792981789148
		
		endif_8792981789148:
		
		lw $t0, 260($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 280($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_121 = internal_126
		lw $t0, 260($sp)
		sw $t0, 280($sp)
		end_assign:
		
		# Jumping to endif_8792981790245
		j endif_8792981790245
		
		else_8792981790245:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 184($sp) # internal_145 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 180($sp) # internal_146 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 104
		sb $t0, 8($v0) # internal_147[0] = 'h'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 176($sp) # internal_147 = "h"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_146
		lw $t0, 192($sp)
		sw $t0, 4($sp) # Storing internal_146
		
		# Argument internal_147
		lw $t0, 188($sp)
		sw $t0, 0($sp) # Storing internal_147
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 184($sp) # internal_148 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 172($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 184($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_145 = internal_148
		lw $t0, 172($sp)
		sw $t0, 184($sp)
		end_assign:
		
		# If internal_145 then goto then_8792981790239
		lw $t0, 184($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790239
		
		# Jumping to else_8792981790239
		j else_8792981790239
		
		then_8792981790239:
		
		# Allocating E
		li $v0, 9
		lw $a0, type_E
		syscall
		la $t0, type_E # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 164($sp) # internal_150 = address of allocated object E
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_150
		lw $t0, 172($sp)
		sw $t0, 0($sp) # Storing internal_150
		
		# Calling function function___init___at_E
		jal function___init___at_E
		lw $ra, 4($sp)
		sw $v1, 172($sp) # internal_150 = result of function___init___at_E
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 160($sp) # internal_151 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_151
		lw $t0, 168($sp)
		sw $t0, 0($sp) # Storing internal_151
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 164($sp) # internal_152 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_150
		lw $t0, 176($sp)
		sw $t0, 4($sp) # Storing internal_150
		
		# Argument internal_152
		lw $t0, 168($sp)
		sw $t0, 0($sp) # Storing internal_152
		
		# Calling function function_method6_at_E
		jal function_method6_at_E
		lw $ra, 8($sp)
		sw $v1, 164($sp) # internal_153 = result of function_method6_at_E
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 152($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 168($sp)
		j end_assign
		not_is_Bool_or_Int:
		# x = internal_153
		lw $t0, 152($sp)
		sw $t0, 168($sp)
		end_assign:
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 144($sp) # internal_155 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_155
		lw $t0, 152($sp)
		sw $t0, 0($sp) # Storing internal_155
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 148($sp) # internal_156 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument x
		lw $t0, 176($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 144($sp) # internal_157 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating Int 8
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Int # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 8
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 132($sp) # internal_158 = address of allocated object Int
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_157
		lw $t0, 148($sp)
		sw $t0, 4($sp) # Storing internal_157
		
		# Argument internal_158
		lw $t0, 144($sp)
		sw $t0, 0($sp) # Storing internal_158
		
		# Calling function function_mult
		jal function_mult
		lw $ra, 8($sp)
		sw $v1, 140($sp) # internal_159 = result of function_mult
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_156
		lw $t0, 152($sp)
		sw $t0, 4($sp) # Storing internal_156
		
		# Argument internal_159
		lw $t0, 140($sp)
		sw $t0, 0($sp) # Storing internal_159
		
		# Calling function function_sub
		jal function_sub
		lw $ra, 8($sp)
		sw $v1, 136($sp) # internal_160 = result of function_sub
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 124($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 148($sp)
		j end_assign
		not_is_Bool_or_Int:
		# r = internal_160
		lw $t0, 124($sp)
		sw $t0, 148($sp)
		end_assign:
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 16 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 7
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 110
		sb $t0, 8($v0) # internal_161[0] = 'n'
		
		addi $t0, $zero, 117
		sb $t0, 9($v0) # internal_161[1] = 'u'
		
		addi $t0, $zero, 109
		sb $t0, 10($v0) # internal_161[2] = 'm'
		
		addi $t0, $zero, 98
		sb $t0, 11($v0) # internal_161[3] = 'b'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_161[4] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 13($v0) # internal_161[5] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 14($v0) # internal_161[6] = ' '
		
		sb $zero, 15($v0) # Null-terminator at the end of the string
		
		sw $v0, 120($sp) # internal_161 = "number "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_161
		lw $t0, 132($sp)
		sw $t0, 0($sp) # Storing internal_161
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 128($sp) # internal_162 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 112($sp) # internal_163 = avar
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_163
		lw $t0, 124($sp)
		sw $t0, 0($sp) # Storing internal_163
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 120($sp) # internal_164 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 21 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 12
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 105
		sb $t0, 8($v0) # internal_165[0] = 'i'
		
		addi $t0, $zero, 115
		sb $t0, 9($v0) # internal_165[1] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_165[2] = ' '
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_165[3] = 'e'
		
		addi $t0, $zero, 113
		sb $t0, 12($v0) # internal_165[4] = 'q'
		
		addi $t0, $zero, 117
		sb $t0, 13($v0) # internal_165[5] = 'u'
		
		addi $t0, $zero, 97
		sb $t0, 14($v0) # internal_165[6] = 'a'
		
		addi $t0, $zero, 108
		sb $t0, 15($v0) # internal_165[7] = 'l'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_165[8] = ' '
		
		addi $t0, $zero, 116
		sb $t0, 17($v0) # internal_165[9] = 't'
		
		addi $t0, $zero, 111
		sb $t0, 18($v0) # internal_165[10] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 19($v0) # internal_165[11] = ' '
		
		sb $zero, 20($v0) # Null-terminator at the end of the string
		
		sw $v0, 104($sp) # internal_165 = "is equal to "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_165
		lw $t0, 116($sp)
		sw $t0, 0($sp) # Storing internal_165
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 112($sp) # internal_166 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument x
		lw $t0, 180($sp)
		sw $t0, 0($sp) # Storing x
		
		# Calling function function_print_at_Main
		jal function_print_at_Main
		lw $ra, 8($sp)
		sw $v1, 108($sp) # internal_167 = result of function_print_at_Main
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 37 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 28
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 116
		sb $t0, 8($v0) # internal_168[0] = 't'
		
		addi $t0, $zero, 105
		sb $t0, 9($v0) # internal_168[1] = 'i'
		
		addi $t0, $zero, 109
		sb $t0, 10($v0) # internal_168[2] = 'm'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_168[3] = 'e'
		
		addi $t0, $zero, 115
		sb $t0, 12($v0) # internal_168[4] = 's'
		
		addi $t0, $zero, 32
		sb $t0, 13($v0) # internal_168[5] = ' '
		
		addi $t0, $zero, 56
		sb $t0, 14($v0) # internal_168[6] = '8'
		
		addi $t0, $zero, 32
		sb $t0, 15($v0) # internal_168[7] = ' '
		
		addi $t0, $zero, 119
		sb $t0, 16($v0) # internal_168[8] = 'w'
		
		addi $t0, $zero, 105
		sb $t0, 17($v0) # internal_168[9] = 'i'
		
		addi $t0, $zero, 116
		sb $t0, 18($v0) # internal_168[10] = 't'
		
		addi $t0, $zero, 104
		sb $t0, 19($v0) # internal_168[11] = 'h'
		
		addi $t0, $zero, 32
		sb $t0, 20($v0) # internal_168[12] = ' '
		
		addi $t0, $zero, 97
		sb $t0, 21($v0) # internal_168[13] = 'a'
		
		addi $t0, $zero, 32
		sb $t0, 22($v0) # internal_168[14] = ' '
		
		addi $t0, $zero, 114
		sb $t0, 23($v0) # internal_168[15] = 'r'
		
		addi $t0, $zero, 101
		sb $t0, 24($v0) # internal_168[16] = 'e'
		
		addi $t0, $zero, 109
		sb $t0, 25($v0) # internal_168[17] = 'm'
		
		addi $t0, $zero, 97
		sb $t0, 26($v0) # internal_168[18] = 'a'
		
		addi $t0, $zero, 105
		sb $t0, 27($v0) # internal_168[19] = 'i'
		
		addi $t0, $zero, 110
		sb $t0, 28($v0) # internal_168[20] = 'n'
		
		addi $t0, $zero, 100
		sb $t0, 29($v0) # internal_168[21] = 'd'
		
		addi $t0, $zero, 101
		sb $t0, 30($v0) # internal_168[22] = 'e'
		
		addi $t0, $zero, 114
		sb $t0, 31($v0) # internal_168[23] = 'r'
		
		addi $t0, $zero, 32
		sb $t0, 32($v0) # internal_168[24] = ' '
		
		addi $t0, $zero, 111
		sb $t0, 33($v0) # internal_168[25] = 'o'
		
		addi $t0, $zero, 102
		sb $t0, 34($v0) # internal_168[26] = 'f'
		
		addi $t0, $zero, 32
		sb $t0, 35($v0) # internal_168[27] = ' '
		
		sb $zero, 36($v0) # Null-terminator at the end of the string
		
		sw $v0, 92($sp) # internal_168 = "times 8 with a remainder of "
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_168
		lw $t0, 104($sp)
		sw $t0, 0($sp) # Storing internal_168
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 100($sp) # internal_169 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating A2I
		li $v0, 9
		lw $a0, type_A2I
		syscall
		la $t0, type_A2I # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 80($sp) # internal_171 = address of allocated object A2I
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_171
		lw $t0, 88($sp)
		sw $t0, 0($sp) # Storing internal_171
		
		# Calling function function___init___at_A2I
		jal function___init___at_A2I
		lw $ra, 4($sp)
		sw $v1, 88($sp) # internal_171 = result of function___init___at_A2I
		addi $sp, $sp, 8 # Freeing space for arguments
		
		lw $t0, 80($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 476($sp)
		j end_assign
		not_is_Bool_or_Int:
		# a = internal_171
		lw $t0, 80($sp)
		sw $t0, 476($sp)
		end_assign:
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument a
		lw $t0, 488($sp)
		sw $t0, 4($sp) # Storing a
		
		# Argument r
		lw $t0, 160($sp)
		sw $t0, 0($sp) # Storing r
		
		# Calling function function_i2a_at_A2I
		jal function_i2a_at_A2I
		lw $ra, 8($sp)
		sw $v1, 88($sp) # internal_172 = result of function_i2a_at_A2I
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_172
		lw $t0, 88($sp)
		sw $t0, 0($sp) # Storing internal_172
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 84($sp) # internal_173 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 10
		sb $t0, 8($v0) # internal_174[0] = '\n'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 68($sp) # internal_174 = "\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 780($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_174
		lw $t0, 80($sp)
		sw $t0, 0($sp) # Storing internal_174
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 76($sp) # internal_175 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 168($sp) # $t1 = x
		sw $t1, 12($t0) # self.avar = x
		
		lw $t0, 168($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 188($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_144 = x
		lw $t0, 168($sp)
		sw $t0, 188($sp)
		end_assign:
		
		# Jumping to endif_8792981790239
		j endif_8792981790239
		
		else_8792981790239:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 56($sp) # internal_177 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 52($sp) # internal_178 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 106
		sb $t0, 8($v0) # internal_179[0] = 'j'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 48($sp) # internal_179 = "j"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_178
		lw $t0, 64($sp)
		sw $t0, 4($sp) # Storing internal_178
		
		# Argument internal_179
		lw $t0, 60($sp)
		sw $t0, 0($sp) # Storing internal_179
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 56($sp) # internal_180 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 44($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 56($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_177 = internal_180
		lw $t0, 44($sp)
		sw $t0, 56($sp)
		end_assign:
		
		# If internal_177 then goto then_8792981790233
		lw $t0, 56($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981790233
		
		# Jumping to else_8792981790233
		j else_8792981790233
		
		then_8792981790233:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 40($sp) # internal_181 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_181
		lw $t0, 48($sp)
		sw $t0, 0($sp) # Storing internal_181
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 48($sp) # internal_181 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 40($sp) # $t1 = internal_181
		sw $t1, 12($t0) # self.avar = internal_181
		
		lw $t0, 40($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_176 = internal_181
		lw $t0, 40($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# Jumping to endif_8792981790233
		j endif_8792981790233
		
		else_8792981790233:
		
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 32($sp) # internal_183 = address of allocated object Int
		
		# Get attribute char of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'char' from the instance
		sw $t1, 28($sp) # internal_184 = char
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 10 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 1
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 113
		sb $t0, 8($v0) # internal_185[0] = 'q'
		
		sb $zero, 9($v0) # Null-terminator at the end of the string
		
		sw $v0, 24($sp) # internal_185 = "q"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_184
		lw $t0, 40($sp)
		sw $t0, 4($sp) # Storing internal_184
		
		# Argument internal_185
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing internal_185
		
		# Calling function function_equal
		jal function_equal
		lw $ra, 8($sp)
		sw $v1, 32($sp) # internal_186 = result of function_equal
		addi $sp, $sp, 12 # Freeing space for arguments
		
		lw $t0, 20($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 32($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_183 = internal_186
		lw $t0, 20($sp)
		sw $t0, 32($sp)
		end_assign:
		
		# If internal_183 then goto then_8792981789693
		lw $t0, 32($sp) # Loading the address of the condition
		lw $t0, 8($t0) # Loading the value of the condition
		addi $t1, $zero, 1 # Setting the value to 1 for comparison
		beq $t0, $t1, then_8792981789693
		
		# Jumping to else_8792981789693
		j else_8792981789693
		
		then_8792981789693:
		
		# Allocating Bool 0
		li $v0, 9
		addi $a0, $zero, 12
		syscall
		
		la $t0, type_Bool # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of the object
		sw $a0, 4($v0) # Setting size in the second word of the object
		addi $t0, $zero, 0
		sw $t0, 8($v0) # Setting value in the third word of the object
		sw $v0, 16($sp) # internal_187 = address of allocated object Int
		
		# Set attribute flag of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 16($sp) # $t1 = internal_187
		sw $t1, 20($t0) # self.flag = internal_187
		
		lw $t0, 16($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 36($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_182 = internal_187
		lw $t0, 16($sp)
		sw $t0, 36($sp)
		end_assign:
		
		# Jumping to endif_8792981789693
		j endif_8792981789693
		
		else_8792981789693:
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 12($sp) # internal_188 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_188
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_188
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 20($sp) # internal_188 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Get attribute avar of self
		lw $t0, 768($sp) # Get the address of self
		lw $t1, 12($t0) # Get the attribute 'avar' from the instance
		sw $t1, 8($sp) # internal_189 = avar
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_189
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_189
		
		# Calling function function_value_at_A
		jal function_value_at_A
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_190 = result of function_value_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_188
		lw $t0, 24($sp)
		sw $t0, 4($sp) # Storing internal_188
		
		# Argument internal_190
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_190
		
		# Calling function function_method1_at_A
		jal function_method1_at_A
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_191 = result of function_method1_at_A
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Set attribute avar of self
		lw $t0, 768($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_191
		sw $t1, 12($t0) # self.avar = internal_191
		
		lw $t0, 0($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 36($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_182 = internal_191
		lw $t0, 0($sp)
		sw $t0, 36($sp)
		end_assign:
		
		# Jumping to endif_8792981789693
		j endif_8792981789693
		
		endif_8792981789693:
		
		lw $t0, 36($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 60($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_176 = internal_182
		lw $t0, 36($sp)
		sw $t0, 60($sp)
		end_assign:
		
		# Jumping to endif_8792981790233
		j endif_8792981790233
		
		endif_8792981790233:
		
		lw $t0, 60($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 188($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_144 = internal_176
		lw $t0, 60($sp)
		sw $t0, 188($sp)
		end_assign:
		
		# Jumping to endif_8792981790239
		j endif_8792981790239
		
		endif_8792981790239:
		
		lw $t0, 188($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 280($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_121 = internal_144
		lw $t0, 188($sp)
		sw $t0, 280($sp)
		end_assign:
		
		# Jumping to endif_8792981790245
		j endif_8792981790245
		
		endif_8792981790245:
		
		lw $t0, 280($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 316($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_112 = internal_121
		lw $t0, 280($sp)
		sw $t0, 316($sp)
		end_assign:
		
		# Jumping to endif_8792981790251
		j endif_8792981790251
		
		endif_8792981790251:
		
		lw $t0, 316($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 352($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_103 = internal_112
		lw $t0, 316($sp)
		sw $t0, 352($sp)
		end_assign:
		
		# Jumping to endif_8792981790257
		j endif_8792981790257
		
		endif_8792981790257:
		
		lw $t0, 352($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 388($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_94 = internal_103
		lw $t0, 352($sp)
		sw $t0, 388($sp)
		end_assign:
		
		# Jumping to endif_8792981790263
		j endif_8792981790263
		
		endif_8792981790263:
		
		lw $t0, 388($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 444($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_80 = internal_94
		lw $t0, 388($sp)
		sw $t0, 444($sp)
		end_assign:
		
		# Jumping to endif_8792981790269
		j endif_8792981790269
		
		endif_8792981790269:
		
		lw $t0, 444($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 632($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_33 = internal_80
		lw $t0, 444($sp)
		sw $t0, 632($sp)
		end_assign:
		
		# Jumping to endif_8792981790275
		j endif_8792981790275
		
		endif_8792981790275:
		
		lw $t0, 632($sp)
		lw $t1, 0($t0)
		la $t2, type_Main
		la $t3, type_Bool
		beq $t1, $t2, is_Bool_or_Int
		beq $t1, $t3, is_Bool_or_Int
		j not_is_Bool_or_Int
		is_Bool_or_Int:
		lw $t4, 8($t0)
		lw $t5, 688($sp)
		j end_assign
		not_is_Bool_or_Int:
		# internal_19 = internal_33
		lw $t0, 632($sp)
		sw $t0, 688($sp)
		end_assign:
		
		# Jumping to endif_8792981790281
		j endif_8792981790281
		
		endif_8792981790281:
		
		# Jumping to while_start_8792981790296
		j while_start_8792981790296
		
		while_end_8792981790296:
		
		# Loading return value in $v1
		addi $v1, $zero, 0
		
		# Freeing space for local variables
		addi $sp, $sp, 768
		
		jr $ra
		
	main:
		# Reserving space for local variables
		addi $sp, $sp, -8
		
		# Allocating Main
		li $v0, 9
		lw $a0, type_Main
		syscall
		la $t0, type_Main # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 4($sp) # internal_0 = address of allocated object Main
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function___init___at_Main
		jal function___init___at_Main
		lw $ra, 4($sp)
		sw $v1, 12($sp) # internal_0 = result of function___init___at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 12($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_main_at_Main
		jal function_main_at_Main
		lw $ra, 4($sp)
		sw $v1, 8($sp) # internal_1 = result of function_main_at_Main
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Exit program
		li $v0, 10
		syscall
		
		