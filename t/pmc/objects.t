#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/objects.t - Objects

=head1 SYNOPSIS

	% perl t/pmc/objects.t

=head1 DECSRIPTION

Tests the object/class subsystem.

=cut

use Parrot::Test tests => 22;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "findclass (base class)");
    newclass P1, "Foo"

    findclass I0, "Foo"
    print I0
    print "\n"

    findclass I0, "Bar"
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "findclass (subclass)");
    newclass P1, "Foo"
    subclass P2, P1, "Bar"

    findclass I0, "Foo"
    print I0
    print "\n"

    findclass I0, "Bar"
    print I0
    print "\n"

    findclass I0, "Qux"
    print I0
    print "\n"

    end
CODE
1
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "classname");
    newclass P1, "Foo"
    classname S0, P1
    print S0
    print "\n"

    subclass P2, P1, "Bar"
    classname S1, P2
    print S1
    print "\n"

    subclass P3, "Foo", "Baz"
    classname S2, P3
    print S2
    print "\n"
    end
CODE
Foo
Bar
Baz
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "getclass");
    newclass P1, "Foo"
    getclass P2, "Foo"
    classname S2, P2
    print S2
    print "\n"

    subclass P3, P1, "FooBar"
    getclass P4, "FooBar"
    classname S4, P4
    print S4
    print "\n"

    getclass P3, "NoSuch"
    end
CODE
/Foo
FooBar
Class doesn't exist/
OUTPUT
# ' for vim

output_is(<<'CODE', <<'OUTPUT', "isa");
    new P1, .Boolean
    isa I0, P1, "Boolean"
    print I0
    isa I0, P1, "Bool"
    print I0
    isa I0, P1, "scalar"
    print I0
    isa I0, P1, "calar"
    print I0
    print "\n"

    isa I0, P1, "PerlInt"
    print I0
    isa I0, P1, "PerlIn"
    print I0
    isa I0, P1, "erl"
    print I0
    isa I0, P1, " "
    print I0
    print "\n"

    isa I0, P1, ""
    print I0
    null S0
    isa I0, P1, S0
    print I0
    set S0, "scalar"
    isa I0, P1, S0
    print I0

    print "\n"
    end
CODE
1010
1000
001
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "does scalar");
    new P1, .Boolean
    does I0, P1, "Boolean"
    print I0
    does I0, P1, "Bool"
    print I0
    does I0, P1, "scalar"
    print I0
    print "\n"
    end
CODE
001
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "does array");
    new P1, .OrderedHash
    does I0, P1, "Boolean"
    print I0
    does I0, P1, "Bool"
    print I0
    does I0, P1, "hash"
    print I0
    does I0, P1, "array"
    print I0
    print "\n"
    end
CODE
0011
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "new object");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "new object - type, isa");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    print "ok 1\n"
    typeof I1, P2
    eq I0, I1, ok2
    print "not "
ok2:
    print "ok 2\n"
    isa I3, P2, "Foo"
    print I3
    print "\n"
    end
CODE
ok 1
ok 2
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "new object - classname");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classname S0, P1	# class
    print S0
    print "\n"
    classname S0, P2	# object
    print S0
    print "\n"
    end
CODE
Foo
Foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "isa subclass");
    newclass P1, "Foo"
    subclass P2, P1, "Bar"
    isa I0, P1, "Foo"
    if I0, ok1
    print "not "
ok1:
    print "ok 1\n"
    isa I0, P2, "Bar"
    if I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    isa I0, P2, "Foo"
    if I0, ok3
    print "not "
ok3:
    print "ok 3\n"
    isa I0, P2, "ParrotClass"
    if I0, ok4
    print "not "
ok4:
    print "ok 4\n"
    isa I0, P2, "ParrotObject"
    unless I0, ok5
    print "not "
ok5:
    print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "isa subclass - objects");
    newclass P3, "Foo"
    subclass P4, P3, "Bar"
    find_type I0, "Foo"
    new P1, I0
    find_type I0, "Bar"
    new P2, I0

    isa I0, P1, "Foo"
    if I0, ok1
    print "not "
ok1:
    print "ok 1\n"
    isa I0, P2, "Bar"
    if I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    isa I0, P2, "Foo"
    if I0, ok3
    print "not "
ok3:
    print "ok 3\n"
    isa I0, P2, "ParrotObject"
    if I0, ok4
    print "not "
ok4:
    print "ok 4\n"
    isa I0, P2, "ParrotClass"
    if I0, ok5
    print "not "
ok5:
    print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "addattribute");
    newclass P1, "Foo"
# Check that addattribute doesn't blow up
    addattribute P1, "foo_i"
    print "ok 1\n"
# Check that P1 is still the same ParrotClass PMC
    classname S0, P1
    eq S0, "Foo", ok2
    print "not "
ok2: 
    print "ok 2\n"
# Check that we can add multiple attributes
    set I0, 0
l1: 
    set S0, I0
    addattribute P1, S0
    inc I0
    lt I0, 1000, l1
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "addattribute subclass");
    newclass P1, "Foo"
    addattribute P1, "foo_i"
    print "ok 1\n"
    subclass P2, P1, "Bar"
    addattribute P2, "bar_i"
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

# This needs a better test...
output_is(<<'CODE', <<'OUTPUT', "addattribute subclass - same name");
    newclass P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    subclass P2, P1, "Bar"
    addattribute P2, "i"
    addattribute P2, "j"
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get object attribs");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0

    new P3, .PerlInt
    set P3, 1024
    setattribute P2, 2, P3

    new P4, .PerlInt
    getattribute P4, P2, 2
    print P4
    print "\n"
    end
CODE
1024
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get multiple object attribs");
    newclass P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    find_type I0, "Foo"
    new P2, I0

    new P3, .PerlInt
    set P3, 4201
    new P4, .PerlHash
    set P4["Key"], "Value" 

    setattribute P2, 2, P3
    setattribute P2, 3, P4

    getattribute P5, P2, 2
    print P5
    print "\n"
    getattribute P6, P2, 3
    set S0, P6["Key"]
    print S0
    print "\n"
    end
CODE
4201
Value
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "setting non-existant attribute");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    new P3, .PerlInt
    setattribute P2, 8, P3
    end
CODE
/No such attribute/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "getting non-existant attribute");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    getattribute P3, P2, 8
    end
CODE
/No such attribute/
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "attribute values are specific to objects");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0
    new P3, I0

    new P4, .PerlInt
    set P4, 100
    setattribute P2, 2, P4
    new P5, .PerlString
    set P5, "One hundred"
    setattribute P3, 2, P5

    getattribute P6, P2, 2
    print P6
    print "\n"
    getattribute P6, P3, 2
    print P6
    print "\n"
    end
CODE
100
One hundred
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "attribute values and subclassing");
    newclass P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    subclass P2, P1, "Bar"
    addattribute P2, "k"
    addattribute P2, "l"

    find_type I0, "Bar"
    new P2, I0
    new P3, I0
 
    new P4, .PerlInt
    set P4, 10
    setattribute P2, 2, P4
    inc P4
    setattribute P2, 3, P4

    new P5, .PerlInt
    set P5, 100
    setattribute P3, 2, P5
    inc P5
    setattribute P3, 3, P5

    getattribute P6, P2, 2
    bsr l1
    getattribute P6, P2, 3
    bsr l1

    getattribute P6, P3, 2
    bsr l1
    getattribute P6, P3, 3
    bsr l1
    branch end
l1:
    print P6
    print "\n"
    ret
end:
    end
CODE
11
11
101
101
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "classoffset (single class)");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"
    print I1
    print "\n"
    end
CODE
2
OUTPUT
