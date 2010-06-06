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

    plan(3)

    $P0 = new ['AddrRegistry']
    ok(1, 'Instantiated .AddrRegistry')

    $I0 = 0
    if $P0 goto isnotempty
    inc $I0
isnotempty:
    ok($I0, 'vtable get_bool gives false when empty')

    $P1 = new [ 'Integer' ]
    $P0[0] = $P1
    $I0 = 0
    unless $P0 goto isempty
    inc $I0
isempty:
    ok($I0, 'vtable get_bool gives true when non empty')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
