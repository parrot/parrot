#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/context.t - test Context PMC

=head1 SYNOPSIS

    % prove t/pmc/context.t

=head1 DESCRIPTION

Tests the Context PMC.

TODO: Implement real tests when Context PMC will be migrated to use ATTRibutes.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    $P0 = new ['Context']
    sweep 1
    ok(1, 'Instantiated .Context')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
