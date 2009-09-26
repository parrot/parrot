#! parrot
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/null.t - test Null PMC

=head1 SYNOPSIS

    % prove t/pmc/null.t

=head1 DESCRIPTION

Tests the Null PMC.

=cut

.sub main :main
    .local int i
    .include 'test_more.pir'

    plan(3)

    new $P0, ['Null']
    ok(1, 'Instantiated a Null PMC')

    new $P1, ['Null']
    i = issame $P0, $P1
    ok (i, 'Null is same as Null')

    new $P2, ['Undef']
    i = issame $P0, $P2
    nok(i, 'Null is not same as not Null')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
