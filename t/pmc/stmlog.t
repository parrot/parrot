#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/stmlog.t - test the STMLog PMC

=head1 SYNOPSIS

    % prove t/pmc/stmlog.t

=head1 DESCRIPTION

Tests the STMLog PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'STMLog'
    ok(1, 'Instantiated .STMLog')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
