# Push an integer in Befunge's stack.
# The integer is popped from Parrot's stack.
# Generic method.
PUSH:
        pushi
        restore I6
        set I7, P2
        set P2[I7], I6
        popi
        ret

# Pop an integer from Befunge's stack.
# the integer is pushed on Parrot's stack.
# Generic method.
POP:
        pushi
        set I7, P2
        eq I7, 0, POP_EMPTY
        dec I7
        set I6, P2[I7]
        save I6
        set P2, I7
        popi
        ret

POP_EMPTY:      
        set I10, 0
        save I10
        popi
        ret

# Duplicate.
# Befunge stack:        
#   before:     ... v
#   after:      ... v 
STACK_DUP:
        pushi
        bsr POP
        restore I10
        save I10
        bsr PUSH
        save I10
        bsr PUSH
        popi
        branch MOVE_PC

# Pop.
# Befunge stack:        
#    before:    ... v
#    after:     ...
# Element is just discarded.
STACK_POP:
        pushi
        bsr POP
        restore I10
        popi
        branch MOVE_PC
        
# Swap.
# Befunge stack:        
#   before:     ... a b
#   after:      ... b a
STACK_SWAP:
        pushi
        bsr POP
        restore I10
        bsr POP
        restore I11
        save I10
        bsr PUSH
        save I11
        bsr PUSH
        popi
        branch MOVE_PC