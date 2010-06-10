# Copyright (C) 2002-2009, Parrot Foundation.
# $Id$

# ** string mode

#
# string mode.
# befunge stack:
#   before:     ...
#   after:      ... c
# c = ord(current char)
.sub io__push_char
    $P0 = get_global "status"
    $P1 = get_global "stack"

    $I0 = $P0["val"]
    push $P1, $I0

    set_global "stack", $P1
.end


# ** input

#
# io__input_char()
#
# input character.
# befunge stack:
#   before:     ...
#   after:      ... c
# c = getchar()
# no return value.
#
.sub "io__input_char"
    $P0 = get_global "user_input"
    $S0 = $P0

    $I0 = length $S0
    if $I0 > 0 goto _IO__INPUT_CHAR__SUBSTR

    $P1 = getinterp
    $P1 = $P1.'stdhandle'(.PIO_STDIN_FILENO)
    $S0 = $P1.'readline'()
    $S0 = chopn $S0, 1

  _IO__INPUT_CHAR__SUBSTR:
    $S1 = replace $S0, 0, 1, ""
    $P0 = $S0
    set_global "user_input", $P0

    $I0 = ord $S1
    stack__push($I0)

.end

#
# io__input_integer()
#
# input integer.
# befunge stack:
#   before:     ...
#   after:      ... i
# i = readint()
# no return value.
#
.sub "io__input_integer"
    $P0 = get_global "user_input"
    $S0 = $P0

    .local int len
    len = length $S0
    if len > 0 goto _IO__INPUT_INT__PARSE_INPUT

    $P1 = getinterp
    $P1 = $P1.'stdhandle'(.PIO_STDIN_FILENO)
    $S0 = $P1.'readline'()
    $S0 = chopn $S0, 1
    len = length $S0

  _IO__INPUT_INT__PARSE_INPUT:
    .local int    i
    .local string buf
    i   = 0
    buf = ""
  _IO__INPUT_INT__NEXT_CHAR:
    $S1 = substr $S0, i, 1
    if $S1 < '0' goto _IO__INPUT_INT__NAN
    if $S1 > '9' goto _IO__INPUT_INT__NAN
    concat buf, $S1
    inc i
    if i < len goto _IO__INPUT_INT__NEXT_CHAR

  _IO__INPUT_INT__NAN:
    $S0 = replace $S0, 0, i, ""
    $P0 = $S0
    set_global "user_input", $P0

    $I0 = buf
    stack__push($I0)
.end


# ** output

#
# io__output_char()
#
# output character.
# befunge stack:
#   before:     ... i
#   after:      ...
# writechar( chr(i) )
#
.sub "io__output_char"
    $I0 = stack__pop()
    $S0 = chr $I0
    print $S0
.end

#
# io__output_int()
#
# output integer.
# befunge stack:
#   before:     ... i
#   after:      ...
# writeint(i)
#
.sub "io__output_int"
    $I0 = stack__pop()
    print $I0
    print " "
.end


# ** playfield tinkering

#
# io__value_get()
#
# get a value from the playfield.
# befunge stack:
#   before:     ... x y
#   after:      ... i
# i = value_at(x,y)
#
.sub "io__value_get"
    .local int x, y
    y = stack__pop()
    x = stack__pop()

    $P0 = get_global "playfield"
    $I0 = $P0[y;x]
    stack__push($I0)
.end


#
# io__value_put()
#
# put a value in the playfield.
# befunge stack:
#   before:     ... i x y
#   after:      ...
# value_at(x,y) = i
#
.sub "io__value_put"
    .local int x, y, v
    y = stack__pop()
    x = stack__pop()
    v = stack__pop()

    $P0 = get_global "playfield"
    $P0[y;x] = v
    set_global"playfield", $P0
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

