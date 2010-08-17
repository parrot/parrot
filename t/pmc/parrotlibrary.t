#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/parrotlibrary.t - test the ParrotLibrary PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotlibrary.t

=head1 DESCRIPTION

Tests the ParrotLibrary PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    new $P0, ['ParrotLibrary']
    ok(1, 'Instantiated a ParrotLibrary PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
