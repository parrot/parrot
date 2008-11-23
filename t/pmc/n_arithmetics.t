#! parrot
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/n_arithmetics.t - n_* Arithmetic Ops

=head1 SYNOPSIS

    % prove t/pmc/n_arithmetics.t

=head1 DESCRIPTION

Tests basic arithmetic ops that construct a new return value on
various combinations of Parrot integer and number types.

=cut


.sub main :main
    .include 'include/test_more.pir'

    plan(73)

    take_the_negative_of_an_integer()
    take_the_absolute_value_of_an_integer()
    add_integer_to_integer()
    subtract_integer_from_integer()
    multiply_integer_by_integer()
    divide_integer_by_integer()
    negate_a_float()
    take_the_absolute_value_of_a_float()
    add_integer_to_float()
    subtract_integer_from_float()
    multiply_float_by_integer()
    divide_float_by_integer()
    add_float_to_float()
    add_sub_mul_div_of_float_with_constants()
    subtract_float_from_float()
    multiply_float_by_float()
    divide_float_by_float()
    verify_new_pmc()
.end

###
### Operations on a single INTVAL
###
.sub take_the_negative_of_an_integer
    $P0 = new 'Integer'
    ## negate zero.
    set $P0, 0
    n_neg $P1, $P0
    is( $P1, 0, 'negavite of zero is zero' )
    $P30 = $P1
    ## negate a positive number.
    set $P0, 1234567890
    n_neg $P1, $P0
    is( $P1, -1234567890, 'negavite of positive' )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ## negate a negative number.
    set $P0, -1234567890
    $P1 = n_neg $P0
    is( $P1, 1234567890, 'negative of negative' )
.end

.sub take_the_absolute_value_of_an_integer
    $P0 = new 'Integer'
    ## find absolute zero (so to speak).
    set $P0, 0
    $P1 = n_abs $P0
    is( $P1, 0, 'abs of zero' )
    $P30 = $P1
    ## find the absolute value of a positive Integer.
    set $P0, 1234567890
    n_abs $P1, $P0
    is( $P1, 1234567890, 'abs of positive' )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ## find the absolute value of a negative number.
    set $P0, -1234567890
    n_abs $P1, $P0
    is( $P1, 1234567890, 'abs of negative' )
.end

###
### first arg is Integer, second arg is Integer
###
.sub add_integer_to_integer
    $P0 = new 'Integer'
    set $P0, 4000
    $P1 = new 'Integer'
    set $P1, -123
    $P2 = new 'Integer'
    set $P2, 666
    add $P2, $P0, $P1
    is( $P2, 3877, 'add integer to integer' )
    $P30 = $P2
    $P2 = add $P0, $P1
    is( $P2, 3877, 'add integer to integer in assignment' )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ## check adding constants.
    $P2 = add $P0, 11
    is( $P2, 4011, 'adding integer and constant' )
    $P0 = add $P0, 11
    is( $P0, 4011, 'adding integer and constant and assign to Int arg' )
.end

.sub subtract_integer_from_integer
    $P0 = new 'Integer'
    set $P0, 4000
    $P1 = new 'Integer'
    set $P1, -123
    $P2 = new 'Integer'
    set $P2, 666
    sub $P2, $P0, $P1
    is( $P2, 4123, 'subtract Integer from Integer' )
    $P30 = $P2
    $P2 = sub $P0, $P1
    is( $P2, 4123, 'subtract Integer from Integer in assignment' )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ## check subtracting constants.
    $P2 = sub $P0, 11
    is( $P2, 3989, 'subtract constant from Integer' )
    $P0 = sub $P0, 11
    is( $P2, 3989, 'subtract constant from Integer and assign to Int arg' )
.end

.sub multiply_integer_by_integer
    $P0 = new 'Integer'
    set $P0, 4000
    $P1 = new 'Integer'
    set $P1, -123
    $P2 = new 'Integer'
    set $P2, 666
    mul $P2, $P0, $P1
    is( $P2, -492000, 'multiply Integer by Integer' )
    $P3 = mul $P0, $P1
    is( $P3, -492000, 'multiply Integer by Integer in assginment' )
    ## check multiplying constants.
    $P2 = mul $P0, 11
    is( $P2, 44000, 'multiply Integer by constant' )
    $P0 = mul $P0, 11
    is( $P0, 44000, 'multiply Integer by constant and assign to Int arg' )
.end

.sub divide_integer_by_integer
    $P0 = new 'Integer'
    set $P0, 4000
    $P1 = new 'Integer'
    set $P1, -123
    $P2 = new 'Integer'
    set $P2, 666
    div $P2, $P0, $P1
    is( $P2, -32.5203, 'divide Integer by Integer', 0.0001 )
    $P3 = div $P0, $P1
    is( $P3, -32.5203, 'divide Integer by Integer in assignment', 0.0001 )
    ## check dividing by constants.
    $P2 = div $P0, 11
    is( $P2, 363.6363636363636364, 'divide Integer by constant' )
    $P0 = div $P0, 11
    is( $P0, 363.6363636363636364, 'divide Integer by constant and assign to Int arg' )
.end

###
### Operations on a single NUMVAL
###
.sub negate_a_float
    $P0 = new 'Float'
    set $P0, 0
    $P1 = n_neg $P0
    is( $P1, 0, 'neg of Float 0 is 0' )
    set $P0, -0.0
    n_neg $P1, $P0
    is( $P1, 0, 'neg of Float -0.0 is 0' )
    set $P0, 123.4567890
    $P1 = n_neg $P0
    is( $P1, -123.4567890, 'neg of positive Float is negative' )
    set $P0, -123.4567890
    n_neg $P1, $P0
    is( $P1, 123.4567890, 'neg of negavite Float is positive' )
.end

.sub take_the_absolute_value_of_a_float
    $P0 = new 'Integer'
    set $P0, 0
    $P1 = n_abs $P0
    is( $P1, 0, 'abs value of float 0 is zero' )
    set $P0, -0.0
    n_abs $P1, $P0
    is( $P1, 0, 'abs value of float -0.0 is zero' )
    set $P0, 123.45678901
    n_abs $P1, $P0
    is( $P1, 123.45678901, 'abs value of positive float is positive' )
    set $P0, -123.45678901
    $P1 = n_abs $P0
    is( $P1, 123.45678901, 'abs value of negative float is positive' )
.end

###
### FLOATVAL and INTVAL tests
###
.sub add_integer_to_float
    $P10 = new 'Integer'
    set $P10, 4000
    $P0 = new 'Float'
    set $P0, -123.123
    add $P1, $P0, $P10
    is( $P1, 3876.877, 'add Float and Int' )
    $P30 = $P1
    $P1 = add $P0, $P10
    is( $P1, 3876.877, 'add Float and Int in assignment' )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ##
    $P2 = add $P10, $P0
    is( $P2, 3876.877, 'add Int and Float' )
    $P1 = add $P1, $P10
    is( $P1, 7876.877, 'add Float and Int and assign to Float arg' )
.end

.sub subtract_integer_from_float
    $P10 = new 'Integer'
    set $P10, 4000
    $P0 = new 'Float'
    set $P0, -123.123
    sub $P1, $P0, $P10
    is( $P1, -4123.123, 'subtract Int from Float' )
    $P30 = $P1
    $P1 = sub $P0, $P10
    is( $P1, -4123.123, 'subtract Int from Float in assignment' )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ##
    $P2 = sub $P10, $P0
    is( $P2, 4123.123, 'subtract Float from Int in assignment' )
    $P1 = sub $P1, $P10
    is( $P1, -8123.123, 'subtract Float from Int and assign to Float arg' )
.end

.sub multiply_float_by_integer
    $P10 = new 'Integer'
    set $P10, 4000
    $P0 = new 'Float'
    set $P0, -123.123
    mul $P1, $P0, $P10
    is( $P1, -492492, 'multiply Float by Int' )
    $P30 = $P1
    $P1 = mul $P0, $P10
    is( $P1, -492492, 'multiply Float by Int in assignment' )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ##
    $P1 = mul $P10, $P0
    is( $P1, -492492, 'multiply Int by Float in assignment' )
    $P1 = mul $P1, -2
    is( $P1, 984984, 'multiply Float by const int and assign to Float arg' )
.end

.sub divide_float_by_integer
    $P10 = new 'Integer'
    set $P10, 4000
    $P0 = new 'Float'
    set $P0, -123.123
    div $P1, $P0, $P10
    is( $P1, -0.03078075, 'divide Float by Int', 0.0001 )
    $P30 = $P1
    $P1 = div $P0, $P10
    is( $P1, -0.03078075, 'divide Float by Int in assignment', 0.0001 )
    ## check that we are not reusing $P1.
    ne_addr $P30, $P1, not_broken
    ok( 0, 'not reusing $P1' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P1' )
  not_broken__done:
    ##
    $P1 = div $P0, 1
    is( $P1, -123.123, 'divide Float by constant Int 1' )
    set $P0, 100.000
    $P1 = div $P0, 100
    is( $P1, 1, 'divide Float by constant Int' )
    $P1 = div $P1, 0.01
    is( $P1, 100, 'divide Float by constant Float' )
.end

###
### FLOATVAL and FLOATVAL tests
###
.sub add_float_to_float
    $P0 = new 'Float'
    set $P0, 4000.246
    $P1 = new 'Float'
    set $P1, -123.123
    $P2 = new 'Float'
    set $P2, 6.66
    add $P2, $P0, $P1
    is( $P2, 3877.123, 'add Float to Float' )
    $P30 = $P2
    $P2 = add $P0, $P1
    is( $P2, 3877.123, 'add Float to Float in assignment' )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ##
.end
#
## This tests n_infix_ic_p_p_nc for n_add, n_sub, n_mul, and n_div.  Note that
## there is no n_infix_ic_p_nc_p op; the PMC argument always comes first.
.sub add_sub_mul_div_of_float_with_constants
    $P0 = new 'Float'
    set $P0, 4000.246
    $P1 = new 'Float'
    set $P1, -123.123
    $P2 = add $P1, 6.78
    is( $P2, -116.343, 'add neg Float to constant Float' )
    $P2 = add $P0, 6.78
    is( $P2,  4007.026, 'add pos Float to constant Float', 0.001 )
    $P2 = mul $P1, 6.78
    is( $P2, -834.77394, 'multiply Float by constant Float' )
    $P2 = div $P0, 6.78
    is( $P2,  590.007, 'divide Float by constant Float', 0.001 )
.end

.sub subtract_float_from_float
    $P0 = new 'Float'
    set $P0, 4000.246
    $P1 = new 'Float'
    set $P1, -123.123
    $P2 = new 'Float'
    set $P2, 6.66
    sub $P2, $P0, $P1
    is( $P2, 4123.369, 'subtract Float from Float' )
    $P30 = $P2
    $P2 = sub $P1, $P0
    is( $P2, -4123.369, 'subtract Float from Float in assignment' )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ##
.end

.sub multiply_float_by_float
    $P0 = new 'Float'
    set $P0, 400.0246
    $P1 = new 'Float'
    set $P1, -123.123
    $P2 = new 'Float'
    set $P2, 6.66
    mul $P2, $P0, $P1
    is( $P2, -49252.2288258, 'multiply Float from Float', 0.000001 )
    $P30 = $P2
    $P2 = mul $P0, $P1
    is( $P2, -49252.2288258, 'muliply Float from Float in assignment', 0.000001 )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ##
.end

.sub divide_float_by_float
    $P0 = new 'Float'
    set $P0, 4000.246
    $P1 = new 'Float'
    set $P1, -123.123
    $P2 = new 'Float'
    set $P2, 6.66
    div $P2, $P1, $P0
    is( $P2, -0.0307788571002883, 'divide neg Float by pos Float', 0.0000001 )
    $P30 = $P2
    $P2 = div $P0, $P1
    is( $P2, -32.4898, 'divide pos Float by neg Float in assignment', 0.0001 )
    ## check that we are not reusing $P2.
    ne_addr $P30, $P2, not_broken
    ok( 0, 'not reusing $P2' )
    goto not_broken__done
  not_broken:
    ok( 1, 'not reusing $P2' )
  not_broken__done:
    ##
.end

.sub verify_new_pmc
    $P0 = new 'Integer'
    $P1 = $P0
    $P0 = add $P0, 1
    is( $P0, 1, 'add constant to new (unassigned) PMC' )
    eq_addr $P0, $P1, nok
      ok( 1, 'variables have different addresses' )
      .return()
  nok:
    ok( 0, 'variables have different addresses' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
