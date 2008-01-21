#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/version.t - test the Version PMC

=head1 SYNOPSIS

    % prove t/pmc/version.t

=head1 DESCRIPTION

Tests the Version PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'Version'
    ok(1, 'Instantiated .Version')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
