#! parrot
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/tqueue.t - Thread Queue

=head1 SYNOPSIS

    % prove t/pmc/tqueue.t

=head1 DESCRIPTION

Tests the thread queue.

=cut

.sub main :main
    .include "include/test_more.pir"
    plan(5)
    thread_safe_queue_tests()
.end

.sub thread_safe_queue_tests
    .local int i, is_ok
    .local pmc tq, pInt

    new tq, ['TQueue']
    ok(1, "didn't crash")

    i = tq
    is_ok = i == 0
    ok(is_ok, "int assignment gets # of elements in empty queue")

    pInt = new ['Integer']
    pInt = 2
    push tq, pInt
    pInt = new ['Integer']
    pInt = 3
    push tq, pInt
    i = tq
    is_ok = i == 2
    ok(is_ok, "int assignment gets # of elements in non-empty queue")

    shift pInt, tq
    i = pInt
    is_ok = i == 2
    ok(is_ok, "int retrieval works")
    shift pInt, tq
    i = pInt
    is_ok = i == 3
    ok(is_ok, "int retrieval works")
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
