#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/time.t - Time Dynops

=cut

.loadlib 'sys_ops'

.sub main :main
    .include 'test_more.pir'

    plan(10)

    test_gmtime_s_i()
    test_time_n_vs_time_i()
    test_decodetime_p_i()
    test_localtime_s_i()
    test_decodelocaltime_p_i()
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
