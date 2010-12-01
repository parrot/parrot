# Copyright (C) 2002-2009, Parrot Foundation.

#
# push number on befunge's stack.
# befunge stack:
#   before:     ...
#   after:      ... <number>
# no return value.
#
.sub maths__push_number
    $P0 = get_global "status"
    $S0 = $P0["char"]
    $I0 = $S0
    stack__push($I0)
.end


# ** math operations

#
# maths__add()
#
# addition.
# befunge stack:
#   before:     ... a b
#   after:      ... a+b
# no return value.
#
.sub "maths__add"
    $I1 = stack__pop()
    $I0 = stack__pop()
    $I2 = $I0 + $I1
    stack__push($I2)
.end


#
# maths__div()
#
# division.
# befunge stack:
#   before:     ... a b
#   after:      ... a/b
# no return value.
#
.sub "maths__div"
    $I1 = stack__pop()
    $I0 = stack__pop()
    if $I1 == 0 goto MATHS__DIV__BY_ZERO
    $I2 = $I0 / $I1
    stack__push($I2)
    .return()

  MATHS__DIV__BY_ZERO:
    stack__push(0)
.end


#
# maths__mod()
#
# modulus.
# befunge stack:
#   before:     ... a b
#   after:      ... a%b
# no return value.
#
.sub "maths__mod"
    $I1 = stack__pop()
    $I0 = stack__pop()
    $I2 = mod $I0, $I1
    stack__push($I2)
.end


#
# maths__mul()
#
# multiplication.
# befunge stack:
#   before:     ... a b
#   after:      ... a*b
# no return value.
# no return value.
#
.sub "maths__mul"
    $I1 = stack__pop()
    $I0 = stack__pop()
    $I2 = $I0 * $I1
    stack__push($I2)
.end


#
# maths__not()
#
# logical not.
# befunge stack:
#   before:     ... a
#   after:      ... not(a)
# no return value.
#
.sub "maths__not"
    $I0 = stack__pop()
    $I0 = not $I0
    stack__push($I0)
.end


#
# maths__sub()
#
# subtraction.
# befunge stack:
#   before:     ... a b
#   after:      ... a-b
# no return value.
#
.sub "maths__sub"
    $I1 = stack__pop()
    $I0 = stack__pop()
    $I2 = $I0 - $I1
    stack__push($I2)
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
