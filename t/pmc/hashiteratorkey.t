#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/hashiteratorkey.t - HashIteratorKey PMC

=head1 SYNOPSIS

    % prove t/pmc/hashiteratorkey.t

=head1 DESCRIPTION

Do almost nothing test. HashIteratorKey is supplementary class for
iterating over Hash. Just check that we create it.

=cut

.sub 'main'
    .include 'test_more.pir'

    plan(3)

    $P0 = new ['HashIteratorKey']
    ok(1, "Can create HashIteratorKey directly")

    $P0 = new ['Hash']
    $P0['foo'] = 'bar'
    $P1 = iter $P0
    $P2 = shift $P1
    $S0 = $P2.'key'()
    is($S0, 'foo', 'HashIteratorKey.key works')
    $S0 = $P2.'value'()
    is($S0, 'bar', 'HashIteratorKey.value works')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
