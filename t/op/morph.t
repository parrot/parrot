#!./parrot
# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

t/op/morph.t - the morph opcode

=head1 SYNOPSIS

    % prove t/op/morph.t

=head1 DESCRIPTION

Tests most morph operations.

morph objects to class, object
morph class to class, object

=cut

.namespace[]

.const int TESTS = 8

# must set these up before the hll_map calls later
.sub '__setup' :immediate
    $P0 = subclass 'Integer', 'MyInt'
    $P0 = subclass 'String',  'MyString'
    $P0 = subclass 'Float',   'MyFloat'
.end

.sub 'main' :main
    .include 'test_more.pir'

    'plan'(TESTS)
    undef_morph_to_string()
    undef_pmc_morph_to_string()
    undef_pmc_morph_to_integer()
    undef_pmc_morph_to_float()
    string_pmc_morph_to_undef()

    morph_class()
    morph_obj()

.end

.sub undef_morph_to_string
    new $P0, ['String']
    new $P1, ['Undef']
    set $P0, "foo"
    concat  $P1, $P0, $P0
    is( $P1, 'foofoo', 'morphed to string' )
.end

.sub undef_pmc_morph_to_string
    .local pmc pmc1
    pmc1 = new ['Undef']
    $S1 = pmc1
    is( $S1, '', 'PMC Undef is empty string' )
.end

.sub undef_pmc_morph_to_integer
    .local pmc pmc1
    pmc1 = new ['Undef']
    .local int int1
    int1 = pmc1
    is( int1, 0, 'PMC Undef as integer is zero' )

    .local int int2
    int2 = -7777777
    int2 += int1
    is( int2, -7777777, 'PMC Undef in addition is zero' )
.end

.sub undef_pmc_morph_to_float
    .local pmc pmc1
    pmc1 = new ['Undef']
    .local int int1
    int1 = pmc1
    .local num float1
    float1 = -7777777e-3
    float1 += int1
    is( float1, -7777.777000, 'PMC Undef morph to int then float' )
.end

.sub string_pmc_morph_to_undef
    .local pmc pmc1
    pmc1 = new ['String']
    $P0 = get_class 'Undef'
    morph pmc1, $P0
    $S1 = typeof pmc1
    is( $S1, 'Undef', 'PMC String morph to undef' )
.end

.sub morph_class
    .local pmc obja, objb
    $P0 = newclass 'Object1'
    $P1 = newclass 'Object2'
    obja = new $P0
    objb = new $P1
    morph obja, objb
    $S1 = typeof obja
    todo( $S1, 'Object2', 'morph class' )
.end

.sub morph_obj
    .local pmc obja, objb
    $P0 = newclass 'Object1'
    $P1 = newclass 'Object2'
    obja = new $P0
    morph obja, $P1
    $P2 = find_method obja, 'nameMe'
    $S1 = obja.$P2()
    todo( $S1, 'Object2', 'morph obj' )
.end

.namespace ['Object2']

.sub 'nameMe' :method
     .return("Object2")
.end

# Local Variables:
#   mode: pir
#   fill-column: 78
# End:
# vim: expandtab shiftwidth=4 ft=pir:
