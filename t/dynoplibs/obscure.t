#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/dynoplibs/obscure.t - Tests for obscure mathematical functions

=head1 SYNOPSIS

        % prove t/dynoblibs/obscure.t

=head1 DESCRIPTION

Tests obscure.ops

=cut

.loadlib 'obscure_ops'
.loadlib 'trans_ops'    # needed for atan

.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'
    plan(37)
    ok(1,"load obscure_ops")

    lcm_test()
    gcd_test()
.end

.sub lcm_test
    set $I0, 10
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 10, 'lcm_test' )

    lcm $I2, 10, $I0
    is( $I2, 10, 'lcm_test' )

    lcm $I2, $I1, 10
    is( $I2, 10, 'lcm_test' )

    lcm $I2, 10, 10
    is( $I2, 10, 'lcm_test' )

    set $I1, 17
    lcm $I2, $I1, $I0
    is( $I2, 170, 'lcm_test' )

    lcm $I2, 17, $I0
    is( $I2, 170, 'lcm_test' )

    lcm $I2, $I1, 10
    is( $I2, 170, 'lcm_test' )

    lcm $I2, 17, 10
    is( $I2, 170, 'lcm_test' )

    set $I0, 17
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 170, 'lcm_test' )

    lcm $I2, 10, $I0
    is( $I2, 170, 'lcm_test' )

    lcm $I2, $I1, 17
    is( $I2, 170, 'lcm_test' )

    lcm $I2, 10, 17
    is( $I2, 170, 'lcm_test' )

    set $I0, 10
    set $I1, 0
    lcm $I2, $I1, $I0
    is( $I2, 0, 'lcm_test' )

    lcm $I2, 0, $I0
    is( $I2, 0, 'lcm_test' )

    lcm $I2, $I1, 10
    is( $I2, 0, 'lcm_test' )

    lcm $I2, 0, 10
    is( $I2, 0, 'lcm_test' )

    set $I0, 0
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 0, 'lcm_test' )

    lcm $I2, 10, $I0
    is( $I2, 0, 'lcm_test' )

    lcm $I2, $I1, 0
    is( $I2, 0, 'lcm_test' )

    lcm $I2, 10, 0
    is( $I2, 0, 'lcm_test' )
.end

.sub gcd_test
    set $I0, 70
    set $I1, 42
    gcd $I2, $I1, $I0
    is( $I2, 14, 'gcd_test' )

    gcd $I2, 42, $I0
    is( $I2, 14, 'gcd_test' )

    gcd $I2, $I1, 70
    is( $I2, 14, 'gcd_test' )

    gcd $I2, 42, 70
    is( $I2, 14, 'gcd_test' )

    set $I0, 66
    gcd $I2, $I1, $I0
    is( $I2, 6, 'gcd_test' )

    gcd $I2, 42, $I0
    is( $I2, 6, 'gcd_test' )

    gcd $I2, $I1, 66
    is( $I2, 6, 'gcd_test' )

    gcd $I2, 42, 66
    is( $I2, 6, 'gcd_test' )

    set $I0, 70
    set $I1, 1
    gcd $I2, $I1, $I0
    is( $I2, 1, 'gcd_test' )

    gcd $I2, 1, $I0
    is( $I2, 1, 'gcd_test' )

    gcd $I2, $I1, 70
    is( $I2, 1, 'gcd_test' )

    gcd $I2, 1, 70
    is( $I2, 1, 'gcd_test' )

    set $I0, 70
    set $I1, 3
    gcd $I2, $I1, $I0
    is( $I2, 1, 'gcd_test' )

    gcd $I2, 3, $I0
    is( $I2, 1, 'gcd_test' )

    gcd $I2, $I1, 70
    is( $I2, 1, 'gcd_test' )

    gcd $I2, 3, 70
    is( $I2, 1, 'gcd_test' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
