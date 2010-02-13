#!parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/trans.t - Bitwise Ops

=head1 SYNOPSIS

        % prove t/op/trans.t

=head1 DESCRIPTION

Tests various transcendental operations

=cut

.sub main :main
    .include 'test_more.pir'

    plan(16)

    test_sin_n()
    test_sin_i()
    test_cos_n()
    test_cos_i()
    test_tan_n()
    test_tan_i()
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
    .local num epsilon
    epsilon = _epsilon()

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
    .local num epsilon
    epsilon = _epsilon()

    $N0 = sin 0
    is($N0, 0.0, "sin(0)", epsilon)

    $N0 = sin 1
    is($N0, 0.841471, "sin(1)", epsilon)
.end

.sub test_cos_n
    .local num epsilon
    epsilon = _epsilon()

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
    .local num epsilon
    epsilon = _epsilon()

    $N0 = cos 0
    is($N0, 1.0, "cos(0)", epsilon)

    $N0 = cos 1
    is($N0, 0.540302, "cos(1)", epsilon)
.end

.sub test_tan_n
    .local num epsilon
    epsilon = _epsilon()

    $N0 = tan 0.0
    is($N0, 0.0, "tan(0.0)", epsilon)

    $N0 = tan 1.0
    is($N0, 1.557408, "tan(1.0)", epsilon)
.end

.sub test_tan_i
    .local num epsilon
    epsilon = _epsilon()

    $N0 = tan 0
    is($N0, 0.0, "tan(0)", epsilon)

    $N0 = tan 1
    is($N0, 1.557408, "tan(1)", epsilon)
.end

