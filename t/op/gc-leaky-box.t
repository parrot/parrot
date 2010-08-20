#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/gc-leaky-box.t - test for memory leaks in the Garbage Collector

=head1 SYNOPSIS

    % prove t/op/gc-leaky-box.t

=head1 DESCRIPTION

Tests that we actually do a GC mark and sweep after a large number of PMC's have
been created. Test suggested by chromatic++ . Also includes tests for
TT1465 - http://trac.parrot.org/parrot/ticket/1465 .

=cut

# 20:57 <chromatic> For every million PMCs allocated, see that the GC has performed a mark/sweep.

.include 'interpinfo.pasm'

.sub _main :main
    .include 'test_more.pir'

    plan(3)

    $S0 = interpinfo .INTERPINFO_GC_SYS_NAME
    if $S0 == "inf" goto dont_run_hanging_tests

    test_gc_mark_sweep()

    goto test_end
  dont_run_hanging_tests:
    ok(1, "#TODO - Test disabled on gc_inf")
    ok(1, "#TODO - Test disabled on gc_inf")
    ok(1, "#TODO - Test disabled on gc_inf")
  test_end:
.end

.sub test_gc_mark_sweep
    .local int counter

    counter = 0
  loop:
    $P0 = box 0
    inc counter
    if counter < 10e6 goto loop

    diag("")
    $I1 = interpinfo.INTERPINFO_GC_COLLECT_RUNS
    $S1 = $I1
    $S0 = "performed " . $S1
    $S0 .= " (which should be >=1) GC collect runs"
    ok($I1,$S0)

    $I1 = interpinfo.INTERPINFO_GC_MARK_RUNS
    $S1 = $I1
    $S0 = "performed " . $S1
    $S0 .= " (which should be >=1) GC mark runs"
    ok($I1,$S0)

    $I1 = interpinfo.INTERPINFO_TOTAL_MEM_ALLOC
    $S1 = $I1
    $S0 = "allocated " . $S1
    $S0 .= " (which should be <= 2_000_000) bytes of memory, TODO: TT#1465"
    $I2 = isle $I1, 2000000
    todo($I2,$S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
