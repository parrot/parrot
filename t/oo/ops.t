#! parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/ops.t - test OO related ops

=head1 SYNOPSIS

    % prove t/oo/ops.t

=head1 DESCRIPTION

Tests opcodes related to the OO implementation.

=cut

.sub main :main
    .include 'except_types.pasm'
    .include 'test_more.pir'

    plan(20)

    op_addrole_p_p()
    op_inspect_p_p()
    op_inspect_p_p_s()
    op_get_class_p_s()
    op_get_class_p_p()
    op_addattribute_p_s()
    op_new_p_s()
    op_can_i_p_s()

.end

.sub op_addrole_p_p
    $P0 = new 'Role'
    $P1 = new 'Class'

    addrole $P1, $P0
    $P2 = $P1.'roles'()
    $I1 = elements $P2
    is ($I1, 1, 'addrole op executed and  verified')

.end

.sub op_inspect_p_p
    $P0 = new 'Class'

    $P1 = inspect $P0
    $I1 = elements $P1
    is ($I1, 7, 'inspect op executed and hash count verified')

.end

.sub op_inspect_p_p_s
    $P0 = new 'Class'
    $P0.'name'('foo')
    $P0.'add_attribute'('a')

    $P1 = inspect $P0, 'name'
    is ($P1, 'foo', 'inspect_p_p_s with name')

    $P1 = inspect $P0, 'flags'
    $I0 = $P1
    $I1 = 1 << 29 # flag 29 is PObj_is_class_FLAG
    $I2 = $I0 & $I1
    ok ($I2, 'inspect_p_p_s with flags')

    $P1 = inspect $P0, 'attributes'
    $I0 = elements $P1
    is ($I0, 1, 'inspect_p_p_s with attributes')
.end

.sub op_get_class_p_s
    $P0 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'Monkey'
    $P0['name'] = $P4

    $P1 = new 'Class', $P0
    $I0 = isa $P1 , 'Class'
    ok ($I0, 'created new class named Monkey')

    $P2 = get_class 'Monkey'
    $I1 = isa $P2 , 'Class'
    ok ($I1, 'get_class found a class')

    $P3 = $P2.'inspect'('name')
    is ($P3, 'Monkey', 'got name of found class')

    null $S0
    $P5 = get_class $S0
    $I2 = isnull $P5
    is ($I2, 1, 'null p gives null p')
.end

.sub op_get_class_p_p
    $P0 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'Ape'
    $P0['name'] = $P4

    $P1 = new 'Class', $P0
    $I0 = isa $P1 , 'Class'
    ok ($I0, 'created new class named Ape')

    $P2 = get_class [ 'Ape' ]
    $I1 = isa $P2 , 'Class'
    ok ($I1, 'get_class with a key found a class')

    $P3 = $P2.'inspect'('name')
    is ($P3, 'Ape', 'got name of found class')

    $P3 = get_namespace [ 'Monkey' ]
    $P2 = get_class $P3
    $I1 = isa $P2 , 'Class'
    ok ($I1, 'get_class with a namespace found a class')
    is ($P3, 'Monkey', 'got name of found class')

    null $P5
    $P6 = get_class $P5
    $I2 = isnull $P6
    is ($I2, 1, 'null s gives null p')
.end

.sub op_addattribute_p_s
    .local pmc eh
    $P0 = new 'Class'
    addattribute $P0, 'foo'

    $P1 = $P0.'new'()

    $P2 = new 'Integer'
    $P2 = 100
    setattribute $P1, 'foo', $P2
    getattribute $P2, $P1, 'foo'


    $P0 = new 'Hash'
try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch

    push_eh eh
    addattribute $P0, 'oops'
    $I0 = 1 # add attribute success flag
    goto finally

catch:
    $I0 = 0 # add attribute failure flag

finally:
    pop_eh
    is ($P2, 100, 'reading assigned attribute')
    nok ($I0,'attempt to add attribute to non-class')

.end

.sub op_new_p_s
    $P0 = newclass "Foo"
    addattribute $P0, 'foo'

    $S0 = "Foo"
    $P1 = new $S0

    $P2 = new 'Integer'
    $P2 = 100
    setattribute $P1, 'foo', $P2
    getattribute $P2, $P1, 'foo'

    is ($P2, 100, 'reading assigned attribute')

.end

.sub op_can_i_p_s
    $P0 = newclass "Baz"
    $P1 = new $P0

    can $I0, $P1, "bar"
    ok ($I0, 'PMC has method bar')
    $I1 = $P1.'bar'()
    ok ($I1, 'called bar method on PMC')
.end

.namespace ["Baz"]
.sub bar :method
    .return (1)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
