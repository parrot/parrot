#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/undef.t - Undef PMC

=head1 SYNOPSIS

    % prove t/pmc/undef.t

=head1 DESCRIPTION

Tests mainly morphing undef to other types.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(27)

    morph_to_string()
    undef_pmc_is_false()
    undef_pmc_is_not_defined()
    undef_pmc_morph_to_string()
    undef_pmc_morph_to_integer()
    undef_pmc_morph_to_float()
    verify_equality()
    string_pmc_morph_to_undef()
    undef_pmc_set_to_integer_native()
    undef_pmc_set_to_number_native()
    undef_pmc_isa_after_assignment()
    check_whether_interface_is_done()
    verify_clone_works()
    undef_equals_undef()
    set_undef_to_object()
.end

.sub morph_to_string
        new $P0, ['String']
        new $P1, ['Undef']
        set $P0, "foo"
        concat  $P1, $P0, $P0
        is( $P1, 'foofoo', 'morphed to string' )
.end

.sub undef_pmc_is_false
    .local pmc pmc1
    pmc1 = new ['Undef']
    if pmc1 goto PMC1_IS
      ok( 1, 'PMC Undef created by new is false' )
      goto logical_not
    PMC1_IS:
    ok( 0, 'PMC Undef created by new is false' )

  logical_not:
    unless pmc1 goto logical_not_passed
    ok( 0, 'logical_not of PMC Undef created by new is false' )
    goto done
  logical_not_passed:
    ok( 1, 'logical_not of PMC Undef created by new is true' )

  done:
.end

.sub undef_pmc_is_not_defined
    .local pmc pmc1
    pmc1 = new ['Undef']
    .local int is_defined
    is_defined = defined pmc1
    if is_defined goto PMC1_IS_DEFINED
      ok( 1, 'PMC Undef created by new is not defined' )
      .return()
    PMC1_IS_DEFINED:
    ok( 0, 'PMC Undef created by new is not defined' )
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

.sub verify_equality
    .local pmc pmc1
    pmc1 = new ['Undef']

    .local pmc pmc2
    pmc2 = new ['String']

    $I0 = pmc1 == pmc2
    is( $I0, 0, 'PMC Undef and PMC String are unequal' )
.end

.sub string_pmc_morph_to_undef
    .local pmc pmc1
    pmc1 = new ['String']
    $P0 = get_class 'Undef'
    morph pmc1, $P0
    $S1 = typeof pmc1
    is( $S1, 'Undef', 'PMC String morph to undef' )
.end

.sub undef_pmc_set_to_integer_native
    .local pmc pmc1
    pmc1 = new ['Undef']
    pmc1 = -88888888
    is( pmc1, -88888888, 'PMC Undef set to int gives int' )

    .local int pmc1_is_a
    pmc1_is_a = isa pmc1, "Integer"
    ok( pmc1_is_a, 'PMC Undef set to int isa Integer' )
.end

.sub undef_pmc_set_to_number_native
    .local pmc pmc1
    pmc1 = new ['Undef']
    pmc1 = 52.23
    is( pmc1, 52.23, 'PMC Undef set to float gives float' )

    $I0 = isa pmc1, "Float"
    ok( $I0, 'PMC Undef set to float isa Float' )
.end

.sub undef_pmc_isa_after_assignment
    .local pmc pmc1
    pmc1 = new ['Undef']
    .local int pmc1_is_a

    pmc1_is_a = isa pmc1, "Undef"
    ok( pmc1_is_a, 'PMC Undef isa Undef' )

    pmc1_is_a = isa pmc1, "default"
    is( pmc1_is_a, 0, 'PMC Undef is not default' )

    pmc1_is_a = isa pmc1, "Default"
    is( pmc1_is_a, 0, 'PMC Undef is not Default' )

    pmc1_is_a = isa pmc1, "scalar"
    is( pmc1_is_a, 0, 'PMC Undef is not scalar' )

    pmc1_is_a = isa pmc1, "Scalar"
    is( pmc1_is_a, 0, 'PMC Undef is not Scalar' )
.end

.sub check_whether_interface_is_done
    .local pmc pmc1
    pmc1 = new ['Undef']
    .local int bool1

    does bool1, pmc1, "scalar"
    is( bool1, 1, 'PMC Undef does scalar' )

    does bool1, pmc1, "no_interface"
    is( bool1, 0, 'PMC Undef does not do no_interface' )
.end

.sub verify_clone_works
    $P1 = new ['Undef']
    $P2 = clone $P1
    $S0 = typeof $P2
    is( $S0, 'Undef', 'PMC Undef clone is an Undef' )
.end

.sub undef_equals_undef
    $P1 = new ['Undef']
    $P2 = new ['Undef']
    if $P1 == $P2 goto ok
        ok( 0, 'Undef == Undef' )
        .return()
  ok:
    ok( 1, 'Undef == Undef' )
.end

.sub set_undef_to_object
    $P0 = new "Undef"
    $P1 = get_class 'Integer'
    $P2 = new 'Integer'
    assign $P0, $P2
    $I0 = isa $P0, $P1
    ok( $I0, 'Assign Integer to Undef' )

    $P0 = new "Undef"
    $P1 = newclass "HI"
    $P2 = new $P1
    assign $P0, $P2
    $I0 = isa $P0, $P1
    ok( $I0, 'Assign Object to Undef' )

    $S0 = $P0
    is( $S0, 'A string', '... and the right object' )

    $P0 = new "Undef"
    $P1 = subclass 'ResizablePMCArray', 'FooRPA'
    $P2 = new $P1
    assign $P0, $P2
    $I0 = isa $P0, $P1
    ok( $I0, 'Assign Object with PMC parent to Undef' )

    # TODO: Needs tests to verify that the values and metadata are preserved
    #       across the assignment
.end

.namespace [ 'HI' ]

.sub get_string :vtable :method
    .return( 'A string' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
