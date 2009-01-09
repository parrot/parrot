# $Id$

#
# stack_duplicate()
#
# duplicate element at top of stck
# befunge stack:
#   before:     ... v
#   after:      ... v v
# no return value
#
.sub "stack__duplicate"
    $I0 = stack__pop()
    
    $P0 = get_global "stack"
    push $P0, $I0
    push $P0, $I0
    set_global "stack", $P0
    .return()
.end


#
# val = stack__pop()
#
# pop and return a value from the stack, or 0 if stack is empty.
# befunge stack:
#    before:    ... v
#    after:     ...
#
.sub "stack__pop"
    $P0 = get_global "stack"

    $I0 = $P0
    if $I0 > 0 goto STACK__POP__POP
    .return(0)

  STACK__POP__POP:
    $I1 = pop $P0
    set_global "stack", $P0
    .return($I1)
.end


#
# stack__push(v)
#
# push a value on the stack.
# befunge stack:
#    before:    ...
#    after:     ... v
#
.sub "stack__push"
    .param int v
    $P0 = get_global "stack"
    push $P0, v
    set_global "stack", $P0
.end


=pod

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

