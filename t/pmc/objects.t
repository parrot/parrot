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

use Parrot::Test tests => 27;
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

    class P3, P1
    classname S0, P1	# class
    print S0
    print "\n"
    class P3, P1
    classname S0, P2	# object
    print S0
    print "\n"
    end
CODE
Foo
Foo
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
    classoffset I1, P2, "Foo"

    new P3, .PerlInt
    set P3, 1024
    setattribute P2, I1, P3

    new P4, .PerlInt
    getattribute P4, P2, I1
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
    classoffset I1, P2, "Foo"

    new P3, .PerlInt
    set P3, 4201
    new P4, .PerlHash
    set P4["Key"], "Value"

    setattribute P2, I1, P3
    add I2, I1, 1
    setattribute P2, I2, P4

    getattribute P5, P2, I1
    print P5
    print "\n"
    getattribute P6, P2, I2
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
    classoffset I1, P2, "Foo"

    new P3, .PerlInt
    setattribute P2, I1, P3
    end
CODE
/No such attribute/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "setting non-existant attribute - 1");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"

    new P3, .PerlInt
    dec I1
    setattribute P2, I1, P3
    end
CODE
/No such attribute/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "getting non-existant attribute");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"
    add I2, I1, 6

    getattribute P3, P2, I2
    end
CODE
/No such attribute/
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "attribute values are specific to objects");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"
    new P3, I0
    classoffset I2, P3, "Foo"

    new P4, .PerlInt
    set P4, 100
    setattribute P2, I1, P4
    new P5, .PerlString
    set P5, "One hundred"
    setattribute P3, I2, P5

    getattribute P6, P2, I1
    print P6
    print "\n"
    getattribute P6, P3, I2
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
    classoffset I1, P2, "Foo"
    new P3, I0
    classoffset I3, P3, "Foo"

# Note that setattribute holds the actual PMC, not a copy, so
# in this test both attributes get the PMC from P4, and should
# both have the same value, despite the C<inc>.
    new P4, .PerlInt
    set P4, 10
    setattribute P2, I1, P4
    inc P4
    add I2, I1, 1
    setattribute P2, I2, P4

    new P5, .PerlInt
    set P5, 100
    setattribute P3, I3, P5
    inc P5
    add I4, I3, 1
    setattribute P3, I4, P5

    getattribute P6, P2, I1
    bsr l1
    getattribute P6, P2, I2
    bsr l1

    getattribute P6, P3, I3
    bsr l1
    getattribute P6, P3, I4
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

output_is(<<'CODE', <<'OUTPUT', "attribute values and subclassing 2");
    newclass P1, "Foo"
    # must add attributes before object instantiation
    addattribute P1, ".i"
    addattribute P1, ".j"

    subclass P2, P1, "Bar"
    addattribute P2, ".k"
    addattribute P2, ".l"

    # subclass is prefered for the SI case over
    #   newclass P2, "Bar"
    #   addattrib ...
    #   addparent P2, P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    find_type I1, "Bar"
    new P3, I1

    classoffset I3, P3, "Foo"   # The parent class
    # print I3                  # don't assume anything about this offset
    # print "\n"		# ' for vim

    set I0, I3			# access Foo attribs, remember offset

    new P10, .PerlString	# set attribute values
    set P10, "i\n"		# attribute slots have reference semantics
    setattribute P3, I0, P10	# so always put new PMCs in
                                # if you have unique values
    inc I0			# next attribute
    new P10, .PerlString
    set P10, "j\n"
    setattribute P3, I0, P10

    classoffset I4, P3, "Bar"   # set Bar attribs
    set I1, I4			# dup offset for retrieval again

    new P10, .PerlString
    set P10, "k\n"
    setattribute P3, I1, P10
    inc I1
    new P10, .PerlString
    set P10, "l\n"
    setattribute P3, I1, P10

    getattribute P11, P3, I3	# retrieve attribs
    print P11
    inc I3
    getattribute P11, P3, I3
    print P11

    getattribute P11, P3, I4
    print P11
    inc I4
    getattribute P11, P3, I4
    print P11

    classname S0, P3		# verify classname is still ok
    print S0
    print "\n"
    end
CODE
i
j
k
l
Bar
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "attribute values, subclassing access meths ");
    newclass P1, "Foo"
    # must add attributes before object instantiation
    addattribute P1, ".i"
    addattribute P1, ".j"
    # define attrib access functions in Foo namespace
    find_global P5, "Foo::set"
    store_global "Foo", "Foo::set", P5
    find_global P5, "Foo::get"
    store_global "Foo", "Foo::get", P5


    subclass P2, P1, "Bar"
    addattribute P2, ".k"
    addattribute P2, ".l"
    find_global P5, "Bar::set"
    store_global "Bar", "Bar::set", P5
    find_global P5, "Bar::get"
    store_global "Bar", "Bar::get", P5

    # instantiate a Bar object
    find_type I1, "Bar"
    new P3, I1

    # Foo and Bar have attribute accessor methods
    set S0, "Foo::set"		# the meth   s. pdd03
    set P2, P3			# the object s. pdd03
    new P5, .PerlString		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set I5, 0			# set first attrib
    # register preserving is optimized away :)
    callmethodcc
    set S0, "Foo::set"
    new P5, .PerlString
    set P5, "j\n"
    set I5, 1			# set 2nd attrib
    callmethodcc

    set S0, "Bar::set"
    new P5, .PerlString
    set P5, "k\n"
    set I5, 0			# set first attrib
    callmethodcc
    set S0, "Bar::set"
    new P5, .PerlString
    set P5, "l\n"
    set I5, 1			# set 2nd attrib
    callmethodcc

    # now retrieve attributes
    set S0, "Foo::get"
    set I5, 0			# get first attrib
    callmethodcc
    print P5			# return result
    set S0, "Foo::get"
    set I5, 1			# get 2nd attrib
    callmethodcc
    print P5			# return result

    set S0, "Bar::get"
    set I5, 0			# get first attrib
    callmethodcc
    print P5			# return result
    set S0, "Bar::get"
    set I5, 1			# get 2nd attrib
    callmethodcc
    print P5			# return result
    end

# set(obj: Pvalue, Iattr_idx)
.pcc_sub Foo::set:
    print "in Foo::set\n"
    classoffset I3, P2, "Foo"
    add I4, I3, I5
    setattribute P2, I4, P5	# so always put new PMCs in
    invoke P1

# Pattr = get(obj: Iattr_idx)
.pcc_sub Foo::get:
    print "in Foo::get\n"
    classoffset I3, P2, "Foo"
    add I4, I3, I5
    getattribute P5, P2, I4
    invoke P1

.pcc_sub Bar::set:
    print "in Bar::set\n"
    classoffset I3, P2, "Bar"
    add I4, I3, I5
    setattribute P2, I4, P5	# so always put new PMCs in
    invoke P1

.pcc_sub Bar::get:
    print "in Bar::get\n"
    classoffset I3, P2, "Bar"
    add I4, I3, I5
    getattribute P5, P2, I4
    invoke P1
CODE
in Foo::set
in Foo::set
in Bar::set
in Bar::set
in Foo::get
i
in Foo::get
j
in Bar::get
k
in Bar::get
l
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "attribute values, inherited access meths");
    newclass P1, "Foo"
    # must add attributes before object instantiation
    addattribute P1, ".i"
    addattribute P1, ".j"
    # define attrib access functions
    find_global P5, "set"
    store_global "Foo", "set", P5
    find_global P5, "get"
    store_global "Foo", "get", P5

    subclass P2, P1, "Bar"
    addattribute P2, ".k"
    addattribute P2, ".l"
    addattribute P2, ".m"

    # subclass is prefered for the SI case over
    #   newclass P2, "Bar"
    #   addattrib ...
    #   addparent P2, P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    find_type I1, "Bar"
    new P3, I1

    # Foo and Bar have attribute accessor methods
    set S0, "set"		# the meth   s. pdd03
    set P2, P3			# the object s. pdd03
    new P5, .PerlString		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set S5, "Foo"
    set I5, 0			# set first attrib
    # register preserving is optimized away :)
    callmethodcc
    new P5, .PerlString
    set P5, "j\n"
    set I5, 1			# set 2nd attrib
    callmethodcc

    new P5, .PerlString
    set P5, "k\n"
    set S5, "Bar"
    set I5, 0			# set first attrib
    callmethodcc
    new P5, .PerlString
    set P5, "l\n"
    set I5, 1			# set 2nd attrib
    callmethodcc
    new P5, .PerlString
    set P5, "m\n"
    set I5, 2			# set 3rd attrib
    callmethodcc

    # now retrieve attributes
    set S0, "get"
    set S5, "Foo"
    set I5, 0			# get first attrib
    callmethodcc
    print P5			# return result
    set I5, 1			# get 2nd attrib
    callmethodcc
    print P5			# return result

    set S5, "Bar"
    set I5, 0			# get first attrib
    callmethodcc
    print P5			# return result
    set I5, 1			# get 2nd attrib
    callmethodcc
    print P5			# return result
    set I5, 2			# get 3rd attrib
    callmethodcc
    print P5			# return result
    end

# Foo provides accessor functions which Bar inherits
# they take an additional classname argument SClass

# set(obj: Pvalue, SClass, Iattr_idx)
.pcc_sub set:
    classoffset I3, P2, S5
    add I4, I3, I5
    setattribute P2, I4, P5
    invoke P1

# Pattr = get(obj: SClass, Iattr_idx)
.pcc_sub get:
    classoffset I3, P2, S5
    add I4, I3, I5
    getattribute P5, P2, I4
    invoke P1

CODE
i
j
k
l
m
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "overriden vtables");
    newclass P1, "Foo"
    find_global P2, "set_i"
    store_global "Foo", "__set_integer_native", P2
    find_global P2, "add"
    store_global "Foo", "__add", P2
    find_global P2, "get_s"
    store_global "Foo", "__get_string", P2
    # must add attributes before object instantiation
    addattribute P1, ".i"

    find_type I1, "Foo"
    new P3, I1
    set P3, 1
    new P4, I1
    set P4, 1
    new P5, I1

    add P5, P3, P4
    # the print below calls __get_string
    print P5
    print "\n"
    set P4, 41
    add P5, P3, P4
    print P5
    print "\n"
    end

.pcc_sub set_i:
    print "in set_integer\n"
    classoffset I0, P2, "Foo"
    new P6, .PerlInt
    set P6, I5
    setattribute P2, I0, P6
    invoke P1
.pcc_sub add:
    print "in add\n"
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    getattribute P11, P5, I0
    new P12, .PerlInt
    add P12, P10, P11
    setattribute P6, I0, P12
    invoke P1
.pcc_sub get_s:
    print "in get_string\n"
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    set S5, P10
    set I0, P10
    ne I0, 2, no_2
    set S5, "two"
no_2:
    invoke P1
CODE
in set_integer
in set_integer
in add
in get_string
two
in set_integer
in add
in get_string
42
OUTPUT

# Not sure if this is right or not
# output_is(<<'CODE', <<'OUTPUT', "typeof classes");
#     newclass P0, "A"
#     newclass P1, "B"
#
#     typeof S0, P0
#     typeof S1, P1
#     print S0
#     print "\n"
#     print S1
# CODE
# A
# B
# OUTPUT


output_is(<<'CODE', <<'OUTPUT', "typeof objects");
    newclass P0, "A"
    newclass P1, "B"

    find_type I0, "A"
    find_type I1, "B"
    new P0, I0
    new P1, I1

    typeof S0, P0
    typeof S1, P1
    print S0
    print "\n"
    print S1
    print "\n"
    end
CODE
A
B
OUTPUT
