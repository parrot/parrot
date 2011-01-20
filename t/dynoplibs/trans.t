#!./parrot
# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/op/trans.t - Trancendental Mathematical Ops

=head1 SYNOPSIS

        % prove t/op/trans.t

=head1 DESCRIPTION

Tests various transcendental operations

=cut

.loadlib 'trans_ops'

.sub main :main
    .include 'test_more.pir'
    .local num epsilon
    epsilon = _epsilon()

    plan(111)

    test_sin_n(epsilon)
    test_sin_i(epsilon)
    test_cos_n(epsilon)
    test_cos_i(epsilon)
    test_tan_n(epsilon)
    test_tan_i(epsilon)
    test_cot_n(epsilon)
    test_cot_i(epsilon)
    test_sec_n(epsilon)
    test_sec_i(epsilon)
    test_csc_n(epsilon)
    test_csc_i(epsilon)
    test_atan_n(epsilon)
    test_atan_i(epsilon)
    test_asin_n(epsilon)
    test_asin_i(epsilon)
    test_acos_n(epsilon)
    test_acos_i(epsilon)
    test_asec_n(epsilon)
    test_asec_i(epsilon)
    test_sinh_n(epsilon)
    test_sinh_i(epsilon)
    test_cosh_n(epsilon)
    test_cosh_i(epsilon)
    test_sech_n(epsilon)
    test_sech_i(epsilon)
    test_tanh_n(epsilon)
    test_tanh_i(epsilon)
    test_exp_n(epsilon)
    test_ln_n(epsilon)
    test_log2_n(epsilon)
    test_log10_n(epsilon)
    test_pow_p_p_p()
    test_pow_p_p_i()
    test_pow_p_p_n()
    test_pow_n_nc_i(epsilon)
    integer_overflow_with_pow()
    e_raised_pi_time_i__plus_1_equal_0()
.end

.sub _pi
    .return (3.1415926535897)
.end

.sub _e
    .return (2.7182818459045)
.end

.sub _epsilon
    .return (0.0001)
.end

.sub test_sin_n
    .param num epsilon

    $N0 = sin 0.0
    is($N0, 0.0, "sin(0.0)", epsilon)

    $N0 = sin 1.0
    is($N0, 0.841471, "sin(1.0)", epsilon)

    $N1 = _pi()
    $N0 = sin $N1
    is($N0, 0.0, "sin(pi)", epsilon)

    $N1 = _pi()
    $N1 = $N1 / 2
    $N0 = sin $N1
    is($N0, 1.0, "sin(pi/2)", epsilon)
.end

.sub test_sin_i
    .param num epsilon

    $N0 = sin 0
    is($N0, 0.0, "sin(0)", epsilon)

    $N0 = sin 1
    is($N0, 0.841471, "sin(1)", epsilon)
.end

.sub test_cos_n
    .param num epsilon

    $N0 = cos 0.0
    is($N0, 1.0, "cos(0.0)", epsilon)

    $N0 = cos 1.0
    is($N0, 0.540302, "cos(1.0)", epsilon)

    $N1 = _pi()
    $N0 = cos $N1
    is($N0, -1.0, "cos(pi)", epsilon)

    $N1 = _pi()
    $N1 = $N1 / 2
    $N0 = cos $N1
    is($N0, 0.0, "cos(pi/2)", epsilon)
.end

.sub test_cos_i
    .param num epsilon

    $N0 = cos 0
    is($N0, 1.0, "cos(0)", epsilon)

    $N0 = cos 1
    is($N0, 0.540302, "cos(1)", epsilon)
.end

.sub test_tan_n
    .param num epsilon

    $N0 = tan 0.0
    is($N0, 0.0, "tan(0.0)", epsilon)

    $N0 = tan 1.0
    is($N0, 1.557408, "tan(1.0)", epsilon)
.end

.sub test_tan_i
    .param num epsilon

    $N0 = tan 0
    is($N0, 0.0, "tan(0)", epsilon)

    $N0 = tan 1
    is($N0, 1.557408, "tan(1)", epsilon)
.end

.sub test_cot_n
    .param num epsilon

    $N0 = cot 0.5
    is($N0,  1.8305, "cot(0.5)", epsilon)

    $N0 = cot 1.0
    is($N0,  0.64209, "cot(1.0)", epsilon)
.end

.sub test_cot_i
    .param num epsilon

    $N0 = cot 1
    is($N0, 0.64209, "cot(1)", epsilon)

    $N0 = cot 2
    is($N0,  -0.45766, "cot(2)", epsilon)
.end

.sub test_sec_n
    .param num epsilon

    $N1 = 1.0
    $N2 = sec $N1
    is($N2, 1.850816, "sec(1.0)", epsilon)

    $N2 = sec 1.0
    is($N2, 1.850816, "sec(1.0)", epsilon)
.end

.sub test_sec_i
    .param num epsilon

    $I1 = 1
    $N1 = sec $I1
    is($N1, 1.850816, "sec(1)", epsilon)
.end

.sub test_csc_n
    .param num epsilon

    $N0 = csc 0.5
    is($N0,   2.0858, "csc(0.5)", epsilon)

    $N0 = csc 1.0
    is($N0,  1.1884, "csc(1.0)", epsilon)
.end

.sub test_csc_i
    .param num epsilon

    $N0 = csc 1
    is($N0, 1.1884, "csc(1)", epsilon)

    $N0 = csc 2
    is($N0,   1.0998, "csc(2)", epsilon)
.end

.sub test_atan_n
    .param num epsilon

    $N1 = 1.0
    $N2 = atan $N1
    is($N2, 0.785398, "atan(1.0)", epsilon)
.end

.sub test_atan_i
    .param num epsilon

    $I1 = 1
    $N1 = atan $I1
    is($N1, 0.785398, "atan(1)", epsilon)
.end

.sub test_asin_n
    .param num epsilon
    .local num pi2
    pi2 = _pi()
    pi2 /= 2

    $N1 = 1.0
    $N2 = asin $N1
    is($N2, pi2, "asin(1.0)", epsilon)

    $N2 = asin 1.0
    is($N2, pi2, "asin(1.0)", epsilon)
.end

.sub test_asin_i
    .param num epsilon
    .local num pi2
    pi2 = _pi()
    pi2 /= 2

    $I1 = 1
    $N1 = asin $I1
    is($N1, pi2, "asin(1)", epsilon)
.end

.sub test_acos_n
    .param num epsilon

    $N1 = 1.0
    $N2 = acos $N1
    is($N2, 0.0, "acos(1.0)", epsilon)

    $N2 = acos 1.0
    is($N2, 0.0, "acos(1.0)", epsilon)
.end

.sub test_acos_i
    .param num epsilon

    $I1 = 1
    $N1 = acos $I1
    is($N1, 0.0, "acos(1)", epsilon)
.end

.sub test_asec_n
    .param num epsilon

    $N1 = 1.0
    $N2 = asec $N1
    is($N2, 0.0, "asec(1.0)", epsilon)

    $N2 = asec 1.0
    is($N2, 0.0, "asec(1.0)", epsilon)
.end

.sub test_asec_i
    .param num epsilon

    $I1 = 1
    $N1 = asec $I1
    is($N1, 0.0, "asec(1)", epsilon)
.end

.sub test_sinh_n
    .param num epsilon
    .local num result

    $N1 = 1.0
    $N2 = sinh $N1
    is($N2, 1.175201, "sinh(1.0)", epsilon)

    $N2 = sinh 1.0
    is($N2, 1.175201, "sinh(1.0)", epsilon)
.end

.sub test_sinh_i
    .param num epsilon

    $I1 = 1
    $N1 = sinh $I1
    is($N1, 1.175201, "sinh(1)", epsilon)
.end

.sub test_cosh_n
    .param num epsilon
    .local num result

    $N1 = 1.0
    $N2 = cosh $N1
    is($N2, 1.543081, "cosh(1.0)", epsilon)

    $N2 = cosh 1.0
    is($N2, 1.543081, "cosh(1.0)", epsilon)
.end

.sub test_cosh_i
    .param num epsilon

    $I1 = 1
    $N1 = cosh $I1
    is($N1, 1.543081, "cosh(1)", epsilon)
.end

.sub test_sech_n
    .param num epsilon
    .local num result

    $N1 = 1.0
    $N2 = sech $N1
    is($N2, 0.648054, "sech(1.0)", epsilon)

    $N2 = sech 1.0
    is($N2, 0.648054, "sech(1.0)", epsilon)
.end

.sub test_sech_i
    .param num epsilon

    $I1 = 1
    $N1 = sech $I1
    is($N1, 0.648054, "sech(1)", epsilon)
.end

.sub test_tanh_n
    .param num epsilon
    .local num result

    $N1 = 1.0
    $N2 = tanh $N1
    is($N2, 0.761594, "tanh(1.0)", epsilon)

    $N2 = tanh 1.0
    is($N2, 0.761594, "tanh(1.0)", epsilon)
.end

.sub test_tanh_i
    .param num epsilon

    $I1 = 1
    $N1 = tanh $I1
    is($N1, 0.761594, "tanh(1)", epsilon)
.end

.sub test_exp_n
    .param num epsilon
    .local num result

    $N1 = 2.0
    $N2 = exp $N1
    is($N2, 7.389056, "exp(2.0)", epsilon)

    $N2 = exp 2.0
    is($N2, 7.389056, "exp(2.0)", epsilon)
.end

.sub test_ln_n
    .param num epsilon
    .local num result

    $N1 = 2.0
    $N2 = ln $N1
    is($N2, 0.693147, "ln(2.0)", epsilon)

    $N2 = ln 2.0
    is($N2, 0.693147, "ln(2.0)", epsilon)
.end

.sub test_log2_n
    .param num epsilon
    .local num result

    $N1 = 16.0
    $N2 = log2 $N1
    is($N2, 4.0, "ln(2.0)", epsilon)

    $N2 = log2 16.0
    is($N2, 4.0, "ln(2.0)", epsilon)
.end

.sub test_log10_n
    .param num epsilon
    .local num result

    $N1 = 100.0
    $N2 = log10 $N1
    is($N2, 2.0, "log10(100.0)", epsilon)

    $N2 = log10 100.0
    is($N2, 2.0, "log10(100.0)", epsilon)
.end

.sub test_pow_p_p_p
    $P1 = new ['Integer']
    $P1 = 2
    $P2 = new ['Integer']
    $P2 = 2
    null $P3
    $P3 = pow $P1, $P2
    is($P3, 4, "pow(2, 2) with null register")

    $P3 = pow $P1, $P2
    is($P3, 4, "pow(2, 2)")
.end

.sub test_pow_p_p_i
    $P1 = new ['Integer']
    $P1 = 2
    null $P2
    $P2 = pow $P1, 2
    is($P2, 4, "pow(2, const 2) with null register")

    $P2 = pow $P1, 2
    is($P2, 4, "pow(2, const 2)")

    $I1 = 2
    null $P2
    $P2 = pow $P1, $I1
    is($P2, 4, "pow(2, 2) with null register")

    $P2 = pow $P1, $I1
    is($P2, 4, "pow(2, 2)")
.end

.sub test_pow_p_p_n
    $P1 = new ['Integer']
    $P1 = 2
    null $P2
    $P2 = pow $P1, 2.0
    is($P2, 4, "pow(2, const 2.0) with null register")

    $P2 = pow $P1, 2.0
    is($P2, 4, "pow(2, const 2.0)")

    $N1 = 2.0
    null $P2
    $P2 = pow $P1, $N1
    is($P2, 4, "pow(2, 2.0) with null register")

    $P2 = pow $P1, $N1
    is($P2, 4, "pow(2, 2.0)")
.end

.sub test_pow_n_nc_i
   .param num epsilon

   $I1 = 2
   $N0 = pow 2.0, $I1
   is($N0, 4, "pow(2, 2)")

   $I1 = -2
   $N0 = pow 2.0, $I1
   is($N0, 0.25, "pow(2, -2)", epsilon)
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
    .local string gmp
    gmp = config['gmp']

    if intvalsize == 4 goto skipthem

    if gmp == 'define' goto can_test

    goto skipthem

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
    goto end

  skipthem:
    skip(40,'No integer overflow tests for 32-bit INTVALs')
  end:
.end

.macro sprintf_is(fmt, number, message)
    c = .number
    $S0 = sprintf .fmt, c
    $S1 = .message
    is( $S0, $S1, $S1 )
.endm

.sub e_raised_pi_time_i__plus_1_equal_0
    .local pmc c, c2, c3
    c  = new ['Complex']
    c2 = new ['Complex']
    c3 = new ['Complex']
    # e^(pi * i) + 1 = 0
    $N0 = atan 1
    $N0 *= 4
    c[0] = 0.0
    c[1] = $N0
    c2 = c.'exp'()
    c2 += 1.0
    .sprintf_is( "%.3f%+.3fi", c2, "0.000+0.000i" )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

