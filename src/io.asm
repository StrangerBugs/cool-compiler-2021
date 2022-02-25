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
	
	type_C: .word 8
	type_C_inherits_from: .word type_IO
	type_C_attributes: .word 0
	type_C_name_size: .word 1
	type_C_name: .asciiz "C"
	
	type_D: .word 8
	type_D_inherits_from: .word type_C
	type_D_attributes: .word 0
	type_D_name_size: .word 1
	type_D_name: .asciiz "D"
	
	type_Main: .word 8
	type_Main_inherits_from: .word type_IO
	type_Main_attributes: .word 0
	type_Main_name_size: .word 4
	type_Main_name: .asciiz "Main"
	
	buffer_input: .space 1024

.text
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
		
		# Allocating IO
		li $v0, 9
		lw $a0, type_IO
		syscall
		la $t0, type_IO # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 0($sp) # internal_0 = address of allocated object IO
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 8($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function___init___at_IO
		jal function___init___at_IO
		lw $ra, 4($sp)
		sw $v1, 8($sp) # internal_0 = result of function___init___at_IO
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Set attribute io of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.io = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_out_a_at_A:
		# Function parameters
		#   $ra = 16($sp)
		#   self = 12($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -12
		
		# Get attribute io of self
		lw $t0, 12($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'io' from the instance
		sw $t1, 8($sp) # internal_0 = io
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 24 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 15
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 65
		sb $t0, 8($v0) # internal_1[0] = 'A'
		
		addi $t0, $zero, 58
		sb $t0, 9($v0) # internal_1[1] = ':'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_1[2] = ' '
		
		addi $t0, $zero, 72
		sb $t0, 11($v0) # internal_1[3] = 'H'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_1[4] = 'e'
		
		addi $t0, $zero, 108
		sb $t0, 13($v0) # internal_1[5] = 'l'
		
		addi $t0, $zero, 108
		sb $t0, 14($v0) # internal_1[6] = 'l'
		
		addi $t0, $zero, 111
		sb $t0, 15($v0) # internal_1[7] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_1[8] = ' '
		
		addi $t0, $zero, 119
		sb $t0, 17($v0) # internal_1[9] = 'w'
		
		addi $t0, $zero, 111
		sb $t0, 18($v0) # internal_1[10] = 'o'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_1[11] = 'r'
		
		addi $t0, $zero, 108
		sb $t0, 20($v0) # internal_1[12] = 'l'
		
		addi $t0, $zero, 100
		sb $t0, 21($v0) # internal_1[13] = 'd'
		
		addi $t0, $zero, 10
		sb $t0, 22($v0) # internal_1[14] = '\n'
		
		sb $zero, 23($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_1 = "A: Hello world\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 20($sp)
		sw $t0, 4($sp) # Storing internal_0
		
		# Argument internal_1
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_1
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_2 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 12
		
		jr $ra
		
	function___init___at_B:
		# Function parameters
		#   $ra = 8($sp)
		#   self = 4($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -4
		
		# Allocating IO
		li $v0, 9
		lw $a0, type_IO
		syscall
		la $t0, type_IO # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 0($sp) # internal_0 = address of allocated object IO
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 8($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function___init___at_IO
		jal function___init___at_IO
		lw $ra, 4($sp)
		sw $v1, 8($sp) # internal_0 = result of function___init___at_IO
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Set attribute io of self
		lw $t0, 4($sp) # $t0 = self
		lw $t1, 0($sp) # $t1 = internal_0
		sw $t1, 8($t0) # self.io = internal_0
		
		# Loading return value in $v1
		lw $v1, 4($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 4
		
		jr $ra
		
	function_out_b_at_B:
		# Function parameters
		#   $ra = 16($sp)
		#   self = 12($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -12
		
		# Get attribute io of self
		lw $t0, 12($sp) # Get the address of self
		lw $t1, 8($t0) # Get the attribute 'io' from the instance
		sw $t1, 8($sp) # internal_0 = io
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 24 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 15
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 66
		sb $t0, 8($v0) # internal_1[0] = 'B'
		
		addi $t0, $zero, 58
		sb $t0, 9($v0) # internal_1[1] = ':'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_1[2] = ' '
		
		addi $t0, $zero, 72
		sb $t0, 11($v0) # internal_1[3] = 'H'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_1[4] = 'e'
		
		addi $t0, $zero, 108
		sb $t0, 13($v0) # internal_1[5] = 'l'
		
		addi $t0, $zero, 108
		sb $t0, 14($v0) # internal_1[6] = 'l'
		
		addi $t0, $zero, 111
		sb $t0, 15($v0) # internal_1[7] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_1[8] = ' '
		
		addi $t0, $zero, 119
		sb $t0, 17($v0) # internal_1[9] = 'w'
		
		addi $t0, $zero, 111
		sb $t0, 18($v0) # internal_1[10] = 'o'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_1[11] = 'r'
		
		addi $t0, $zero, 108
		sb $t0, 20($v0) # internal_1[12] = 'l'
		
		addi $t0, $zero, 100
		sb $t0, 21($v0) # internal_1[13] = 'd'
		
		addi $t0, $zero, 10
		sb $t0, 22($v0) # internal_1[14] = '\n'
		
		sb $zero, 23($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_1 = "B: Hello world\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 20($sp)
		sw $t0, 4($sp) # Storing internal_0
		
		# Argument internal_1
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_1
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_2 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 12
		
		jr $ra
		
	function___init___at_C:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_out_c_at_C:
		# Function parameters
		#   $ra = 12($sp)
		#   self = 8($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -8
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 24 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 15
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 67
		sb $t0, 8($v0) # internal_0[0] = 'C'
		
		addi $t0, $zero, 58
		sb $t0, 9($v0) # internal_0[1] = ':'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_0[2] = ' '
		
		addi $t0, $zero, 72
		sb $t0, 11($v0) # internal_0[3] = 'H'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_0[4] = 'e'
		
		addi $t0, $zero, 108
		sb $t0, 13($v0) # internal_0[5] = 'l'
		
		addi $t0, $zero, 108
		sb $t0, 14($v0) # internal_0[6] = 'l'
		
		addi $t0, $zero, 111
		sb $t0, 15($v0) # internal_0[7] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_0[8] = ' '
		
		addi $t0, $zero, 119
		sb $t0, 17($v0) # internal_0[9] = 'w'
		
		addi $t0, $zero, 111
		sb $t0, 18($v0) # internal_0[10] = 'o'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_0[11] = 'r'
		
		addi $t0, $zero, 108
		sb $t0, 20($v0) # internal_0[12] = 'l'
		
		addi $t0, $zero, 100
		sb $t0, 21($v0) # internal_0[13] = 'd'
		
		addi $t0, $zero, 10
		sb $t0, 22($v0) # internal_0[14] = '\n'
		
		sb $zero, 23($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_0 = "C: Hello world\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 20($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_0
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_1 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 8
		
		jr $ra
		
	function___init___at_D:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_out_d_at_D:
		# Function parameters
		#   $ra = 12($sp)
		#   self = 8($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -8
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 24 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 15
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 68
		sb $t0, 8($v0) # internal_0[0] = 'D'
		
		addi $t0, $zero, 58
		sb $t0, 9($v0) # internal_0[1] = ':'
		
		addi $t0, $zero, 32
		sb $t0, 10($v0) # internal_0[2] = ' '
		
		addi $t0, $zero, 72
		sb $t0, 11($v0) # internal_0[3] = 'H'
		
		addi $t0, $zero, 101
		sb $t0, 12($v0) # internal_0[4] = 'e'
		
		addi $t0, $zero, 108
		sb $t0, 13($v0) # internal_0[5] = 'l'
		
		addi $t0, $zero, 108
		sb $t0, 14($v0) # internal_0[6] = 'l'
		
		addi $t0, $zero, 111
		sb $t0, 15($v0) # internal_0[7] = 'o'
		
		addi $t0, $zero, 32
		sb $t0, 16($v0) # internal_0[8] = ' '
		
		addi $t0, $zero, 119
		sb $t0, 17($v0) # internal_0[9] = 'w'
		
		addi $t0, $zero, 111
		sb $t0, 18($v0) # internal_0[10] = 'o'
		
		addi $t0, $zero, 114
		sb $t0, 19($v0) # internal_0[11] = 'r'
		
		addi $t0, $zero, 108
		sb $t0, 20($v0) # internal_0[12] = 'l'
		
		addi $t0, $zero, 100
		sb $t0, 21($v0) # internal_0[13] = 'd'
		
		addi $t0, $zero, 10
		sb $t0, 22($v0) # internal_0[14] = '\n'
		
		sb $zero, 23($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_0 = "D: Hello world\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 20($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_0
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_1 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 8
		
		jr $ra
		
	function___init___at_Main:
		# Function parameters
		#   $ra = 4($sp)
		#   self = 0($sp)
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		jr $ra
		
	function_main_at_Main:
		# Function parameters
		#   $ra = 44($sp)
		#   self = 40($sp)
		
		# Reserving space for local variables
		addi $sp, $sp, -40
		
		# Allocating A
		li $v0, 9
		lw $a0, type_A
		syscall
		la $t0, type_A # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 36($sp) # internal_0 = address of allocated object A
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function___init___at_A
		jal function___init___at_A
		lw $ra, 4($sp)
		sw $v1, 44($sp) # internal_0 = result of function___init___at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_0
		lw $t0, 44($sp)
		sw $t0, 0($sp) # Storing internal_0
		
		# Calling function function_out_a_at_A
		jal function_out_a_at_A
		lw $ra, 4($sp)
		sw $v1, 40($sp) # internal_1 = result of function_out_a_at_A
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating B
		li $v0, 9
		lw $a0, type_B
		syscall
		la $t0, type_B # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 28($sp) # internal_2 = address of allocated object B
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function___init___at_B
		jal function___init___at_B
		lw $ra, 4($sp)
		sw $v1, 36($sp) # internal_2 = result of function___init___at_B
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_2
		lw $t0, 36($sp)
		sw $t0, 0($sp) # Storing internal_2
		
		# Calling function function_out_b_at_B
		jal function_out_b_at_B
		lw $ra, 4($sp)
		sw $v1, 32($sp) # internal_3 = result of function_out_b_at_B
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating C
		li $v0, 9
		lw $a0, type_C
		syscall
		la $t0, type_C # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 20($sp) # internal_4 = address of allocated object C
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_4
		
		# Calling function function___init___at_C
		jal function___init___at_C
		lw $ra, 4($sp)
		sw $v1, 28($sp) # internal_4 = result of function___init___at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_4
		lw $t0, 28($sp)
		sw $t0, 0($sp) # Storing internal_4
		
		# Calling function function_out_c_at_C
		jal function_out_c_at_C
		lw $ra, 4($sp)
		sw $v1, 24($sp) # internal_5 = result of function_out_c_at_C
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating D
		li $v0, 9
		lw $a0, type_D
		syscall
		la $t0, type_D # $t0 = address of the type
		sw $t0, 0($v0) # Setting type in the first word of th object
		sw $a0, 4($v0) # Setting size in the second word of th object
		sw $v0, 12($sp) # internal_6 = address of allocated object D
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_6
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_6
		
		# Calling function function___init___at_D
		jal function___init___at_D
		lw $ra, 4($sp)
		sw $v1, 20($sp) # internal_6 = result of function___init___at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Passing function arguments
		addi $sp, $sp, -8 # Reserving space for arguments
		sw $ra, 4($sp) # Storing return address
		
		# Argument internal_6
		lw $t0, 20($sp)
		sw $t0, 0($sp) # Storing internal_6
		
		# Calling function function_out_d_at_D
		jal function_out_d_at_D
		lw $ra, 4($sp)
		sw $v1, 16($sp) # internal_7 = result of function_out_d_at_D
		addi $sp, $sp, 8 # Freeing space for arguments
		
		# Allocating String
		li $v0, 9
		addi $a0, $zero, 15 # $a0 = length of string + 9 for 4 bytes for the type, 4 bytes for the length of the string and 1 byte for null-terminator
		syscall
		
		la $t0, type_String
		sw $t0, 0($v0) # Setting type in the first word of the object
		
		addi $t0, $zero, 6
		sw $t0, 4($v0) # Setting length of the string in the second word of the object
		
		addi $t0, $zero, 68
		sb $t0, 8($v0) # internal_8[0] = 'D'
		
		addi $t0, $zero, 111
		sb $t0, 9($v0) # internal_8[1] = 'o'
		
		addi $t0, $zero, 110
		sb $t0, 10($v0) # internal_8[2] = 'n'
		
		addi $t0, $zero, 101
		sb $t0, 11($v0) # internal_8[3] = 'e'
		
		addi $t0, $zero, 46
		sb $t0, 12($v0) # internal_8[4] = '.'
		
		addi $t0, $zero, 10
		sb $t0, 13($v0) # internal_8[5] = '\n'
		
		sb $zero, 14($v0) # Null-terminator at the end of the string
		
		sw $v0, 4($sp) # internal_8 = "Done.\n"
		
		# Passing function arguments
		addi $sp, $sp, -12 # Reserving space for arguments
		sw $ra, 8($sp) # Storing return address
		
		# Argument self
		lw $t0, 52($sp)
		sw $t0, 4($sp) # Storing self
		
		# Argument internal_8
		lw $t0, 16($sp)
		sw $t0, 0($sp) # Storing internal_8
		
		# Calling function function_out_string_at_IO
		jal function_out_string_at_IO
		lw $ra, 8($sp)
		sw $v1, 12($sp) # internal_9 = result of function_out_string_at_IO
		addi $sp, $sp, 12 # Freeing space for arguments
		
		# Loading return value in $v1
		lw $v1, 0($sp)
		
		# Freeing space for local variables
		addi $sp, $sp, 40
		
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
		
		