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

    plan(2)

    # Just test that we can't create OrderedHashIterator directly
    $I0 = 1
    push_eh fail
    $P0 = new ['OrderedHashIterator']
    $I0 = 0
  fail:
    pop_eh
    ok($I0, "Can't create OrderedHashIterator directly")

    $P0 = new ['OrderedHash']
    $P1 = iter $P0
    $I0 = isa $P1, 'Iterator'
    ok($I0, 'OrderedHashIterator has proper type')


.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
