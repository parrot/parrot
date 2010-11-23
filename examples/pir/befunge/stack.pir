# Copyright (C) 2002-2009, Parrot Foundation.

#
# stack__duplicate()
#
# duplicate element at top of stack
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
# no return value
#
.sub "stack__push"
    .param int v
    $P0 = get_global "stack"
    push $P0, v
    set_global "stack", $P0
.end


#
# stack__swap()
#
# swap.
# befunge stack:
#   before:     ... a b
#   after:      ... b a
# no return value
#
.sub "stack__swap"
    $I0 = stack__pop()
    $I1 = stack__pop()
    stack__push($I0)
    stack__push($I1)
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

