#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/arithmetics.t - Arithmetic Ops

=head1 SYNOPSIS

        % prove t/op/arithmetics.t

=head1 DESCRIPTION

Tests basic arithmetic on various combinations of Parrot integer and
number types.

=cut

.sub main :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'

    plan(121)

    take_the_negative_of_a_native_integer()
    take_the_absolute_of_a_native_integer()
    add_native_integer_to_native_integer()
    subtract_native_integer_from_native_integer()
    multiply_native_integer_with_native_integer()
    divide_native_integer_by_native_integer()
    negate_minus_zero_point_zero()
    negate_a_native_number()
    take_the_absolute_of_a_native_number()
    ceil_of_a_native_number()
    floor_of_a_native_number()
    add_native_integer_to_native_number()
    subtract_native_integer_from_native_number()
    multiply_native_number_with_native_integer()
    divide_native_number_by_native_integer()
    add_native_number_to_native_number()
    subtract_native_number_from_native_number()
    multiply_native_number_with_native_number()
    divide_native_number_by_native_number()
    integer_overflow_with_pow()
    bnot_p_p_creates_destination()
    # END_OF_TESTS

.end

#
# Operations on a single INTVAL
#
.sub take_the_negative_of_a_native_integer
    set $I0, 0
    neg $I0
    is( $I0, "0", 'take_the_negative_of_a_native_integer' )

    set $I0, 1234567890
    neg $I0
    is( $I0, "-1234567890", 'take_the_negative_of_a_native_integer' )

    set $I0, -1234567890
    neg $I0
    is( $I0, "1234567890", 'take_the_negative_of_a_native_integer' )

    set $I0, 0
    set $I1, 0
    neg $I1, $I0
    is( $I1, "0", 'take_the_negative_of_a_native_integer' )

    set $I0, 1234567890
    neg $I1, $I0
    is( $I1, "-1234567890", 'take_the_negative_of_a_native_integer' )

    set $I0, -1234567890
    neg $I1, $I0
    is( $I1, "1234567890", 'take_the_negative_of_a_native_integer' )
.end

.sub take_the_absolute_of_a_native_integer
    set $I0, 0
    abs $I0
    is( $I0, "0", 'take_the_absolute_of_a_native_integer' )

    set $I0, 1234567890
    abs $I0
    is( $I0, "1234567890", 'take_the_absolute_of_a_native_integer' )

    set $I0, -1234567890
    abs $I0
    is( $I0, "1234567890", 'take_the_absolute_of_a_native_integer' )

    set $I0, 0
    set $I1, 0
    abs $I1, $I0
    is( $I1, "0", 'take_the_absolute_of_a_native_integer' )

    set $I0, 1234567890
    abs $I1, $I0
    is( $I1, "1234567890", 'take_the_absolute_of_a_native_integer' )

    set $I0, -1234567890
    abs $I1, $I0
    is( $I1, "1234567890", 'take_the_absolute_of_a_native_integer' )
.end

#
# first arg is INTVAL, second arg is INTVAL
#
.sub add_native_integer_to_native_integer
    set $I0, 4000
    set $I1, -123
    add $I2, $I0, $I1
    is( $I2, "3877", 'add_native_integer_to_native_integer' )

    add $I0, $I0, $I1
    is( $I0, "3877", 'add_native_integer_to_native_integer' )
.end

.sub subtract_native_integer_from_native_integer
    set $I0, 4000
    set $I1, -123
    sub $I2, $I0, $I1
    is( $I2, "4123", 'subtract_native_integer_from_native_integer' )

    sub $I0, $I0, $I1
    is( $I0, "4123", 'subtract_native_integer_from_native_integer' )
.end

.sub multiply_native_integer_with_native_integer
    set $I0, 4000
    set $I1, -123
    mul $I2, $I0, $I1
    is( $I2, "-492000", 'multiply_native_integer_with_native_integer' )

    mul $I0, $I0, $I1
    is( $I0, "-492000", 'multiply_native_integer_with_native_integer' )
.end

.sub divide_native_integer_by_native_integer
    set $I0, 4000
    set $I1, -123
    div $I2, $I0, $I1
    is( $I2, "-32", 'divide_native_integer_by_native_integer' )

    div $I0, $I0, $I1
    is( $I0, "-32", 'divide_native_integer_by_native_integer' )
.end

#
# print -0.0 as -0
#
.sub negate_minus_zero_point_zero
    .local pmc interp, config_hash
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash['has_negative_zero']

    set $N0, 0
    neg $N0
    $S0 = $N0
    unless has_negative_zero goto Todo_test1
    is( $S0, "-0", '1' )
    goto End_test1
Todo_test1:
    $I0 = $S0 == "-0"
    todo($I0, 'negative zero, TT #313')
End_test1:

    set $N0, -0.0
    neg $N0
    $S0 = $N0
    is( $S0, "0", '2' )

    set $N0, -0.0
    neg $N1, $N0
    $S0 = $N1
    is( $S0, "0", '3' )

    set $N0, 0
    set $N1, 1
    neg $N1, $N0
    $S0 = $N1
    unless has_negative_zero goto Todo_test4
    is( $S0, "-0", '4' )
    goto End_test4
Todo_test4:
    $I0 = $S0 == "-0"
    todo($I0, 'negative zero, TT #313')
End_test4:
.end

#
# Operations on a single NUMVAL
#
.sub negate_a_native_number
    set $N0, 123.4567890
    neg $N0
    is( $N0, "-123.456789", 'negate_a_native_number' )

    set $N0, -123.4567890
    neg $N0
    is( $N0, "123.456789", 'negate_a_native_number' )

    set $N0, 123.4567890
    neg $N1, $N0
    is( $N1, "-123.456789", 'negate_a_native_number' )

    set $N0, -123.4567890
    neg $N1, $N0
    is( $N1, "123.456789", 'negate_a_native_number' )
.end

.sub take_the_absolute_of_a_native_number
    set $N0, 0
    abs $N0
    is( $N0, "0", 'take_the_absolute_of_a_native_number' )

    set $N0, -0.0
    abs $N0
    is( $N0, "0", 'take_the_absolute_of_a_native_number' )

    set $N0, 123.45678901
    abs $N0
    is( $N0, "123.45678901", 'take_the_absolute_of_a_native_number' )

    set $N0, -123.45678901
    abs $N0
    is( $N0, "123.45678901", 'take_the_absolute_of_a_native_number' )

    set $N0, 0
    set $N1, 1
    abs $N1, $N0
    is( $N1, "0", 'take_the_absolute_of_a_native_number' )

    set $N0, 0.0
    set $N1, 1
    abs $N1, $N0
    is( $N1, "0", 'take_the_absolute_of_a_native_number' )

    set $N0, 123.45678901
    set $N1, 1
    abs $N1, $N0
    is( $N1, "123.45678901", 'take_the_absolute_of_a_native_number' )

    set $N0, -123.45678901
    set $N1, 1
    abs $N1, $N0
    is( $N1, "123.45678901", 'take_the_absolute_of_a_native_number' )
.end

.sub ceil_of_a_native_number
    set $N0, 0
    ceil $N0
    is( $N0, "0", 'ceil_of_a_native_number' )

    set $N0, 123.45678901
    ceil $N0
    is( $N0, "124", 'ceil_of_a_native_number' )

    set $N0, -123.45678901
    ceil $N0
    is( $N0, "-123", 'ceil_of_a_native_number' )

    set $N0, 0
    set $N1, 1
    ceil $N1, $N0
    is( $N1, "0", 'ceil_of_a_native_number' )

    set $N0, 0.0
    set $N1, 1
    ceil $N1, $N0
    is( $N1, "0", 'ceil_of_a_native_number' )

    set $N0, 123.45678901
    set $N1, 1
    ceil $N1, $N0
    is( $N1, "124", 'ceil_of_a_native_number' )

    set $N0, -123.45678901
    set $N1, 1
    ceil $N1, $N0
    is( $N1, "-123", 'ceil_of_a_native_number' )

    set $N0, 0
    set $I1, 1
    ceil $I1, $N0
    is( $I1, "0", 'ceil_of_a_native_number' )

    set $N0, 0.0
    set $I1, 1
    ceil $I1, $N0
    is( $I1, "0", 'ceil_of_a_native_number' )

    set $N0, 123.45678901
    set $I1, 1
    ceil $I1, $N0
    is( $I1, "124", 'ceil_of_a_native_number' )

    set $N0, -123.45678901
    set $I1, 1
    ceil $I1, $N0
    is( $I1, "-123", 'ceil_of_a_native_number' )
.end

.sub floor_of_a_native_number
    set $N0, 0
    floor $N0
    is( $N0, "0", 'floor_of_a_native_number' )

    set $N0, 123.45678901
    floor $N0
    is( $N0, "123", 'floor_of_a_native_number' )

    set $N0, -123.45678901
    floor $N0
    is( $N0, "-124", 'floor_of_a_native_number' )

    set $N0, 0
    set $N1, 1
    floor $N1, $N0
    is( $N1, "0", 'floor_of_a_native_number' )

    set $N0, 0.0
    set $N1, 1
    floor $N1, $N0
    is( $N1, "0", 'floor_of_a_native_number' )

    set $N0, 123.45678901
    set $N1, 1
    floor $N1, $N0
    is( $N1, "123", 'floor_of_a_native_number' )

    set $N0, -123.45678901
    set $N1, 1
    floor $N1, $N0
    is( $N1, "-124", 'floor_of_a_native_number' )

    set $N0, 0
    set $I1, 1
    floor $I1, $N0
    is( $I1, "0", 'floor_of_a_native_number' )

    set $N0, 0.0
    set $I1, 1
    floor $I1, $N0
    is( $I1, "0", 'floor_of_a_native_number' )

    set $N0, 123.45678901
    set $I1, 1
    floor $I1, $N0
    is( $I1, "123", 'floor_of_a_native_number' )

    set $N0, -123.45678901
    set $I1, 1
    floor $I1, $N0
    is( $I1, "-124", 'floor_of_a_native_number' )

.end

#
# FLOATVAL and INTVAL tests
#
.sub add_native_integer_to_native_number
    set $I0, 4000
    set $N0, -123.123
    add $N1, $N0, $I0
    is( $N1, "3876.877", 'add_native_integer_to_native_number' )

    add $N0, $N0, $I0
    is( $N0, "3876.877", 'add_native_integer_to_native_number' )

    add $N0, $I0
    is( $N0, "7876.877", 'add_native_integer_to_native_number' )

.end

.sub subtract_native_integer_from_native_number
    set $I0, 4000
    set $N0, -123.123
    sub $N1, $N0, $I0
    is( $N1, "-4123.123", 'subtract_native_integer_from_native_number' )

    sub $N0, $N0, $I0
    is( $N0, "-4123.123", 'subtract_native_integer_from_native_number' )

    sub $N0, $I0
    is( $N0, "-8123.123", 'subtract_native_integer_from_native_number' )

.end

.sub multiply_native_number_with_native_integer
    set $I0, 4000
    set $N0, -123.123
    mul $N1, $N0, $I0
    is( $N1, "-492492", 'multiply_native_number_with_native_integer' )

    mul $N0, $N0, $I0
    is( $N0, "-492492", 'multiply_native_number_with_native_integer' )

    mul $N0, -2
    is( $N0, "984984", 'multiply_native_number_with_native_integer' )
.end

.sub divide_native_number_by_native_integer
    set $I0, 4000
    set $N0, -123.123
    div $N1, $N0, $I0
    is( $N1, "-0.03078075", 'divide_native_number_by_native_integer' )

    div $N0, $N0, $I0
    is( $N0, "-0.03078075", 'divide_native_number_by_native_integer' )

    div $N0, 1
    is( $N0, "-0.03078075", 'divide_native_number_by_native_integer' )

    set $N0, 100.000
    div $N0, 100
    is( $N0, "1", 'divide_native_number_by_native_integer' )

    div $N0, 0.01
    is( $N0, "100", 'divide_native_number_by_native_integer' )
.end

#
# FLOATVAL and FLOATVAL tests
#
.sub add_native_number_to_native_number
    set $N2, 4000.246
    set $N0, -123.123
    add $N1, $N0, $N2
    is( $N1, "3877.123", 'add_native_number_to_native_number' )

    add $N0, $N0, $N2
    is( $N0, "3877.123", 'add_native_number_to_native_number' )
.end

.sub subtract_native_number_from_native_number
    set $N2, 4000.246
    set $N0, -123.123
    sub $N1, $N0, $N2
    is( $N1, "-4123.369", 'subtract_native_number_from_native_number' )

    sub $N0, $N0, $N2
    is( $N0, "-4123.369", 'subtract_native_number_from_native_number' )

.end

.sub multiply_native_number_with_native_number
    set $N2, 4000.246
    set $N0, -123.123
    mul $N1, $N0, $N2
    is( $N1, "-492522.288258", 'multiply_native_number_with_native_number' )

    mul $N0, $N0, $N2
    is( $N0, "-492522.288258", 'multiply_native_number_with_native_number' )

.end

.sub divide_native_number_by_native_number
    set $N2, 4000.246
    set $N0, -123.123
    div $N1, $N0, $N2
    is( $N1, "-0.0307788571002883", 'divide_native_number_by_native_number' )

    div $N0, $N0, $N2
    is( $N0, "-0.0307788571002883", 'divide_native_number_by_native_number' )

.end

.sub integer_overflow_with_pow
    .include "iglobals.pasm"

    # Check that we aren't 32-bit INTVALs without GMP
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int intvalsize
    intvalsize = config['intvalsize']
    .local int gmp
    gmp = config['gmp']

    if intvalsize != 4 goto can_test
    if gmp goto can_test
        skip(40,'No integer overflow for 32-bit INTVALs without GMP installed')
        goto end

  can_test:

    .local pmc i1, i2, r
    i1 = new 'Integer'
    i2 = new 'Integer'
    i1 = 2
    i2 = 1
    $I1 = 1
  next:
    null r
    r = pow i1, i2
    $S0 = r

    $I1 = $I1 * 2
    is( $S0, $I1, 'integer_overflow_with_pow' )

    inc i2
# XXX: this must be extended to at least 64 bit range
# when sure that the result is not floating point.
# In the meantime, make sure it overflows nicely
# on 32 bit.
    unless i2 > 40 goto next

  end:
.end

.sub 'bnot_p_p_creates_destination'
    $P0 = box 3
    $P1 = bnot $P0
    is( $P1, -4, 'bnot_p_p_creates_destination')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
