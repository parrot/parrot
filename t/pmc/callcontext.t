#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/callcontext.t - test CallContext PMC

=head1 SYNOPSIS

    % prove t/pmc/callcontext.t

=head1 DESCRIPTION

Tests the CallContext PMC.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(65)

    test_instantiate()
    test_get_set_attrs()
    test_indexed_access()
    test_indexed_boxing()
    test_keyed_access()
    test_shift_access()
    test_shift_acess_empty()
    test_exists()
    test_clone()
    test_short_sign()
    test_named_args('Int' => 10, 'Num' => 3.14, 'Str' => 'A String', 'Pmc' => 'A String PMC')
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

    $P5 = 'nothing'
    push_eh eh
    $I0 = 1
    setattribute $P0, 'unexisting_attribute_123', $P5
    $I0 = 0
eh:
    pop_eh
    ok($I0, 'exception when set an unexisting attribute')
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

    $I2 = $P0[4]
    is($I2, 0, 'unexisting get_integer_keyed_int')

    $N2 = $P0[4]
    is($N2, 0.0, 'unexisting get_number_keyed_int')

    $S2 = $P0[4]
    null $S3
    is($S2, $S3, 'unexisting get_string_keyed_int')

    $P2 = $P0[4]
    null $P3
    is($P2, $P3, 'unexisting get_pmc_keyed_int')
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
    $S0 = 'bar'
    $P0[$S0] = 1.11
    $P0['baz'] = '2.22'
    $P1        = new [ 'Float' ]
    $P1        = 3.33

    $P0['qux'] = $P1

    $I0 = $P0['foo']
    is( $I0, 100, 'set/get_intval_keyed' )

    $N0 = $P0[$S0]
    is( $N0, 1.11, 'set/get_number_keyed' )

    $S0 = $P0['baz']
    is( $S0, '2.22', 'set/get_string_keyed' )

    $P2 = $P0['qux']
    is( $P2, 3.33, 'set/get_pmc_keyed' )

    $P1 = getattribute $P0, 'named'
    $I0 = elements $P1
    is( $I0, 4, 'elements after set_*_keyed' )

    $P4 = $P0['baz']
    is($P4, '2.22', 'get_pmc_keyed with boxing')

    $P3 = new ['CallContext']
    $I1 = $P0['unexisting']
    is($I1, 0, 'get_integer_keyed whith empty CallContext')

    $N1 = $P0['unexisting']
    is($N1, 0.0, 'get_number_keyed whith empty CallContext')

    $S1 = $P0['unexisting']
    null $S2
    is($S1, $S2, 'get_string_keyed whith empty CallContext')

    $P3 = $P0['unexisting']
    null $P4
    is($P3, $P4, 'get_pmc_keyed whith empty CallContext')
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
    nok( $I0, 'exists_keyed_int -- non-existent' )

    $I0 = exists $P0['bar']
    nok( $I0, 'exists_keyed_str -- non-existent' )

    $P1 = new ['CallContext']
    $I0 = exists $P1[1]
    nok($I0, 'test exists_keyed_int whith empty CallContext')

    $P2 = new ['String']
    $P2 = 'unexisting'
    $I0 = exists $P1[$P2]
    nok($I0, 'test exists_keyed whith empty CallContext')
.end

.sub 'test_clone'
    $P0 = new ['CallContext']
    $P0[0] = 42
    $P0[1] = "Hello Parrot"
    $P0['floatval'] = 3.14159
    $P0 = 'PISS'

    $P2 = new['String']
    $P2 = 'return attr'
    setattribute $P0, 'return_flags', $P2
    $P3 = new['String']
    $P3 = 'arg attr'
    setattribute $P0, 'arg_flags', $P3

    $P1 = clone $P0

    $I2 = $P1[0]
    is($I2, 42, 'clone - integer positional cloned')
    $S2 = $P1[1]
    is($S2, "Hello Parrot", 'clone - string positional cloned')
    $N2 = $P1['floatval']
    is($N2, 3.14159, 'clone - named number cloned')
    $S3 = $P0
    is($S3, 'PISS', 'clone - with a short signature string')

    getattribute $P4, $P0, 'return_flags'
    is($P4,'return attr', 'clone - with return_flags attribute')
    getattribute $P4, $P0, 'arg_flags'
    is($P4,'arg attr', 'clone - with arg_flags attribute')
.end

.sub 'test_shift_access'
    $P0 = new ['CallContext']
    $P1 = new [ 'String' ]
    $P1 = 'derF'

    $P3 = new ['String']
    $P3 = 'Second'

    unshift $P0, $P3
    unshift $P0, $P1

    $S1 = shift $P0
    is($S1, 'derF', 'shift should convert to proper type (PMC -> STRING)')

    unshift $P0, $P1
    $P2 = shift $P0

    is($P2, 'derF', '... but not convert when unneccesary')
    $I0 = issame $P1, $P2
    ok($I0, '... returning the same item' )

    # no unshift_string for now
    $P0[0] = 'Fred'

    $P2 = shift $P0
    is($P2, 'Fred', 'shift should convert to proper type (STRING -> PMC)')

    $P0[0] = 'Fred'
    $S2 = shift $P0

    is($S2, 'Fred', '... but not convert when unnecessary')
.end


.sub 'test_shift_acess_empty'
    $P0 = new['CallContext']
    $I0 = 1
    push_eh first_eh
    $P1 = shift $P0
    $I0 = 0

first_eh:
    pop_eh
    ok($I0, 'exception when shift_pmc an empty CallContext')

    push_eh second_eh
    $I0 = 1
    $S0 = shift $P0
    $I0 = 0

second_eh:
    pop_eh
    ok($I0, 'exception when shift_string an empty CallContext')
.end


.sub 'test_short_sign'
    $P0 = new ['CallContext']
    $P1 = new ['String']
    $P1 = 'PMC String'
    $S0 = 'String'
    $I0 = 123
    $N0 = 3.14

    $P0[0] = $P1
    $P0[1] = $S0
    $P0[2] = $I0
    $P0[3] = $N0

    $S1 = $P0
    is($S1, 'PSIN', 'get short signature string from arguments type')

    $P0 = 'NISP'
    $S2 = $P0
    is($S2, 'NISP', 'set short signature')
.end


.sub 'test_named_args'
    .param int i :named('Int')
    .param num n :named('Num')
    .param string s :named('Str')
    .param pmc p :named('Pmc')

    is( i, 10, 'set/get_intval_keyed_str' )
    is( n, 3.14, 'set/get_number_keyed_str' )
    is( s, 'A String', 'set/get_string_keyed_str' )
    is( p, 'A String PMC', 'set/get_pmc_keyed_str' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
