#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 74;

=head1 NAME

t/pmc/objects.t - Objects

=head1 SYNOPSIS

    % prove t/pmc/objects.t

=head1 DESCRIPTION

Tests the object/class subsystem.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "find_type (base class)" );
    newpdd15class P1, "Foo"

    find_type I0, "Foo"
    isgt I0, I0, 0
    print I0
    print "\n"

    find_type I0, "Bar"
    isgt I0, I0, 0
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "find_type (subclass)" );
    newpdd15class P1, "Foo"
    subclass P2, P1, "Bar"

    find_type I0, "Foo"
    isgt I0, I0, 0
    print I0
    print "\n"

    find_type I0, "Bar"
    isgt I0, I0, 0
    print I0
    print "\n"

    find_type I0, "Qux"
    isgt I0, I0, 0
    print I0
    print "\n"
    end
CODE
1
1
0
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "find_type nested, with key" );
    newpdd15class P1, ["Foo"; "Bar"]

    find_type I0, ["Foo"; "Bar"]
    isgt I1, I0, 0
    print I1
    print "\n"

    new P3, I0
    print "new\n"
    end
CODE
1
new
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "find_type nested, with array [EXPERIMENTAL]" );
    newpdd15class P1, ["Foo"; "Bar"]

    new P2, 'ResizablePMCArray'
    push P2, "Foo"
    push P2, "Bar"

    find_type I0, P2
    isgt I0, I0, 0
    print I0
    print "\n"

    new P3, I0
    print "new\n"
    end
CODE
1
new
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get classname from class" );
    newpdd15class P1, "Foo"
    set S0, P1
    print S0
    print "\n"

    subclass P2, P1, "Bar"
    set S1, P2
    print S1
    print "\n"

    subclass P3, "Foo", "Baz"
    set S2, P3
    print S2
    print "\n"
    end
CODE
parrot;Foo
parrot;Bar
parrot;Baz
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "getclass" );
    newpdd15class P1, "Foo"
    getclass P2, "Foo"
    set S2, P2
    print S2
    print "\n"

    subclass P3, P1, "FooBar"
    getclass P4, "FooBar"
    set S4, P4
    print S4
    print "\n"

    getclass P3, "NoSuch"
    end
CODE
/parrot;Foo
parrot;FooBar
Class 'NoSuch' doesn't exist/
OUTPUT

# ' for vim

pasm_output_is( <<'CODE', <<'OUTPUT', "isa" );
    new P1, 'Boolean'
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

pasm_output_is( <<'CODE', <<'OUTPUT', "does scalar" );
    new P1, 'Boolean'
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

pasm_output_is( <<'CODE', <<'OUTPUT', "does array" );
    new P1, 'OrderedHash'
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

pasm_output_is( <<'CODE', <<'OUTPUT', "new object" );
    newpdd15class P1, "Foo"
    new P2, "Foo"
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "new object - type, isa" );
    newpdd15class P1, "Foo"
    new P2, P1
    print "ok 1\n"
    isa I0, P2, "Foo"
    if I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "new object - classname" );
    newpdd15class P1, "Foo"
    new P2, P1
    set S0, P1	# class
    print S0
    print "\n"
    set S0, P2	# object
    print S0
    print "\n"

    class P3, P1
    set S0, P1	# class
    print S0
    print "\n"
    class P3, P1
    set S0, P2	# object
    print S0
    print "\n"
    end
CODE
parrot;Foo
parrot;Foo
parrot;Foo
parrot;Foo
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "isa subclass" );
    newpdd15class P1, "Foo"
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
    isa I0, P2, "Class"
    if I0, ok4
    print "not "
ok4:
    print "ok 4\n"
    isa I0, P2, "Object"
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

pir_output_is( <<'CODE', <<'OUTPUT', "isa subclass - objects" );
.sub 'main' :main
    newpdd15class P3, "Foo"
    subclass P4, P3, "Bar"
    P1 = P3.'new'()
    P2 = P4.'new'()

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
    isa I0, P2, "Object"
    if I0, ok4
    print "not "
ok4:
    print "ok 4\n"
    isa I0, P2, "Class"
    if I0, ok5
    print "not "
ok5:
    print "ok 5\n"
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "addattribute" );
    newpdd15class P1, "Foo"
# Check that addattribute doesn't blow up
    addattribute P1, "foo_i"
    print "ok 1\n"
# Check that P1 is still the same ParrotClass PMC
    set S0, P1
    eq S0, "parrot;Foo", ok2
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

pasm_output_is( <<'CODE', <<'OUTPUT', "addattribute subclass" );
    newpdd15class P1, "Foo"
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

pir_output_is( <<'CODE', <<'OUTPUT', "addattribute subclass - same name" );
.sub main :main
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    subclass P2, P1, "Bar"
    addattribute P2, "j"
    addattribute P2, "k"
    print "ok 1\n"
    .local pmc o
    o = P2.'new'()
    $P0 = getattribute o, 'i'
    print $P0
    print ' '
    $P0 = getattribute o, ['Foo'], 'j'
    print $P0
    print ' '
    $P0 = getattribute o, ['Bar'], 'j'
    print $P0
    print ' '
    $P0 = getattribute o, 'k'
    print $P0
    print_newline
    $P0 = getattribute o, 'i'
    print $P0
    print ' '
    $P0 = getattribute o, ['Foo'], "j"
    print $P0
    print ' '
    $P0 = getattribute o, 'j'
    print $P0
    print ' '
    $P0 = getattribute o, 'k'
    print $P0
    print_newline
.end
.namespace ['Bar']
.sub init :vtable :method
    $P0 = new 'String'
    $P0 = 'Foo.i'
    setattribute self, ['Foo'], "i", $P0
    $P0 = new 'String'
    $P0 = 'Foo.j'
    setattribute self, ["Foo"], "j", $P0
    $P0 = new 'String'
    $P0 = 'Bar.j'
    setattribute self, ["Bar"], "j", $P0
    $P0 = new 'String'
    $P0 = 'Bar.k'
    setattribute self, ["Bar"], "k", $P0
.end
CODE
ok 1
Foo.i Foo.j Bar.j Bar.k
Foo.i Foo.j Bar.j Bar.k
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "set/get object attribs" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    new P2, P1

    new P3, 'Integer'
    set P3, 1024
    setattribute P2, "i", P3

    new P4, 'Integer'
    getattribute P4, P2, "i"
    print P4
    print "\n"
    end
CODE
1024
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "set/get multiple object attribs" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    new P2, "Foo"

    new P3, 'Integer'
    set P3, 4201
    new P4, 'Hash'
    set P4["Key"], "Value"

    setattribute P2, "i", P3
    setattribute P2, "j", P4

    getattribute P5, P2, "i"
    print P5
    print "\n"
    getattribute P6, P2, "j"
    set S0, P6["Key"]
    print S0
    print "\n"
    end
CODE
4201
Value
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "setting non-existent attribute" );
    newpdd15class P1, "Foo"
    new P2, P1

    new P3, 'Integer'
    setattribute P2, "bar", P3
    end
CODE
/No such attribute/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "setting non-existent by name" );
    newpdd15class P1, "Foo"
    new P2, P1

    new P3, 'Integer'
    setattribute P2, ["Foo"], "no_such", P3
    end
CODE
/No such attribute 'no_such' in class 'Foo'/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "getting NULL attribute" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    new P2, P1

    getattribute P3, P2, "i"
    typeof S1, P3
    print S1
    print "\n"
    end
CODE
Undef
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "getting non-existent attribute" );
.sub 'main' :main
    newpdd15class P1, "Foo"
    P2 = P1.'new'()

    getattribute P3, P2, "bar"
.end
CODE
/No such attribute/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "attribute values are specific to objects" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    new P2, P1
    new P3, P1

    new P4, 'Integer'
    set P4, 100
    setattribute P2, "i", P4
    new P5, 'String'
    set P5, "One hundred"
    setattribute P3, "i", P5

    getattribute P6, P2, "i"
    print P6
    print "\n"
    getattribute P6, P3, "i"
    print P6
    print "\n"
    end
CODE
100
One hundred
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "attribute values and subclassing" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    subclass P2, P1, "Bar"
    addattribute P2, "k"
    addattribute P2, "l"

    new P2, "Bar"
    new P3, "Bar"

# Note that setattribute holds the actual PMC, not a copy, so
# in this test both attributes get the PMC from P4, and should
# both have the same value, despite the C<inc>.
    new P4, 'Integer'
    set P4, 10
    setattribute P2, "i", P4
    inc P4
    setattribute P2, "j", P4

    new P5, 'Integer'
    set P5, 100
    setattribute P3, "i", P5
    inc P5
    setattribute P3, "j", P5

    getattribute P6, P2, "i"
    bsr l1
    getattribute P6, P2, "j"
    bsr l1

    getattribute P6, P3, "i"
    bsr l1
    getattribute P6, P3, "j"
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

pasm_output_is( <<'CODE', <<'OUTPUT', "attribute values and subclassing 2" );
    newpdd15class P1, "Foo"
    # must add attributes before object instantiation
    addattribute P1, ".i"
    addattribute P1, ".j"

    subclass P2, P1, "Bar"
    addattribute P2, ".k"
    addattribute P2, ".l"

    # subclass is preferred for the SI case over
    #   newpdd15class P2, "Bar"
    #   addattrib ...
    #   addparent P2, P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    new P3, "Bar"

    # print I3                  # don't assume anything about this offset
    # print "\n"		# ' for vim

    new P10, 'String'		# set attribute values
    set P10, "i\n"		# attribute slots have reference semantics
    setattribute P3, ".i", P10	# so always put new PMCs in
                                # if you have unique values
    new P10, 'String'
    set P10, "j\n"
    setattribute P3, ".j", P10

    new P10, 'String'
    set P10, "k\n"
    setattribute P3, ".k", P10
    new P10, 'String'
    set P10, "l\n"
    setattribute P3, ".l", P10

    getattribute P11, P3, ".i"	# retrieve attribs
    print P11
    getattribute P11, P3, ".j"
    print P11

    getattribute P11, P3, ".k"
    print P11
    getattribute P11, P3, ".l"
    print P11

    set S0, P3		# verify classname is still ok
    print S0
    print "\n"
    end
CODE
i
j
k
l
parrot;Bar
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "attribute values, subclassing access meths " );
    newpdd15class P1, "Foo"
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
    new P13, "Bar"

    # Foo and Bar have attribute accessor methods
    new P5, 'String'		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set_args "(0,0)", P5, "i"
    get_results "()"
    callmethodcc P13, "Foo::set"

    new P5, 'String'
    set P5, "j\n"
    set_args "(0,0)", P5, "j"
    get_results "()"
    callmethodcc  P13,"Foo::set"

    new P5, 'String'
    set P5, "k\n"
    set_args "(0,0)", P5, "k"
    get_results "()"
    callmethodcc  P13,"Bar::set"

    new P5, 'String'
    set P5, "l\n"
    set_args "(0,0)", P5, "l"
    get_results "()"
    callmethodcc  P13,"Bar::set"

    # now retrieve attributes
    set_args "(0)",  "i"
    get_results "(0)", P5
    callmethodcc  P13,"Foo::get"
    print P5			# return result

    set_args "(0)",  "j"
    get_results "(0)", P5
    callmethodcc  P13,"Foo::get"
    print P5

    set_args "(0)",  "k"
    get_results "(0)", P5
    callmethodcc  P13,"Bar::get"
    print P5			# return result

    set_args "(0)",  "l"
    get_results "(0)", P5
    callmethodcc  P13,"Bar::get"
    print P5
    end

# set(obj: Pvalue, Iattr_idx)
.pcc_sub Foo::set:
    get_params "(0,0)", P5, S4
    print "in Foo::set\n"
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    setattribute P2, S4, P5	# so always put new PMCs in
    set_returns "()"
    returncc

# Pattr = get(obj: Iattr_idx)
.pcc_sub Foo::get:
    get_params "(0)", S4
    print "in Foo::get\n"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    getattribute P5, P2, S4
    set_returns "(0)", P5
    returncc

.pcc_sub Bar::set:
    get_params "(0,0)", P5, S4
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    print "in Bar::set\n"
    setattribute P2, S4, P5	# so always put new PMCs in
    set_returns "()"
    returncc

.pcc_sub Bar::get:
    get_params "(0)", S4
    print "in Bar::get\n"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    getattribute P5, P2, S4
    set_returns "(0)", P5
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

pasm_output_is( <<'CODE', <<'OUTPUT', "attribute values, inherited access meths" );
    newpdd15class P1, "Foo"
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
    #   newpdd15class P2, "Bar"
    #   addattrib ...
    #   addparent P2, P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    new P2, "Bar"

    # Foo and Bar have attribute accessor methods
    new P5, 'String'		# set attribute values
    set P5, "i\n"		# attribute slots have reference semantics
    set_args "(0,0,0)", P5, "Foo", "i"
    get_results "()"
    callmethodcc P2, "set"

    new P5, 'String'
    set P5, "j\n"
    set_args "(0,0,0)", P5, "Foo", "j"
    get_results "()"
    callmethodcc P2, "set"

    new P5, 'String'
    set P5, "k\n"
    set_args "(0,0,0)", P5, "Bar", "k"
    get_results "()"
    callmethodcc P2, "set"

    new P5, 'String'
    set P5, "l\n"
    set_args "(0,0,0)", P5, "Bar", "l"
    get_results "()"
    callmethodcc P2, "set"

    new P5, 'String'
    set P5, "m\n"
    set_args "(0,0,0)", P5, "Bar", "m"
    get_results "()"
    callmethodcc P2, "set"

    # now retrieve attributes
    set_args "(0,0)", "Foo", "i"
    get_results "(0)", P5
    callmethodcc P2, "get"
    print P5			# return result

    set_args "(0,0)", "Foo", "j"
    get_results "(0)", P5
    callmethodcc P2, "get"
    print P5


    set_args "(0,0)", "Bar", "k"
    get_results "(0)", P5
    callmethodcc P2, "get"
    print P5

    set_args "(0,0)", "Bar", "l"
    get_results "(0)", P5
    callmethodcc P2, "get"
    print P5

    set_args "(0,0)", "Bar", "m"
    get_results "(0)", P5
    callmethodcc P2, "get"
    print P5
    end

# Foo provides accessor functions which Bar inherits
# they take an additional classname argument SClass

# set(obj: Pvalue, SClass, Sattr)
.pcc_sub set:
.include "interpinfo.pasm"
    get_params "(0,0,0)", P5, S4, S5
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    setattribute P2, S4, P5
    set_returns "()"
    returncc

# Pattr = get(obj: SClass, Sattr)
.pcc_sub get:
    get_params "(0,0)", S5, S4
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    getattribute P5, P2, S4
    set_returns "(0)", P5
    returncc

CODE
i
j
k
l
m
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "overridden vtables" );
.sub 'main' :main
    newpdd15class P1, "Foo"
    # must add attributes before object instantiation
    addattribute P1, ".i"

    P3 = P1.'new'()
    set P3, 1
    P4 = P1.'new'()
    set P4, 1
    P5 = P1.'new'()

    add P5, P3, P4
    # the print below calls __get_string
    print P5
    print "\n"
    set P4, 41
    add P5, P3, P4
    print P5
    print "\n"
.end

.namespace [ 'Foo' ]

.sub 'set_integer_native' :vtable :method
    .param int val

    print "in set_integer\n"
    new P6, 'Integer'
    set P6, val
    setattribute P2, ".i", P6

    .return ()
.end

.sub 'add' :multi(PMC, PMC) :method
    .param pmc left
    .param pmc right

    print "in add\n"
    getattribute P10, self, ".i"
    getattribute P11, left, ".i"
    new P12, 'Integer'
    add P12, P10, P11
    setattribute P7, ".i", right

    .return( P7 )
.end

.sub 'get_string' :vtable :method
    print "in get_string\n"
    getattribute P10, self, ".i"
    set S5, P10
    set I0, P10
    ne I0, 2, no_2
    set S5, "two"
no_2:
    .return( S5 )
.end
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
# pasm_output_is(<<'CODE', <<'OUTPUT', "typeof classes");
#     newpdd15class P0, "A"
#     newpdd15class P1, "B"
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

pasm_output_is( <<'CODE', <<'OUTPUT', "typeof objects" );
    newpdd15class P0, "A"
    newpdd15class P1, "B"

    new P0, "A"
    new P1, "B"

    typeof S0, P0
    typeof S1, P1
    print S0
    print "\n"
    print S1
    print "\n"
    end
CODE
parrot;A
parrot;B
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "multiple inheritance, with attributes" );
    newpdd15class P1, "Star"
    addattribute P1, "Spectral Type"

    newpdd15class P2, "Company"
    addattribute P2, "Annual Profit"

    subclass P3, P1, "Sun"
    addparent P3, P2

    new P4, "Sun"

    new P5, 'String'
    set P5, "G"
    setattribute P4, "Spectral Type", P5

    new P6, 'String'
    set P6, "$100,000,000"
    setattribute P4, "Annual Profit", P6

    getattribute P7, P4, "Spectral Type"
    print P7
    print "\n"
    getattribute P8, P4, "Annual Profit"
    print P8
    print "\n"
    end
CODE
G
$100,000,000
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "two levels of inheritance" );
    newpdd15class P0, "Astronomical Object"
    addattribute P0, "Location"

    subclass P1, P0, "Star"
    addattribute P1, "Spectral Type"

    newpdd15class P2, "Sun"
    addparent P2, P1
    addparent P2, P0

    new P4, "Sun"

    new P5, 'String'
    set P5, "Taurus"
    setattribute P4, "Location", P5
    getattribute P6, P4, "Location"
    print P6
    print "\n"
    end
CODE
Taurus
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "addparent exceptions #1" );
    newpdd15class P0, "Astronomical Object"
    new P1, 'String'
    set P1, "Not a class"
    addparent P0, P1
    end
CODE
/Parent isn't a Class/
OUTPUT

# '

pasm_error_output_like( <<'CODE', <<'OUTPUT', "addparent exceptions #2" );
    new P0, 'Hash'
    newpdd15class P1, "Trashcan"
    addparent P0, P1
    end
CODE
/Class isn't a ParrotClass/
OUTPUT

# '

pasm_output_is( <<'CODE', <<'OUTPUT', "class op test" );
    newpdd15class P0, "City"
    new P1, "City"

    class P2, P1
#    classname S0, P2 # deprecated
    set S0, P2
    print S0
    print "\n"
    end
CODE
parrot;City
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "subclassing a non-existent class" );
    subclass P1, "Character", "Nemo"
    print "Uh-oh...\n"
    end
CODE
/Class 'Character' doesn't exist/
OUTPUT

# '
pasm_error_output_like( <<'CODE', <<'OUTPUT', "anon. subclass of non-existent class" );
    subclass P1, "Character"
    print "Uh-oh...\n"
    end
CODE
/Class 'Character' doesn't exist/
OUTPUT

# '

pasm_output_is( <<'CODE', <<'OUTPUT', "anon. subclass has no name" );
    newpdd15class P0, "City"
    subclass P1, P0
#    classname S0, P1 # deprecated
    set S0, P1
    print "'"
    print S0
    print "'"
    print "\n"
    end
CODE
''
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get attrib by name" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    new P2, "Foo"
    new P3, 'String'
    set P3, "ok\n"
    setattribute P2, "i", P3

    getattribute P4, P2, ["Foo"], "i"
    print P4
    end
CODE
ok
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get attrib by name subclass" );
    newpdd15class P0, "Bar"
    addattribute P0, "j"
    subclass P1, P0, "Foo"
    addattribute P1, "i"
    new P2, "Foo"
    new P3, 'String'
    set P3, "foo i\n"
    setattribute P2, "i", P3
    new P3, 'String'
    set P3, "bar j\n"
    setattribute P2, "j", P3

    getattribute P4, P2, ["Foo"], "i"
    print P4
    getattribute P4, P2, ["Bar"], "j"
    print P4
    end
CODE
foo i
bar j
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "set attrib by name subclass" );
    newpdd15class P0, "Bar"
    addattribute P0, "j"
    subclass P1, P0, "Foo"
    addattribute P1, "i"
    new P2, "Foo"
    new P3, 'String'
    set P3, "foo i\n"
    setattribute P2, ["Foo"], "i", P3
    new P3, 'String'
    set P3, "bar j\n"
    setattribute P2, ["Bar"], "j", P3

    getattribute P4, P2, "i"
    print P4
    getattribute P4, P2, "j"
    print P4
    end
CODE
foo i
bar j
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "addattribute duplicate" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    addattribute P1, "i"
    print "never\n"
    end
CODE
/Attribute 'i' already exists/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "PMC as classes" );
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - subclass" );

.sub main :main
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
MyInt
11
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - instantiate" );

.sub main :main
  .local pmc MyInt
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  addattribute MyInt, ".i"
  print "ok 2\n"
  .local pmc i
  i = new "MyInt"
  print "ok 3\n"
.end
CODE
ok 1
ok 2
ok 3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - methods" );

.sub main :main
  .local pmc MyInt
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  print "ok 2\n"
  .local pmc i
  i = new "MyInt"
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
.sub get_integer :vtable :method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub get_string :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - mmd methods" );


.sub main :main
  .local pmc MyInt
  getclass $P0, "Integer"
  subclass MyInt, $P0, "MyInt"
  .local pmc i
  .local pmc j
  .local pmc k
  i = new "MyInt"
  j = new "MyInt"
  k = new "MyInt"
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
.sub get_string :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - overridden mmd methods");

.sub main :main
  .local pmc MyInt
  getclass $P0, "Integer"
  subclass MyInt, $P0, "MyInt"
  .local pmc i
  .local pmc j
  .local pmc k
  i = new "MyInt"
  j = new "MyInt"
  k = new "MyInt"
  i = 6
  j = 7
  k = i + j
  print k
  print "\n"
  j = new 'Integer'
  j = 100
  k = i + j
  print k
  print "\n"
.end

.namespace ["MyInt"]
.sub __add :multi(MyInt, MyInt)
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - derived 1" );

.sub main :main
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  i = new "MyInt2"
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
.sub get_integer :vtable :method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub get_string :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - derived 2" );

.sub main :main
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  i = new "MyInt2"
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
.sub get_integer :vtable :method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   inc $I0            # <<<<<
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.namespace ["MyInt"]
.sub get_integer :vtable :method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub get_string :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "PMC as classes - derived 3" );

.sub main :main
  .local pmc MyInt
  .local pmc MyInt2
  getclass $P0, "Integer"
  print "ok 1\n"
  subclass MyInt, $P0, "MyInt"
  getclass $P1, "MyInt"
  subclass MyInt2, $P1, "MyInt2"
  print "ok 2\n"
  .local pmc i
  i = new "MyInt2"
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
.sub get_integer :vtable :method
   $I0 = classoffset self, "MyInt"
   $P0 = getattribute self, $I0
   $I0 = $P0
   .pcc_begin_return
   .return $I0
   .pcc_end_return
.end
.sub get_string :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "subclassing ParrotClass" );

.sub main :main
    .local pmc cl
    .local pmc parent
    parent = getclass "Class"
    cl = subclass parent, "Foo"
    print "ok 1\n"
    .local pmc o
    o = new "Foo"
    print "ok 2\n"
#    $S0 = classname o # deprecated
    $S0 = o
    print $S0
    print "\n"
.end
CODE
ok 1
ok 2
Foo
OUTPUT

SKIP: {
    skip( "instantiate disabled", 2 );
    pasm_output_is( <<'CODE', <<'OUTPUT', "instantiate", todo => 'needs super()' );
    subclass P2, "Integer", "Foo"
    set I0, 0
    set I3, 1
    new P5, 'Integer'
    set P5, 42
    instantiate P1
    print P1
    print "\n"
    end
.namespace [ "Foo" ]
.pcc_sub __instantiate:	# create object the hard way
    new P10, "Foo"		# should inspect passed arguments
    classoffset I0, P10, "Foo"	# better should clone the argument
    setattribute P10, I0, P5	# the first attribute is the internal __value
    set P5, P10			# set return value
    set I0, 0
    set I3, 1
    returncc
CODE
42
OUTPUT

    pir_output_is( <<'CODE', <<'OUTPUT', "instantiate - PIR", todo => 'needs super()' );

.sub main :main
    .local pmc cl
    cl = subclass "Integer", "Foo"
    .local pmc i
    i = cl."instantiate"(42)
    print i
    print "\n"
.end

.namespace ["Foo"]
.sub __instantiate :method
    .param int val		# in realiter check what is passed
    .local pmc obj
    obj = new "Foo"
    $I1 = classoffset obj, "Foo"
    $P0 = new 'Integer'
    $P0 = val
    setattribute obj, $I1, $P0
    .pcc_begin_return
    .return obj
    .pcc_end_return
.end
CODE
42
OUTPUT
}

pir_output_is( <<'CODE', <<'OUTPUT', "namespace vs name" );
.sub main :main
    .local pmc o, cl, f
    newpdd15class cl, "Foo"
    o = new "Foo"
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
.sub get_string :vtable :method
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

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Wrong way to create new objects" );
    new P0, .ParrotObject
    end
CODE
/Can't create new ParrotObject/
OUTPUT

#' for vim

pasm_output_is( <<'CODE', <<'OUTPUT', "multpile anon classes - #33103" );
     newpdd15class P0, "City"
     subclass P1, P0
     newpdd15class P2, "State"
     subclass P3, P2
     print "ok\n"
     end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "subclassed Integer bug" );
.sub _main :main
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

pasm_output_is( <<'CODE', <<'OUTPUT', "short name attributes" );
    newpdd15class P1, "Foo"
    addattribute P1, "i"
    addattribute P1, "j"
    subclass P2, P1, "Bar"
    addattribute P2, "k"
    addattribute P2, "l"

    new P2, "Bar"

    new P4, 'Integer'
    set P4, 10
    setattribute P2, "i", P4
    new P4, 'Integer'
    set P4, 11
    setattribute P2, "j", P4
    new P4, 'Integer'
    set P4, 20
    setattribute P2, "k", P4
    new P4, 'Integer'
    set P4, 21
    setattribute P2, "l", P4

    getattribute P6, P2, "i"
    bsr l1
    getattribute P6, P2, "j"
    bsr l1

    getattribute P6, P2, "k"
    bsr l1
    getattribute P6, P2, "l"
    bsr l1

    getattribute P6, P2, ["Foo"], "i"
    bsr l1
    getattribute P6, P2, ["Bar"], "k"
    bsr l1
    branch end
l1:
    print P6
    print "\n"
    ret
end:
    end
CODE
10
11
20
21
10
20
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "init with and w/o arg" );
.sub 'main' :main
    .local pmc cl, o, h, a
    cl = newpdd15class "Foo"
    addattribute cl, "a"
    o = cl.'new'()
    a = getattribute o, "a"
    print a
    h = new 'Hash'
    $P0 = new 'String'
    $P0 = "ok 2\n"
    h['a'] = $P0
    o  = cl.'new'(h)
    a = getattribute o, "a"
    print a
.end

.namespace ["Foo"]
.sub init_pmc :vtable :method
    .param pmc args
    $P0 = args['a']
    setattribute self, 'a', $P0
    .return()
.end
.sub init :vtable :method
    $P0 = new 'String'
    $P0 = "ok 1\n"
    setattribute self, 'a', $P0
.end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "newpdd15class [] parsing)" );
    newpdd15class P0, ['Foo';'Bar']
    print "ok\n"
    end
CODE
ok
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "verfiy namespace types" );
    newpdd15class P0, ['Foo';'Bar']
    getinterp P0
    .include "iglobals.pasm"
    set P1, P0[.IGLOBALS_CLASSNAME_HASH]
    typeof S0, P1
    print S0
    print "\n"
    set P2, P1['Foo']
    typeof S0, P2
    print S0
    print "\n"
    end
CODE
NameSpace
NameSpace
OUTPUT

pasm_output_like( <<'CODE', <<'OUTPUT', "verfiy data type" );
    newpdd15class P0, ['Foo';'Bar']
    getinterp P0
    .include "iglobals.pasm"
    set P1, P0[.IGLOBALS_CLASSNAME_HASH]
    set P2, P1['Foo']
    set P3, P2['Bar']
    print P3
    print "\n"
    end
CODE
/\d+/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "new keyed" );
.sub main :main
    .local pmc cl, o
    cl = newpdd15class ['Foo';'Bar']
    o = cl.'new'()
    print "ok\n"
.end
.namespace ['Foo';'Bar']
.sub init :vtable :method
    print "__init\n"
.end
CODE
__init
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "new keyed 2" );
.sub main :main
    .local pmc c1, c2, o1, o2
    c1 = newpdd15class ['Foo';'Bar']
    c2 = newpdd15class ['Foo';'Baz']
    o1 = c1.'new'()
    o2 = c2.'new'()
    print "ok\n"
.end
.namespace ['Foo';'Bar']
.sub init :vtable :method
    print "__init Bar\n"
.end
.namespace ['Foo';'Baz']
.sub init :vtable :method
    print "__init Baz\n"
.end

CODE
__init Bar
__init Baz
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "new keyed 3" );
.sub main :main
    .local pmc c1, c2, c3, o1, o2, o3
    c1 = newpdd15class ['Foo';'Bar']
    c2 = newpdd15class ['Foo';'Baz']
    c3 = newpdd15class 'Foo'
    o1 = new      ['Foo';'Bar']
    o2 = new      ['Foo';'Baz']
    o3 = new      'Foo'
    print "ok\n"
.end
.namespace ['Foo';'Bar']
.sub init :vtable :method
    print "__init Bar\n"
.end
.namespace ['Foo';'Baz']
.sub init :vtable :method
    print "__init Baz\n"
.end

.namespace ['Foo']
.sub init :vtable :method
    print "__init Foo\n"
.end
CODE
__init Bar
__init Baz
__init Foo
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "subclass keyed" );
.sub main :main
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6'; 'PAST'; 'Node']
    addattribute base, '$.source'                  # original source
    addattribute base, '$.pos'                     # offset position

    $P0 = subclass base, ['Perl6'; 'PAST'; 'Sub']
    $P0 = subclass base, ['Perl6'; 'PAST'; 'Stmt']
    print "ok 1\n"

    o1 = new   ['Perl6'; 'PAST'; 'Sub']
    o2 = new   ['Perl6'; 'PAST'; 'Stmt']
    print "ok 2\n"
.end
.namespace ['Perl6'; 'PAST'; 'Stmt']
.sub init :vtable :method
    print "__init Stmt\n"
.end
.namespace ['Perl6'; 'PAST'; 'Sub']
.sub init :vtable :method
    print "__init Sub\n"
.end
CODE
ok 1
__init Sub
__init Stmt
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "class name" );
.sub main :main
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6'; 'PAST'; 'Node']
    $S0 = classname base
    print $S0
    print "\n"
.end
CODE
Perl6;PAST;Node
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "getclass" );
.sub main :main
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6'; 'PAST'; 'Node']
    $P0 = getclass ['Perl6'; 'PAST'; 'Node']
    $S0 = classname $P0
    print $S0
    print "\n"
.end
CODE
Perl6;PAST;Node
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "isa (#39045)" );
.sub main :main
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6'; 'PAST'; 'Node']
    $P0 = new [ 'Perl6'; 'PAST'; 'Node' ]
    $I0 = isa $P0, [ 'Perl6'; 'PAST'; 'Node']
    print $I0
    $I0 = isa $P0, 'Hash'
    print $I0
    $I0 = isa $P0, 'Perl6'
    print $I0
    print "\n"
.end
CODE
110
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "new nested ordering" );
.sub main :main
    .local pmc c1, c2, o
    c1 = newpdd15class ['Foo']
    c2 = newpdd15class ['Foo';'Bar']
    o = c2.'new'()
    print "ok\n"
.end
.namespace ['Foo']
.sub init :vtable :method
    print "__init Foo\n"
.end
.namespace ['Foo';'Bar']
.sub init :vtable :method
    print "__init Bar\n"
.end
CODE
__init Bar
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "vtable override once removed (#39056)" );
.sub main :main
    .local pmc base
    $P0 = getclass 'Integer'
    base = subclass $P0, 'Foo'          # create subclass 'Foo'
    addattribute base, '@!capt'

    $P0 = subclass 'Foo', 'Bar'         # create subclass 'Bar'
    $P1 = new 'Bar'                     # create an instance of 'Bar'

    $S1 = $P1                           # get its string representation
    print $S1                           # display it
    print "\n"
.end

.namespace [ 'Bar' ]

.sub 'get_string' :vtable :method
    $S0 = 'ok bar'
    .return ($S0)
.end
CODE
ok bar
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "super __init called twice (#39081)" );
.sub main :main
    $P0 = newpdd15class 'Foo'
    $P1 = subclass $P0, 'Bar'

    $P2 = $P1.'new'()
.end

.namespace [ 'Foo' ]

.sub 'init' :vtable :method
    say "foo constructor"
    .return ()
.end
CODE
foo constructor
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Using key from classname op with new" );
.sub main :main
    $P0 = newpdd15class [ "Monkey" ; "Banana" ]
    $P0 = $P0.'new'()
    $P0.ook()
    $P1 = class $P0
    $P2 = classname $P0
    $P3 = new $P2
    $P3.ook()
.end

.namespace [ "Monkey" ; "Banana" ]
.sub ook
    print "Ook!\n"
.end
CODE
Ook!
Ook!
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
