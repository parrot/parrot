#!parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/vivify.t - the vivify opcode

=head1 SYNOPSIS

     % prove t/op/vivify.t

=head1 DESCRIPTION

Tests Parrot's experimental vivify opcode.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(25)

    test_vivify_keyed_pmc()
    test_vivify_keyed_int()
    test_vivify_keyed_str()
    # END_OF_TESTS
.end

.sub 'test_vivify_keyed_int'
    $P0    = new [ 'Hash' ]
    $P1    = box 111
    $P0[1] = $P1
    $P0[3] = $P1

    $P3 = vivify $P0, 1, [ 'Integer' ]
    is( $P3, 111, 'vivify should return existing element unmodified' )
    $P1 = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P4 = $P0[1]
    $I0 = issame $P1, $P4
    ok( $I0, ' ... existing entry in Hash should be unmodified')

    $P3 = vivify $P0, 3, [ 'Integer' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3 = vivify $P0, 2, [ 'Integer' ]
    is( $P3, 0, 'vivify should create new PMC if not-existent' )
    isa_ok( $P3, 'Integer', 'new PMC should have requested type' )

    $P4 = $P0[2]
    $I0 = issame $P3, $P4
    ok( $I0, ' ... and should be bound in Hash')
.end

.sub 'test_vivify_keyed_str'
    $P0          = new [ 'Hash' ]
    $P1          = box 111
    $P0['one']   = $P1
    $P0['three'] = $P1

    $P3 = vivify $P0, 'one', [ 'Integer' ]
    is( $P3, 111, 'vivify should return existing element unmodified' )
    $P1 = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P4 = $P0['one']
    $I0 = issame $P1, $P4
    ok( $I0, ' ... existing entry in Hash should be unmodified')

    $P3 = vivify $P0, 'three', [ 'Integer' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    $P3 = vivify $P0, 'two', [ 'Integer' ]
    is( $P3, 0, 'vivify should create new PMC if not-existent' )
    isa_ok( $P3, 'Integer', 'new PMC should have requested type' )

    $P4 = $P0['two']
    $I0 = issame $P3, $P4
    ok( $I0, ' ... and should be bound in Hash')
.end

.sub 'test_vivify_keyed_pmc'
    $P0          = new [ 'Hash' ]
    $P1          = box 111

    .local pmc str_key
    str_key      = box 'foo'
    $P0[str_key] = $P1

    .local pmc int_key
    int_key      = box 435
    $P0[int_key] = $P1

    $P3          = vivify $P0, str_key, [ 'String' ]
    is( $P3, 111, 'vivify should return existing element unmodified' )

    $P1          = 123
    is( $P3, 123, '... the exact PMC itself' )

    $P4 = $P0[str_key]
    $I0 = issame $P1, $P4
    ok( $I0, ' ... existing entry in Hash should be unmodified')

    $P3 = vivify $P0, int_key, [ 'String' ]
    is( $P3, 123, '... even if stored in multiple locations' )

    $P4 = $P0[int_key]
    $I0 = issame $P1, $P4
    ok( $I0, ' ... existing entry in Hash should be unmodified')

    str_key = 'baz'
    $P3 = vivify $P0, str_key, [ 'String' ]
    is( $P3, '', 'vivify should return new PMC if keyed PMC is not there' )
    isa_ok( $P3, 'String', 'new PMC should have given type' )

    $P4 = $P0[str_key]
    $I0 = issame $P3, $P4
    ok( $I0, ' ... and should be bound in Hash')

    int_key = 789
    $P3 = vivify $P0, int_key, [ 'String' ]
    is( $P3, '', 'vivify should return new PMC if keyed PMC is not there' )
    isa_ok( $P3, 'String', 'new PMC should have given type' )

    $P4 = $P0[int_key]
    $I0 = issame $P3, $P4
    ok( $I0, ' ... and should be bound in Hash')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
