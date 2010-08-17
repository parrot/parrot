#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/fetch.t - the fetch opcode

=head1 SYNOPSIS

     % prove t/op/fetch.t

=head1 DESCRIPTION

Tests Parrot's experimental fetch opcode.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(17)

    test_fetch_keyed_pmc()
    test_fetch_keyed_int()
    test_fetch_keyed_str()
    # END_OF_TESTS
.end

.sub 'test_fetch_keyed_int'
    $P0    = new [ 'Hash' ]
    $P1    = box 111
    $P0[1] = $P1
    $P0[3] = $P1

    $P3 = fetch $P0, 1, [ 'Integer' ]
    is( $P3, 111, 'fetch should return existing element unmodified' )
    $P1 = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P3 = fetch $P0, 3, [ 'Integer' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3 = fetch $P0, 2, [ 'Integer' ]
    is( $P3, 0, 'fetch should create new PMC if not-existent' )
    isa_ok( $P3, 'Integer', 'new PMC should have type Integer' )
.end

.sub 'test_fetch_keyed_str'
    $P0          = new [ 'Hash' ]
    $P1          = box 111
    $P0['one']   = $P1
    $P0['three'] = $P1

    $P3 = fetch $P0, 'one', [ 'Integer' ]
    is( $P3, 111, 'fetch should return existing element unmodified' )
    $P1 = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P3 = fetch $P0, 'three', [ 'Integer' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3 = fetch $P0, 'two', [ 'Integer' ]
    is( $P3, 0, 'fetch should create new PMC if not-existent' )
    isa_ok( $P3, 'Integer', 'new PMC should have type Integer' )
.end

.sub 'test_fetch_keyed_pmc'
    $P0          = new [ 'Hash' ]
    $P1          = box 111

    .local pmc str_key
    str_key      = box 'foo'
    $P0[str_key] = $P1

    .local pmc int_key
    int_key      = box 435
    $P0[int_key] = $P1

    $P3          = fetch $P0, str_key, [ 'String' ]
    is( $P3, 111, 'fetch should return existing element unmodified' )

    $P1          = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P3 = fetch $P0, int_key, [ 'String' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    str_key = 'baz'
    $P3 = fetch $P0, str_key, [ 'String' ]
    is( $P3, '', 'fetch should return new PMC if keyed PMC is not there' )
    isa_ok( $P3, 'String', 'new PMC should have given type' )

    int_key = 789
    $P3 = fetch $P0, str_key, [ 'String' ]
    is( $P3, '', 'fetch should return new PMC if keyed PMC is not there' )
    isa_ok( $P3, 'String', 'new PMC should have given type' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
