#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/arrayiterator.t - ArrayIterator PMC

=head1 SYNOPSIS

    % prove t/pmc/arrayiterator.t

=head1 DESCRIPTION

Tests C<ArrayIterator> PMC. Navigate in both directions, check bounds.

=cut

.namespace []

.include 'iterator.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(21)

    iterate_forward() # 8 tests
    iterate_backward() # 6 tests
    iterate_backward_string() # 6 test
    iterator_init() # 1 test
.end


.sub 'iterate_forward'
    .local pmc foo, it

    foo = new ['ResizablePMCArray']

    it = iter foo
    nok(it, "Iterator for empty array is empty")
    $I0 = isa it, 'Iterator'
    ok($I0, "Have proper type")

    push foo, 1
    push foo, 42

    it = iter foo
    ok(it, "Iterator for 2-elem list is not empty")
    $P0 = shift it
    ok(it, "Can shift 1st element")
    is($P0, 1, "With expected value")
    $P0 = shift it
    nok(it, "Iterator is finished after second shift")
    is($P0, 42, "2nd element has correct value")

    $I0 = 1
    push_eh fail
    $P0 = shift it
    $I0 = 0
  fail:
    pop_eh
    ok($I0, "Shifting from finished iterator throws exception")

.end

.sub 'iterate_backward'
    .local pmc foo, it

    foo = new ['ResizablePMCArray']
    push foo, 1
    push foo, 42

    it = iter foo
    it = .ITERATE_FROM_END
    ok(it, "Iterator reset to backward iteration")
    $P0 = pop it
    ok(it, "Can shift 1st element")
    is($P0, 42, "With expected value")
    $P0 = pop it
    nok(it, "Iterator is finished after second shift")
    is($P0, 1, "2nd element has correct value")

    $I0 = 1
    push_eh fail
    $P0 = shift it
    $I0 = 0
  fail:
    pop_eh
    ok($I0, "Shifting from finished iterator throws exception")
.end

.sub 'iterate_backward_string'
    .local pmc foo, it

    foo = new ['ResizableStringArray']
    push foo, 'First'
    push foo, 'Other'

    it = iter foo
    it = .ITERATE_FROM_END
    ok(it, "Iterator reset to backward iteration - string")
    $S0 = pop it
    ok(it, "Can shift 1st element - string")
    is($S0, 'Other', "With expected value- string")
    $S0 = pop it
    nok(it, "Iterator is finished after second shift - string")
    is($S0, 'First', "2nd element has correct value - string")

    $I0 = 1
    push_eh fail
    $S0 = shift it
    $I0 = 0
  fail:
    pop_eh
    ok($I0, "Shifting from finished iterator throws exception - string")
.end

.sub 'iterator_init'
    .local pmc it, e
    .local string msg
    msg = "ArrayIterator can't be directly instantiated, init must throw"
    push_eh CATCH
    it = new 'ArrayIterator'
    pop_eh
    ok(0, msg)
    goto DONE
CATCH:
    .get_results(e)
    pop_eh
    ok(1, msg)
DONE:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
