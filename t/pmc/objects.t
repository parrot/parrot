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

use Parrot::Test tests => 24;
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

output_is(<<'CODE', <<'OUTPUT', "addattrib");
    newclass P1, "Foo"
    addattribute I1, P1, "foo_i"
    print "ok 1\n"
    print I1
    print "\n"
    addattribute I1, P1, "foo_j"
    print I1
    print "\n"
    end
CODE
ok 1
0
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "addattribute subclass");
    newclass P1, "Foo"
    addattribute I1, P1, "foo_i"
    print "ok 1\n"
    print I1
    print "\n"
    addattribute I1, P1, "foo_j"
    print I1
    print "\n"

    subclass P2, P1, "Bar"
    addattribute I1, P2, "bar_i"
    print "ok 2\n"
    print I1
    print "\n"
    addattribute I1, P2, "bar_j"
    print I1
    print "\n"
    # attr count
    set I0, P2
    print I0
    print "\n"
    end
CODE
ok 1
0
1
ok 2
2
3
4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "addattribute subclass - get idx");
    newclass P1, "Foo"
    addattribute I1, P1, "foo_i"
    set I2, P1["Foo\x00foo_i"]
    eq I1, I2, ok1
    print "not "
ok1:
    print "ok 1\n"
    addattribute I1, P1, "foo_j"
    set I2, P1["Foo\x00foo_j"]
    eq I1, I2, ok2
    print "not "
ok2:
    print "ok 2\n"

    subclass P2, P1, "Bar"
    addattribute I1, P2, "bar_i"
    set I2, P2["Bar\x00bar_i"]
    eq I1, I2, ok3
    print "not "
ok3:
    print "ok 3\n"
    addattribute I1, P2, "bar_j"
    set I2, P2["Bar\x00bar_j"]
    eq I1, I2, ok4
    print "not "
ok4:
    print "ok 4\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "object attr count");
    newclass P1, "Foo"
    addattribute I1, P1, "foo_i"
    addattribute I1, P1, "foo_j"
    set I1, P1
    print I1
    print "\n"

    find_type I0, "Foo"
    new P2, I0
    set I1, P2
    print I1
    print "\n"
    end
CODE
2
2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "object attribs 1");
    newclass P1, "Foo"
    addattribute I1, P1, "i"
    addattribute I1, P1, "j"

    find_type I0, "Foo"
    new P2, I0
    new P3, I0

    set P2["Foo\x00i"], 10
    set P3["Foo\x00i"], 20
    set I2, P2["Foo\x00i"]
    set I3, P3["Foo\x00i"]
    print I2
    print "\n"
    print I3
    print "\n"
    end
CODE
10
20
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "object attribs 2");
    newclass P1, "Foo"
    addattribute I1, P1, "i"
    addattribute I1, P1, "j"

    find_type I0, "Foo"
    new P2, I0
    new P3, I0

    set P2["Foo\x00i"], 10
    set P3["Foo\x00i"], 20
    set P2["Foo\x00j"], 30
    set P3["Foo\x00j"], 40
    set I4, P2["Foo\x00j"]
    set I5, P3["Foo\x00j"]
    set I2, P2["Foo\x00i"]
    set I3, P3["Foo\x00i"]
    print I2
    print "\n"
    print I3
    print "\n"
    print I4
    print "\n"
    print I5
    print "\n"
    end
    end
CODE
10
20
30
40
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "object attribs 3");
    newclass P1, "Foo"
    addattribute I1, P1, "i"

    find_type I0, "Foo"
    new P2, I0

    set P2["Foo\x00no_such"], 10
    print "never\n"
    end
CODE
/No such attribute/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "object attribs 4");
    newclass P1, "Foo"
    addattribute I1, P1, "i"
    addattribute I1, P1, "j"

    find_type I0, "Foo"
    new P2, I0
    new P3, I0

    # the preferred method of accessing attribs is by index
    set P2[0], 10
    set P3[0], 20
    set P2[1], 30
    set P3[1], 40
    set I4, P2[1]
    set I5, P3[1]
    set I2, P2[0]
    set I3, P3[0]
    print I2
    print "\n"
    print I3
    print "\n"
    print I4
    print "\n"
    print I5
    print "\n"
    set I6, P3["Foo\x00j"]
    eq I5, I6, ok
    print "not "
ok: print "ok\n"
    end
CODE
10
20
30
40
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "class attribs - same name");
    newclass P1, "Foo"
    addattribute I1, P1, "i"
    addattribute I1, P1, "j"
    subclass P2, P1, "Bar"
    addattribute I1, P2, "i"
    addattribute I1, P2, "j"
    set I0, P2
    print I0
    print "\n"
    set I0, P2["Foo\x0i"]
    print I0
    print "\n"
    set I0, P2["Bar\x0i"]
    print I0
    print "\n"
    end
CODE
4
0
2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "object attribs 5");
    newclass P1, "Foo"
    addattribute I1, P1, "i"
    addattribute I1, P1, "j"
    subclass P2, P1, "Bar"
    addattribute I1, P2, "k"
    addattribute I1, P2, "l"

    find_type I0, "Bar"
    new P2, I0
    new P3, I0

    set P2[0], 10
    set P2[1], 20
    set P2[2], 30
    set P2[3], 40
    set P3[0], 110
    set P3[1], 120
    set P3[2], 130
    set P3[3], 140

    set I0, 0
lp1:
    set I4, P2[I0]
    print I4
    print "\n"
    inc I0
    lt I0, 4, lp1

    set I0, 0
lp2:
    set I4, P3[I0]
    print I4
    print "\n"
    inc I0
    lt I0, 4, lp2

    end
CODE
10
20
30
40
110
120
130
140
OUTPUT


output_is(<<'CODE',  (join '', map { "$_\n" }42..65), "attributes");
   newclass P0, "Foo"
   find_type I1, "Foo"
   addattribute I0, P0, "b"
   addattribute I0, P0, "l"
   addattribute I0, P0, "a"
   new P1, I1

   set  P1["Foo\x00a"], 42
   set  I2, P1["Foo\x00a"]
   print I2
   print "\n"

   set  S0, "Foo\x00a"
   set  P1[S0], 43
   set  I2, P1[S0]
   print I2
   print "\n"

   set  P1[2], 44
   set  I2, P1[2]
   print I2
   print "\n"

   set I3, 2
   set  P1[I3], 45
   set  I2, P1[I3]
   print I2
   print "\n"



   new P2, .Key
   set P2, "Foo\x00a"

   set  P1[P2], 46
   set  I2, P1[P2]
   print I2
   print "\n"

   new P2, .Key
   set P2, 0

   set  P1[P2], 47
   set  I2, P1[P2]
   print I2
   print "\n"



# strings

   set  P1["Foo\x00a"], "48"
   set  S2, P1["Foo\x00a"]
   print S2
   print "\n"

   set  S0, "Foo\x00a"
   set  P1[S0], "49"
   set  S2, P1[S0]
   print S2
   print "\n"

   set  P1[2], "50"
   set  S2, P1[2]
   print S2
   print "\n"

   set I3, 2
   set  P1[I3], "51"
   set  S2, P1[I3]
   print S2
   print "\n"



   new P2, .Key
   set P2, "Foo\x00a"

   set  P1[P2], "52"
   set  S2, P1[P2]
   print S2
   print "\n"

   new P2, .Key
   set P2, 0

   set  P1[P2], "53"
   set  S2, P1[P2]
   print S2
   print "\n"

# pmc


   set  P1["Foo\x00a"], 54
   set  P4, P1["Foo\x00a"]
   print P4
   print "\n"

   set  S0, "Foo\x00a"
   set  P1[S0], 55
   set  P4, P1[S0]
   print P4
   print "\n"

   set  P1[2], 56
   set  P4, P1[2]
   print P4
   print "\n"

   set I3, 2
   set  P1[I3], 57
   set  P4, P1[I3]
   print P4
   print "\n"



   new P2, .Key
   set P2, "Foo\x00a"

   set  P1[P2], 58
   set  P4, P1[P2]
   print P4
   print "\n"

   new P2, .Key
   set P2, 0

   set  P1[P2], 59
   set  P4, P1[P2]
   print P4
   print "\n"


   set  P1["Foo\x00a"], "60"
   set  P4, P1["Foo\x00a"]
   print P4
   print "\n"

   set  S0, "Foo\x00a"
   set  P1[S0], "61"
   set  P4, P1[S0]
   print P4
   print "\n"

   set  P1[2], "62"
   set  P4, P1[2]
   print P4
   print "\n"

   set I3, 2
   set  P1[I3], "63"
   set  P4, P1[I3]
   print P4
   print "\n"



   new P2, .Key
   set P2, "Foo\x00a"

   set  P1[P2], "64"
   set  P4, P1[P2]
   print P4
   print "\n"

   new P2, .Key
   set P2, 0

   set  P1[P2], "65"
   set  P4, P1[P2]
   print P4
   print "\n"
   end
CODE

my $output_re = join '', map {  "$_.00.*[\\n\\r]+" } 4..15;
$output_re = qr/^$output_re$/;
output_like(<<'CODE',  $output_re , "float attributes");
   newclass P0, "Foo"
   find_type I1, "Foo"
   addattribute P0, "b", "Foo::b"
   addattribute P0, "l", "Foo::l"
   addattribute P0, "a", "Foo::a"
   new P1, I1


   set  P1["Foo\x00a"], 4.00001
   set  N2, P1["Foo\x00a"]
   print N2
   print "\n"


   set  S0, "Foo\x00a"
   set  P1[S0], 5.00001
   set  N2, P1[S0]
   print N2
   print "\n"


   set  P1[2], 6.00001
   set  N2, P1[2]
   print N2
   print "\n"

   set I3, 2
   set  P1[I3], 7.00001
   set  N2, P1[I3]
   print N2
   print "\n"

   new P2, .Key
   set P2, "Foo\x00a"
   set  P1[P2], 8.00001
   set  N2, P1[P2]
   print N2
   print "\n"

   new P2, .Key
   set P2, 0
   set  P1[P2], 9.00001
   set  N2, P1[P2]
   print N2
   print "\n"

   set  P1["Foo\x00a"], 10.00001
   set  P4, P1["Foo\x00a"]
   print P4
   print "\n"

   set  S0, "Foo\x00a"
   set  P1[S0], 11.00001
   set  P4, P1[S0]
   print P4
   print "\n"

   set  P1[2], 12.00001
   set  P4, P1[2]
   print P4
   print "\n"

   set I3, 2
   set  P1[I3], 13.00001
   set  P4, P1[I3]
   print P4
   print "\n"


   new P2, .Key
   set P2, "Foo\x00a"
   set  P1[P2], 14.00001
   set  P4, P1[P2]
   print P4
   print "\n"

   new P2, .Key
   set P2, 0
   set  P1[P2], 15.00001
   set  P4, P1[P2]
   print P4
   print "\n"
   end


CODE
