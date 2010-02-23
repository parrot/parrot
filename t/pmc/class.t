#! parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/class.t - test the Class PMC

=head1 SYNOPSIS

    % prove t/pmc/class.t

=head1 DESCRIPTION

Tests the Class PMC.

=cut


.const int TESTS = 63


.sub 'main' :main
     load_bytecode 'Test/More.pbc'
     .local pmc exporter, test_ns
     test_ns = get_namespace [ 'Test'; 'More' ]
     exporter = new ['Exporter']
     exporter.'import'( test_ns :named('source'), 'plan ok is isa_ok todo' :named('globals') )

     plan(TESTS)
     'new op'()
     'class flag'()
     'name'()
     'new method'()
     'attributes'()
     'add_attribute'()
     'set_attr/get_attr'()
     'add_method'()
     'parents'()
     'roles'()
     'inspect'()
     'clone'()
     'clone_pmc'()
     'new with init hash'()
     'isa'()
     'does'()
     'more does'()
     'anon_inherit'()
.end


# L<PDD15/Class PMC API/=item new>
.sub 'new op'
    .local pmc class
    .local int isa_class
    class = new ['Class']

    ok(1, "$P0 = new ['Class']")
    isa_ok(class, 'Class')
.end


# L<PDD15/Class PMC API/'Class PMCs also have the "I am a class" flag set on them.'>
.sub 'class flag'
    .local pmc class, class_flags_pmc
    .local int class_flags, class_flag_set
    .const int POBJ_IS_CLASS_FLAG = 536870912  # 1 << 29

    class = new ['Class']
    class_flags_pmc = inspect class, 'flags'
    class_flags = class_flags_pmc
    class_flag_set = class_flags & POBJ_IS_CLASS_FLAG
    ok(class_flag_set, 'Class PMC has "I am a class" flag set')
.end



# L<PDD15/Class PMC API/=item name>
.sub 'name'
    .local pmc class, result
    class = new ['Class']

    result = class.'name'()
    is(result, '', 'name() with no args returns class name, which is empty at first')

    class.'name'('Alex')
    result = class.'name'()
    is(result, 'Alex', 'name() with args sets class name')

    $I0 = 1        # hack for testing exceptions
    push_eh t_too_many_args
    class.'name'('Alice', 'Bob')
    $I0 = 0
    pop_eh

  t_too_many_args:
    ok($I0, 'name() with too many args fails')

    result = class.'get_namespace'()
    is(result, 'Alex', 'name() with args sets namespace too')
.end


# L<PDD15/Class PMC API/=item new>
.sub 'new method'
    .local pmc class, result, attrib
    .local int isa_object
    class = new ['Class']
    result = class.'new'()

    isa_ok(result, 'Object')

    $I0 = 1
    push_eh t_non_attribute_key
    result = class.'new'('abc' => '123' )
    $I0 = 0
    pop_eh

  t_non_attribute_key:
    ok($I0, 'new() with non-attribute key fails')

    $I0 = 1
    class = new ['Class']
    class.'add_attribute'('foo')
    class.'add_attribute'('bar')
    result = class.'new'('foo' => 1, 'bar' => 2)
    attrib = getattribute result, 'foo'
    if attrib != 1 goto nok_3
    attrib = getattribute result, 'bar'
    if attrib != 2 goto nok_3
    goto ok_3
  nok_3:
    $I0 = 0
  ok_3:
    ok($I0, 'new() with key/value pairs sets attributes')
.end


# L<PDD15/Class PMC API/=item attributes>
.sub 'attributes'
    .local pmc class, attribs
    .local int test_val
    class = new ['Class']
    attribs = class.'attributes'()
    test_val = isa attribs, 'Hash'

    ok(test_val, 'attributes() returns a Hash')

    test_val = attribs
    is(test_val, 0, 'New Class PMC has no attributes')

    $I0 = 1
    push_eh ok_ro_accessor
    attribs = class.'attributes'( 'foo' )
    $I0 = 0
    pop_eh

  ok_ro_accessor:
    ok($I0, 'attributes() is read-only accessor')
.end


# L<PDD15/Class PMC API/=item add_attribute>
.sub 'add_attribute'
    .local pmc class, attribs
    .local int test_val
    class = new ['Class']

    $I0 = 1
    push_eh t_no_args
    class.'add_attribute'()
    $I0 = 0
    pop_eh

  t_no_args:
    ok($I0, 'add_attribute() with no args fails')

    class.'add_attribute'( 'foo' )
    attribs = class.'attributes'()
    test_val = attribs
    is(test_val, 1, 'add_attribute() with valid single arg adds an attribute')

    class.'add_attribute'( 'bar', 'Integer' )
    attribs = class.'attributes'()
    test_val = attribs
    is(test_val, 2, 'add_attribute() with valid args adds an attribute')

    $I0 = 1
    push_eh t_existing_attribute
    class.'add_attribute'( 'foo', 'String' )
    $I0 = 0
    pop_eh

  t_existing_attribute:
    ok($I0, 'add_attribute() with existing attribute name fails')
.end


# L<PDD15/Class PMC API>
.sub 'set_attr/get_attr'
    .local pmc class, class_instance, attrib_in, attrib_out
    class = new ['Class']
    class.'name'("Test")
    class.'add_attribute'("foo")
    ok(1, 'created a class with one attribute')

    class_instance = class.'new'()
    ok(1, 'instantiated the class')

    attrib_in = new ['Integer']
    attrib_in = 42
    setattribute class_instance, "foo", attrib_in
    ok(1, 'set an attribute')

    attrib_out = getattribute class_instance, "foo"
    is(attrib_out, 42, 'got an attribute')
.end


# L<PDD15/Class PMC API/=item add_method>
.sub 'add_method'
    .local pmc class, attribs, test_attr_val, obj_inst
    .local int test_val
    class = new ['Class']

    $I0 = 1
    push_eh t_no_args
    class.'add_method'()
    $I0 = 0
    pop_eh

  t_no_args:
    ok($I0, 'add_method() with no args fails')

    $I0 = 1
    push_eh t_one_arg
    class.'add_method'( 'foo' )
    $I0 = 0
    pop_eh

  t_one_arg:
    ok($I0, 'add_method() with valid single arg fails')

    # note this test depends on 'add_attribute' and 'attributes'
    class.'add_attribute'( 'foo', 'String' )
    attribs = class.'attributes'()
    attribs['foo'] = 'bar'

    .const 'Sub' meth_to_add = 'foo'

    class.'add_method'( 'foo', meth_to_add )
    attribs = class.'methods'()
    test_val = attribs
    is(test_val, 1, 'add_method() one method added')

    test_val = exists attribs['foo']
    ok(test_val, 'add_method() method has correct name')

    test_val = defined attribs['foo']
    ok(test_val, 'add_method() method is defined')

    test_attr_val = attribs['foo']
    isa_ok(test_attr_val, 'Sub', 'add_method() with valid args adds a method')

    .local string test_string_val

    $I0 = 1
    push_eh t_class_meth
    test_string_val = class.'foo'()
    $I0 = 0
    pop_eh

    is(test_string_val, 'bar', 'add_method() invoking method added to class works')
t_class_meth:
    todo(0, 'add_method() invoking method added to class works', "classes don't seem to call methods yet")

    obj_inst = class.'new'()
    test_string_val = obj_inst.'foo'()
    is(test_string_val, 'bar', 'add_method() invoking method added to class through instance works')


    $I0 = 1
    push_eh t_existing_method
    class.'add_method'( 'foo' )
    $I0 = 0
    pop_eh

  t_existing_method:
    ok($I0, 'add_method() with existing method name fails')
.end

.sub 'foo' :method
    .return ('bar')
.end


# L<PDD15/Class PMC API/=item parents>
.sub 'parents'
    .local pmc class, parents
    .local int isa_parent
    class = new ['Class']
    parents = class.'parents'()

    ## XXX is this really what's expected?
    isa_ok(parents, 'ResizablePMCArray', 'parents() returns a ResizablePMCArray')
.end
## NOTE test that accessor is read-only
## NOTE figure out what parents the base Class has by default (if any)
## A: It has no parents by default. (Note, the parents stored in the 'parents'
# attribute aren't the parents of Class, they're the parents of the class object
# that is an instance of Class.)


## TODO add_parent


# L<PDD15/Class PMC API/=item roles>
.sub 'roles'
    .local pmc class, array
    .local int is_array
    class = new ['Class']
    array = class.'roles'()

    ## XXX is this really what's expected?
    isa_ok(array, 'ResizablePMCArray', 'roles() returns a ResizablePMCArray')
.end
## NOTE test that accessor is read-only
## NOTE figure out what roles the base Class has by default (if any)
# A: None. See comment for parents().


## TODO add_role


# L<PDD15/Class PMC API/=item inspect>
.sub 'inspect'
    .local pmc class, result
    .local int test_val

    class = new ['Class']
    class.'name'('foo')
    class.'add_attribute'('a')

    result = class.'inspect'()
    ok(1, 'inspect() with no args called returns successfully')

    test_val = elements result
    is(test_val, 7, 'inspect() returns correctly sized value')

    result = class.'inspect'('name')
    is(result, 'foo', 'inspect() "name" param returns expected value')

    result = class.'inspect'('attributes')
    test_val = elements result
    is(test_val, 1, 'inspect() "attributes" param returns correctly sized value')
.end
# TODO more tests


.sub 'clone'
    .local pmc attrs, class, class_instance, test_pmc
    .local string test_name
    .local int test_val

    attrs = new ['Hash']
    attrs['name'] = 'Monkey'
    class = new ['Class'], attrs
    class.'add_attribute'('banana')
    class_instance = class.'new'()
    ok(1, 'clone() created class Monkey and instantiated it')

    class_instance = clone class
    ok(1, 'cloned class Monkey')

    test_name = class_instance.'inspect'('name')
    is(test_name, '', 'clone() name is empty')

    test_pmc = class_instance.'inspect'('namespace')
    $I0 = isnull test_pmc
    ok($I0, 'clone() namespace is null')

    test_pmc = class_instance.'inspect'('attributes')
    test_val = elements test_pmc
    is(test_val, 1, 'clone() attribute survived cloning')

    class_instance.'add_attribute'('jungle')
    ok(1, 'clone() can modify cloned class')
.end


.sub 'clone_pmc'
    .local pmc class, class_instance, monkey, mandrill, test_ns
    .local string test_string_val
    .local int num_elems

    class = new ['Hash']
    class['name'] = 'Monkey2'
    class_instance = new ['Class'], class
    class_instance.'add_attribute'('banana')
    monkey = class_instance.'new'()
    ok(1, 'clone_pmc() created class Monkey and instantiated it')

    class = new ['Hash']
    class['name'] = 'Mandrill'
    mandrill = clone class_instance, class
    ok(1, 'clone_pmc() cloned class Monkey with Hash argument')

    test_string_val = mandrill.'inspect'('name')
    is(test_string_val, 'Mandrill', 'clone_pmc() name is new one set in the Hash')

    test_ns = mandrill.'inspect'('namespace')
    test_string_val = test_ns
    is(test_string_val, 'Mandrill', 'clone_pmc() namespace is Mandrill too')

    test_ns = mandrill.'inspect'('attributes')
    num_elems = elements test_ns
    is(num_elems, 1, 'clone_pmc() attribute survived cloning')

    mandrill.'add_attribute'('jungle')
    ok(1, 'clone_pmc() can modify cloned class')
.end


.sub 'new with init hash'
    .local pmc class, init_hash, attrs, methods, meth_to_add, class_instance
    .local pmc attr_val, result
    init_hash = new ['Hash']

    # We'll have some attributes...
    attrs = new ['ResizablePMCArray']
    attrs[0] = 'x'
    attrs[1] = 'y'
    init_hash['attributes'] = attrs

    # And a method.
    methods = new ['Hash']
    meth_to_add = get_global 'add'
    methods['add'] = meth_to_add
    init_hash['methods'] = methods

    class = new ['Class'], init_hash
    ok(1, 'new() created new class with attributes and methods supplied')

    # Instantiate and try setting each attribute.
    class_instance = class.'new'()
    attr_val = new ['Integer']
    attr_val = 37
    setattribute class_instance, 'x', attr_val
    ok(1, 'new() set first attribute')

    attr_val = new ['Integer']
    attr_val = 5
    setattribute class_instance, 'y', attr_val
    ok(1, 'new() set second attribute')

    # Call method.
    result = class_instance.'add'()
    is(result, 42, 'new() added method returns expected value')
.end

.sub add :method
    $P0 = getattribute self, "x"
    $P1 = getattribute self, "y"
    $P2 = new ['Integer']
    $P2 = $P0 + $P1
    .return($P2)
.end


# L<PDD15/Class PMC API/=item isa>
.sub 'isa'
    .local pmc class
    class = new ['Class']

    test_isa( class, 'Class', 1 )
    test_isa( class, 'Hash',  0 )
    test_isa( class, 'Foo',   0 )
.end

.sub 'test_isa'
    .param pmc    obj
    .param string class
    .param int expected
    .local int isa_class
    .local string message

    $I0 = 0
    message = 'isa() '

    isa_class = obj.'isa'( class )
    if isa_class goto is_class
    message .= "The object isn't a "
    message .= class
    goto test

  is_class:
    $I0 = 1
    message .= "The object is a "
    message .= class

  test:
    is($I0, expected, message)
    .return()
.end


# L<PDD15/Class PMC API/=item does>
.sub 'does'
    .local pmc class
    .local pmc attrs
    attrs = new ['Hash']

    .local pmc red, green, blue
    attrs['name'] = 'Red'
    red           = new ['Role'], attrs

    attrs['name'] = 'Green'
    green         = new ['Role'], attrs

    attrs['name'] = 'Blue'
    blue          = new ['Role'], attrs

    green.'add_role'( blue )

    .local pmc color
    color = new ['Class']

    test_does( color, 'Red', 0 )

    color.'add_role'( red )
    test_does( color, 'Red', 1 )

    color.'add_role'( green )
    test_does( color, 'Green', 1 )
    test_does( color, 'Blue', 1 )

    test_does( color, 'Class', 1 )
.end

.sub 'test_does'
    .param pmc    obj
    .param string role_name
    .param int expected
    .local int does_a_role
    .local string message

    $I0 = 0
    message = 'does() '

    does_a_role = obj.'does'( role_name )
    if does_a_role goto does_role
    message .= "The object doesn't "
    message .= role_name
    goto test

  does_role:
    $I0 = 1
    message .= "The object does "
    message .= role_name

  test:
    is($I0, expected, message)
    .return()
.end


# L<PDD15/Class PMC API/=item does>
.sub 'more does'
    .local pmc attrs
    attrs = new ['Hash']

    .local pmc red, green, blue
    attrs['name'] = 'Red'
    red           = new ['Role'], attrs

    attrs['name'] = 'Green'
    green         = new ['Role'], attrs

    attrs['name'] = 'Blue'
    blue          = new ['Role'], attrs

    green.'add_role'( blue )

    .local pmc color
    color = new ['Class']

    $S0 = 'Red'
    $I0 = color.'does'($S0)
    is($I0, 0, 'does not Red')

    color.'add_role'( red )
    $I0 = color.'does'($S0)
    is($I0, 1, 'does Red')
.end

.sub 'anon_inherit'
    $P0 = new 'Class'
    $P1 = new 'Class'
    $P2 = new 'Class'
    addparent $P2, $P0
    addparent $P2, $P1
    ok(1, 'inheritance of two different anonymous classes works')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
