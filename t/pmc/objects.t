#! perl -w

use Parrot::Test tests => 16;
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
    addattrib I1, P1, "foo_i"
    print "ok 1\n"
    print I1
    print "\n"
    addattrib I1, P1, "foo_j"
    print I1
    print "\n"
    end
CODE
ok 1
0
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "addattrib subclass");
    newclass P1, "Foo"
    addattrib I1, P1, "foo_i"
    print "ok 1\n"
    print I1
    print "\n"
    addattrib I1, P1, "foo_j"
    print I1
    print "\n"

    subclass P2, P1, "Bar"
    addattrib I1, P2, "bar_i"
    print "ok 2\n"
    print I1
    print "\n"
    addattrib I1, P2, "bar_j"
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

output_is(<<'CODE', <<'OUTPUT', "addattrib subclass - get idx");
    newclass P1, "Foo"
    addattrib I1, P1, "foo_i"
    set I2, P1["Foo\x0foo_i"]
    eq I1, I2, ok1
    print "not "
ok1:
    print "ok 1\n"
    addattrib I1, P1, "foo_j"
    set I2, P1["Foo\x0foo_j"]
    eq I1, I2, ok2
    print "not "
ok2:
    print "ok 2\n"

    subclass P2, P1, "Bar"
    addattrib I1, P2, "bar_i"
    set I2, P2["Bar\x0bar_i"]
    eq I1, I2, ok3
    print "not "
ok3:
    print "ok 3\n"
    addattrib I1, P2, "bar_j"
    set I2, P2["Bar\x0bar_j"]
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
    addattrib I1, P1, "foo_i"
    addattrib I1, P1, "foo_j"
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

