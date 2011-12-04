#!./parrot --gc-min-threshold=100
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/op/gc-leaky-call.t - test for memory leaks in the Garbage Collector

=head1 SYNOPSIS

    % prove t/op/gc-leaky-call.t

=head1 DESCRIPTION

Tests that we actually do a GC mark and sweep after a large number of
function calls.

=cut

.include 'interpinfo.pasm'

.sub _main :main
    .include 'test_more.pir'


    $S0 = Parrot_interp_info .INTERPINFO_GC_SYS_NAME
    if $S0 == "inf" goto dont_run_hanging_tests

    diag($S0)

    plan(3)
    test_gc_mark_sweep()

    goto test_end
  dont_run_hanging_tests:
    skip_all("Not relevant for this GC")
  test_end:
.end

.sub test_gc_mark_sweep
    .local int counter
    .local int cycles

    cycles  = 10
  cycle:

    counter = 0
  loop:
    "consume"()
    inc counter
    if counter < 1e6 goto loop

    $I1 = Parrot_interp_info.INTERPINFO_GC_COLLECT_RUNS
    if $I1 goto done

    dec cycles
    if cycles > 0 goto cycle

  done:

    $I2 = Parrot_interp_info.INTERPINFO_GC_MARK_RUNS

    $S0 = Parrot_interp_info .INTERPINFO_GC_SYS_NAME
    if $S0 == "gms" goto last_alloc

    $I3 = Parrot_interp_info.INTERPINFO_TOTAL_MEM_ALLOC
    goto test

  last_alloc:
    $I3 = Parrot_interp_info.INTERPINFO_MEM_ALLOCS_SINCE_COLLECT

  test:
    $S1 = $I1
    $S0 = "performed " . $S1
    $S0 .= " (which should be >=1) GC collect runs"
    ok($I1,$S0)

    $S1 = $I2
    $S0 = "performed " . $S1
    $S0 .= " (which should be >=1) GC mark runs"
    ok($I2,$S0)

    $S1 = $I3
    $S0 = "allocated " . $S1
    $S0 .= " (which should be <= 6_000_000) bytes of memory"
    $I4 = isle $I3, 6000000
    ok($I4,$S0)
.end

.sub consume
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
