#!./parrot
# Copyright (C) 2001-2006, Parrot Foundation.
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

    plan(1)

    $P0 = new ['HashIteratorKey']
    ok(1, "Can create HashIteratorKey directly")

.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
