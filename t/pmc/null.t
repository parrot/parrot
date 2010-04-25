#!./parrot
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
    .include 'test_more.pir'

    plan(3)

    new $P0, ['Null']
    ok(1, 'Instantiated a Null PMC')

    new $P1, ['Null']
    $I0 = issame $P0, $P1
    ok ($I0, 'Null is same as Null')

    new $P2, ['Undef']
    $I0 = issame $P0, $P2
    nok($I0, 'Null is not same as not Undef')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
