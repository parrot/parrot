#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/hash.t - Test the Hash PMC

=head1 SYNOPSIS

    % prove t/pmc/hashiterator.t

=head1 DESCRIPTION

Tests the C<Hash> PMC. Checks key access with various types of
normal and potentially hazardous keys. Does a bit of stress testing as
well.

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(8)

    iter_over_empty_hash()
    iter_over_single_element()
    iter_over_single_element_with_checks()
    iter_invalid_type()
.end

.sub 'iter_over_empty_hash'
    .local pmc hash, it
    hash = new 'Hash'
    it   = new 'HashIterator', hash
    $I0  = isfalse it
    ok($I0, "Iterator for empty Hash is empty")
    .local pmc eh
    .local int i
    i = 1
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_addr eh, catch
    push_eh catch
    $P0 = shift it
    i = 0
    goto report
  catch:
    finalize eh
  report:
    pop_eh
    ok(i, 'shift for empty hash throws')
.end

.sub 'iter_over_single_element'
    .local pmc hash, it
    hash = new 'Hash'
    hash["foo"] = "bar"
    it   = new 'HashIterator', hash
    $I0  = istrue it
    ok($I0, "Iterator for non empty Hash is not empty")
    $P0  = shift it
    $I0  = isfalse it
    ok($I0, "And contains one element")
.end

.sub 'iter_over_single_element_with_checks'
    .local pmc hash, it
    hash = new 'Hash'
    hash["foo"] = "bar"

    it   = new 'HashIterator', hash
    $P0  = shift it
    $I0  = isa $P0, 'HashIteratorKey'
    ok($I0, "HashIteratorKey fetched successfully")

    $S0  = $P0 # Get key
    is($S0, "foo", "Key fetched successfully")
    $S1  = hash[$P0]
    is($S1, "bar", "Value fetched successfully")

.end

.sub 'iter_invalid_type'
    .local pmc hash, it
    hash = new 'Hash'
    it   = new 'HashIterator', hash
    .local pmc eh
    .local int i
    i = 1
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch
    push_eh catch
    it = 987 # Arbitrary value, let's hope we never use
    i = 0
    goto report
  catch:
    finalize eh
  report:
    pop_eh
    ok(i, 'setting invalid type throws')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
