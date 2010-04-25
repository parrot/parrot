#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/addrregistry.t - test AddrRegistry PMC

=head1 SYNOPSIS

    % prove t/pmc/addrregistry.t

=head1 DESCRIPTION

Tests the AddrRegistry PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    $P0 = new ['AddrRegistry']
    ok(1, 'Instantiated .AddrRegistry')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
