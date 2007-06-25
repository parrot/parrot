#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 17;

=head1 NAME

t/pmc/class.t - test the Class PMC

=head1 SYNOPSIS

    % prove t/pmc/class.t

=head1 DESCRIPTION

Tests the Class PMC.

=cut

# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    .local pmc class
    .local int isa_class
    new class, .Class
    say 'ok 1 - $P0 = new .Class'

    isa_class = isa class, 'Class'
    if isa_class goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'Class'"
.end
CODE
ok 1 - $P0 = new .Class
ok 2 - isa $P0, 'Class'
OUT

# L<PDD15/Class PMC API/'Class PMCs also have the "I am a class" flag set on them.'>
pir_output_is( <<'CODE', <<'OUT', 'Class PMC has "I am a class" flag set' );
.include 'pmcinfo.pasm'

.sub 'test' :main
    .local pmc class
    .local int class_flags, class_flag_set
    .const int POBJ_IS_CLASS_FLAG = 536870912  # 1 << 29

    new class, .Class
    class_flags = pmcinfo class, .PMCINFO_FLAGS    # XXX op currently experimental
    class_flag_set = class_flags & POBJ_IS_CLASS_FLAG
    if class_flag_set goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - Class PMC has "I am a class" flag set'
.end
CODE
ok 1 - Class PMC has "I am a class" flag set
OUT

# L<PDD15/Class PMC API/=item name>
pir_output_is( <<'CODE', <<'OUT', 'name' );
.sub 'test' :main
    .local pmc class, result
    new class, .Class
    result = class.'name'()
    if result == '' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - name() with no args returns class name, which is empty at first'

    class.'name'('Alex')
    result = class.'name'()
    if result == 'Alex' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - name() with args sets class name'

    push_eh ok_3
    class.'name'('Alice', 'Bob')
    clear_eh

    print 'not '
  ok_3:
    say 'ok 3 - name() with too many args fails'

    result = class.'pmc_namespace'()
    if result == 'Alex' goto ok_4
    print 'not '
ok_4:
    say 'ok 4 - name() with args sets namespace too'
.end
CODE
ok 1 - name() with no args returns class name, which is empty at first
ok 2 - name() with args sets class name
ok 3 - name() with too many args fails
ok 4 - name() with args sets namespace too
OUT

# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    .local pmc class, result, attrib
    .local int isa_object
    new class, .Class
    result = class.'new'()
    isa_object = isa result, 'Object'
    if isa_object goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - new() with no args returns an object'

    push_eh ok_2
    result = class.'new'('abc' => '123' )
    clear_eh
    print 'not '
  ok_2:
    say 'ok 2 - new() with non-attribute key fails'

    class = new .Class
    class.'add_attribute'('foo')
    class.'add_attribute'('bar')
    result = class.'new'('foo' => 1, 'bar' => 2)
    attrib = getattribute result, 'foo'
    if attrib != 1 goto nok_3
    attrib = getattribute result, 'bar'
    if attrib != 2 goto nok_3
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - new() with key/value pairs sets attributes'
.end
CODE
ok 1 - new() with no args returns an object
ok 2 - new() with non-attribute key fails
ok 3 - new() with key/value pairs sets attributes
OUT

# L<PDD15/Class PMC API/=item attributes>
pir_output_is( <<'CODE', <<'OUT', 'attributes' );
.sub 'test' :main
    .local pmc class, attribs
    .local int test_val
    new class, .Class
    attribs = class.'attributes'()
    test_val = isa attribs, 'Hash'
    if test_val goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - attributes() returns a Hash'

    test_val = attribs
    if test_val == 0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - New Class PMC has no attributes'

    push_eh ok_3
    attribs = class.'attributes'( 'foo' )
    clear_eh

    print 'not '
    goto ok_3
  ok_3:
    say 'ok 3 - attributes() is read-only accessor'
.end
CODE
ok 1 - attributes() returns a Hash
ok 2 - New Class PMC has no attributes
ok 3 - attributes() is read-only accessor
OUT
## Q: what attributes does the base Class have by default?
## A: it has no attributes by default

# L<PDD15/Class PMC API/=item add_attribute>
pir_output_is( <<'CODE', <<'OUT', 'add_attribute' );
.sub 'test' :main
    .local pmc class, attribs
    .local int test_val
    new class, .Class

    push_eh ok_1
    class.'add_attribute'()
    clear_eh

    print 'not '
  ok_1:
    say 'ok 1 - add_attribute() with no args fails'

    class.'add_attribute'( 'foo' )
    attribs = class.'attributes'()
    test_val = attribs
    if test_val == 1 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - add_attribute() with valid single arg adds an attribute'

    class.'add_attribute'( 'bar', 'Integer' )
    attribs = class.'attributes'()
    test_val = attribs
    if test_val == 2 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - add_attribute() with valid args adds an attribute'

    push_eh ok_4
    class.'add_attribute'( 'foo', 'String' )
    clear_eh

    print 'not '
  ok_4:
    say 'ok 4 - add_attribute() with existing attribute name fails'
.end
CODE
ok 1 - add_attribute() with no args fails
ok 2 - add_attribute() with valid single arg adds an attribute
ok 3 - add_attribute() with valid args adds an attribute
ok 4 - add_attribute() with existing attribute name fails
OUT
## Q: should adding an attribute with an invalid type name fail?
## A: since type compatibility checks does, you could specify a type
# that isn't registered as a class/role. So, no, I don't think it should try to
# validate types.

## NOTE i think this belongs in the Object PMC tests
# L<PDD15/Class PMC API>
pir_output_is( <<'CODE', <<'OUT', 'set_attr/get_attr VTABLE methods' );
.sub 'test' :main
    .local pmc class, class_instance, attrib_in, attrib_out
    new class, .Class
    class.'name'("Test")
    class.'add_attribute'("foo")
    say 'ok 1 - created a class with two attributes'

    class_instance = class.'new'()
    say 'ok 2 - instantiated the class'

    attrib_in = new Integer
    attrib_in = 42
    setattribute class_instance, "foo", attrib_in
    say 'ok 3 - set an attribute'

    attrib_out = getattribute class_instance, "foo"
    print attrib_out
    print "\n"
    say 'ok 4 - got an attribute'
.end
CODE
ok 1 - created a class with two attributes
ok 2 - instantiated the class
ok 3 - set an attribute
42
ok 4 - got an attribute
OUT


# L<PDD15/Class PMC API/=item add_method>
pir_output_is( <<'CODE', <<'OUT', 'add_method', todo => 'not yet implemented' );
.sub 'test' :main
    .local pmc class, attribs, meth_to_add, test_attr_val
    .local int test_val
    new class, .Class

    push_eh ok_1
    class.'add_method'()
    clear_eh

    print 'not '
  ok_1:
    say 'ok 1 - add_method() with no args fails'

    push_eh ok_2
    class.'add_method'( 'foo' )
    clear_eh

    print 'not '
  ok_2:
    say 'ok 2 - add_method() with valid single arg fails'

    # note this test depends on 'add_attribute'/'attributes'
    class.'add_attribute'( 'foo', 'String' )
    attribs = class.'attributes'()
    attribs['foo'] = 'bar'

    .const .Sub meth_to_add = 'foo'

    class.'add_method'( 'foo', meth_to_add )
    attribs = class.'methods'()
    test_val = attribs
    if test_val != 1 goto nok_3
    test_val = exists attribs['foo']
    if test_val != 1 goto nok_3
    test_val = defined attribs['foo']
    test_attr_val = attribs['foo']
    test_val = isa test_attr_val, 'Sub'
    if test_val != 1 goto nok_3
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - add_method() with valid args adds a method'

    .local string test_string_val

    test_string_val = class.'foo'()
    if test_string_val == 'bar' goto ok_4
    print 'not '
  ok_4:
    say 'ok 4 - invoking method added to class works'

    push_eh ok_5
    class.'add_method'( 'foo' )
    clear_eh

    print 'not '
  ok_5:
    say 'ok 5 - add_method() with existing method name fails'
.end

.sub 'foo' :method
    .return ('foo')
.end


CODE
ok 1 - add_method() with no args fails
ok 2 - add_method() with valid single arg fails
ok 3 - add_method() with valid args adds a method
ok 4 - invoking method added to class works
ok 5 - add_method() with existing method name fails
OUT


# L<PDD15/Class PMC API/=item parents>
pir_output_is( <<'CODE', <<'OUT', 'parents' );
.sub 'test' :main
    .local pmc class, parents
    .local int isa_parent
    new class, .Class
    parents = class.'parents'()
    isa_parent = isa parents, 'ResizablePMCArray'  ## XXX really?
    if isa_parent goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - parents() returns a ResizablePMCArray'
.end
CODE
ok 1 - parents() returns a ResizablePMCArray
OUT
## NOTE test that accessor is read-only
## NOTE figure out what parents the base Class has by default (if any)
## A: It has no parents by default. (Note, the parents stored in the 'parents'
# attribute aren't the parents of Class, they're the parents of the class object
# that is an instance of Class.)

## TODO add_parent

# L<PDD15/Class PMC API/=item roles>
pir_output_is( <<'CODE', <<'OUT', 'roles' );
.sub 'test' :main
    .local pmc class, array
    .local int is_array
    new class, .Class
    array = class.'roles'()
    is_array = isa array, 'ResizablePMCArray'  ## XXX really?
    if is_array goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - roles() returns a ResizablePMCArray'
.end
CODE
ok 1 - roles() returns a ResizablePMCArray
OUT
## NOTE test that accessor is read-only
## NOTE figure out what roles the base Class has by default (if any)
# A: None. See comment for parents().

## TODO add_role

# L<PDD15/Class PMC API/=item inspect>
pir_output_is( <<'CODE', <<'OUT', 'inspect PCCMETHOD' );
.sub 'test' :main
    .local pmc class, result
    .local int test_val

    class = new 'Class'
    class.name('foo')
    class.add_attribute('a')

    result = class.inspect()
    print "ok 1 - inspect with no args called\n"

    test_val = elements result
    if test_val == 6 goto ok_2
    print "not "
ok_2:
    print "ok 2 - returned hash had correct number of elements\n"

    result = class.inspect('name')
    say result
    print "ok 3 - inspect('name')\n"

    result = class.inspect('attributes')
    test_val = elements result
    if test_val == 1 goto ok_4
    print "not "
ok_4:
    print "ok 4 - inspect('attributes')\n"
.end
CODE
ok 1 - inspect with no args called
ok 2 - returned hash had correct number of elements
foo
ok 3 - inspect('name')
ok 4 - inspect('attributes')
OUT

pir_output_is( <<'CODE', <<'OUT', 'clone' );
.sub 'test' :main
    .local pmc attrs, class, class_instance, test_pmc
    .local string test_name
    .local int test_val

    attrs = new 'Hash'
    attrs['name'] = 'Monkey'
    class = new 'Class', attrs
    class.add_attribute('banana')
    class_instance = class.'new'()
    print "ok 1 - created class Monkey and instantiated it\n"

    class_instance = clone class
    print "ok 2 - cloned class Monkey\n"

    test_name = class_instance.'inspect'('name')
    if test_name == "" goto ok_3
    print "not "
ok_3:
    print "ok 3 - name is empty\n"

    test_pmc = class_instance.'inspect'('namespace')
    if null test_pmc goto ok_4
    print "not "
ok_4:
    print "ok 4 - namespace is null\n"

    test_pmc = class_instance.'inspect'('attributes')
    test_val = elements test_pmc
    if test_val == 1 goto ok_5
    print "not "
ok_5:
    print "ok 5 - attribute survived cloning\n"

    class_instance.add_attribute('jungle')
    print "ok 6 - can modify cloned class\n"
.end
CODE
ok 1 - created class Monkey and instantiated it
ok 2 - cloned class Monkey
ok 3 - name is empty
ok 4 - namespace is null
ok 5 - attribute survived cloning
ok 6 - can modify cloned class
OUT

pir_output_is( <<'CODE', <<'OUT', 'clone_pmc' );
.sub 'test' :main
    .local pmc class, class_instance, monkey, mandrill, test_ns
    .local string test_string_val
    .local int num_elems

    class = new 'Hash'
    class['name'] = 'Monkey'
    class_instance = new 'Class', class
    class_instance.add_attribute('banana')
    monkey = class_instance.'new'()
    print "ok 1 - created class Monkey and instantiated it\n"

    class = new 'Hash'
    class['name'] = 'Mandrill'
    mandrill = clone class_instance, class
    print "ok 2 - cloned class Monkey with Hash argument\n"

    test_string_val = mandrill.'inspect'('name')
    if test_string_val == "Mandrill" goto ok_3
    print "not "
ok_3:
    print "ok 3 - name is new one set in the Hash\n"

    test_ns = mandrill.'inspect'('namespace')
    test_string_val = test_ns
    if test_string_val == 'Mandrill' goto ok_4
    print "not "
ok_4:
    print "ok 4 - namespace is Mandrill too\n"

    test_ns = mandrill.'inspect'('attributes')
    num_elems = elements test_ns
    if num_elems == 1 goto ok_5
    print "not "
ok_5:
    print "ok 5 - attribute survived cloning\n"

    mandrill.add_attribute('jungle')
    print "ok 6 - can modify cloned class\n"
.end
CODE
ok 1 - created class Monkey and instantiated it
ok 2 - cloned class Monkey with Hash argument
ok 3 - name is new one set in the Hash
ok 4 - namespace is Mandrill too
ok 5 - attribute survived cloning
ok 6 - can modify cloned class
OUT

pir_output_is( <<'CODE', <<'OUT', 'new with initialization hash' );
.sub 'test' :main
    .local pmc class, init_hash, attrs, methods, meth_to_add, class_instance
    .local pmc attr_val, result
    init_hash = new 'Hash'

    # We'll have some attributes...
    attrs = new 'ResizablePMCArray'
    attrs[0] = 'x'
    attrs[1] = 'y'
    init_hash['attributes'] = attrs

    # And a method.
    methods = new 'Hash'
    meth_to_add = find_global 'add'
    methods['add'] = meth_to_add
    init_hash['methods'] = methods

    class = new 'Class', init_hash
    print "ok 1 - created new class with attributes and methods supplied\n"

    # Instantiate and try setting each attribute.
    class_instance = class.'new'()
    attr_val = new 'Integer'
    attr_val = 37
    setattribute class_instance, 'x', attr_val
    print "ok 2 - set first attribute\n"
    attr_val = new 'Integer'
    attr_val = 5
    setattribute class_instance, 'y', attr_val
    print "ok 3 - set second attribute\n"

    # Call method.
    result = class_instance.add()
    print result
    print "\nok 4 - called method\n"
.end


.sub add :method
    $P0 = getattribute self, "x"
    $P1 = getattribute self, "y"
    $P2 = new 'Integer'
    $P2 = $P0 + $P1
    .return($P2)
.end
CODE
ok 1 - created new class with attributes and methods supplied
ok 2 - set first attribute
ok 3 - set second attribute
42
ok 4 - called method
OUT

# L<PDD15/Class PMC API/=item isa>
pir_output_is( <<'CODE', <<'OUT', 'isa()' );
.sub 'test' :main
    .local pmc class
    new class, .Class

    test_isa( class, 'Class' )
    test_isa( class, 'Hash' )
    test_isa( class, 'Foo' )
.end

.sub 'test_isa'
    .param pmc    obj
    .param string class
    .local int isa_class

    isa_class = obj.'isa'( class )
    if isa_class goto is_class
    print "Not a "
    print class
    print "\n"
    .return()

  is_class:
    print "Is a "
    print class
    print "\n"

    .return()
.end
CODE
Is a Class
Not a Hash
Not a Foo
OUT

# L<PDD15/Class PMC API/=item does>
pir_output_is( <<'CODE', <<'OUT', 'does()' );
.sub 'test' :main
    .local pmc class
    .local pmc attrs
    attrs = new 'Hash'

    .local pmc red, green, blue
    attrs['name'] = 'Red'
    red           = new 'Role', attrs

    attrs['name'] = 'Green'
    green         = new 'Role', attrs

    attrs['name'] = 'Blue'
    blue          = new 'Role', attrs

    green.'add_role'( blue )

    .local pmc color
    color = new 'Class'

    test_does( color, 'Red' )

    color.'add_role'( red )
    test_does( color, 'Red' )

    color.'add_role'( green )
    test_does( color, 'Green' )
    test_does( color, 'Blue' )

    test_does( color, 'Class' )
.end

.sub 'test_does'
    .param pmc    obj
    .param string role_name
    .local int does_a_role

    does_a_role = obj.'does'( role_name )
    if does_a_role goto does_role
    print "Doesn't "
    print role_name
    print "\n"
    .return()

  does_role:
    print "Does "
    print role_name
    print "\n"

    .return()
.end
CODE
Doesn't Red
Does Red
Does Green
Does Blue
Does Class
OUT

# L<PDD15/Class PMC API/=item does>
pir_output_is( <<'CODE', <<'OUT', 'more does() - RT #42974' );
.const int TESTS = 2

.sub 'main' :main
    load_bytecode 'Test/More.pir'
    .local pmc exp, test_ns
    test_ns = get_namespace ['Test::More']
    exp     = new 'Exporter'
    exp.'source'(test_ns)
    exp.'import'('plan ok is diag isa_ok' :named('globals'))

    plan(TESTS)

    .local pmc attrs
    attrs = new 'Hash'

    .local pmc red, green, blue
    attrs['name'] = 'Red'
    red           = new 'Role', attrs

    attrs['name'] = 'Green'
    green         = new 'Role', attrs

    attrs['name'] = 'Blue'
    blue          = new 'Role', attrs

    green.'add_role'( blue )

    .local pmc color
    color = new 'Class'

    $S0 = 'Red'
    $I0 = color.'does'($S0)
    is($I0, 0, 'does not Red')

    color.'add_role'( red )
    $I0 = color.'does'($S0)
    is($I0, 1, 'does Red')
.end
CODE
1..2
ok 1 - does not Red
ok 2 - does Red
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
