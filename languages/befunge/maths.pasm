# Create a pseudo-random number.
# Parrot's stack:
#   before:     ... max
#   after:      ... rand
# 0 <= rand < max
.constant RANDMAX 65536.0
MATHS_RAND:
        pushi
        restore I10
        mul N0, N0, 5.0
        add N0, N0, 1.0
        mod N0, N0, .RANDMAX
        save N0
        pushn
        restore N0
        set N10, I10
        mul N10, N0, N10
        div N10, N10, .RANDMAX
        set I10, N10
        popn
        save I10
        popi
        ret
        
# Push number on Befunge's stack.
# Befunge Stack:
#   before:     ...
#   after:      ... <number>
MATHS_PUSH_NUMBER:
        pushi
        set I10, S0
        save I10
        bsr PUSH
        popi
        branch MOVE_PC

# Addition.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a+b
MATHS_ADD:
        pushi
        bsr POP
        restore I11
        bsr POP
        restore I10
        add I12, I10, I11
        save I12
        bsr PUSH
        popi
        branch MOVE_PC
        
# Substraction.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a-b
MATHS_SUB:
        pushi
        bsr POP
        restore I11
        bsr POP
        restore I10
        sub I12, I10, I11
        save I12
        bsr PUSH
        popi
        branch MOVE_PC

# Multiplication.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a*b
MATHS_MUL:
        pushi
        bsr POP
        restore I11
        bsr POP
        restore I10
        mul I12, I10, I11
        save I12
        bsr PUSH
        popi
        branch MOVE_PC

# Division.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a/b
MATHS_DIV:
        pushi
        bsr POP
        restore I11
        bsr POP
        restore I10
        div I12, I10, I11
        save I12
        bsr PUSH
        popi
        branch MOVE_PC

# Remainder.
# Befunge Stack:
#   before:     ... a b
#   after:      ... a mod b
MATHS_MOD:
        pushi
        bsr POP
        restore I11
        bsr POP
        restore I10
        mod I12, I10, I11
        save I12
        bsr PUSH
        popi
        branch MOVE_PC

# Logical not.        
# Befunge Stack:
#   before:     ... a
#   after:      ... not(a)
MATHS_NOT:
        pushi
        bsr POP
        restore I10
        not I10, I10
        save I10
        bsr PUSH
        popi
        branch MOVE_PC