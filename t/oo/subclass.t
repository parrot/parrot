#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/subclass.t - Test OO subclassing (instantiation)

=head1 SYNOPSIS

    % prove t/oo/subclass.t

=head1 DESCRIPTION

Tests OO features related to subclassing.

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(70)

    instance_sub_class_from_class_object()
    manually_create_anon_class_object()
    manually_create_named_class_object()
    instance_from_class_object_method()
    instance_from_string_name()
    instance_from_string_register()
    instance_from_string_pmc_name()
    instance_from_key_name()
    instance_from_key_pmc_name()
    instance_from_class_object_init()
    instance_from_string_name_init()
    instance_from_string_register_name_init()
    instance_from_string_pmc_name_init()
    instance_from_key_name_init()
    subclasses_within_other_namespaces()
    call_inherited_method()
    call_inherited_init_vtable_overrides()
    set_inherited_attribute_by_parent_key()
    can_not_add_same_parent_twice()
    can_not_be_own_parent()
    can_not_be_own_ancestor()
    no_loop_in_hierarchy()
    subclass_does_what_parent_does()
.end

.sub instance_sub_class_from_class_object
    #instance_subclass_from_class_object
    .local pmc parent_class, foo_class, foo_object

    parent_class = newclass "PreFoo"
    foo_class = subclass parent_class, "Foo"

    $S1 = typeof foo_class
    is ($S1, 'Class', 'created Foo as subclass of Pre')

    $I3 = isa foo_class, "Class"
    ok ($I3, 'Foo isa Class')

    foo_object = new foo_class
    $S1 = typeof foo_object
    is ($S1, 'Foo', 'instance is typeof Foo')

    $I3 = isa foo_object, "Foo"
    ok ($I3, 'instance Foo isa Foo')

    $I3 = isa foo_object, "Object"
    ok ($I3, 'instance Foo isa Object')

.end

.sub manually_create_anon_class_object
    # manually create anonymous class object' );
    .local pmc parent_class, class_init_args, parent_list
    .local pmc anon_class, anon_object

    parent_class = new "Class"
    class_init_args = new 'Hash'
    parent_list = new 'ResizablePMCArray'

    push parent_list, parent_class
    class_init_args['parents'] = parent_list

    anon_class = new "Class", class_init_args
    $S1 = typeof anon_class
    is ($S1, 'Class', 'create new instance of Class')

    $I3 = isa anon_class, "Class"
    ok ($I3, 'new instance isa Class')

    anon_object = new anon_class

    $S1 = typeof anon_object
    is ($S1, '', 'instance has typeof empty string')

    $I3 = isa anon_object, "Foo"
    nok ($I3, 'instance not isa Foo')

    $I3 = isa anon_object, parent_class
    ok ($I3, 'instance isa parent')

    $I3 = isa anon_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub manually_create_named_class_object
    # manually create named class object
    .local pmc parent_class, class_init_args, parent_list
    .local pmc bar_class, bar_object
    parent_class = new "Class"

    class_init_args = new 'Hash'
    parent_list = new 'ResizablePMCArray'
    push parent_list, parent_class
    class_init_args['parents'] = parent_list

    bar_class = new "Class", class_init_args
    bar_class.'name'("Bar")

    $S1 = typeof bar_class
    is ($S1, 'Class', 'create new instance of Class')

    $I3 = isa bar_class, "Class"
    ok ($I3, 'instance isa Class')

    bar_object = new bar_class
    $S1 = typeof bar_object
    is ($S1, 'Bar', 'instance is typeof Bar')

    $I3 = isa bar_object, "Bar"
    ok ($I3, 'instance isa Bar')

    $I3 = isa bar_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_class_object_method
    # instantiate from class object method
    .local pmc parent_class, baz_class, baz_object
    parent_class = newclass "PreBaz"
    baz_class = subclass "PreBaz", "Baz"
    baz_object = baz_class.'new'()

    $S1 = typeof baz_object
    is ($S1, "Baz", "instance is typeof Baz")

    $I3 = isa baz_object, "Baz"
    ok ($I3, "instance isa Baz")

    $I3 = isa baz_object, "Object"
    ok ($I3, "instance isa Object")

.end

.sub instance_from_string_name
    # instantiate from string name
    .local pmc parent_class, qux_class, qux_object
    parent_class = newclass "PreQux"
    qux_class = subclass "PreQux", "Qux"
    qux_object = new 'Qux'

    $S1 = typeof qux_object
    is ($S1, 'Qux', 'instance is typeof Qux')

    $I3 = isa qux_object, "Qux"
    ok ($I3, 'instance isa Qux')

    $I3 = isa qux_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_string_register
    # instantiate from string register name
    .local pmc parent_class, quux_class, quux_object
    parent_class = newclass "PreQuux"
    quux_class = subclass "PreQuux", "Quux"
    $S1 = 'Quux'
    quux_object = new $S1

    $S1 = typeof quux_object
    is ($S1, 'Quux', 'instance is typeof Quux')

    $I3 = isa quux_object, "Quux"
    ok ($I3, 'instance isa Quux')

    $I3 = isa quux_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_string_pmc_name
    # instantiate from string PMC name
    .local pmc parent_class, bongo_class, bongo_object
    parent_class = newclass "PreBongo"
    bongo_class = subclass "PreBongo", "Bongo"
    $P3 = new 'String'
    $P3 = 'Bongo'
    bongo_object = new $P3

    $S1 = typeof bongo_object
    is ($S1, 'Bongo', 'instance is typof Bongo')

    $I3 = isa bongo_object, "Bongo"
    ok ($I3, 'instance isa Bongo')

    $I3 = isa bongo_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_key_name
    # instantiate from key name'
    .local pmc parent_class, foobar_class, foobar_object
    parent_class = newclass "Zot"
    foobar_class = subclass "Zot", ['Foo';'Bar']
    $S1 = typeof foobar_class
    is ($S1, 'Class', 'new class is typeof Class')

    $I3 = isa foobar_class, "Class"
    ok ($I3, 'new class isa Class')

    foobar_object = new ['Foo';'Bar']

    $S1 = typeof foobar_object
    is ($S1, 'Foo;Bar', 'instance is typeof Foo;Bar')

    $I3 = isa foobar_object, ['Foo';'Bar']
    ok ($I3, 'instance isa Foo;Bar')

    $I3 = isa foobar_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_key_pmc_name
    # instantiate from key PMC name
    .local pmc parent_class, barbaz_class, barbaz_object
    parent_class = newclass "Snork"
    barbaz_class = subclass "Snork", ['Bar';'Baz']
    $S1 = typeof barbaz_class
    is ($S1, 'Class', 'new class is typeof Class')

    $I3 = isa barbaz_class, "Class"
    ok ($I3, 'new class isa Class')

    .local pmc kbarbaz, kbaz
    kbarbaz = new 'Key'
    kbarbaz = 'Bar'
    kbaz = new 'Key'
    kbaz = 'Baz'
    push kbarbaz, kbaz
    ok (1, 'set the value of a non-constant key PMC')

    barbaz_object = new kbarbaz

    $S1 = typeof barbaz_object
    is ($S1, 'Bar;Baz', 'instance is typeof Bar;Baz')

    $I3 = isa barbaz_object, 'Snork'
    ok ($I3, 'instance isa Snork')

    $I3 = isa barbaz_object, "Object"
    ok ($I3, 'instance isa Object')

.end

.sub instance_from_class_object_init
    # instantiate from class object with init
    .local pmc parent_class, bork_class, bork_object
    parent_class = newclass "Gork"
    bork_class = subclass "Gork", "Bork"
    addattribute bork_class, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Gork\n"
    $P3['data'] = $P4

    bork_object = new bork_class, $P3

    $S1 = typeof bork_object
    is ($S1, 'Bork', 'instance is typeof Bork')

    $I3 = isa bork_object, "Gork"
    ok ($I3, 'instance isa Gork')

    $I3 = isa bork_object, "Object"
    ok ($I3, 'instance isa Object')

    $P5 = getattribute bork_object, 'data'
    is ($P5, "data for Gork\n", 'read attribute data from instance of Bork')

.end

.sub instance_from_string_name_init
    # instantiate from string name with init
    .local pmc parent_class, boogle_class, boogle_object
    parent_class  = newclass "Froogle"
    boogle_class = subclass "Froogle", "Boogle"
    addattribute boogle_class, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Boogle\n"
    $P3['data'] = $P4

    boogle_object = new 'Boogle', $P3

    $S1 = typeof boogle_object
    is ($S1, 'Boogle', 'instance is typeof Boogle')

    $I3 = isa boogle_object, "Boogle"
    ok ($I3, 'instance isa Boogle')

    $I3 = isa boogle_object, "Object"
    ok ($I3, 'instance isa Object')

    $P5 = getattribute boogle_object, 'data'
    is ($P5, "data for Boogle\n", 'read attribute data from instance of Boogle')

.end

.sub instance_from_string_register_name_init
    # instantiate from string register name with init
    .local pmc parent_class, eek_class, eek_object
    parent_class = newclass "Ook"
    eek_class = subclass "Ook", "Eek"
    addattribute eek_class, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Eek\n"
    $P3['data'] = $P4

    $S1 = 'Eek'
    eek_object = new $S1, $P3

    $S1 = typeof eek_object
    is ($S1, 'Eek', 'instance is typeof Eek')

    $I3 = isa eek_object, "Eek"
    ok ($I3, 'instance isa Eek')

    $I3 = isa eek_object, "Object"
    ok ($I3, 'instance isa Object')

    $P5 = getattribute eek_object, 'data'
    is ($P5, "data for Eek\n", 'read attribute data from instance of Eek')

.end
#
#pir_output_is( <<'CODE', <<'OUT', 'instantiate from string PMC name with init' );
.sub instance_from_string_pmc_name_init
    # instantiate from string PMC name with init
    .local pmc parent_class, wobble_class, wobble_object
    parent_class = newclass "Weeble"
    wobble_class = subclass "Weeble", "Wobble"
    addattribute wobble_class, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Wobble\n"
    $P3['data'] = $P4

    $P6 = new 'String'
    $P6 = 'Wobble'
    wobble_object = new $P6, $P3

    $S1 = typeof wobble_object
    is ($S1, 'Wobble', 'instance is typeof Wobble')

    $I3 = isa wobble_object, "Wobble"
    ok ($I3, 'instance isa Wobble')

    $I3 = isa wobble_object, "Object"
    ok ($I3, 'instance isa Object')

    $P5 = getattribute wobble_object, 'data'
    is ($P5, "data for Wobble\n", 'read attribute data from instance of Wobble')
.end

.sub instance_from_key_name_init
    # instantiate from key name with init
    .local pmc parent_class, barfoo_class, barfoo_object
    parent_class = newclass "Zork"
    barfoo_class = subclass "Zork", ['Bar';'Foo']
    addattribute barfoo_class, 'data'

    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Bar;Foo\n"
    $P3['data'] = $P4

    barfoo_object = new ['Bar';'Foo'], $P3

    $S1 = typeof barfoo_object
    is ($S1, 'Bar;Foo', 'instance is typeof Bar;Foo')

    $I3 = isa barfoo_object, 'Zork'
    ok ($I3, 'instance isa Zork')

    $I3 = isa barfoo_object, "Object"
    ok ($I3, 'instance isa Object')

    $P5 = getattribute barfoo_object, 'data'
    is ($P5, "data for Bar;Foo\n", 'read attribute data from instance of Bar;Foo')
.end

.sub subclasses_within_other_namespaces
    # declare subclasses within other namespaces
    $P0 = newclass 'Tom'
    $P99 = subclass 'Tom', 'Dick'
    $P99 = subclass 'Tom', 'Harry'

    $P1 = new 'Dick'
    $S1 = $P1.'name'()
    is ($S1, "Richard", 'calling method on Dick' )
.end

.namespace [ 'Dick' ]
.sub 'name' :method
    $P1 = new 'Harry'
    $S1 = $P1.'name'()
    is ($S1, "Harold", 'calling method on Harry from Namespace Dick')
    .return ("Richard")
.end


.namespace [ 'Harry' ]
.sub 'name' :method
    .return ("Harold")
.end
.namespace []

.sub call_inherited_method
    # call inherited methods
    $P0 = newclass 'Bilbo'
    $P0 = subclass 'Bilbo', 'Frodo'

    $P1 = new 'Frodo'
    $I1 = $P1.'is_hobbit'()
    ok ($I1, 'calling inherited method')
.end

.namespace [ 'Bilbo' ]
.sub 'is_hobbit' :method
    .return (1)
.end
.namespace []

.sub call_inherited_init_vtable_overrides
    # call inherited init vtable overrides
    $P0 = newclass 'Wombat'
    $P1 = subclass 'Wombat', 'Frog'
    addattribute $P0, 'storage'
    $P1 = new 'Frog'
    $I1 = $P1.'count_strings'()
    is ($I1, 3, 'correct array length in vtable overriden init method')
.end

.namespace [ 'Frog' ]
.sub 'init' :method :vtable
    self.'add_string'('first string')
    self.'add_string'('second string')
    self.'add_string'('third string')
.end

.namespace [ 'Wombat' ]
.sub 'init' :method :vtable
    $P1 = new 'ResizablePMCArray'
    setattribute self, 'storage', $P1
.end

.sub 'add_string' :method
    .param string newstring
    $P1 = getattribute self, 'storage'
    push $P1, newstring
.end

.sub 'count_strings' :method
    $P1 = getattribute self, 'storage'
    $S3 = $P1
    .return ($P1)
.end
.namespace []

.sub set_inherited_attribute_by_parent_key
    # set inherited attributes by parent key
    .local pmc parent_class, child_class, child_object
    parent_class = newclass 'Zolar'
    addattribute parent_class, 'storage'
    child_class = subclass parent_class, 'SonOfZolar'
    child_object = child_class.'new'()
    $P2 = getattribute child_object, 'storage'
    is ($P2,'storage attribute value', 'retrieve attribute vale')
.end

.namespace [ 'SonOfZolar' ]
.sub 'init' :method :vtable
    .local pmc newstring
    newstring = new 'String'
    newstring = 'storage attribute value'
    setattribute self, ['Zolar'], 'storage', newstring
.end
.namespace []

.sub can_not_add_same_parent_twice
    # the same parent can't be added twice
    .local pmc eh, parent_class, child_class
    parent_class = newclass 'Supervisor'
    child_class = newclass 'Employee'

try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch

    push_eh eh
    # attempt to add duplicate parent
    addparent child_class, parent_class
    addparent child_class, parent_class
    $I0 = 1 # addparent success flag
    goto finally

catch:
    $I0 = 0 # addparent failure flag

finally:
    pop_eh
    nok ($I0, 'attempt to duplicate parent throws exception')
.end

.sub can_not_be_own_parent
    # can't be own parent
    .local pmc eh, parent_class
    parent_class = newclass 'Frob'

try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch

    push_eh eh
    # attempt to create inheritance loop
    addparent parent_class, parent_class
    $I0 = 1 # addparent success flag
    goto finally

catch:
    $I0 = 0 # addparent failure flag

finally:
    pop_eh
    nok ($I0, 'attempt to create inheritance loop throws exception')
.end

.sub can_not_be_own_ancestor
    # can't be own grandparent
    .local pmc eh, parent_class, child_class
    parent_class = newclass 'Parent'
    child_class = subclass 'Parent', 'Child'

try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch

    push_eh eh
    # attempt to create inheritance loop
    addparent parent_class, child_class
    $I0 = 1 # addparent success flag
    goto finally

catch:
    $I0 = 0 # addparent failure flag

finally:
    pop_eh
    nok ($I0, 'attempt to create inheritance loop throws exception')
.end

.sub no_loop_in_hierarchy
    # can't create loop in hierarchy
    .local pmc eh, mutt_class, jeff_class
    mutt_class = newclass 'Mutt'
    jeff_class = newclass 'Jeff'

try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_addr eh, catch

    push_eh eh
    # attempt to create inheritance loop
    addparent jeff_class, mutt_class
    addparent mutt_class, jeff_class
    $I0 = 1 # addparent success flag
    goto finally

catch:
    $I0 = 0 # addparent failure flag

finally:
    pop_eh
    nok ($I0, 'attempt to create inheritance loop throws exception')
.end

.sub subclass_does_what_parent_does
    # subclass should do what the parent does
    does_pmc()
    does_subclass()
.end

.sub 'does_pmc'
    $P0 = get_class 'ResizablePMCArray'
    $I0 = does $P0, 'array'
    ok ($I0, 'PMC that provides array does array')
.end

.sub 'does_subclass'
    $P0 = subclass 'ResizablePMCArray', 'List'
    $I0 = does $P0, 'array'
    ok ($I0, 'subclass of PMC that provides array does array')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
