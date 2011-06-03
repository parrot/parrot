#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.

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
    plan(79)
    loadlib $P1, 'rational'
    test_init()
    test_destroy()
    test_version()
    test_set_get_native_int()
    test_set_get_native_float()
    test_set_get_native_string()

    test_set_get_int()
    test_set_get_float()
    test_set_get_string()
    test_set_get_string_keyed()

    test_get_bool()

    test_inc_dec()

    test_add_int_inplace()
    test_add_float_inplace()

    test_add_int_pmc_inplace()
    test_add_float_pmc_inplace()
    test_add_rats_inplace()

    test_subtract_int()
    test_subtract_float()
    test_subtract_int_pmc()
    test_subtract_float_pmc()
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

    test_defaults()

    test_neg()
    test_abs()
    test_cmp()
    test_equal()
    test_equal_int()
    .return()

 no_gmp:
    skip_all('GMP not found, skipping Rational tests')
    .return()
.end

.sub test_neg
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "-3/2"
    $P3 = -$P2
    neg $P2

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

.sub test_equal
    new $P2, 'Rational'
    new $P3, 'Integer'
    $P2 = "2/1"
    $P3 = 2
    is($P2, $P3, '== on Rational and Integer PMC')

    throws_substring(<<"CODE", "epsilon", "== on Rational and Float PMC throws exception")
    .sub main
        $P0 = new ['Rational']
        $P1 = new ['Float']
        $P0 = "2/1"
        $P1 = 2.
        if $P0 == $P1 goto fail
    fail:
        ok(0, '== on Rational and Float PMC')
    .end
CODE

    throws_substring(<<"CODE", "is_equal not implemented (yet).", "== on Rational and String PMC throws exception")
    .sub main
        $P0 = new ['Rational']
        $P1 = new ['String']
        $P0 = "2/1"
        $P1 = "foo"
        if $P0 == $P1 goto fail
    fail:
        ok(0, '== on Rational and String PMC')
    .end
CODE
.end

.sub test_equal_int
    $P0 = new ['Rational']
    $P0 = "2/1"

    eq $P0, 2, success
  success:
    ok(1, 'is_equal on Rational and integer')
.end

.sub test_cmp
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "6/4"

    is($P2, $P3,'== on Rational PMC')

    $P3 = "7/4"
    cmp $I1, $P2, $P3
    cmp $I2, $P3, $P2
    is($I1,-1,'cmp on Rational PMC')
    is($I2,1,'cmp on Rational PMC')

    $P4 = new ['Integer']
    $P4 = -1
    cmp $I1, $P2, $P4
    is($I1, 1, 'cmp with Integer')

    $P4 = 100
    cmp $I1, $P2, $P4
    is($I1, -1, 'cmp with Integer')

    $P4 = new ['Float']
    $P4 = -1.0
    push_eh eh1
    cmp $I1, $P2, $P4
    is($I1, -1, 'cmp with Float')
    goto finally1
eh1:
    todo(0, "cmp with Float not implemented")
finally1:
    pop_eh

    $P4 = 100.0
    push_eh eh2
    cmp $I1, $P2, $P4
    is($I1, 1, 'cmp with Float')
    goto finally2
eh2:
    todo(0, "cmp with Float not implemented")
finally2:
    pop_eh

    throws_substring(<<"CODE", "cmp not implemented (yet).", "cmp with default")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1"

        $P1 = new ['String']
        $P1 = 'foo'
        cmp $I1, $P0, $P1
    .end
CODE
.end

.sub test_divide_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 / $I1
    div $P1, $I1
    is($P1,'3/14','divide int inplace')
    is($P2,'3/14','divide int')
.end

.sub test_divide_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 / $N1
    div $P1, $N1
    is($P1,'3/14','divide float inplace')
    is($P2,'3/14','divide float')

.end

.sub test_divide_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 / $P4
    div $P2, $P4
    is($P2,'3/14','divide Integer PMC inplace')
    is($P3,'3/14','divide Integer PMC')
.end

.sub test_divide_float_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 / $P4
    div $P2, $P4
    is($P2,'3/14','divide Float PMC inplace')
    is($P3,'3/14','divide Float PMC')
.end

.sub test_divide_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 / $P3
    div $P2, $P3
    is($P1,'3/5','divide Rational PMC')
    is($P2,'3/5','divide Rational PMC inplace')
.end

.sub test_multiply_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 * $I1
    mul $P1, $I1
    is($P1,'21/2','multiply int inplace')
    is($P2,'21/2','multiply int')
.end

.sub test_multiply_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 * $N1
    mul $P1, $N1
    is($P1,'21/2','multiply float inplace')
    is($P2,'21/2','multiply float')
.end

.sub test_multiply_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 * $P4
    mul $P2, $P4
    is($P2,'21/2','multiply Integer PMC inplace')
    is($P3,'21/2','multiply Integer PMC')
.end

.sub test_multiply_float_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 * $P4
    mul $P2, $P4
    is($P2,'21/2','multiply Float PMC inplace')
    is($P3,'21/2','multiply Float PMC')

.end

.sub test_multiply_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 * $P3
    mul $P2, $P3
    is($P1,'15/4','multiply Rational PMC')
    is($P2,'15/4','multiply Rational PMC inplace')
.end

.sub test_subtract_rats
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 - $P3
    sub $P2, $P3
    is($P1,-1,'subtract Rational')
    is($P2,-1,'subtract Rational inplace')

.end

.sub test_subtract_int
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 - $I1
    sub $P1, $I1
    sub $P1, $I1
    is($P1,'-25/2','subtract int inplace')
    is($P2,'-11/2','subtract int')
.end

.sub test_subtract_float
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 - $N1
    sub $P1, $N1
    sub $P1, $N1
    is($P1,'-25/2','subtract float inplace')
    is($P2,'-11/2','subtract float')
.end

.sub test_subtract_float_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 - $P4
    sub $P2, $P4
    is($P2,'-11/2','subtract Float PMC inplace')
    is($P3,'-11/2','subtract Float PMC')
.end

.sub test_subtract_int_pmc
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 - $P4
    sub $P2, $P4
    is($P2,'-11/2','subtract Integer PMC inplace')
    is($P3,'-11/2','subtract Integer PMC')
.end

.sub test_add_rats_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 + $P3
    add $P2, $P3
    is($P1,4,'adding rationals')
    is($P2,4,'adding rationals inplace')
.end

.sub test_add_int_pmc_inplace
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 + $P4
    add $P2, $P4
    is($P2,'17/2','add Integer PMCs inplace')
    is($P3,'17/2','add Integer PMCs')
.end

.sub test_add_float_pmc_inplace
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 + $P4
    add $P2, $P4
    is($P2,'17/2','add Float PMCs inplace')
    is($P3,'17/2','add Float PMCs')
.end

.sub test_add_int_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 + $I1
    add $P1, $I1
    add $P1, $I1
    is($P1,'31/2','add integers inplace')
    is($P2,'17/2','add integers')
.end

.sub test_add_float_inplace
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 + $N1
    add $P1, $N1
    add $P1, $N1
    is($P1,'31/2','add floats inplace')
    is($P2,'17/2','add floats')
.end

.sub test_defaults
    throws_substring(<<"CODE", "Rational, add: Not implemented (yet).", "add string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        $P2 = $P0 + $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, subtract: Not implemented (yet).", "sub string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        $P2 = $P0 - $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, multiply: Not implemented (yet).", "mul string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        $P2 = $P0 * $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, divide: Not implemented (yet).", "div string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        $P2 = $P0 / $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, i_add: Not implemented (yet).", "i_add string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        add $P0, $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, i_subtract: Not implemented (yet).", "i_sub string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        sub $P0, $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, i_multiply: Not implemented (yet).", "i_mul string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        mul $P0, $P1
    .end
CODE
    throws_substring(<<"CODE", "Rational, i_divide: Not implemented (yet).", "i_div string")
    .sub main
        $P0 = new ['Rational']
        $P0 = "1/2"
        $P1 = new ['String']
        $P1 = "foo"

        div $P0, $P1
    .end
CODE
.end

.sub test_init
    new $P1, 'Rational'
    is($P1, 0, 'initialization')
.end

.sub test_destroy
    new $P1, 'Rational'
    null $P1
    sweep 1
    ok(1, 'destroy')
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

    throws_substring(<<"CODE", "Number is too big", "int too long overflows")
    .sub main
        $P0 = new ['Rational']
        $P0 = "10000000000000000000"
        $I0 = $P0
    .end
CODE
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

.sub test_set_get_string_keyed
    new $P1, 'Rational'

    $S1 = "a/b"
    $P1[16] = $S1
    $S2 = $P1[8]

    is($S2, '12/13', 'set and get string keyed')
.end

.sub test_get_bool
    new $P0, 'Rational'
    $P0 = "0"
    $I0 = isfalse $P0
    ok($I0, '0 should be false')
    $P0 = "3/4"
    $I0 = istrue $P0
    ok($I0, '3/4 should be true')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
