#! parrot
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/rational.t - Rational PMC

=head1 SYNOPSIS

    % prove t/dynpmc/rational.t

=head1 DESCRIPTION

Tests the Rational PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'
    .local pmc config_hash, interp

    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['gmp']

    unless $S0 goto no_gmp
    plan(55)
    goto gmp_tests

  no_gmp:
    # seems like plan(0) is not supported currently
    plan(1)
    ok(1,'GMP not found, skipping Rational tests')
    .return()

    # The following tests only run if GMP is installed
 gmp_tests:
    loadlib $P1, 'rational'
    test_init()
    test_version()
    test_set_get_native_int()
    test_set_get_native_float()
    test_set_get_native_string()

    test_set_get_int()
    test_set_get_float()
    test_set_get_string()

    test_inc_dec()
    test_add_int_inplace()
    test_add_float_inplace()

    test_add_int_pmc_inplace()
    test_add_float_pmc_inplace()
    test_add_rats_inplace()

    test_subtract_int()
    test_subtract_float()
    test_subtract_int_pmc()
    test_subtract_rats()

    test_multiply_int()
    test_multiply_float()
    test_multiply_int_pmc()
    test_multiply_float_pmc()
    test_multiply_rats()

    test_divide_int()
    test_divide_float()
    test_divide_int_pmc()
    test_divide_float_pmc()
    test_divide_rats()

    test_neg()
    test_abs()
    test_cmp()
    #test_equal_tt1517()
.end

.sub test_neg
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "-3/2"
    $P3 = -$P2
    $P2 = -$P2

    is($P2,'3/2','neg')
    is($P3,'3/2','neg')
.end

.sub test_abs
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "-3/2"
    $P3 = abs $P2
    abs $P2
    is($P2,'3/2','abs')
    is($P3,'3/2','abs')
.end

.sub test_equal_tt1517
    new $P2, 'Rational'
    new $P3, 'Integer'
    $P2 = "2/1"
    $P3 = 2
    if $P2 == $P3 goto pass
    ok(0,'== on Rational and Integer PMC')
    .return()
  pass:
    ok(1,'== on Rational and Integer PMC')
.end

.sub test_cmp
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "6/4"

    if $P2 == $P3 goto EQ
    goto NE
  EQ:
    ok(1,'== on Rational PMC')
    goto END_EQ
  NE:
    ok(0,'== on Rational PMC')
  END_EQ:

    $P3 = "7/4"
    cmp $I1, $P2, $P3
    cmp $I2, $P3, $P2
    is($I1,-1,'cmp on Rational PMC')
    is($I2,1,'cmp on Rational PMC')
.end

.sub test_divide_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 / $I1
    $P1 = $P1 / $I1
    is($P1,'3/14','divide int')
    is($P2,'3/14','divide int')
.end

.sub test_divide_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 / $N1
    $P1 = $P1 / $N1
    is($P1,'3/14','divide float')
    is($P2,'3/14','divide float')

.end

.sub test_divide_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 / $P4
    $P2 = $P2 / $P4
    is($P2,'3/14','divide Integer PMC')
    is($P3,'3/14','divide Integer PMC')
.end

.sub test_divide_float_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 / $P4
    $P2 = $P2 / $P4
    is($P2,'3/14','divide Float PMC')
    is($P3,'3/14','divide Float PMC')
.end

.sub test_divide_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 / $P3
    $P2 = $P2 / $P3
    is($P1,'3/5','divide Rational PMC')
    is($P2,'3/5','divide Rational PMC')
.end

.sub test_multiply_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 * $I1
    $P1 = $P1 * $I1
    is($P1,'21/2','multiply int')
    is($P2,'21/2','multiply int')
.end

.sub test_multiply_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 * $N1
    $P1 = $P1 * $N1
    is($P1,'21/2','multiply float')
    is($P2,'21/2','multiply float')
.end

.sub test_multiply_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 * $P4
    $P2 = $P2 * $P4
    is($P2,'21/2','multiply Integer PMC')
    is($P3,'21/2','multiply Integer PMC')
.end

.sub test_multiply_float_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 * $P4
    $P2 = $P2 * $P4
    is($P2,'21/2','multiply Float PMC')
    is($P3,'21/2','multiply Float PMC')

.end

.sub test_multiply_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 * $P3
    $P2 = $P2 * $P3
    is($P1,'15/4','multiply Rational PMC')
    is($P2,'15/4','multiply Rational PMC')
.end

.sub test_subtract_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 - $P3
    $P2 = $P2 - $P3
    is($P1,-1,'subtract Rational inplace')
    is($P2,-1,'subtract Rational inplace')

.end

.sub test_subtract_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 - $I1
    $P1 = $P1 - $I1
    $P1 = $P1 - $I1
    is($P1,'-25/2','subtract int inplace')
    is($P2,'-11/2','subtract int inplace')
.end

.sub test_subtract_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 - $N1
    $P1 = $P1 - $N1
    $P1 = $P1 - $N1
    is($P1,'-25/2','subtract float inplace')
    is($P2,'-11/2','subtract float inplace')
.end

.sub test_subtract_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 - $P4
    $P2 = $P2 - $P4
    is($P2,'-11/2','subtract Integer PMC inplace')
    is($P3,'-11/2','subtract Integer PMC inplace')
.end

.sub test_add_rats_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 + $P3
    $P2 = $P2 + $P3
    is($P1,4,'adding rationals inplace')
    is($P2,4,'adding rationals inplace')
.end

.sub test_add_int_pmc_inplace
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 + $P4
    $P2 = $P2 + $P4
    is($P2,'17/2','add Integer PMCs inplace')
    is($P3,'17/2','add Integer PMCs inplace')
.end

.sub test_add_float_pmc_inplace
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 + $P4
    $P2 = $P2 + $P4
    is($P2,'17/2','add Float PMCs inplace')
    is($P3,'17/2','add Float PMCs inplace')
.end

.sub test_add_int_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 + $I1
    $P1 = $P1 + $I1
    $P1 = $P1 + $I1
    is($P1,'31/2','add integers inplace')
    is($P2,'17/2','add integers inplace')
.end

.sub test_add_float_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 + $N1
    $P1 = $P1 + $N1
    $P1 = $P1 + $N1
    is($P1,'31/2','add floats inplace')
    is($P2,'17/2','add floats inplace')
.end


.sub test_init
    new $P1, 'Rational'
    ok($P1,'initialization')
.end

.sub test_version
    new $P1, 'Rational'
    $S1 = $P1.'version'()
    ok($S1,'can get version number')
.end

.sub test_set_get_native_int
    new $P1, 'Rational'

    $I1 = 42
    $P1 = $I1
    $I2 = $P1
    is($I2,42,'set and get native int')
.end

.sub test_set_get_int
    new $P1, 'Rational'
    new $P2, 'Integer'
    new $P3, 'Integer'

    $P2 = 7
    $P1 = $P2
    $P3 = $P1
    is($P3,7,'set and get int')
.end

.sub test_set_get_float
    new $P1, 'Rational'

    new $P2, 'Float'
    new $P3, 'Float'

    $P2 = 7.110000
    $P1 = $P2
    $P3 = $P1
    is($P3,7.11,'set and set float',0.0001)
.end

.sub test_inc_dec
    new $P1, 'Rational'

    $P1 = "7/4"
    inc $P1
    is($P1,'11/4','increment a rational')
    dec $P1
    dec $P1
    is($P1,'3/4','decrement a rational')
.end

.sub test_set_get_string
    new $P1, 'Rational'
    new $P2, 'String'
    new $P3, 'String'

    $P2 = "7/4"
    $P1 = $P2
    $P3 = $P1
    is($P3,"7/4",'set and get string')
.end

.sub test_set_get_native_float
    new $P0, 'Rational'

    $N0 = 11.1
    $P0 = $N0
    $N1 = $P0
    is($N1,11.1,'set and get a native float')
.end

.sub test_set_get_native_string
    new $P1, 'Rational'

    $S1 = "7/4"
    $P1 = $S1
    $S2 = $P1
    is($S2,'7/4','set and get native string')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
