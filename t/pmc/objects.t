#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/objects.t - Objects

=head1 SYNOPSIS

	% perl -Ilib t/pmc/objects.t

=head1 DESCRIPTION

Tests the object/class subsystem.

=cut

use Parrot::Test tests => 61;
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
Class 'NoSuch' doesn't exist/
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

    isa I0, P1, "Integer"
    print I0
    isa I0, P1, "Integ"
    print I0
    isa I0, P1, "eger"
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

output_like(<<'CODE', <<'OUTPUT', "classoffset: normal operation");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"
    print I1
    end
CODE
/\d+/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "classoffset: invalid parent class");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Bar"
    print I1
    end
CODE
/Class not parent of object/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "classoffset: non-object argument");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, .Undef
    classoffset I1, P2, "Foo"
    print I1
    end
CODE
/Not an object/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get object attribs");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"

    new P3, .Integer
    set P3, 1024
    setattribute P2, I1, P3

    new P4, .Integer
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

    new P3, .Integer
    set P3, 4201
    new P4, .Hash
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

output_like(<<'CODE', <<'OUTPUT', "setting non-existent attribute");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"

    new P3, .Integer
    setattribute P2, I1, P3
    end
CODE
/No such attribute/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "setting non-existent by name");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0

    new P3, .Integer
    setattribute P2, "Foo\0no_such", P3
    end
CODE
/No such attribute 'Foo\\0no_such'/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "getting NULL attribute");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I0, "Foo"
    new P2, I0

    getattribute P3, P2, "Foo\0i"
    print P3
    end
CODE
/Null PMC access/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "setting non-existent attribute - 1");
    newclass P1, "Foo"
    find_type I0, "Foo"
    new P2, I0
    classoffset I1, P2, "Foo"

    new P3, .Integer
    dec I1
    setattribute P2, I1, P3
    end
CODE
/No such attribute/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "getting non-existent attribute");
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

    new P4, .Integer
    set P4, 100
    setattribute P2, I1, P4
    new P5, .String
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
    new P4, .Integer
    set P4, 10
    setattribute P2, I1, P4
    inc P4
    add I2, I1, 1
    setattribute P2, I2, P4

    new P5, .Integer
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

    # subclass is preferred for the SI case over
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

    new P10, .String		# set attribute values
    set P10, "i\n"		# attribute slots have reference semantics
    setattribute P3, I0, P10	# so always put new PMCs in
                                # if you have unique values
    inc I0			# next attribute
    new P10, .String
    set P10, "j\n"
    setattribute P3, I0, P10

    classoffset I4, P3, "Bar"   # set Bar attribs
    set I1, I4			# dup offset for retrieval again

    new P10, .String
    set P10, "k\n"
    setattribute P3, I1, P10
    inc I1
    new P10, .String
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
    new P13, I1

    # Foo and Bar have attribute accessor methods
    set S0, "Foo::set"		# the meth   s. pdd03
    set P2, P13			# the object s. pdd03
    new P5, .String		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set I5, 0			# set first attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 1
    set I4, 0
    # register preserving is optimized away :)
    callmethodcc
    set S0, "Foo::set"
    new P5, .String
    set P5, "j\n"
    set I5, 1			# set 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc

    set S0, "Bar::set"
    new P5, .String
    set P5, "k\n"
    set I5, 0			# set first attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc
    set S0, "Bar::set"
    new P5, .String
    set P5, "l\n"
    set I5, 1			# set 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc

    # now retrieve attributes
    set S0, "Foo::get"
    set I5, 0			# get first attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    set S0, "Foo::get"
    set I5, 1			# get 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result

    set S0, "Bar::get"
    set I5, 0			# get first attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    set S0, "Bar::get"
    set I5, 1			# get 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 0
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    end

# set(obj: Pvalue, Iattr_idx)
.pcc_sub Foo::set:
    print "in Foo::set\n"
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    classoffset I3, P2, "Foo"
    add I4, I3, I5
    setattribute P2, I4, P5	# so always put new PMCs in
    returncc

# Pattr = get(obj: Iattr_idx)
.pcc_sub Foo::get:
    print "in Foo::get\n"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    classoffset I3, P2, "Foo"
    add I4, I3, I5
    getattribute P5, P2, I4
    set I0, 0
    set I3, 1
    returncc

.pcc_sub Bar::set:
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    print "in Bar::set\n"
    classoffset I3, P2, "Bar"
    add I4, I3, I5
    setattribute P2, I4, P5	# so always put new PMCs in
    set I0, 0
    set I3, 0
    returncc

.pcc_sub Bar::get:
    print "in Bar::get\n"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    classoffset I3, P2, "Bar"
    add I4, I3, I5
    getattribute P5, P2, I4
    set I0, 0
    set I3, 1
    returncc
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

    # subclass is preferred for the SI case over
    #   newclass P2, "Bar"
    #   addattrib ...
    #   addparent P2, P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    find_type I1, "Bar"
    new P13, I1

    # Foo and Bar have attribute accessor methods
    set S0, "set"		# the meth   s. pdd03
    set P2, P13			# the object s. pdd03
    new P5, .String		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set S5, "Foo"
    set I5, 0			# set first attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc
    new P5, .String
    set P5, "j\n"
    set I5, 1			# set 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc

    new P5, .String
    set P5, "k\n"
    set S5, "Bar"
    set I5, 0			# set first attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc
    new P5, .String
    set P5, "l\n"
    set I5, 1			# set 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc
    new P5, .String
    set P5, "m\n"
    set I5, 2			# set 3rd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 1
    set I4, 0
    set P2, P13
    callmethodcc

    # now retrieve attributes
    set S0, "get"
    set S5, "Foo"
    set I5, 0			# get first attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    set I5, 1			# get 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result

    set S5, "Bar"
    set I5, 0			# get first attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    set I5, 1			# get 2nd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    set I5, 2			# get 3rd attrib
    set I0, 1
    set I1, 1
    set I2, 1
    set I3, 0
    set I4, 0
    set P2, P13
    callmethodcc
    print P5			# return result
    end

# Foo provides accessor functions which Bar inherits
# they take an additional classname argument SClass

# set(obj: Pvalue, SClass, Iattr_idx)
.pcc_sub set:
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    classoffset I3, P2, S5
    add I4, I3, I5
    setattribute P2, I4, P5
    set I0, 0
    set I3, 0
    returncc

# Pattr = get(obj: SClass, Iattr_idx)
.pcc_sub get:
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    classoffset I3, P2, S5
    add I4, I3, I5
    getattribute P5, P2, I4
    set I0, 0
    set I3, 1
    returncc

CODE
i
j
k
l
m
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "overridden vtables");
.include "pmctypes.pasm"
.include "mmd.pasm"
    newclass P1, "Foo"
    find_global P2, "set_i"
    store_global "Foo", "__set_integer_native", P2
    find_global P2, "add"
    store_global "Foo", "__add", P2
    find_type I1, "Foo"
    mmdvtregister .MMD_ADD, I1, I1, P2
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
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    print "in set_integer\n"
    classoffset I0, P2, "Foo"
    new P6, .Integer
    set P6, I5
    setattribute P2, I0, P6
    returncc
.pcc_sub add:
    print "in add\n"
    classoffset I0, P5, "Foo"
    getattribute P10, P5, I0
    getattribute P11, P6, I0
    new P12, .Integer
    add P12, P10, P11
    setattribute P7, I0, P12
    set P5, P7
    set I3, 1
    returncc
.pcc_sub get_s:
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    print "in get_string\n"
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    set S5, P10
    set I0, P10
    ne I0, 2, no_2
    set S5, "two"
no_2:
    returncc
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

output_is(<<'CODE', <<'OUTPUT', "multiple inheritance, with attributes");
    newclass P1, "Star"
    addattribute P1, "Spectral Type"

    newclass P2, "Company"
    addattribute P2, "Annual Profit"

    subclass P3, P1, "Sun"
    addparent P3, P2

    find_type I0, "Sun"
    new P4, I0

    classoffset I1, P4, "Star"
    new P5, .String
    set P5, "G"
    setattribute P4, I1, P5

    classoffset I2, P4, "Company"
    new P6, .String
    set P6, "$100,000,000"
    setattribute P4, I2, P6

    getattribute P7, P4, I1
    print P7
    print "\n"
    getattribute P8, P4, I2
    print P8
    print "\n"
    end
CODE
G
$100,000,000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "two levels of inheritance");
    newclass P0, "Astronomical Object"
    addattribute P0, "Location"

    subclass P1, P0, "Star"
    addattribute P1, "Spectral Type"

    newclass P2, "Sun"
    addparent P2, P1
    addparent P2, P0

    find_type I0, "Sun"
    new P4, I0
    classoffset I1, P4, "Astronomical Object"

    new P5, .String
    set P5, "Taurus"
    setattribute P4, I1, P5
    getattribute P6, P4, I1
    print P6
    print "\n"
    end
CODE
Taurus
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "addparent exceptions #1");
    newclass P0, "Astronomical Object"
    new P1, .String
    set P1, "Not a class"
    addparent P0, P1
    end
CODE
/Parent isn't a ParrotClass/
OUTPUT
# '

output_like(<<'CODE', <<'OUTPUT', "addparent exceptions #2");
    new P0, .Hash
    newclass P1, "Trashcan"
    addparent P0, P1
    end
CODE
/Class isn't a ParrotClass/
OUTPUT
# '

output_is(<<'CODE', <<'OUTPUT', "class op test");
    newclass P0, "City"
    find_type I0, "City"
    new P1, I0

    class P2, P1
    classname S0, P2
    print S0
    print "\n"
    end
CODE
City
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "subclassing a non-existent class");
    subclass P1, "Character", "Nemo"
    print "Uh-oh...\n"
    end
CODE
/Class 'Nemo' doesn't exist/
OUTPUT
# '
output_like(<<'CODE', <<'OUTPUT', "anon. subclass of non-existent class");
    subclass P1, "Character"
    print "Uh-oh...\n"
    end
CODE
/Class 'Character' doesn't exist/
OUTPUT
# '

output_like(<<'CODE', <<'OUTPUT', "anon. subclass classname");
    newclass P0, "City"
    subclass P1, P0
    classname S0, P1
    print S0
    print "\n"
    end
CODE
/anon_\d+/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "get attrib by name");
    newclass P1, "Foo"
    addattribute P1, "i"
    find_type I1, "Foo"
    new P2, I1
    classoffset I2, P2, "Foo"
    new P3, .String
    set P3, "ok\n"
    setattribute P2, I2, P3

    getattribute P4, P2, "Foo\x0i"
    print P4
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "get attrib by name subclass");
    newclass P0, "Bar"
    addattribute P0, "j"
    subclass P1, P0, "Foo"
    addattribute P1, "i"
    find_type I1, "Foo"
    new P2, I1
    classoffset I2, P2, "Foo"
    new P3, .String
    set P3, "foo i\n"
    setattribute P2, I2, P3
    classoffset I2, P2, "Bar"
    new P3, .String
    set P3, "bar j\n"
    setattribute P2, I2, P3

    getattribute P4, P2, "Foo\x0i"
    print P4
    getattribute P4, P2, "Bar\x0j"
    print P4
    end
CODE
foo i
bar j
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set attrib by name subclass");
    newclass P0, "Bar"
    addattribute P0, "j"
    subclass P1, P0, "Foo"
    addattribute P1, "i"
    find_type I1, "Foo"
    new P2, I1
    new P3, .String
    set P3, "foo i\n"
    setattribute P2, "Foo\x0i", P3
    new P3, .String
    set P3, "bar j\n"
    setattribute P2, "Bar\x0j", P3

    classoffset I2, P2, "Foo"
    getattribute P4, P2, I2
    print P4
    classoffset I2, P2, "Bar"
    getattribute P4, P2, I2
    print P4
    end
CODE
foo i
bar j
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "addattribute duplicate");
    newclass P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    addattribute P1, "i"
    print "never\n"
    end
CODE
/Attribute 'Foo(.*?i)?' already exists/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PMC as classes");
    getclass P0, "Integer"
    print "ok 1\n"
    getclass P0, "Integer"
    print "ok 2\n"
    typeof S0, P0
    print S0
    print "\n"
    end
CODE
ok 1
ok 2
Integer
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - subclass");

.sub main @MAIN
  .local pmc MyInt
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  print "ok 2\n"
  $S0 = typeof MyInt
  print $S0
  print "\n"
  $I0 = isa MyInt, "MyInt"
  print $I0
  $I0 = isa MyInt, "Integer"
  print $I0
  print "\n"
.end
CODE
ok 1
ok 2
ParrotClass
11
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - instantiate");

.sub main @MAIN
  .local pmc MyInt
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  addattribute MyInt, ".i"
  print "ok 2\n"
  .local pmc i
  $I0 = find_type "MyInt"
  i = new $I0
  print "ok 3\n"
.end
CODE
ok 1
ok 2
ok 3
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - methods");

.sub main @MAIN
  .local pmc MyInt
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  print "ok 2\n"
  .local pmc i
  $I0 = find_type "MyInt"
  i = new $I0
  print "ok 3\n"
  i = 42	# set_integer is inherited from Integer
  print "ok 4\n"
  $I0 = i	# get_integer is overridden below
  print $I0
  print "\n"
  $S0 = i 	# get_string is overridden below
  print $S0
  print "\n"
.end

.namespace ["MyInt"]
.sub __get_integer method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub __get_string method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $S1 = $I0
   $S0 = "MyInt("
   $S0 .= $S1
   $S0 .= ")"
   .pcc_begin_return
   .return $S0
   .pcc_end_return
.end
CODE
ok 1
ok 2
ok 3
ok 4
42
MyInt(42)
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - mmd methods");


.sub main @MAIN
  .local pmc MyInt
  getclass $P0, "Integer"
  subclass MyInt, $P0, "MyInt"
  .local pmc i
  .local pmc j
  .local pmc k
  $I0 = find_type "MyInt"
  i = new $I0
  j = new $I0
  k = new $I0
  i = 6
  j = 7
  k = i * j
  $I0 = k
  print $I0
  print "\n"
  $S0 = k 	# get_string is overridden below
  print $S0
  print "\n"
.end

.namespace ["MyInt"]
.sub __get_string method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $S1 = $I0
   $S0 = "MyInt("
   $S0 .= $S1
   $S0 .= ")"
   .pcc_begin_return
   .return $S0
   .pcc_end_return
.end
CODE
42
MyInt(42)
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - overridden mmd methods");

.sub main @MAIN
  .local pmc MyInt
  getclass $P0, "Integer"
  subclass MyInt, $P0, "MyInt"
  .local pmc i
  .local pmc j
  .local pmc k
  $I0 = find_type "MyInt"
  i = new $I0
  j = new $I0
  k = new $I0
  i = 6
  j = 7
  k = i + j
  print k
  print "\n"
  j = new Integer
  j = 100
  k = i + j
  print k
  print "\n"
.end

.namespace ["MyInt"]
.sub __add @MULTI(MyInt, MyInt)
   .param pmc self
   .param pmc right
   .param pmc dest
   print "in add\n"
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $I1 = right
   $I2 = $I0 + $I1
   dest = $I2
   .return(dest)
.end
CODE
in add
13
106
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - derived 1");

.sub main @MAIN
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  $I0 = find_type "MyInt2"
  i = new $I0
  $I0 = isa i, "Integer"
  print $I0
  $I0 = isa i, "MyInt"
  print $I0
  $I0 = isa i, "MyInt2"
  print $I0
  print "\n"
  print "ok 3\n"
  i = 42	# set_integer is inherited from Integer
  print "ok 4\n"
  $I0 = i	# get_integer is overridden below
  print $I0
  print "\n"
  $S0 = i 	# get_string is overridden below
  print $S0
  print "\n"
.end

.namespace ["MyInt"]
.sub __get_integer method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub __get_string method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $S1 = $I0
   $S0 = typeof self
   $S0 .= "("
   $S0 .= $S1
   $S0 .= ")"
   .pcc_begin_return
   .return $S0
   .pcc_end_return
.end
CODE
ok 1
ok 2
111
ok 3
ok 4
42
MyInt2(42)
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - derived 2");

.sub main @MAIN
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  $I0 = find_type "MyInt2"
  i = new $I0
  $I0 = isa i, "Integer"
  print $I0
  $I0 = isa i, "MyInt"
  print $I0
  $I0 = isa i, "MyInt2"
  print $I0
  print "\n"
  print "ok 3\n"
  i = 42	# set_integer is inherited from Integer
  print "ok 4\n"
  $I0 = i	# get_integer is overridden below
  print $I0
  print "\n"
  $S0 = i 	# get_string is overridden below
  print $S0
  print "\n"
.end

.namespace ["MyInt2"]
# subclassing methods from MyInt is ok
# this one changes the value a bit
.sub __get_integer method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   inc $I0            # <<<<<
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.namespace ["MyInt"]
.sub __get_integer method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub __get_string method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $S1 = $I0
   $S0 = typeof self
   $S0 .= "("
   $S0 .= $S1
   $S0 .= ")"
   .pcc_begin_return
   .return $S0
   .pcc_end_return
.end
CODE
ok 1
ok 2
111
ok 3
ok 4
43
MyInt2(42)
OUTPUT

TODO: {
  local $TODO = "methods can't be overridden in derived class only";
pir_output_is(<<'CODE', <<'OUTPUT', "PMC as classes - derived 3");

.sub main @MAIN
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  $I0 = find_type "MyInt2"
  i = new $I0
  $I0 = isa i, "Integer"
  print $I0
  $I0 = isa i, "MyInt"
  print $I0
  $I0 = isa i, "MyInt2"
  print $I0
  print "\n"
  print "ok 3\n"
  i = 42	# set_integer is inherited from Integer
  print "ok 4\n"
  $I0 = i	# get_integer is overridden below
  print $I0
  print "\n"
  $S0 = i 	# get_string is overridden below
  print $S0
  print "\n"
.end

.namespace ["MyInt2"]
.sub __get_integer method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub __get_string method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   $S1 = $I0
   $S0 = typeof self
   $S0 .= "("
   $S0 .= $S1
   $S0 .= ")"
   .pcc_begin_return
   .return $S0
   .pcc_end_return
.end
CODE
ok 1
ok 2
111
ok 3
ok 4
42
MyInt2(42)
OUTPUT
};

pir_output_is(<<'CODE', <<'OUTPUT', "subclassing ParrotClass");

.sub main @MAIN
    .local pmc cl
    .local pmc parent
    parent = getclass "ParrotClass"
    cl = subclass parent, "Foo"
    print "ok 1\n"
    .local pmc o
    o = new "Foo"
    print "ok 2\n"
    $S0 = classname o
    print $S0
    print "\n"
.end
CODE
ok 1
ok 2
Foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "instantiate");
    subclass P2, "Integer", "Foo"
    set I0, 0
    set I3, 1
    new P5, .Integer
    set P5, 42
    instantiate P1
    print P1
    print "\n"
    end
.namespace [ "Foo" ]
.pcc_sub __instantiate:	# create object the hard way
    find_type I0, "Foo"
    new P10, I0			# should inspect passed arguments
    classoffset I0, P10, "Foo"	# better should clone the argument
    setattribute P10, I0, P5	# the first attribute is the internal __value
    set P5, P10			# set return value
    set I0, 0
    set I3, 1
    returncc
CODE
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "instantiate - PIR");

.sub main @MAIN
    .local pmc cl
    cl = subclass "Integer", "Foo"
    .local pmc i
    i = cl."instantiate"(42)
    print i
    print "\n"
.end

.namespace ["Foo"]
.sub __instantiate method
    .param int val		# in realiter check what is passed
    $I0 = find_type "Foo"
    .local pmc obj
    obj = new $I0
    $I1 = classoffset obj, "Foo"
    $P0 = new Integer
    $P0 = val
    setattribute obj, $I1, $P0
    .pcc_begin_return
	.return obj
    .pcc_end_return
.end
CODE
42
OUTPUT

{ local $TODO = "new Px, Ix: argcP is wrong in __init method";
pir_output_is(<<'CODE', <<'OUTPUT', "__init argcP");

.sub main @MAIN
    $P0 = newclass "Foo"
    $I0 = find_type "Foo"

    argcI = 2
    argcS = 3
    argcP = 4
    argcN = 5

    print "a: "
    print argcI
    print argcS
    print argcP
    print argcN
    print "\n"

    $P0 = new $I0

    print "b: "
    print argcI
    print argcS
    print argcP
    print argcN
    print "\n"

    argcI = 6
    argcS = 7
    argcP = 8
    argcN = 9

    print "c: "
    print argcI
    print argcS
    print argcP
    print argcN
    print "\n"
    $P0 = new $I0, $P0
    print "d: "
    print argcI
    print argcS
    print argcP
    print argcN
    print "\n"

    end
.end

.namespace ["Foo"]
.sub __init method
    print "X: "
    print argcI
    print argcS
    print argcP
    print argcN
    print "\n"
.end
CODE
a: 2345
X: 0000
b: 2345
c: 6789
X: 0010
d: 6789
OUTPUT

}

pir_output_is(<<'CODE', <<'OUTPUT', "namespace vs name");
.sub main @MAIN
    .local pmc o, cl, f
    newclass cl, "Foo"
    $I0 = find_type "Foo"
    o = new $I0
    print o
    Foo()
    f = global "Foo"
    f()
    f = find_global "Foo", "Foo"
    f()
.end
.sub Foo
    print "ok 2\n"
.end
.namespace [ "Foo" ]
.sub __get_string
    .return("ok 1\n")
.end
.sub Foo
    print "ok 3\n"
.end
CODE
ok 1
ok 2
ok 2
ok 3
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Wrong way to create new objects");
    new P0, .ParrotObject
    end
CODE
/Can't create new ParrotObject/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "multpile anon classes - #33103");
     newclass P0, "City"
     subclass P1, P0
     newclass P2, "State"
     subclass P3, P2
     print "ok\n"
     end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "subclassed Integer bug");
.sub _main @MAIN
   .local pmc class
   .local pmc a
   .local pmc b

    subclass class, "Integer", "LispInteger"

    a = new "LispInteger"
    b = new "LispInteger"

    a = 1
    b = 1

    print a
    print " * "
    print b
    print " = "

    a = a * b

    print a
    print "\n"
   end
.end
CODE
1 * 1 = 1
OUTPUT
