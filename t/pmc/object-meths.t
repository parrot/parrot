#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/object-meths.t - Object Methods

=head1 SYNOPSIS

	% perl t/pmc/object-meths.t

=head1 DESCRIPTION

Tests PMC object methods.

=cut

use Parrot::Test tests => 16;
use Test::More;

output_like(<<'CODE', <<'OUTPUT', "callmethod - unknown method");
    newclass P2, "Foo"
    set S0, "nada"
    callmethod
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "callmethod (STR) - unknown method");
    newclass P2, "Foo"
    set S1, "nada"
    callmethod S1
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "callmethodcc - unknown method");
    newclass P2, "Foo"
    set S0, "nada"
    callmethodcc
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "callmethodcc (STR) - unknown method");
    newclass P2, "Foo"
    set S1, "nada"
    callmethodcc S1
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "callmethod 1");
    newclass P2, "Foo"
    set S0, "meth"

    print "main\n"
    callmethodcc
    print "back\n"
    end

.namespace ["Foo"]
.pcc_sub meth:
    print "in meth\n"
    invoke P1
CODE
main
in meth
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "can class");
    newclass P2, "Foo"
    set S0, "meth"

    new P3, .Sub
    # store the sub with the real name
    store_global "Foo", "meth", P3

    can I0, P2, "meth"
    print I0
    print "\n"
    can I0, P2, "no_such_meth"
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "can object");
    newclass P2, "Foo"
    find_type I0, "Foo"
    new P2, I0

    set S0, "meth"

    new P3, .Sub
    # store the sub with the real name
    store_global "Foo", "meth", P3

    can I0, P2, "meth"
    print I0
    print "\n"
    can I0, P2, "no_such_meth"
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "constructor");
    newclass P1, "Foo"
    find_type I1, "Foo"
    new P3, I1
    print "ok 2\n"
    end
.namespace ["Foo"]
.pcc_sub __init:
    print "ok 1\n"
    invoke P1
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "constructor - init attr");
    newclass P1, "Foo"
    addattribute P1, ".i"
    find_type I1, "Foo"
    new P3, I1
    print "ok 2\n"
    print P3
    print "\n"
    end
.namespace ["Foo"]
.pcc_sub __init:
    print "ok 1\n"
    new P10, .PerlInt
    set P10, 42
    classoffset I0, P2, "Foo"
    setattribute P2, I0, P10
    invoke P1
.pcc_sub __get_string:
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    set S5, P10
    invoke P1
CODE
ok 1
ok 2
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "constructor - parents");
    newclass P1, "Foo"
    subclass P2, P1, "Bar"
    subclass P3, P2, "Baz"
    find_type I1, "Baz"
    new P3, I1
    find_type I1, "Bar"
    new P3, I1
    find_global P0, "_sub"
    invokecc
    print "done\n"
    end

    .namespace ["Foo"]
.pcc_sub __init:
    print "foo_init\n"
    classname S0, P2
    print S0
    print "\n"
    invoke P1

    .namespace ["Bar"]
.pcc_sub __init:
    print "bar_init\n"
    invoke P1

    .namespace ["Baz"]
.pcc_sub __init:
    print "baz_init\n"
    invoke P1

    .namespace [""]	# main again
.pcc_sub _sub:
    print "in sub\n"
    invoke P1

CODE
foo_init
Baz
bar_init
baz_init
foo_init
Bar
bar_init
in sub
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "methods: self");
##PIR##
.sub _main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    find_type I0, "A"
    find_type I1, "B"

    new A, I0
    new B, I1

    setprop A, "B", B

    A."foo"()
    B."foo"()

    end
.end

.namespace ["A"]

.sub foo method
    .local pmc B

    print "A::foo\n"
    getprop B, "B", self

    self."blah"()
    B."blah"()
    self."blah"()

.end

.sub blah method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo method
    print "B::foo\n"
.end

.sub blah method
    print "B::blah\n"
.end
CODE
A::foo
A::blah
B::blah
A::blah
B::foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "methods: self w arg");
##PIR##
.sub _main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    find_type I0, "A"
    find_type I1, "B"

    new A, I0
    new B, I1

    A."foo"(B)
    B."foo"()

    end
.end

.namespace ["A"]

.sub foo method
    .param pmc B

    print "A::foo\n"

    self."blah"()
    B."blah"()
    self."blah"()

.end

.sub blah method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo method
    print "B::foo\n"
.end

.sub blah method
    print "B::blah\n"
.end
CODE
A::foo
A::blah
B::blah
A::blah
B::foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "methods: self w arg and ret");
##PIR##
.sub _main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    find_type I0, "A"
    find_type I1, "B"

    new A, I0
    new B, I1

    .local pmc r
    r = A."foo"(B)
    r."foo"()

    end
.end

.namespace ["A"]

.sub foo method
    .param pmc B

    print "A::foo\n"

    self."blah"()
    B."blah"()
    self."blah"()
    .pcc_begin_return
    .return B
    .pcc_end_return

.end

.sub blah method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo method
    print "B::foo\n"
.end

.sub blah method
    print "B::blah\n"
.end
CODE
A::foo
A::blah
B::blah
A::blah
B::foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "exceptions and different runloops");
_main:
    newsub P0, .Exception_Handler, _eh
    set_eh P0

    newclass P0, "Foo"

    newsub P0, .Sub, __init
    store_global "Foo", "__init", P0

    print "new\n"
    find_type I0, "Foo"
    new P2, I0
    print "back in main\n"
    end

_eh:
    print "eh!\n"
    set P0, P5["_invoke_cc"]
    invoke P0

__init:
    set P10, P1
    print "in __init\n"

    # raise an exception
    set S0, "qux"
    callmethod

    print "back in __init\n"
    invoke P10
CODE
new
in __init
eh!
back in __init
back in main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "fetchmethod");
    newclass P3, "Foo"
    find_type I0, "Foo"
    new P2, I0

    set S0, "meth"
    fetchmethod P0, P2, S0
    print "main\n"
    # P2, S0 are as in callmethod
    invokecc
    print "back\n"
    # check class
    fetchmethod P0, P3, S0
    set P2, P3
    invokecc
    print "back\n"
    end

.namespace ["Foo"]
.pcc_sub meth:
    print "in meth\n"
    invoke P1
CODE
main
in meth
back
in meth
back
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "fetchmethod - unknown method");
    newclass P2, "Foo"
    set S0, "nada"
    fetchmethod P0, P2, S0
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

