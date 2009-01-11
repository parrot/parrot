#! parrot
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/stmvar.t - test the STMVar PMC

=head1 SYNOPSIS

    % prove t/pmc/stmvar.t

=head1 DESCRIPTION

Tests the STMVar PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    new $P0, ['STMVar']
    ok(1, 'Instantiated an STMVar PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
