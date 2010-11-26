#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/addrinfo.t - test Addrinfo PMC

=head1 SYNOPSIS

    % prove t/pmc/addrinfo.t

=head1 DESCRIPTION

Tests the Addrinfo PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    $P0 = new ['Addrinfo']
    isa_ok($P0, 'Addrinfo')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
