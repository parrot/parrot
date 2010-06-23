#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/orderedhashiterator.t - Ordered Hash Iterator

=head1 SYNOPSIS

    % prove t/pmc/orderedhashiterator.t

=head1 DESCRIPTION

Do almost nothing test. Main purpose of OrderedHashIterator covered by
t/pmc/orderedhash.t.

=cut

.sub 'main'
    .include 'test_more.pir'

    plan(3)

    'test_init'()
    'test_bad_type'()
.end

.sub 'test_init'
    .local pmc oh, it
    .local int i, i2
    # We can't create OrderedHashIterator directly
    i = 1
    push_eh fail
    oh = new ['OrderedHashIterator']
    i = 0
  fail:
    pop_eh
    ok(i, "Can't create OrderedHashIterator directly")

    oh = new ['OrderedHash']
    it = iter oh
    sweep 1 # Make sure the mark vtable is covered
    i = isa it, 'Iterator'
    i2 = isa it, 'OrderedHashIterator'
    add i, i2
    is(i, 2, 'OrderedHashIterator has proper type')
.end

.sub 'test_bad_type'
    .local pmc oh, it
    .local int i
    oh = new ['OrderedHash']
    it = iter oh
    i = 1
    push_eh catch
    it = 9999 # Let's hope it will never be a valid iteration type
    i = 0
  catch:
    pop_eh
    ok(i, 'invalid iteration type throws')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
