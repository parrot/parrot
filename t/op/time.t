#!parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/time.t - Time and Sleep

=cut

.sub main :main
    .include 'test_more.pir'

    plan(29)
    test_time_i()
    test_time_n()
    test_sleep_i()
    test_sleep_i_negative()
    test_sleep_n()
    test_sleep_n_negative()
    test_tm_pasm()
    test_gmtime_s_i()
    test_time_n_vs_time_i()
    test_decodetime_p_i()
    test_localtime_s_i()
    test_decodelocaltime_p_i()
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

.sub test_gmtime_s_i
    $S0 = gmtime 0
    $I0 = isnull $S0
    is($I0, 0, "gmtime string is not null")
    is($S0, "Thu Jan  1 00:00:00 1970\n", "correct epoch")
    $I1 = length $S0
    is($I1, 25, "string is the correct length")
.end

.sub test_time_n_vs_time_i
    .local int time_int
    time_int = time

    .local num time_float
    time_float = time

    # check if time_float is within [time_int - 5;time_int + 5]
    .local int time_int_lower
    time_int_lower = time_int - 5
    if time_float < time_int_lower goto FAIL
    .local int time_int_upper
    time_int_upper = time_int + 5
    if time_float > time_int_upper goto FAIL

    ok(1, "time_n value corresponds to time_i value")
    .return()

  FAIL:
    ok(0, "time_n value does not correspond to time_t value")
    .return()
.end

.sub test_decodetime_p_i
    $P0 = decodetime 0
    $I0 = $P0
    is($I0, 9, "decodetime result has 9 values")
    $S0 = typeof $P0
    # TODO: Actually, this should return whatever HLL type replaces
    # FixedIntegerArray. We should test this behavior with a new HLL
    is($S0, "FixedIntegerArray", "decodetime returns the correct PMC type")
.end

.sub test_localtime_s_i
    $S0 = localtime 0
    $I0 = isnull $S0
    is($I0, 0, "localtime string is not a null string")
    $I0 = length $S0
    is($I0, 25, "localtime string is the correct length")
.end

.sub test_decodelocaltime_p_i
    $P0 = decodelocaltime 0
    $I0 = $P0
    is($I0, 9, "decodelocaltime result has 9 values")
    $S0 = typeof $P0
    # TODO: Actually, this should return whatever HLL type replaces
    # FixedIntegerArray. We should test this behavior with a new HLL
    is($S0, "FixedIntegerArray", "decodelocaltime returns the correct PMC type")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
