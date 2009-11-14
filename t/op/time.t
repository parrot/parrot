#!./parrot

.sub main :main
    .include 'test_more.pir'

    plan(9)
    test_time_i()
    test_time_n()
    test_sleep_i()
    test_sleep_i_negative()
    test_gmtime_string_length()
    test_time_n_vs_time_i()
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

    $I1 = 1
    sleep $I1
    $I1 = time
    $I2 = isgt $I1, $I2
    ok($I2, "Sleeping increases time")
.end

.sub test_sleep_i_negative
    push_eh cannot_sleep_negative
    sleep   -1
    pop_eh
    ok(0, "Guess what? Just time traveled")
    .return()
  cannot_sleep_negative:
    pop_eh
    ok(1, "Cannot sleep backwards")
.end

.sub test_gmtime_string_length
    $I0 = 1199145600
    $S0 = gmtime $I0
    is($S0, "Tue Jan  1 00:00:00 2008\n", "can decode a gmtime string")
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
