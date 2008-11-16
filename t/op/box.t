#!parrot
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/op/box.t - the box opcode

=head1 SYNOPSIS

    % prove t/op/box.t

=head1 DESCRIPTION

Tests all box operators.

=cut

.const int TESTS = 24

# must set these up before the .HLL_map statements later
.sub '__setup' :immediate
    $P0 = subclass 'Integer', 'MyInt'
    $P0 = subclass 'String',  'MyString'
    $P0 = subclass 'Float',   'MyFloat'
.end

.sub 'main' :main
    .include 'include/test_more.pir'

    'plan'(TESTS)

    'box_int'()
    'box_num'()
    'box_string'()

    .local pmc box_int_hll
    box_int_hll = get_root_global [ 'for_test' ], 'box_int'

    .local pmc box_num_hll
    box_num_hll = get_root_global [ 'for_test' ], 'box_num'

    .local pmc box_string_hll
    box_string_hll = get_root_global [ 'for_test' ], 'box_string'

    box_int_hll()
    box_num_hll()
    box_string_hll()
.end

.sub 'box_int'
    $P0 = box 100
    $I0 = $P0
    is( $I0, 100, 'value preserved when boxing int' )

    isa_ok( $P0, 'Integer', 'int boxed to appropriate base type' )

    $I0 = 200
    $P0 = box $I0
    $I0 = $P0
    is( $I0, 200, 'value preserved when boxing int from reg' )
    isa_ok( $P0, 'Integer', 'int boxed to appropriate base type from reg' )
.end

.sub 'box_num'
    $P0 = box 77.7
    $N0 = $P0
    is( $N0, 77.7, 'value preserved when boxing num' )

    isa_ok( $P0, 'Float', 'num boxed to appropriate base type' )

    $N0 = 88.8
    $P0 = box $N0
    $N0 = $P0
    is( $N0, 88.8, 'value preserved when boxing num from reg' )

    isa_ok( $P0, 'Float', 'num boxed to appropriate base type from reg' )
.end

.sub 'box_string'
    $P0 = box 'Hi, there'
    $S0 = $P0
    is( $S0, 'Hi, there', 'value preserved when boxing string' )

    isa_ok( $P0, 'String', 'string boxed to appropriate base type' )

    $S0 = 'Hello, there'
    $P0 = box $S0
    $S0 = $P0
    is( $S0, 'Hello, there', 'value preserved when boxing string from reg' )

    isa_ok( $P0, 'String', 'string boxed to appropriate base type from reg' )
.end

.HLL 'for_test'

.HLL_map 'Integer' = 'MyInt'
.HLL_map 'String'  = 'MyString'
.HLL_map 'Float'   = 'MyFloat'

.sub 'box_int'
    .include 'include/test_more.pir'
    $P0 = box -100
    $I0 = $P0
    is( $I0, -100, 'value preserved when boxing int in HLL' )

    isa_ok( $P0, 'MyInt', 'int boxed to appropriate base type for HLL' )

    $I0 = -999
    $P0 = box $I0
    $I0 = $P0
    is( $I0, -999, 'value preserved when boxing int in HLL from reg' )

    isa_ok( $P0, 'MyInt', 'int boxed to appropriate type for HLL from reg')
.end

.sub 'box_num'
    $P0 = box -77.7
    $N0 = $P0
    is( $N0, -77.7, 'value preserved when boxing num in HLL' )

    isa_ok( $P0, 'MyFloat', 'num boxed to appropriate base type for HLL' )

    $N0 = -222222.222222
    $P0 = box $N0
    $N0 = $P0
    is( $N0, -222222.222222, 'value preserved when boxing num in HLL from reg' )

    isa_ok( $P0, 'MyFloat', 'num boxed to appropriate type for HLL from reg' )
.end

.sub 'box_string'
    $P0 = box 'Bye, bye!'
    $S0 = $P0
    is( $S0, 'Bye, bye!', 'value preserved when boxing string in HLL' )

    isa_ok( $P0, 'MyString', 'string boxed to appropriate base type for HLL' )

    $S0 = 'Hello, goodbye!'
    $P0 = box $S0
    $S0 = $P0
    is( $S0, 'Hello, goodbye!', 'value preserved when boxing string in HLL from reg' )

    isa_ok($P0, 'MyString', 'string boxed to appropriate type for HLL from reg')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
