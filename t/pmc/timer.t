#! parrot
# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

t/pmc/timer.t - Timer PMC tests

=head1 SYNOPSIS

    % prove t/pmc/timer.t

=head1 DESCRIPTION

Tests the Timer PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    .include "timer.pasm"
    plan(5)
    timer_setup()
    timer_initialize()
.end

.sub timer_setup
    new $P0, ['Timer']
    set $P0[.PARROT_TIMER_SEC], 7
    set $I0, $P0[.PARROT_TIMER_SEC]
    $I1 = iseq $I0, 7
    ok($I1,'PARROT_TIMER_SEC')

    set $I2, $P0[.PARROT_TIMER_USEC]
    $I3 = iseq $I2, 0
    ok($I3,'PARROT_TIMER_USEC')

    set $I0, $P0[.PARROT_TIMER_RUNNING]
    $I1 = eq $I0, 0
    ok($I1,'PARROT_TIMER_RUNNING')
.end

.sub timer_initialize
    new $P1, ['FixedPMCArray']
    set $P1, 4
    set $P1[0], .PARROT_TIMER_SEC
    set $P1[1], 8
    set $P1[2], .PARROT_TIMER_USEC
    set $P1[3], 400000

    new $P0, ['Timer'], $P1
    set $I0, $P0[.PARROT_TIMER_SEC]

    $I1 = iseq $I0, 8
    ok($I1,'PARROT_TIMER_SEC')

    set $I0, $P0[.PARROT_TIMER_USEC]

    # I0 should be one of the following three
    $I1 = iseq $I0, 400000
    $I2 = iseq $I0, 400001
    $I3 = iseq $I0, 399999

    $I4 = $I1 + $I2
    $I4 += $I3
    # so we assert the sum of the above registers is 1
    is($I4,1,'PARROT_TIMER_USEC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
