#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/obscure.t - Tests for obscure mathematical functions

=head1 SYNOPSIS

        % prove t/dynoblibs/obscure.t

=head1 DESCRIPTION

Tests obscure.ops

=cut

.loadlib 'obscure_ops'
.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'
    plan(42)
    ok(1,"load obscure_ops")

    test_covers()
    test_vers()
    test_hav()
    test_exsec()

    lcm_test()
    gcd_test()
    test_fact()
    test_fact_n_i()
    test_fact_n_ic()
.end

.sub test_covers
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    covers x, 0
    .fp_eq_ok(x, 1, "covers of 0")
    covers x, halfpi
    .fp_eq_ok(x, 0, 'covers of pi/2')
    covers x, pi
    .fp_eq_ok(x, 1, 'covers of pi')
    covers x, y
    .fp_eq_ok(x, 0.292893218813453, 'covers of pi/4')
.end

.sub test_vers
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    vers x, 0
    .fp_eq_ok(x, 0, "vers of 0")
    vers x, halfpi
    .fp_eq_ok(x, 1, 'vers of pi/2')
    vers x, pi
    .fp_eq_ok(x, 2, 'vers of pi')
    vers x, y
    .fp_eq_ok(x, 0.292893218813453, 'covers of pi/4')
.end

.sub test_hav
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    hav x, 0
    .fp_eq_ok(x, 0, "hav of 0")
    hav x, halfpi
    .fp_eq_ok(x, 0.5, 'hav of pi/2')
    hav x, pi
    .fp_eq_ok(x, 1, 'hav of pi')
    hav x, y
    .fp_eq_ok(x, 0.146446609406726, 'hav of pi/4')
.end

.sub test_exsec
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    hav x, 0
    .fp_eq_ok(x, 0, "exsec of 0")
    exsec x, halfpi
    .fp_eq_ok(x, 'nan', 'exsec of pi/2')
    exsec x, pi
    .fp_eq_ok(x, -2, 'exsec of pi')
    exsec x, y
    .fp_eq_ok(x, 0.414213562373095, 'exsec of pi/4')
.end

.sub lcm_test
    set $I0, 10
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 10, 'lcm_test' )

    set $I1, 17
    lcm $I2, $I1, $I0
    is( $I2, 170, 'lcm_test' )

    set $I0, 17
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 170, 'lcm_test' )

    set $I0, 10
    set $I1, 0
    lcm $I2, $I1, $I0
    is( $I2, 0, 'lcm_test' )

    set $I0, 0
    set $I1, 10
    lcm $I2, $I1, $I0
    is( $I2, 0, 'lcm_test' )
.end

.sub gcd_test
    set $I0, 70
    set $I1, 42
    gcd $I2, $I1, $I0
    is( $I2, 14, 'gcd_test' )

    set $I0, 66
    gcd $I2, $I1, $I0
    is( $I2, 6, 'gcd_test' )

    set $I0, 70
    set $I1, 1
    gcd $I2, $I1, $I0
    is( $I2, 1, 'gcd_test' )

    set $I0, 70
    set $I1, 3
    gcd $I2, $I1, $I0
    is( $I2, 1, 'gcd_test' )
.end

.sub 'test_fact'
    $I0 = 3
    $I1 = 11
    $I2 = 0
    $I3 = -563

    $I5 = fact $I0
    is($I5, 6, 'fact_i_i - first')

    $I6 = fact $I1
    is($I6, 39916800, 'fact_i_i - second')

    $I7 = fact $I2
    is($I7, 1, 'fact_i_i on zero')

    $I8 = fact $I3
    is($I8, 1, 'fact_i_i on a negative integer')

    # Now run the same tests, with constants instead
    $I5 = fact 3
    is($I5, 6, 'fact_i_ic - first')

    $I6 = fact 11
    is($I6, 39916800, 'fact_i_ic - second')

    $I7 = fact 0
    is($I7, 1, 'fact_i_ic on zero')

    $I8 = fact -563
    is($I8, 1, 'fact_i_ic on a negative integer')
.end

.sub test_fact_n_i
    set $I0, 3
    set $I1, 11
    set $I2, 0
    set $I3, -563
    fact $N5, $I0
    is( $N5, "6", 'fact_n_i' )
    fact $N6, $I1
    is( $N6, "39916800", 'fact_n_i' )
    fact $N7, $I2
    is( $N7, "1", 'fact_n_i' )
    fact $N8, $I3
    is( $N8, "1", 'fact_n_i' )
.end

.sub test_fact_n_ic
    fact $N5, 3
    is( $N5, "6", 'fact_n_ic' )
    fact $N6, 11
    is( $N6, "39916800", 'fact_n_ic' )
    fact $N7, 0
    is( $N7, "1", 'fact_n_ic' )
    fact $N8, -563
    is( $N8, "1", 'fact_n_ic' )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
