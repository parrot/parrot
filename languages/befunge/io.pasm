# Implement the chr() function.
# Generic method. 
# Parrot stack: 
#   before:     ... i
#   after:      ... c
# c = chr(i)        
IO_CHR:
        pushi
        pushs
        restore I10
        substr S10, S3, I10, 1
        save S10
        pops
        popi
        ret
       
# String mode.
# Befunge stack:        
#   before:     ...
#   after:      ... c
# i = ord(current char)
IO_PUSH_CHAR:
        pushi
        ord I10, S0
        save I10
        bsr PUSH
        popi
        branch MOVE_PC

# Input integer.
# Befunge stack:        
#   before:     ...
#   after:      ... i                                   
# i = readint()
IO_INPUT_INT:
        save S2
        pushi
        pushs
        restore S2
        length I10, S2
        gt I10, 0, IO_INPUT_INT_PARSE_INPUT
        read S2, 1
        length I10, S2
IO_INPUT_INT_PARSE_INPUT:
        set I11, 0
        set S10, ""
IO_INPUT_INT_NEXT_CHAR:
        substr S11, S2, I11, 1
        lt S11, "0", IO_INPUT_INT_NAN
        gt S11, "9", IO_INPUT_INT_NAN
        concat S10, S10, S11
        inc I11
        lt I11, I10, IO_INPUT_INT_NEXT_CHAR
        set I10, 0
        set I11, 0
IO_INPUT_INT_NAN:
        substr S2, S2, I11, I10
        save I10
        bsr PUSH
        pops
        popi
        branch MOVE_PC

# Input character.
# Befunge stack:        
#   before:     ...
#   after:      ... c
# c = getchar()
IO_INPUT_CHAR:
        save S2
        pushi
        pushs
        restore S2
        length I10, S2
        gt I10, 0, IO_INPUT_CHAR_SUBSTR
        read S2, 1
IO_INPUT_CHAR_SUBSTR:
        substr S10, S2, 0, 1
        length I10, S2
        substr S2, S2, 1, I10
        ord I10, S10
        save I10
        bsr PUSH
        save S2
        pops
        restore S2
        popi
        branch MOVE_PC
                             
# Output integer.
# Befunge stack:        
#   before:     ... i
#   after:      ...                                   
# writeint(i)
IO_OUTPUT_INT:
        pushi
        bsr POP
        restore I10
        print I10
        popi
        branch MOVE_PC

# Output character.
# Befunge stack:        
#   before:     ... i
#   after:      ...
# writechar( chr(i) )
IO_OUTPUT_CHAR:
        pushs
        bsr POP
        bsr IO_CHR
        restore S10
        print S10
        pops
        branch MOVE_PC
                             
# Get a value from playfield.
# Befunge stack:        
#   before:     ... x y
#   after:      ... i
# i = value_at(x,y)                                
IO_GET_VALUE:
        pushi
        pushs
        bsr POP
        restore I11
        bsr POP
        restore I10
        set S10, P1[I11]
        ord I12, S10, I10
        save I12
        bsr PUSH
        pops
        popi
        branch MOVE_PC
        
# Put a value in the playfield.
# Befunge stack:        
#   before:     ... i x y
#   after:      ...
# value_at(x,y) = i                                
IO_PUT_VALUE:
        pushi
        pushs
        bsr POP
        restore I11
        set S10, P1[I11]        # original line
        bsr POP
        restore I10             # offset
        bsr POP
        bsr IO_CHR
        restore S11             # char to store
	length I12, S10
	set S13, ""             # First part
	set S12, ""             # Second part
	substr S13, S10, 0, I10
	inc I10
	substr S12, S10, I10, I12
	set S14, ""
	concat S14, S13
	concat S14, S11
	concat S14, S12
        set P1[I11], S14
        pops
        popi
        set S1, P1[I1]          # Restore line, in case we changed the current line...
        branch MOVE_PC
