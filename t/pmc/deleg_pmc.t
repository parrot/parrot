#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/deleg_pmc.t - test deleg_pmc PMC

=head1 SYNOPSIS

    % prove t/pmc/deleg_pmc.t

=head1 DESCRIPTION

Tests the deleg_pmc PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new $P0, 'deleg_pmc'
    ok(1, 'Instantiated .deleg_pmc')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
