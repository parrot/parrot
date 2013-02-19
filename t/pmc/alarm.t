#!./parrot
# Copyright (C) 2010-2011, Parrot Foundation.

.include 'timer.pasm'
.include 'sysinfo.pasm'
.loadlib 'sys_ops'

.sub main
    .include 'test_more.pir'

    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto run_windows_tests
    if $S0 == 'cygwin' goto run_windows_tests
    goto run_unix_tests
  run_windows_tests:
    say "1..1"
    say "ok 1 - All tests skipped on Windows"
    goto all_tests_end

  run_unix_tests:

    plan(7)

    $P0 = new 'Integer'
    $P0 = 0
    set_global 'A', $P0

    $N0 = time
    $N0 = $N0 + 0.25

    $P0 = get_global 'alarm2'
    $N1 = $N0 + 0.04
    make_alarm($N1, $P0)

    $P0 = get_global 'alarm1'
    $N1 = $N0 + 0.02
    make_alarm($N1, $P0)

    $P0 = get_global 'alarm4'
    $N1 = $N0 + 0.10
    make_alarm($N1, $P0)

    $P0 = get_global 'alarm3'
    $N1 = $N0 + 0.09
    make_alarm($N1, $P0)

loop:
    $P0 = get_global 'A'
    $I0 = $P0
    if $I0 == 4 goto done
    goto loop

done:
    ok(1, "All alarms executed")

    $N1 = $N0 + 0.10
    $N0 = time

    if $N0 >= $N1 goto good
    ok(0, "Alarms actually waited")
    .return()

good:
    ok(1, "Alarms actually waited")

    $P1 = get_global 'alarm_finish'
    $N0 = time
    $N0 = $N0 + 0.1

    $P0 = new 'Float'
    $P0 = $N0
    set_global 'FT', $P0

    make_alarm($N0, $P1)

    sleep 5.0
    ok(0, "Alarm/sleep interaction")
  all_tests_end:
.end

.sub make_alarm
    .param num when
    .param pmc proc

    $P1 = new 'Alarm'
    $P1[.PARROT_ALARM_TIME] = when
    $P1[.PARROT_ALARM_TASK] = proc

    $P1()
.end

.sub inc_A
    $P0 = get_global 'A'
    $P0 = $P0 + 1
    set_global 'A', $P0
    .return($P0)
.end

.sub alarm1
    $P0 = inc_A()

    ok(1, "alarm 1")
    .return()
.end

.sub alarm2
    $P0 = inc_A()

    ok(1, "alarm 2")
    .return()
.end

.sub alarm3
    $P0 = inc_A()

    ok(1, "alarm 3")
    .return()
.end

.sub alarm4
    $P0 = inc_A()

    ok(1, "alarm 4")
    .return()
.end

.sub alarm_finish
    $N0 = time

    $P0 = get_global 'FT'
    $N1 = $P0

    if $N0 < $N1 goto fail
    $N1 = $N1 + 0.5
    if $N0 > $N1 goto fail

    ok(1, "Alarm/sleep interaction")
    exit 0

fail:
    ok(0, "Alarm/sleep interaction")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
