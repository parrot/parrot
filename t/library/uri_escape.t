#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/uri_escape.t

=head1 DESCRIPTION

Test the URI Escape library

=head1 SYNOPSIS

    % prove t/library/uri_escape.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'URI/Escape.pbc'

    plan(6)

    $P0 = new ['Exporter']
    $P1 = get_namespace ['URI'; 'Escape']
    $P2 = get_namespace
    $P0.'import'($P1 :named('source'), $P2 :named('destination'), 'percent_encode percent_encode_component' :named('globals'))

    $S0 = percent_encode('Hello')
    is($S0, 'Hello', 'plain ascii without special chars')

    $S0 = percent_encode_component('Hello')
    is($S0, 'Hello', 'plain ascii without special chars - component')

    $S0 = percent_encode('Hello?world')
    is($S0, 'Hello?world', 'plain ascii')

    $S1 = percent_encode_component('Hello?world')
    is($S1, 'Hello%3Fworld', 'plain ascii - component')

    $S0 = percent_encode(iso-8859-1:"A\x{D1}O#a")
    is($S0, 'A%C3%91O#a', 'iso-8859-1 string')

    $S0 = percent_encode_component(iso-8859-1:"A\x{D1}O#a")
    is($S0, 'A%C3%91O%23a', 'iso-8859-1 string - component')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
