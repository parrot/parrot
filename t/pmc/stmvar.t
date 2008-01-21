#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/stmvar.t - test the STMVar PMC

=head1 SYNOPSIS

    % prove t/pmc/stmvar.t

=head1 DESCRIPTION

Tests the STMVar PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'STMVar'
    ok(1, 'Instantiated .STMVar')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
