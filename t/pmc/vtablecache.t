#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/vtablecache.t - test VtableCache

=head1 SYNOPSIS

    % prove t/pmc/vtablecache.t

=head1 DESCRIPTION

Tests the VtableCache PMC.

=cut

.sub main :main
   .include 'include/test_more.pir'

    plan(1)

    new P0, 'VtableCache'
    ok(1, 'Instantiated .VtableCache')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
