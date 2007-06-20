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
    .local pmc class
    new class, .Class
    $P1 = class.'attributes'()
    $I0 = isa $P1, 'Hash'
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - attributes() returns a Hash'

    $I0 = $P1
    if $I0 == 0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - New Class PMC has no attributes'

    push_eh ok_3
    $P1 = class.'attributes'( 'foo' )
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
    .local pmc class
    new class, .Class

    push_eh ok_1
    class.'add_attribute'()
    clear_eh

    print 'not '
  ok_1:
    say 'ok 1 - add_attribute() with no args fails'

    class.'add_attribute'( 'foo' )
    $P1 = class.'attributes'()
    $I0 = $P1
    if $I0 == 1 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - add_attribute() with valid single arg adds an attribute'

    class.'add_attribute'( 'bar', 'Integer' )
    $P1 = class.'attributes'()
    $I0 = $P1
    if $I0 == 2 goto ok_3
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
    .local pmc class
    new class, .Class
    class.'name'("Test")
    class.'add_attribute'("foo")
    say 'ok 1 - created a class with two attributes'

    $P1 = class.'new'()
    say 'ok 2 - instantiated the class'

    $P2 = new Integer
    $P2 = 42
    setattribute $P1, "foo", $P2
    say 'ok 3 - set an attribute'

    $P3 = getattribute $P1, "foo"
    print $P3
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
    .local pmc class
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
    $P1 = class.'attributes'()
    $P1['foo'] = 'bar'

    .const .Sub $P99 = 'foo'

    class.'add_method'( 'foo', $P99 )
    $P1 = class.'methods'()
    $I0 = $P1
    if $I0 != 1 goto nok_3
    $I0 = exists $P1['foo']
    if $I0 != 1 goto nok_3
    $I0 = defined $P1['foo']
    $P2 = $P1['foo']
    $I0 = isa $P2, 'Sub'
    if $I0 != 1 goto nok_3
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - add_method() with valid args adds a method'

    $S0 = class.'foo'()
    if $S0 == 'bar' goto ok_4
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
    .local pmc class
    new class, .Class
    $P1 = class.'parents'()
    $I0 = isa $P1, 'ResizablePMCArray'  ## XXX really?
    if $I0 goto ok_1
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
    .local pmc class
    new class, .Class
    $P1 = class.'roles'()
    $I0 = isa $P1, 'ResizablePMCArray'  ## XXX really?
    if $I0 goto ok_1
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
    .local pmc class
    class = new 'Class'
    class.name('foo')
    class.add_attribute('a')

    $P1 = class.inspect()
    print "ok 1 - inspect with no args called\n"

    $I0 = elements $P1
    if $I0 == 6 goto ok_2
    print "not "
ok_2:
    print "ok 2 - returned hash had correct number of elements\n"

    $P1 = class.inspect('name')
    say $P1
    print "ok 3 - inspect('name')\n"

    $P1 = class.inspect('attributes')
    $I0 = elements $P1
    if $I0 == 1 goto ok_4
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
    .local pmc class
    class = new 'Hash'
    class['name'] = 'Monkey'
    $P1 = new 'Class', class
    $P1.add_attribute('banana')
    $P2 = $P1.'new'()
    print "ok 1 - created class Monkey and instantiated it\n"

    $P3 = clone $P1
    print "ok 2 - cloned class Monkey\n"

    $S1 = $P3.'inspect'('name')
    if $S1 == "" goto ok_3
    print "not "
ok_3:
    print "ok 3 - name is empty\n"

    $P4 = $P3.'inspect'('namespace')
    if null $P4 goto ok_4
    print "not "
ok_4:
    print "ok 4 - namespace is null\n"

    $P4 = $P3.'inspect'('attributes')
    $I0 = elements $P4
    if $I0 == 1 goto ok_5
    print "not "
ok_5:
    print "ok 5 - attribute survived cloning\n"

    $P3.add_attribute('jungle')
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
    .local pmc class
    class = new 'Hash'
    class['name'] = 'Monkey'
    $P1 = new 'Class', class
    $P1.add_attribute('banana')
    $P2 = $P1.'new'()
    print "ok 1 - created class Monkey and instantiated it\n"

    class = new 'Hash'
    class['name'] = 'Mandrill'
    $P3 = clone $P1, class
    print "ok 2 - cloned class Monkey with Hash argument\n"

    $S1 = $P3.'inspect'('name')
    if $S1 == "Mandrill" goto ok_3
    print "not "
ok_3:
    print "ok 3 - name is new one set in the Hash\n"

    $P4 = $P3.'inspect'('namespace')
    $S1 = $P4
    if $S1 == 'Mandrill' goto ok_4
    print "not "
ok_4:
    print "ok 4 - namespace is Mandrill too\n"

    $P4 = $P3.'inspect'('attributes')
    $I0 = elements $P4
    if $I0 == 1 goto ok_5
    print "not "
ok_5:
    print "ok 5 - attribute survived cloning\n"

    $P3.add_attribute('jungle')
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
    .local pmc class
    class = new 'Hash'

    # We'll have some attributes...
    $P1 = new 'ResizablePMCArray'
    $P1[0] = 'x'
    $P1[1] = 'y'
    class['attributes'] = $P1

    # And a method.
    $P1 = new 'Hash'
    $P2 = find_global 'add'
    $P1['add'] = $P2
    class['methods'] = $P1

    $P1 = new 'Class', class
    print "ok 1 - created new class with attributes and methods supplied\n"

    # Instantiate and try setting each attribute.
    $P2 = $P1.'new'()
    $P3 = new 'Integer'
    $P3 = 37
    setattribute $P2, 'x', $P3
    print "ok 2 - set first attribute\n"
    $P3 = new 'Integer'
    $P3 = 5
    setattribute $P2, 'y', $P3
    print "ok 3 - set second attribute\n"

    # Call method.
    $P3 = $P2.add()
    print $P3
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

    $I0 = obj.'isa'( class )
    if $I0 goto is_class
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

    $I0 = obj.'does'( role_name )
    if $I0 goto does_role
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
