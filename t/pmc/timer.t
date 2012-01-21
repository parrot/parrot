#! parrot
# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

t/pmc/timer.t - Timer PMC tests

=head1 SYNOPSIS

    % prove t/pmc/timer.t

=head1 DESCRIPTION

Tests the Timer PMC.

=cut

.sub tick
    get_global $P0, 'counter'
    inc $P0
.end

.sub main :main
    .include 'test_more.pir'
    .include "timer.pasm"
    plan(17)
    timer_setup()
    timer_initialize()
    timer_start_stop()
    timer_repeat()
    timer_start()
    timer_stop()
.end

.sub timer_stop
    .local pmc timer
    .local int t1, t2, r
    .const 'Sub' tick = 'tick'
    $P0 = new 'Integer'
    set_global 'counter', $P0
    timer = new ['Timer']
    timer[.PARROT_TIMER_HANDLER] = tick
    timer[.PARROT_TIMER_INTERVAL] = 0.1
    timer[.PARROT_TIMER_REPEAT] = -1
    timer[.PARROT_TIMER_RUNNING] = 1
    # Allow at least two ticks
    sleep 0.2
    sleep 0.2
    timer[.PARROT_TIMER_RUNNING] = 0
    # Give a chance to run a possible pending tick
    sleep 0.2
    get_global $P0, 'counter'
    t1 = $P0
    r = isgt t1, 1
    is(r,1,'counter = 1')
    # Give a chance to tick to verify that is stopped
    sleep 0.2
    sleep 0.2
    get_global $P0, 'counter'
    t2 = $P0
    r = iseq t1, t2
    is(r,1,'counter = 1')
.end

.sub timer_start
    new $P1, ['FixedPMCArray']
    set $P1, 6
    set $P1[0], .PARROT_TIMER_NSEC
    set $P1[1], 0.5
    set $P1[2], .PARROT_TIMER_HANDLER
    get_global $P2, "_timer_sub2"
    set $P1[3], $P2
    set $P1[4], .PARROT_TIMER_RUNNING
    set $P1[5], 1

    new $P0, ['Timer'], $P1
    ok(1,'timer start')
    sleep 1
    ok(1,'timer start')
.end

.sub timer_repeat
    new $P1, ['FixedPMCArray']
    set $P1, 8
    set $P1[0], .PARROT_TIMER_NSEC
    set $P1[1], 0.2
    set $P1[2], .PARROT_TIMER_HANDLER
    get_global $P2, "_timer_sub2"
    set $P1[3], $P2
    set $P1[4], .PARROT_TIMER_REPEAT
    set $P1[5], 2
    set $P1[6], .PARROT_TIMER_RUNNING
    set $P1[7], 1

    new $P0, ['Timer'], $P1
    ok(1,'repeat 1')
    sleep 1
    sleep 1
    sleep 1
    sleep 1
    ok(1,'repeat 3')
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

.sub timer_start_stop
    $P1 = new ['FixedPMCArray'], 6
    set $P1[0], .PARROT_TIMER_NSEC
    set $P1[1], 0.5
    set $P1[2], .PARROT_TIMER_HANDLER
    get_global $P2, "_timer_sub"
    set $P1[3], $P2
    set $P1[4], .PARROT_TIMER_RUNNING
    set $P1[5], 1

    $P0 = new ['Timer'], $P1
    ok(1,'created Timer PMC')

    set $P0[.PARROT_TIMER_RUNNING], 0
    sleep 1
    ok(1,'slept after stopping timer')
.end

.sub _timer_sub
    print "never\n"
    returncc
.end

.sub _timer_sub2
    ok(1,'timer_sub2')
    returncc
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
