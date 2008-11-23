#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/bound_nci.t - test Bound_NCI PMC

=head1 SYNOPSIS

    % prove t/pmc/bound_nci.t

=head1 DESCRIPTION

Tests the Bound_NCI PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new $P0, 'Bound_NCI'
    ok(1, 'Instantiated .Bound_NCI')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
