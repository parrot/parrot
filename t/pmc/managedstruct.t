#!./parrot
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/managedstruct.t - Managed C Structure

=head1 SYNOPSIS

    % prove t/pmc/managedstruct.t

=head1 DESCRIPTION

Tests the ManagedStruct PMC. Checks element access and memory allocation.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(24)

    set_managedstruct_size()
    element_access()
    named_element_access_int16()
    nested_struct_offsets()
    interface_check()
.end

.sub set_managedstruct_size
    new $P0, ['ManagedStruct']
    set $I0,$P0
    is($I0, 0, "empty ManagedStruct has size 0")
    set $P0,1
    set $I0,$P0
    is($I0, 1, "non-empty ManagedStruct has correct size")
    set $P0,2
    set $I0,$P0
    is($I0, 2, "non-empty ManagedStruct has correct size")
.end

#pasm_output_is( <<'CODE', <<'OUTPUT', "element access - float, double" );
.sub element_access

    #element access - float, double
    new $P2, ['ResizablePMCArray']
    .include "datatypes.pasm"
    push $P2, .DATATYPE_FLOAT
    push $P2, 2	# 2 elem array
    push $P2, 0
    push $P2, .DATATYPE_DOUBLE
    push $P2, 0
    push $P2, 0
    new $P0, ['ManagedStruct'], $P2
    # must have set size automatically
    # this is hopefully 2*4+8 everywhere
    set $I0, $P0
    is($I0, 16, "ManagedStruct has correct size")
    set $P0[0;0], 14.1
    set $N0, $P0[0;0]
    set $P0[0;1], 14.2
    set $P0[1], 14.3
    set $N0, $P0[0;0]
    sub $N1, $N0, 14.1
    cmp $I0, $N1, 0.000001
    ok($I0, "stored float has correct value")
    set $N0, $P0[0;1]
    sub $N1, $N0, 14.2
    cmp $I0, $N1, 0.000001
    ok($I0, "stored float has correct value")
    set $N0, $P0[1]
    sub $N1, $N0, 14.3
    cmp $I0, $N1, 0.000001
    ok($I0, "stored float has correct value")


    #element access - char, short
    new $P2, ['ResizablePMCArray']
    push $P2, .DATATYPE_CHAR
    push $P2, 2	# 2 elem char array
    push $P2, 0
    new $P0, ['ManagedStruct'], $P2
    set $I0, $P0
    $I1 = isge $I0, 2
    ok($I1, "ManagedStruct size is at least 2")

    set $P0[0;0], 1
    set $P0[0;1], 258	# must be truncated to 2
    set $I0, $P0[0;0]
    is($I0, 1, "char val of 1 is correct")
    set $I0, $P0[0;1]
    is($I0, 2, "char val of 258 retrieved as 2")
    # now acces that as a short
    new $P2, ['ResizablePMCArray']
    push $P2, .DATATYPE_SHORT
    push $P2, 1
    push $P2, 0
    assign $P0, $P2
    # should be 2*256+1 or 1*256+2
    set $I0, $P0[0]
    $I1 = $I0 == 513
    $I2 = $I0 == 258
    $I0 = $I1 | $I2
    ok($I0, "short val retrieved correctly")
.end

.sub named_element_access_int16
    new $P1, ['OrderedHash']
    set  $P1['x'], .DATATYPE_INT16
    push $P1, 0
    push $P1, 0

    set $P1['y'], .DATATYPE_INT16
    push $P1, 0
    push $P1, 0

    # need a ManagedStruct to allocate data memory
    new $P2, ['ManagedStruct'], $P1

    # set struct values by name
    set $I0, 2
    set $P2["x"], $I0

    set $I1, 16
    set $S0, "y"
    set $P2[$S0], $I1

    # get struct values by struct item idx
    set $I2, $P2[0]
    set $I3, $P2[1]

    is($I2, 2, "'x' value by idx is correct")
    is($I3, 16, "'y' value by idx is correct")

    # get struct values by name
    set $I2, $P2["x"]
    set $I3, $P2["y"]

    is($I2, 2, "'x' value by name is correct")
    is($I3, 16, "'y' value by name is correct")
.end

#pasm_output_is( <<'CODE', <<'OUTPUT', "nested struct offsets" );
.sub nested_struct_offsets

    # the nested structure
    new $P3, ['ResizablePMCArray']
    push $P3, .DATATYPE_INT
    push $P3, 0
    push $P3, 0
    push $P3, .DATATYPE_INT
    push $P3, 0
    push $P3, 0
    new $P4, ['UnManagedStruct'], $P3
    # outer structure
    new $P2, ['ResizablePMCArray']
    push $P2, .DATATYPE_INT
    push $P2, 0
    push $P2, 0
    push $P2, .DATATYPE_STRUCT
    # attach the unmanged struct as property
    set $P1, $P2[-1]
    setprop $P1, "_struct", $P4
    push $P2, 0
    push $P2, 0
    push $P2, .DATATYPE_INT
    push $P2, 0
    push $P2, 0
    # attach struct initializer
    new $P5, ['UnManagedStruct'], $P2

    # now check offsets
    set $I0, $P2[2]
    is($I0, 0, "offset 2 looks good")
    set $I0, $P2[5]
    is($I0, 4, "offset 5 looks good")
    set $I0, $P2[8]
    is($I0, 12, "offset 8 looks good")
    # nested
    set $I0, $P3[2]
    is($I0, 0, "nested offest 2 looks good")
    set $I0, $P3[5]
    is($I0, 4, "nested offset 5 looks good")

    # check struct size
    set $I0, $P5
    is($I0, 16, "struct size looks good")
    # nested
    set $I0, $P4
    is($I0, 8, "nested struct size looks good")
.end

.sub interface_check
    .local pmc pmc1
    pmc1 = new ['ManagedStruct']
    .local int bool1
    does bool1, pmc1, "scalar"
    is(bool1, 1, "ManagedStruct does scalar")
    does bool1, pmc1, "no_interface"
    is(bool1, 0, "ManagedStruct doesn't do no_interface")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
