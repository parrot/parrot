#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/null.t - test Null PMC

=head1 SYNOPSIS

    % prove t/pmc/null.t

=head1 DESCRIPTION

Tests the Null PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    new $P0, ['Null']
    ok(1, 'Instantiated a Null PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
