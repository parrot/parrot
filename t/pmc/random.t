#! parrot
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/random.t - Random numbers

=head1 SYNOPSIS

        % prove t/pmc/random.t

=head1 DESCRIPTION

Tests random number generation

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(2)

    new $P0, 'Random'
    ok(1, 'Instantiated .Random')
    set $I0, $P0
    ok(1, 'Got (unknown) random int')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
