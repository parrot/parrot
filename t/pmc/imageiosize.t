#! parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/imageiosize.t - test ImageIOSize PMC

=head1 SYNOPSIS

    % prove t/pmc/imagiosize.t

=head1 DESCRIPTION

Tests the ImageIOSize PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(4)

    .local pmc iios
    iios = new ['ImageIOSize']
    ok(1, 'instantiated ImageIOSize')

    .local pmc test_pmc
    test_pmc = null
    setref iios, test_pmc
    $P0 = deref iios
    $S0 = freeze test_pmc
    $I0 = $P0
    $I1 = length $S0
    is($I0, $I1, 'gets the same size as freeze (null)')

    iios = new ['ImageIOSize']
    test_pmc = 'get_test_simple'()
    setref iios, test_pmc
    $P0 = deref iios
    $S0 = freeze test_pmc
    $I0 = $P0
    $I1 = length $S0
    is($I0, $I1, 'gets the same size as freeze (simple)')

    iios = new ['ImageIOSize']
    test_pmc = 'get_test_aggregate'()
    setref iios, test_pmc
    $P0 = deref iios
    $S0 = freeze test_pmc
    $I0 = $P0
    $I1 = length $S0
    is($I0, $I1, 'gets the same size as freeze (aggregate)')
.end

.sub get_test_simple
    $P0 = new ['Integer']
    $P0 = -99
    .return ($P0)
.end

.sub get_test_aggregate
    $P0 = new ['ResizableStringArray']
    $P0[0] = 'parrot'
    $P0[1] = '???'
    $P0[2] = 'profit'
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir
