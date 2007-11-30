#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/oo/isa.t - Test OO inheritance

=head1 SYNOPSIS

    % prove t/oo/isa.t

=head1 DESCRIPTION

Tests OO features related to the isa opcode, comparing for inheritance and
composition.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(22)

    isa_by_string_name()
    isa_by_class_object()
    subclass_isa_by_string_name()
    subclass_isa_by_class_object()
    string_isa_and_pmc_isa_have_same_result()
.end    


.sub isa_by_string_name
    $P1 = newclass "Foo"
    $S1 = typeof $P1
    
    is( 'Class', $S1, 'typeof newclass retval')

    $I3 = isa $P1, "Class"
    ok( $I3, 'isa newclass retval a Class')

    $P2 = new $P1
    $S1 = typeof $P2
    is ( 'Foo', $S1, 'typeof instance of our class')

    $I3 = isa $P2, "Foo"
    ok ( $I3, 'isa instance of our class')

    $I3 = isa $P2, "Object"
    ok ( $I3, 'isa instance of object')
.end

.sub isa_by_class_object
    .local pmc foo_class
    foo_class = newclass "Foo2"
    $S1 = typeof foo_class

    is( 'Class', $S1, 'typeof newclass retval')

    .local pmc class_class
    class_class = get_class "Class"
    $I3 = isa foo_class, class_class
    ok ($I3, 'isa newclass retval a Class')

    $P2 = new foo_class 
    $S1 = typeof $P2
    is ( 'Foo2', $S1, 'typeof new our class?')

    $I3 = isa $P2, foo_class
    ok ( $I3, 'isa instance of our class')

    .local pmc object_class
    object_class = get_class "Object"
    $I3 = isa $P2, object_class
    ok ( $I3, 'isa instance of Object')
.end

.sub subclass_isa_by_string_name
    .local pmc foo_class, bar_class
    foo_class = newclass "Foo3"
    bar_class = subclass "Foo3", "Bar3"

    $I3 = isa bar_class, "Class"
    ok ($I3, 'does subclass generate class objects')

    $P2 = new bar_class 
    $S1 = typeof $P2
    is ('Bar3', $S1, 'does new give us an obj of our type')

    $I3 = isa $P2, "Bar3"
    ok ($I3, 'does new give us an obj that isa our type')

    $I3 = isa $P2, "Foo3"
    ok ($I3, 'does new give us an obj that isa our parent type')

    $I3 = isa $P2, "Object"
    ok ($I3, 'does new give us an obj that isa Object')
.end

.sub subclass_isa_by_class_object
    .local pmc foo_class, bar_class
    foo_class = newclass "Foo4"
    bar_class = subclass "Foo4", "Bar4"

    .local pmc class_class
    class_class = get_class "Class"
    $I3 = isa bar_class, class_class
    ok ($I3, 'is the class of a subclass Class')

    $P2 = new bar_class 
    $S1 = typeof $P2
    is ('Bar4', $S1, 'typeof new class our class')

    $I3 = isa $P2, bar_class
    ok ($I3, 'new class isa our class')

    $I3 = isa $P2, foo_class
    ok ($I3, 'new class isa our parent class')

    .local pmc object_class
    object_class = get_class "Object"
    $I3 = isa $P2, object_class
    ok ($I3, 'new class isa Object')
.end


.sub string_isa_and_pmc_isa_have_same_result
    .local pmc class, obj
    class = new 'Class'
    obj = class.'new'()
    $I0 = isa obj, 'Object'
    ok ($I0, 'isa Class instance an Object')

    .local pmc cl
    cl = new 'String'
    cl = 'Object'
    $I1 = isa obj, cl
    ok ($I1, 'isa String instance an Object')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
