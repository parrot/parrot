#! parrot
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/callcontext.t - test CallContext PMC

=head1 SYNOPSIS

    % prove t/pmc/callcontext.t

=head1 DESCRIPTION

Tests the CallContext PMC.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(66)

    test_instantiate()
    test_get_set_attrs()
    test_push_pop_indexed_access()
    test_shift_unshift_indexed_access()
    test_indexed_access()
    test_indexed_boxing()
    test_keyed_access()
    test_exists()
    test_clone()
.end

.sub 'test_instantiate'
    $P0 = new ['CallContext']
    ok(1, 'Instantiated CallContext')
.end

.sub 'test_get_set_attrs'
    $P0 = new ['CallContext']
    $P5 = new 'String'

    $P5 = 'moonbomb'
    setattribute $P0, 'return_flags', $P5
    ok(1, 'set return_flags attribute')
    getattribute $P1, $P0, 'return_flags'
    is($P5,'moonbomb', 'got return_flags attribute')

    $P5 = 'cheese'
    setattribute $P0, 'arg_flags', $P5
    ok(1, 'set arg_flags attribute')
    getattribute $P1, $P0, 'arg_flags'
    is($P5,'cheese', 'got arg_flags attribute')
.end

.sub 'test_push_pop_indexed_access'
    $P0 = new [ 'CallContext' ]
    $P1 = new [ 'Integer' ]
    $P1 = 100

    push $P0, $P1
    $I0 = elements $P0
    is( $I0, 1, 'elements after push' )

    $P2 = $P0[0]
    is( $P2, 100, 'push_pmc/get_pmc_keyed_int pair' )
    $P2 = pop $P0
    is( $P2, 100, 'push_pmc/pop_pmc pair' )

    $I0 = elements $P0
    is( $I0, 0, 'elements after pop' )

    push $P0, 200
    $I0 = $P0[0]
    is( $I0, 200, 'push_integer/get_integer_keyed_int pair' )
    $I0 = pop $P0
    is( $I0, 200, 'push_integer/pop_integer pair' )

    push $P0, 3.03
    $N0 = $P0[0]
    is( $N0, 3.03, 'push_number/get_number_keyed_int pair' )
    $N0 = pop $P0
    is( $N0, 3.03, 'push_number/pop_number pair' )

    push $P0, 'hello'
    $S0 = $P0[0]
    is( $S0, 'hello', 'push_string/get_string_keyed_int pair' )
    $S0 = pop $P0
    is( $S0, 'hello', 'push_string/pop_string pair' )

    $I0 = elements $P0
    is( $I0, 0, 'elements after push/pop' )
.end

.sub 'test_shift_unshift_indexed_access'
    $P0 = new [ 'CallContext' ]
    $P1 = new [ 'Integer' ]
    $P1 = 100

    unshift $P0, $P1

    $I0 = elements $P0
    is( $I0, 1, 'elements after unshift' )

    $P2 = $P0[0]
    is( $P2, 100, 'unshift_pmc/get_pmc_keyed_int pair' )
    $P2 = shift $P0
    is( $P2, 100, 'unshift_pmc/shift_pmc pair' )

    $I0 = elements $P0
    is( $I0, 0, 'elements after unshift/shift' )

    unshift $P0, 200
    $I0 = $P0[0]
    is( $I0, 200, 'unshift_integer/get_integer_keyed_int pair' )
    $I0 = shift $P0
    is( $I0, 200, 'unshift_integer/shift_integer pair' )

    unshift $P0, 3.03
    $N0 = $P0[0]
    is( $N0, 3.03, 'unshift_number/get_number_keyed_int pair' )
    $N0 = shift $P0
    is( $N0, 3.03, 'unshift_number/shift_number pair' )

    unshift $P0, 'hello'
    $S0 = $P0[0]
    is( $S0, 'hello', 'unshift_string/get_string_keyed_int pair' )
    $S0 = shift $P0
    is( $S0, 'hello', 'unshift_string/shift_string pair' )

    $I0 = elements $P0
    is( $I0, 0, 'elements after unshift/shift' )
.end

.sub 'test_indexed_access'
    $P0    = new [ 'CallContext' ]
    $P0[0] = 100

    $I0 = elements $P0
    is( $I0, 1, 'elements after set_*_indexed' )

    $P0[1] = 1.11

    $I0 = elements $P0
    is( $I0, 2, 'elements after set_*_indexed' )

    $S0    = '2.22'
    $P0[2] = $S0

    $I0 = elements $P0
    is( $I0, 3, 'elements after set_*_indexed' )

    $P1    = new [ 'Float' ]
    $P1    = 3.33
    $P0[3] = $P1

    $I0 = elements $P0
    is( $I0, 4, 'elements after set_*_indexed' )

    $I1    = $P0[0]
    is( $I1, 100, 'set_integer_keyed_int/get_integer_keyed_int pair' )

    $N1    = $P0[1]
    is( $N1, 1.11, 'set_number_keyed_int/get_number_keyed_int pair' )

    $S1    = $P0[2]
    is( $S1, '2.22', 'set_string_keyed_int/get_string_keyed_int pair' )

    $P1    = $P0[3]
    is( $P1, 3.33, 'set_pmc_keyed_int/get_pmc_keyed_int pair' )

    $I1 = shift $P0
    is( $I1, 100, 'set_integer_keyed_int/shift_integer pair' )

    $N1 = $P0[0]
    is( $N1, 1.11, 'shift_* should remove elements from array' )

    $N1 = shift $P0
    is( $N1, 1.11, 'set_number_keyed_int/shift_number pair' )

    $S1 = $P0[0]
    is( $S1, '2.22', 'shift_* should remove elements from array' )

    $S1 = shift $P0
    is( $S1, '2.22', 'set_string_keyed_int/shift_string pair' )

    $P1 = $P0[0]
    is( $P1, 3.33, 'shift_* should remove elements from array' )

    $P1 = shift $P0
    is( $P1, 3.33, 'set_pmc_keyed_int/shift_pmc pair' )
.end

.sub 'test_indexed_boxing'
    $P0    = new [ 'CallContext' ]
    $P0[0] = 100
    $P0[1] = 1.11

    $S0    = '2.22'
    $P0[2] = $S0

    $P1    = new [ 'Float' ]
    $P1    = 3.33
    $P0[3] = $P1

    $I0    = $P0[1]
    is( $I0, 1, 'indexed float converted to int on get_integer_keyed_int' )
    $I0    = $P0[2]
    is( $I0, 2, 'indexed string converted to int on get_integer_keyed_int' )
    $I0    = $P0[3]
    is( $I0, 3, 'indexed PMC converted to int on get_integer_keyed_int' )

    $N0    = $P0[0]
    is( $N0, 100.0, 'indexed integer converted to num on get_number_keyed_int' )
    $N0    = $P0[2]
    is( $N0, 2.22,  'indexed string converted to num on get_number_keyed_int' )
    $N0    = $P0[3]
    is( $N0, 3.33,  'indexed PMC converted to int num get_number_keyed_int' )

    $S0    = $P0[0]
    is( $S0, '100',  'indexed int converted to string on get_string_keyed_int' )
    $S0    = $P0[1]
    is( $S0, '1.11', 'indexed num converted to string on get_string_keyed_int' )
    $S0    = $P0[3]
    is( $S0, '3.33', 'indexed PMC converted to string get_string_keyed_int' )

    $P1    = $P0[0]
    is( $P1, 100,  'indexed int converted to PMC on get_pmc_keyed_int' )
    $P1    = $P0[1]
    is( $P1, 1.11, 'indexed float converted to PMC on get_pmc_keyed_int' )
    $P1    = $P0[2]
    is( $P1, 2.22, 'indexed string converted to PMC on get_pmc_keyed_int' )
.end

.sub 'test_keyed_access'
    $P0        = new [ 'CallContext' ]

    $P0['foo'] = 100
    $P0['bar'] = 1.11
    $P0['baz'] = '2.22'
    $P1        = new [ 'Float' ]
    $P1        = 3.33

    $P0['qux'] = $P1

    $I0 = $P0['foo']
    is( $I0, 100, 'set/get_intval_keyed_str' )

    $N0 = $P0['bar']
    is( $N0, 1.11, 'set/get_number_keyed_str' )

    $S0 = $P0['baz']
    is( $S0, '2.22', 'set/get_string_keyed_str' )

    $P2 = $P0['qux']
    is( $P2, 3.33, 'set/get_pmc_keyed_str' )

    $P1 = getattribute $P0, 'named'
    $I0 = elements $P1
    is( $I0, 4, 'elements after set_*_keyed' )
.end

.sub 'test_exists'
    $P0        = new [ 'CallContext' ]

    $P0[0]     = 111
    $P0['foo'] = 100

    $I0 = exists $P0[0]
    ok( $I0, 'exists_keyed_int' )

    $I0 = exists $P0['foo']
    ok( $I0, 'exists_keyed_str' )

    $I0 = exists $P0[100]
    nok( $I0, 'exists_keyed_int -- non-existant' )

    $I0 = exists $P0['bar']
    nok( $I0, 'exists_keyed_str -- non-existant' )
.end

.sub 'test_clone'
    $P0 = new ['CallContext']
    $P0[0] = 42
    $P0[1] = "Hello Parrot"
    $P0['floatval'] = 3.14159

    $P1 = clone $P0

    $I2 = $P1[0]
    is($I2, 42, 'clone - integer positional cloned')
    $S2 = $P1[1]
    is($S2, "Hello Parrot", 'clone - string positional cloned')
    $N2 = $P1['floatval']
    is($N2, 3.14159, 'clone - named number cloned')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
