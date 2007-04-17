#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 14;

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
    new $P0, .Class
    say 'ok 1 - $P0 = new .Class'

    $I0 = isa $P0, 'Class'
    if $I0 goto ok_2
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
    .const int POBJ_IS_CLASS_FLAG = 536870912  # 1 << 29

    new $P0, .Class
    $I0 = pmcinfo $P0, .PMCINFO_FLAGS          # XXX op currently experimental
    $I99 = $I0 & POBJ_IS_CLASS_FLAG
    if $I99 goto ok_1
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
    new $P0, .Class
    $P1 = $P0.'name'()
    if $P1 == '' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - name() with no args returns class name, which is empty at first'

    $P0.'name'('Alex')
    $P1 = $P0.'name'()
    if $P1 == 'Alex' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - name() with args sets class name'

    push_eh ok_3
    $P0.'name'('Alice', 'Bob')
    clear_eh

    print 'not '
  ok_3:
    say 'ok 3 - name() with too many args fails'

    $P1 = $P0.'namespace'()
    if $P1 == 'Alex' goto ok_4
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
    new $P0, .Class
    $P1 = $P0.'new'()
    $I0 = isa $P1, 'Object'
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - new() with no args returns an object'

    push_eh ok_2
    $P1 = $P0.'new'('abc' => '123' )
    clear_eh
    print 'not '
  ok_2:
    say 'ok 2 - new() with non-attribute key fails'

    $P0 = new .Class
    $P0.'add_attribute'('foo')
    $P0.'add_attribute'('bar')
    $P1 = $P0.'new'('foo' => 1, 'bar' => 2)
    $P2 = getattribute $P1, 'foo'
    say $P2
    $P2 = getattribute $P1, 'bar'
    say $P2
    say 'ok 3 - new() with key/value pairs sets attributes'
.end
CODE
ok 1 - new() with no args returns an object
ok 2 - new() with non-attribute key fails
1
2
ok 3 - new() with key/value pairs sets attributes
OUT

# L<PDD15/Class PMC API/=item attributes>
pir_output_is( <<'CODE', <<'OUT', 'attributes' );
.sub 'test' :main
    new $P0, .Class
    $P1 = $P0.'attributes'()
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
    $P1 = $P0.'attributes'( 'foo' )
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
    new $P0, .Class

    push_eh ok_1
    $P0.'add_attribute'()
    clear_eh

    print 'not '
  ok_1:
    say 'ok 1 - add_attribute() with no args fails'

    $P0.'add_attribute'( 'foo' )
    $P1 = $P0.'attributes'()
    $I0 = $P1
    if $I0 == 1 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - add_attribute() with valid single arg adds an attribute'

    $P0.'add_attribute'( 'bar', 'Integer' )
    $P1 = $P0.'attributes'()
    $I0 = $P1
    if $I0 == 2 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - add_attribute() with valid args adds an attribute'

    push_eh ok_4
    $P0.'add_attribute'( 'foo', 'String' )
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
    new $P0, .Class
    $P0.'name'("Test")
    $P0.'add_attribute'("foo")
    say 'ok 1 - created a class with two attributes'

    $P1 = $P0.'new'()
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

# L<PDD15/Class PMC API/=item parents>
pir_output_is( <<'CODE', <<'OUT', 'parents' );
.sub 'test' :main
    new $P0, .Class
    $P1 = $P0.'parents'()
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
    new $P0, .Class
    $P1 = $P0.'roles'()
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
    $P0 = new 'Class'
    $P0.name('foo')
    $P0.add_attribute('a')

    $P1 = $P0.inspect()
    print "ok 1 - inspect with no args called\n"

    $I0 = elements $P1
    if $I0 == 6 goto ok_2
    print "not "
ok_2:
    print "ok 2 - returned hash had correct number of elements\n"

    $P1 = $P0.inspect('name')
    say $P1
    print "ok 3 - inspect('name')\n"

    $P1 = $P0.inspect('attributes')
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
    $P0 = new 'Hash'
    $P0['name'] = 'Monkey'
    $P1 = new 'Class', $P0
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
    $P0 = new 'Hash'
    $P0['name'] = 'Monkey'
    $P1 = new 'Class', $P0
    $P1.add_attribute('banana')
    $P2 = $P1.'new'()
    print "ok 1 - created class Monkey and instantiated it\n"

    $P0 = new 'Hash'
    $P0['name'] = 'Mandrill'
    $P3 = clone $P1, $P0
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
    $P0 = new 'Hash'

    # We'll have some attributes...
    $P1 = new 'ResizablePMCArray'
    $P1[0] = 'x'
    $P1[1] = 'y'
    $P0['attributes'] = $P1

    # And a method.
    $P1 = new 'Hash'
    $P2 = find_global 'add'
    $P1['add'] = $P2
    $P0['methods'] = $P1

    $P1 = new 'Class', $P0
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
    new $P0, .Class

    test_isa( $P0, 'Class' )
    test_isa( $P0, 'Hash' )
    test_isa( $P0, 'Foo' )
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
