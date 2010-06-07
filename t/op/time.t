#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/time.t - Time and Sleep

=cut

.sub main :main
    .include 'test_more.pir'

    plan(19)
    test_time_i()
    test_time_n()
    test_sleep_i()
    test_sleep_i_negative()
    test_sleep_n()
    test_sleep_n_negative()
    test_tm_pasm()
.end

.sub test_time_i
    $I0 = time
    $I2 = isge $I0, 0
    ok($I2, "Current int time is greater than 0")

    $I1 = time
    $I2 = isge $I1, $I2
    ok($I2, "Current int time is greater than older time")
.end

.sub test_time_n
    $N0 = time
    $I0 = isge $N0, 0.0
    ok($I0, "Current num time is greater than 0.0")

    $N1 = time
    $I0 = isge $N1, $N0
    ok($I0, "Current num time is greater than older time")
.end

.sub test_sleep_i
    $I0 = time
    sleep 1
    $I1 = time
    $I2 = isgt $I1, $I0
    ok($I2, "sleep_i increases time")
    $I2 = $I0 + 1
    $I3 = isge $I1, $I2
    ok($I3, "sleep_i slept for at least the amount of time specified")
.end

.sub test_sleep_i_negative
    push_eh cannot_sleep_negative
    sleep -1
    pop_eh
    ok(0, "Guess what? Just time traveled")
    .return()
  cannot_sleep_negative:
    pop_eh
    ok(1, "Cannot sleep_i backwards")
.end

.sub test_sleep_n
    $N0 = time
    sleep 1.1
    $N1 = time
    $I2 = isgt $N1, $N0
    ok($I2, "sleep_n increases time")
    $N2 = $N0 + 1.0
    $I2 = isge $N1, $N2
    ok($I2, "sleep_n slept for at least the integer amount of time specified")
.end

.sub test_sleep_n_negative
    push_eh cannot_sleep_negative
    sleep -1.2
    pop_eh
    ok(0, "Guess what? Just time traveled")
    .return()
  cannot_sleep_negative:
    pop_eh
    ok(1, "Cannot sleep_n backwards")
.end

.sub test_tm_pasm
    .include "tm.pasm"
    is(.TM_SEC, 0, "TM_SEC ok")
    is(.TM_MIN, 1, "TM_MIN ok")
    is(.TM_HOUR, 2, "TM_HOUR ok")
    is(.TM_MDAY, 3, "TM_MDAY ok")
    is(.TM_MON, 4, "TM_MON ok")
    is(.TM_YEAR, 5, "TM_YEAR ok")
    is(.TM_WDAY, 6, "TM_WDAY ok")
    is(.TM_YDAY, 7, "TM_YDAY ok")
    is(.TM_ISDST, 8, "TM_ISDST ok")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
