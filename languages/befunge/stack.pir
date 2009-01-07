# $Id$

=pod

# Duplicate.
# Befunge stack:
#   before:     ... v
#   after:      ... v
STACK_DUP:
        set I10, P2
        unless I10, STACK_DUP_POP_1
        pop I10, P2
STACK_DUP_POP_1:
        push P2, I10
        push P2, I10
        branch MOVE_PC

# Pop.
# Befunge stack:
#    before:    ... v
#    after:     ...
# Element is just discarded.
STACK_POP:
        set I10, P2
        unless I10, STACK_POP_POP_1
        pop I10, P2
STACK_POP_POP_1:
        branch MOVE_PC

# Swap.
# Befunge stack:
#   before:     ... a b
#   after:      ... b a
STACK_SWAP:
        set I10, P2
        unless I10, STACK_SWAP_POP_1
        pop I10, P2
STACK_SWAP_POP_1:
        set I11, P2
        unless I11, STACK_SWAP_POP_2
        pop I11, P2
STACK_SWAP_POP_2:
        push P2, I10
        push P2, I11
        branch MOVE_PC

=cut

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

