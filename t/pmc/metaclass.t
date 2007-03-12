#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/pmc/metaclass.t - test the MetaClass PMC

=head1 SYNOPSIS

    % prove t/pmc/metaclass.t

=head1 DESCRIPTION

Tests the MetaClass PMC.

=cut


## TODO PDD says 'Class', impl says 'MetaClass'
## i'm testing the impl, cause that's more fun


# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, .MetaClass
    say 'ok 1 - $P0 = new .MetaClass'

    $I0 = isa $P0, 'MetaClass'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'MetaClass'"
.end
CODE
ok 1 - $P0 = new .MetaClass
ok 2 - isa $P0, 'MetaClass'
OUT

# L<PDD15/Class PMC API/'Class PMCs also have the "I am a class" flag set on them.'>
pir_output_is( <<'CODE', <<'OUT', 'Class PMC has "I am a class" flag set' );
.include 'pmcinfo.pasm'

.sub 'test' :main
    .const int POBJ_IS_CLASS_FLAG = 536870912  # 1 << 29

    new $P0, .MetaClass
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
    new $P0, .MetaClass
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

.end
CODE
ok 1 - name() with no args returns class name, which is empty at first
ok 2 - name() with args sets class name
ok 3 - name() with too many args fails
OUT


# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'new'()
    $I0 = isa $P1, 'Object'
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - new() with no args returns an object'

    $P1 = $P0.'new'('abc' => '123' )
    $I0 = isa $P1, 'Object'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - new() with args returns an object'
.end
CODE
ok 1 - new() with no args returns an object
ok 2 - new() with args returns an object
OUT
## test what's set in the object by .'new'() in t/pmc/object.t
## XXX Second test here should probably fail if the class has no abc attribute


# L<PDD15/Class PMC API/=item attributes>
pir_output_is( <<'CODE', <<'OUT', 'attributes' );
.sub 'test' :main
    new $P0, .MetaClass
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
## Q: what attributes the base Class have by default?


# L<PDD15/Class PMC API/=item add_attribute>
pir_output_is( <<'CODE', <<'OUT', 'add_attribute' );
.sub 'test' :main
    new $P0, .MetaClass

    push_eh ok_1
    $P0.'add_attribute'()
    clear_eh

    print 'not '
  ok_1:
    say 'ok 1 - add_attribute() with no args fails'

    push_eh ok_2
    $P0.'add_attribute'( 'foo', 'bar' )
    clear_eh

    print 'not '
  ok_2:
    say 'ok 2 - add_attribute() with unknown type fails'

    $P0.'add_attribute'( 'foo', 'Integer' )
    $P1 = $P0.'attributes'()
    $I0 = $P1
    if $I0 == 1 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - add_attributes() with valid args adds an attribute'

    push_eh ok_4
    $P0.'add_attribute'( 'foo', 'String' )
    clear_eh

    print 'not '
  ok_4:
    say 'ok 4 - add_attributes() with existing attribute name fails'
.end
CODE
ok 1 - add_attribute() with no args fails
ok 2 - add_attribute() with unknown type fails
ok 3 - add_attribute() with valid args adds an attribute
ok 4 - add_attribute() with existing attribute name fails
OUT
## Q: should adding an attribute with unknown type fail? i think so.
## Q: should adding an attr with the same name as an existing one fail? i say yes.


## NOTE i think this belongs in the Object PMC tests
# L<PDD15/Class PMC API>
pir_output_is( <<'CODE', <<'OUT', 'set_attr/get_attr VTABLE methods' );
.sub 'test' :main
    new $P0, .MetaClass
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
    new $P0, .MetaClass
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


## TODO add_parent


# L<PDD15/Class PMC API/=item roles>
pir_output_is( <<'CODE', <<'OUT', 'roles' );
.sub 'test' :main
    new $P0, .MetaClass
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


## TODO add_role


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
