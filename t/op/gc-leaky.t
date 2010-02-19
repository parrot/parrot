#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id: string_mem.t 43904 2010-02-11 13:49:42Z whiteknight $

=head1 NAME

t/op/gc-leaky.t - test for memory leaks in the Garbage Collector

=head1 SYNOPSIS

    % prove t/op/gc-leaky.t

=head1 DESCRIPTION

Tests that we actually do a GC mark and sweep after a large number of PMC's have
been created. Test suggested by chromatic++ . More tests are needed to close
TT1465 - http://trac.parrot.org/parrot/ticket/1465 .

=cut

# 20:57 <chromatic> For every million PMCs allocated, see that the GC has performed a mark/sweep.

.include 'interpinfo.pasm'

.sub _main :main
    .include 'test_more.pir'

    plan(2)

    $S0 = interpinfo .INTERPINFO_GC_SYS_NAME
    if $S0 == "inf" goto dont_run_hanging_tests

    test_gc_mark_sweep()

    goto test_end
  dont_run_hanging_tests:
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
        if counter > 1e6 goto done
        goto loop
    done:
        say ""
        $I1 = interpinfo.INTERPINFO_GC_COLLECT_RUNS
        $I2 = interpinfo.INTERPINFO_GC_MARK_RUNS

        $I3 = isge $I1, 1
        $I4 = isge $I2, 1

        $S1 = $I1
        $S0 = "performed " . $S1
        $S0 .= " (which should be >=1) GC collect runs"
        ok($I2,$S0)

        $S1 = $I2
        $S0 = "performed " . $S1
        $S0 .= " (which should be >=1) GC mark runs"
        ok($I2,$S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
