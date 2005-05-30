# $Id$

# String mode.
# Befunge stack:        
#   before:     ...
#   after:      ... c
# i = ord(current char)
IO_PUSH_CHAR:
        pushi
        ord I10, S0
        push P2, I10
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
        getstdin P15
        readline S2, P15
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
        push P2, S10
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
        getstdin P15
        readline S2, P15
IO_INPUT_CHAR_SUBSTR:
        substr S10, S2, 0, 1
        length I10, S2
        substr S2, S2, 1, I10
        ord I10, S10
        push P2, I10
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
        set I10, P2
        unless I10, IO_OUTPUT_INT_POP_1
        pop I10, P2
IO_OUTPUT_INT_POP_1:    
        print I10
        print " "
        popi
        branch MOVE_PC

# Output character.
# Befunge stack:        
#   before:     ... i
#   after:      ...
# writechar( chr(i) )
IO_OUTPUT_CHAR:
        pushi
        pushs
        set I10, P2
        unless I10, IO_OUTPUT_CHAR_POP_1
        pop I10, P2
IO_OUTPUT_CHAR_POP_1:   
        chr S10, I10
        print S10
        popi
        pops
        branch MOVE_PC
                             
# Get a value from playfield.
# Befunge stack:        
#   before:     ... x y
#   after:      ... i
# i = value_at(x,y)                                
IO_GET_VALUE:
        pushi
        set I11, P2
        unless I11, IO_GET_VALUE_POP_1
        pop I11, P2
IO_GET_VALUE_POP_1:
        set I10, P2
        unless I10, IO_GET_VALUE_POP_2
        pop I10, P2
IO_GET_VALUE_POP_2:
        set I12, P1[I11;I10]
        push P2, I12
        popi
        branch MOVE_PC
        
# Put a value in the playfield.
# Befunge stack:        
#   before:     ... i x y
#   after:      ...
# value_at(x,y) = i                                
IO_PUT_VALUE:
        pushi
        set I11, P2
        unless I11, IO_PUT_VALUE_POP_1
        pop I11, P2
IO_PUT_VALUE_POP_1:     
        set I10, P2             # offset
        unless I10, IO_PUT_VALUE_POP_2
        pop I10, P2
IO_PUT_VALUE_POP_2:
        set I20, P2
        unless I20, IO_PUT_VALUE_POP_3
        pop I20, P2
IO_PUT_VALUE_POP_3:
        set P1[I11;I10], I20
        popi
        branch MOVE_PC
