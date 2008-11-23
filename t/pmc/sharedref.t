#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/sharedref.t - test the SharedRef PMC

=head1 SYNOPSIS

    % prove t/pmc/sharedref.t

=head1 DESCRIPTION

Tests the SharedRef PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new $P0, 'SharedRef'
    ok(1, 'Instantiated SharedRef PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
