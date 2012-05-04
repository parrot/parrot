#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/op/comp.t - Conditionals

=head1 SYNOPSIS

        % prove t/op/comp.t

=head1 DESCRIPTION

Tests various conditional branch operations.

=cut

# some of these were failing with JIT/i386

.sub main :main
    .include 'test_more.pir'
    plan(17)
    test_gt_ic_i_ic()
    test_ge_ic_i_ic()
    test_le_ic_i_ic()
    test_lt_ic_i_ic()
    test_eq_ic_i_ic()
    test_ne_ic_i_ic()
    test_eq_num()
.end

.sub test_gt_ic_i_ic
    set $I0, 10
    gt 11, $I0, ok1
    ok(0, "nok gt1")
    branch nok1
  ok1:
    ok(1, "ok gt1")
  nok1:
    gt 9, $I0, nok2
    ok(1, "ok gt2")
    .return()
  nok2:
    ok(0,"nok gt 2")
.end

.sub test_ge_ic_i_ic
    set $I0, 10
    ge 11, $I0, ok1
    ok(0, "nok ge1")
    branch nok1
  ok1:
    ok(1, "ok ge1")
  nok1:
    ge 9, $I0, nok2
    ok(1, "ok ge2")
    branch ok2
  nok2:
    ok(0, "nok ge2")
  ok2:
    ge 10, $I0, ok3
    ok(0, "nok ge3")
    .return()
  ok3:
    ok(1, "ok ge3")
.end

.sub test_le_ic_i_ic
    set $I0, 10
    le 9, $I0, ok1
    ok(0, "nok le1")
    branch nok1
  ok1:
    ok(1, "ok le1")
  nok1:
    le 11, $I0, nok2
    ok(1, "ok le2")
    branch ok2
  nok2:
    ok(0, "nok le2")
  ok2:
    le 10, $I0, ok3
    ok(0, "nok le2")
    .return()
  ok3:
    ok(1, "ok le3")
.end

.sub test_lt_ic_i_ic
    set $I0, 10
    lt 9, $I0, ok1
    ok(0, "nok lt1")
    branch nok1
  ok1:
    ok(1, "ok lt1")
  nok1:
    lt 10, $I0, nok2
    ok(1, "ok lt2")
    .return()
  nok2:
    ok(0, "nok lt2")
.end

.sub test_eq_ic_i_ic
    set $I0, 10
    eq 9, $I0, nok1
    ok(1, "ok eq1")
    branch ok1
  nok1:
    ok(0, "nok eq1")
  ok1:
    eq 10, $I0, ok2
    ok(0, "nok eq2")
    branch nok2
  ok2:
    ok(1, "ok eq2")
  nok2:
    eq 11, 10, nok3
    ok(1, "ok eq3")
    .return()
  nok3:
    ok(0, "nok eq3")
.end

.sub test_ne_ic_i_ic
    set $I0, 10
    ne 9, $I0, ok1
    ok(0, "nok neq1")
    branch nok1
  ok1:
    ok(1, "ok neq1")
  nok1:
    ne 10, $I0, nok2
    ok(1, "ok neq2")
    branch ok2
  nok2:
    ok(0, "nok neq2")
  ok2:
    ne 11, 10, ok3
    ok(0, "nok neq2")
    .return()
  ok3:
    ok(1, "ok neq3")
.end

.sub test_eq_num
    new $P0, 'Float'
    set $P0, -1.2
    new $P1, 'String'
#
#   fix problems with g++ 4.4.1 (with --optimize) on i386 - GH #677
#   set $P1, "-1.2"
    set $P1, "-1.2000000000"
    eq_num $P0, $P1, OK
    ok(0, "not eq_num")
    .return()
  OK:
    ok(1, "eq_num")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
