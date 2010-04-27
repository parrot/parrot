#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/imageiostrings.t - test ImageIOStrings PMC

=head1 SYNOPSIS

    % prove t/pmc/imageiostrings.t

=head1 DESCRIPTION

Tests the ImageIOStringsPMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(3)

    .local pmc iios
    iios = new ['ImageIOStrings']
    ok(1, 'instantiated ImageIOStrings')

    .local pmc test_pmc
    test_pmc = null
    iios = new ['ImageIOStrings']
    setref iios, test_pmc
    $P0 = deref iios
    $I0 = $P0
    nok( $I0, 'no strings in null pmc' )

    test_pmc = split ' ', 'spam sausage spam spam bacon spam tomato and spam'
    iios = new ['ImageIOStrings']
    setref iios, test_pmc
    $P0 = deref iios
    is_deeply( $P0, test_pmc, 'correctly manages RSA' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
