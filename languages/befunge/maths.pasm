# $Id$

# Create a pseudo-random number.
# Parrot's stack:
#   before:     ... max
#   after:      ... rand
# 0 <= rand < max
.macro_const RANDMAX 65536.0
MATHS_RAND:
        restore I10
        mul N0, N0, 5.0
        add N0, N0, 1.0
        mod N0, N0, .RANDMAX
        save N0
        restore N0
        set N10, I10
        mul N10, N0, N10
        div N10, N10, .RANDMAX
        set I10, N10
        save I10
        ret

# Push number on Befunge's stack.
# Befunge Stack:
#   before:     ...
#   after:      ... <number>
MATHS_PUSH_NUMBER:
        set I10, S0
        push P2, I10
        branch MOVE_PC

# Addition.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a+b
MATHS_ADD:
        set I11, P2
        unless I11, MATHS_ADD_POP_1
        pop I11, P2
MATHS_ADD_POP_1:
        set I10, P2
        unless I10, MATHS_ADD_POP_2
        pop I10, P2
MATHS_ADD_POP_2:
        add I12, I10, I11
        push P2, I12
        branch MOVE_PC

# Substraction.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a-b
MATHS_SUB:
        set I11, P2
        unless I11, MATHS_SUB_POP_1
        pop I11, P2
MATHS_SUB_POP_1:
        set I10, P2
        unless I10, MATHS_SUB_POP_2
        pop I10, P2
MATHS_SUB_POP_2:
        sub I12, I10, I11
        push P2, I12
        branch MOVE_PC

# Multiplication.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a*b
MATHS_MUL:
        set I11, P2
        unless I11, MATHS_MUL_POP_1
        pop I11, P2
MATHS_MUL_POP_1:
        set I10, P2
        unless I10, MATHS_MUL_POP_2
        pop I10, P2
MATHS_MUL_POP_2:
        mul I12, I10, I11
        push P2, I12
        branch MOVE_PC

# Division.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a/b
MATHS_DIV:
        set I11, P2
        unless I11, MATHS_DIV_POP_1
        pop I11, P2
MATHS_DIV_POP_1:
        set I10, P2
        unless I10, MATHS_DIV_POP_2
        pop I10, P2
MATHS_DIV_POP_2:
        div I12, I10, I11
        push P2, I12
        branch MOVE_PC

# Remainder.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a mod b
MATHS_MOD:
        set I11, P2
        unless I11, MATHS_MOD_POP_1
        pop I11, P2
MATHS_MOD_POP_1:
        set I10, P2
        unless I10, MATHS_MOD_POP_2
        pop I10, P2
MATHS_MOD_POP_2:
        mod I12, I10, I11
        push P2, I12
        branch MOVE_PC

# Logical not.
# Befunge Stack:
#   before:     ... a
#   after:      ... not(a)
MATHS_NOT:
        set I10, P2
        unless I10, MATHS_NOT_POP_1
        pop I10, P2
MATHS_NOT_POP_1:
        not I10, I10
        push P2, I10
        branch MOVE_PC

