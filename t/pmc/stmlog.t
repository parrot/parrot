#! parrot
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/stmlog.t - test the STMLog PMC

=head1 SYNOPSIS

    % prove t/pmc/stmlog.t

=head1 DESCRIPTION

Tests the STMLog PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    new $P0, ['STMLog']
    ok(1, 'Instantiated an STMLog PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
