#!parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/trans.t - Trancendental Mathematical Ops

=head1 SYNOPSIS

        % prove t/op/trans.t

=head1 DESCRIPTION

Tests various transcendental operations

=cut

.sub main :main
    .include 'test_more.pir'
    .local num epsilon
    epsilon = _epsilon()

    plan(28)

    test_sin_n(epsilon)
    test_sin_i(epsilon)
    test_cos_n(epsilon)
    test_cos_i(epsilon)
    test_tan_n(epsilon)
    test_tan_i(epsilon)
    test_sec_n(epsilon)
    test_sec_i(epsilon)
    test_atan_n(epsilon)
    test_atan_i(epsilon)
    test_asin_n(epsilon)
    test_asin_i(epsilon)
    test_acos_n(epsilon)
    test_acos_i(epsilon)
    test_asec_n(epsilon)
    test_asec_i(epsilon)
    test_cosh_n(epsilon)
    test_cosh_i(epsilon)
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

.sub test_sec_n
    .param num epsilon

    $N1 = 1.0
    $N2 = sec $N1
    is($N2, 1.850816, "sec(1.0)", epsilon)
.end

.sub test_sec_i
    .param num epsilon

    $I1 = 1
    $N1 = sec $I1
    is($N1, 1.850816, "sec(1)", epsilon)
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
.end

.sub test_asec_i
    .param num epsilon

    $I1 = 1
    $N1 = asec $I1
    is($N1, 0.0, "asec(1)", epsilon)
.end

.sub test_cosh_n
    .param num epsilon
    .local num result

    $N1 = 1.0
    $N2 = cosh $N1
    is($N2, 1.543081, "cosh(1.0)", epsilon)
.end

.sub test_cosh_i
    .param num epsilon

    $I1 = 1
    $N1 = cosh $I1
    is($N1, 1.543081, "cosh(1)", epsilon)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

