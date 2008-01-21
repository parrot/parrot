#! parrot
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/schedulermessage - test the SchedulerMessage PMC

=head1 SYNOPSIS

    % prove t/pmc/schedulermessage.t

=head1 DESCRIPTION

Tests the SchedulerMessage PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'SchedulerMessage'
    ok(1, 'Instantiated SchedulerMessage PMC')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
