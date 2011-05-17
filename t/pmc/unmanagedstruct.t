#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/unmanagedstruct.t - test the UnManagedStruct PMC

=head1 SYNOPSIS

    % prove t/pmc/unmanagedstruct.t

=head1 DESCRIPTION

Tests the UnManagedStruct PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(9)

    test_new()
    is_defined()
    is_equal()
    initialize()
    can_clone()
.end

.sub test_new
    new $P0, ['UnManagedStruct']
    ok(1, 'Instantiated an UnManagedStruct PMC')
.end

.sub is_defined
    $P0 = new ['UnManagedStruct']
    $I0 = defined $P0
    is($I0, 0, 'undefined struct is undefined')
.end

.sub is_equal
    $P0 = new ['UnManagedStruct']
    $P1 = new ['UnManagedStruct']
    $P1 = $P0
    eq $P0, $P1, OK
    ok(0, 'unable to compate the equality of two unmanagedstructs')
OK:
    ok(1, 'can compare the equality of two unmanagedstructs')
.end

.sub initialize
    $P0 = new ['UnManagedStruct']
    $P1 = new ['String']
    $P1 = "test"
    push_eh eh1
    $S0 = $P0[$P1]

    ok(0, "no error thrown when trying to get key of unintialized struct")
    goto finally1
eh1:
    .get_results($P1)
    is($P1, "Missing struct initializer", "error correctly thrown for get")
finally1:
    pop_eh

    push_eh eh2
    $P0[$P1] = "test"
    ok(0, "no error thrown when trying to set key of unintialized struct")
    goto finally2
eh2:
    .get_results($P1)
    is($P1, "Missing struct initializer", "error correctly thrown for set")
finally2:
    pop_eh

    $P1 = new ['OrderedHash']
    $P1['x'] = -1

    push_eh eh3
    $P0 = new ['UnManagedStruct'], $P1
    ok(0, "no error when setting bad initializer")
    goto finally3
eh3:
    .get_results($P2)
    is($P2, "Illegal initializer for struct", "error correctly thrown for bad initializer")
finally3:
    pop_eh

    .include "datatypes.pasm"
    push $P1, 0
    push $P1, 0

    set $P1['y'], .DATATYPE_INT16
    push $P1, 0
    push $P1, 0

    push_eh eh4
    $P0 = new ['UnManagedStruct'], $P1
    ok(0, "no error when initializing with bad type")
    goto finally4
eh4:
    .get_results($P2)
    is($P2, "Illegal type (-1) in initializer for struct", "error correctly thrown for bad initializer type")
finally4:
    pop_eh

    set $P1['x'], .DATATYPE_INT16

    $P0 = new ['UnManagedStruct'], $P1
    ok(1, "can initialize unmanagedstruct from orderedhash")
.end

.sub can_clone
    new $P1, ['OrderedHash']
    set  $P1['x'], .DATATYPE_INT16
    push $P1, 0
    push $P1, 0

    set $P1['y'], .DATATYPE_INT16
    push $P1, 0
    push $P1, 0

    $P0 = new ['UnManagedStruct'], $P1
    $P2 = clone $P0
    ok(1, "can clone unmanagedstruct")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
