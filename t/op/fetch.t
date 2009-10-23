#!parrot
# Copyright (C) 2009, Parrot Foundation.
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

    plan(18)

    test_fetch_keyed_pmc()
    test_fetch_keyed_int()
    test_fetch_keyed_string()
    # END_OF_TESTS
.end

.sub 'test_fetch_keyed_int'
    diag( 'test_fetch_keyed_int' )
    $P0    = new [ 'Hash' ]
    $P1    = new [ 'Integer' ]
    $P1    = 111
    $P0[1] = $P1
    $P0[3] = $P1

    $P2    = new [ 'Integer' ]
    $P2    = 222

    $P3 = fetch $P0, 1, $P2
    is( $P3, 111, 'fetch should return existing element unmodified' )
    $P1 = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P3 = fetch $P0, 3, $P2
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3 = fetch $P0, 2, $P2
    is( $P3, 222, 'fetch should return default PMC if keyed PMC is not there' )

    $P2 = 234
    is( $P3, 222, '... a clone of the default PMC' )
.end

.sub 'test_fetch_keyed_string'
    diag( 'test_fetch_keyed_string' )
    $P0        = new [ 'NameSpace' ]
    $P1        = new [ 'Integer' ]
    $P1        = 111
    $P0['foo'] = $P1
    $P0['bar'] = $P1

    $P2        = new [ 'Integer' ]
    $P2        = 222

    $P3        = fetch $P0, 'foo', $P2
    is( $P3, 111, 'fetch should return existing element unmodified' )
    $P1        = 123
    is( $P3, 123, '... the exact PMC itself' )

    $S0        = 'bar'
    $P3        = fetch $P0, $S0, $P2
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3        = fetch $P0, 'baz', $P2
    is( $P3, 222, 'fetch should return default PMC if keyed PMC is not there' )

    $S0        = 'quux'
    $P3        = fetch $P0, $S0, $P2
    is( $P3, 222, 'fetch should return default PMC if keyed PMC is not there' )

    $P2        = 234
    is( $P3, 222, '... a clone of the default PMC' )
.end

.sub 'test_fetch_keyed_pmc'
    diag( 'test_fetch_keyed_pmc' )
    $P0          = new [ 'Hash' ]
    $P1          = new [ 'Integer' ]
    $P1          = 111

    .local pmc str_key
    str_key      = new [ 'String' ]
    str_key      = 'foo'

    $P0[str_key] = $P1

    .local pmc int_key
    int_key      = new [ 'Integer' ]
    int_key      = 435
    $P0[int_key] = $P1

    $P2          = new [ 'Integer' ]
    $P2          = 222

    $P3          = fetch $P0, str_key, $P2
    is( $P3, 111, 'fetch should return existing element unmodified' )

    $P1          = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P3 = fetch $P0, int_key, $P2
    is( $P3, 123, '... even if stored in multiple locations' )

    str_key = 'baz'

    $P3 = fetch $P0, str_key, $P2
    is( $P3, 222, 'fetch should return default PMC if keyed PMC is not there' )

    $P3 = 234
    is( $P2, 222, '... a clone of the default PMC' )

    int_key = 789

    $P3 = fetch $P0, int_key, $P2
    is( $P3, 222, 'fetch should return default PMC if keyed PMC is not there' )

    $P2 = 234
    is( $P3, 222, '... a clone of the default PMC' )
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir :
