#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/parrotclass.t - test the Class PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotclass.t

=head1 DESCRIPTION

Tests the Class PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'Class'
    ok(1, 'Instantiated .Class')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
