#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/parrotrunningthread.t - test the ParrotRunningThread PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotrunningthread.t

=head1 DESCRIPTION

Tests the ParrotRunningThread PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'ParrotRunningThread'
    ok(1, 'Instantiated .ParrotRunningThread')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
