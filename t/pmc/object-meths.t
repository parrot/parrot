#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/object-meths.t - Object Methods

=head1 SYNOPSIS

	% perl -Ilib t/pmc/object-meths.t

=head1 DESCRIPTION

Tests PMC object methods.

=cut

use Parrot::Test tests => 25;
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
    returncc
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
    returncc
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "disabling the constructor");
    newclass P1, "Foo"
    new P0, .PerlString
    setprop P1, "BUILD", P0
    find_type I1, "Foo"
    new P3, I1
    print "ok 1\n"
    end
.namespace ["Foo"]
.pcc_sub __init:
    print "nok ok!\n"
    returncc
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "specified constructor method does not exist");
    newclass P1, "Foo"
    new P0, .PerlString
    set P0, "bar"
    setprop P1, "BUILD", P0

    newsub P20, .Exception_Handler, _handler
    set_eh P20

    find_type I1, "Foo"
    new P3, I1
    print "not ok 1\n"
    end

_handler:
    print "catched it\n"
    set S0, P5["_message"]      # P5 is the exception object
    print S0
    print "\n"
    end

.namespace ["Foo"]
.pcc_sub __init:
    print "nok ok 2!\n"
    returncc
CODE
catched it
Class BUILD method ('bar') not found
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
    returncc
.pcc_sub __get_string:
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    set S5, P10
    returncc
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
    returncc

    .namespace ["Bar"]
.pcc_sub __init:
    print "bar_init\n"
    returncc

    .namespace ["Baz"]
.pcc_sub __init:
    print "baz_init\n"
    returncc

    .namespace [""]	# main again
.pcc_sub _sub:
    print "in sub\n"
    returncc

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

SKIP: {
  skip("currently broken", 1);
output_is(<<'CODE', <<'OUTPUT', "exceptions and different runloops");
_main:
    newsub P0, .Exception_Handler, eh
    set_eh P0

    newclass P0, "Foo"

    print "new\n"
    find_type I0, "Foo"
    new P2, I0
eh:
    print "back in main\n"
    end

.namespace ["Foo"]
.pcc_sub __init:
    print "in __init\n"

    # raise an exception
    set S0, "qux"
    callmethodcc

    print "never\n"
    returncc
CODE
new
in __init
back in main
OUTPUT
}

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
    returncc
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

TODO: {
  local $TODO = "wrong init order?";

output_is(<<'CODE', <<'OUTPUT', "constructor - diamond parents");
#
# A   B A   E
#  \ /   \ /
#   C     D
#    \   /
#     \ /
#      F
    newclass P1, "A"
    newclass P2, "B"
    subclass P3, P1, "C"
    addparent P3, P2

    subclass P4, P1, "D"
    newclass P5, "E"
    addparent P4, P5

    subclass P6, P3, "F"
    addparent P6, P4
    bsr _check_isa

    print "new F\n"
    find_type I1, "F"
    new P16, I1
    print "done\n"
    end

_check_isa:
    print "F isa D "
    isa I0, P6, "D"
    print I0
    print "\n"
    print "D isa F "
    isa I0, P4, "F"
    print I0
    print "\n"
    print "F isa C "
    isa I0, P6, "C"
    print I0
    print "\n"
    print "C isa F "
    isa I0, P3, "F"
    print I0
    print "\n"
    print "F isa E "
    isa I0, P6, "E"
    print I0
    print "\n"
    print "E isa F "
    isa I0, P5, "F"
    print I0
    print "\n"
    print "F isa A "
    isa I0, P6, "A"
    print I0
    print "\n"
    print "A isa F "
    isa I0, P1, "F"
    print I0
    print "\n"
    print "F isa B "
    isa I0, P6, "B"
    print I0
    print "\n"
    print "B isa F "
    isa I0, P2, "F"
    print I0
    print "\n"

    print "C isa A "
    isa I0, P3, "A"
    print I0
    print "\n"
    print "A isa C "
    isa I0, P1, "C"
    print I0
    print "\n"
    print "D isa A "
    isa I0, P4, "A"
    print I0
    print "\n"
    print "A isa D "
    isa I0, P1, "D"
    print I0
    print "\n"
    ret


.namespace ["A"]
.pcc_sub __init:
    print "A init\n"
    returncc
.namespace ["B"]
.pcc_sub __init:
    print "B init\n"
    returncc
.namespace ["C"]
.pcc_sub __init:
    print "C init\n"
    returncc
.namespace ["D"]
.pcc_sub __init:
    print "D init\n"
    returncc
.namespace ["E"]
.pcc_sub __init:
    print "E init\n"
    returncc
.namespace ["F"]
.pcc_sub __init:
    print "F init\n"
    returncc
CODE
F isa D 1
D isa F 0
F isa C 1
C isa F 0
F isa E 1
E isa F 0
F isa A 1
A isa F 0
F isa B 1
B isa F 0
C isa A 1
A isa C 0
D isa A 1
A isa D 0
new F
E init
A init
D init
B init
C init
F init
done
OUTPUT
};

output_is(<<'CODE', <<'OUTPUT', "constructor - parents BUILD");
    new P10, .PerlString
    set P10, "_new"
    newclass P1, "Foo"
    setprop P1, "BUILD", P10
    subclass P2, P1, "Bar"
    setprop P2, "BUILD", P10
    subclass P3, P2, "Baz"
    setprop P3, "BUILD", P10
    find_type I1, "Baz"
    new P3, I1
    find_type I1, "Bar"
    new P3, I1
    find_global P0, "_sub"
    invokecc
    print "done\n"
    end

    .namespace ["Foo"]
.pcc_sub _new:
    print "foo_init\n"
    classname S0, P2
    print S0
    print "\n"
    returncc

    .namespace ["Bar"]
.pcc_sub _new:
    print "bar_init\n"
    returncc

    .namespace ["Baz"]
.pcc_sub _new:
    print "baz_init\n"
    returncc

    .namespace [""]	# main again
.pcc_sub _sub:
    print "in sub\n"
    returncc

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

output_is(<<'CODE', <<'OUTPUT', "same method name in two namespaces");
##PIR##
.namespace ["A"]
.sub foo method
    .param int i

    .pcc_begin_return
    .pcc_end_return
.end

.namespace ["B"]
.sub foo method
    .param int i

    .pcc_begin_return
    .pcc_end_return
.end

.namespace [""]
.sub _main @MAIN
    print "ok\n"
.end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "self - CURRENT_OBJECT");
##PIR##
.sub _main
    .local pmc A

    newclass A, "A"
    find_type I0, "A"

    new A, I0
    A."foo"()
    end
.end

.namespace ["A"]

.sub foo method
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_OBJECT
    eq_addr self, $P0, ok
    print "not "
ok: print "ok\n"
.end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Bug in method calling with nonconst keys");
##PIR##
.sub _main
    newclass $P0, "Foo"

    find_type $I0, "Foo"
    new $P1, $I0

    $I1 = $P1["foo"]

    $S0 = "foo"
    $I1 = $P1[$S0]

    end
.end

.namespace ["Foo"]

.sub __get_integer_keyed
    .param pmc key
    print "Key = "
    print key
    print "\n"
    .return(0)
.end
CODE
Key = foo
Key = foo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Bug in method calling with nonconst keys - clobber");
##PIR##
.sub _main
    newclass $P0, "Foo"

    find_type $I0, "Foo"
    new $P1, $I0

    $I1 = $P1["foo"]

    $S0 = "foo"
    $I1 = $P1[$S0]

    end
.end

.namespace ["Foo"]

.sub __get_integer_keyed
    .param pmc key
    $S0 = "bar"
    print "Key = "
    print key
    print "\n"
    print $S0
    print "\n"
    .return(0)
.end
CODE
Key = foo
bar
Key = foo
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "method cache invalidation");
.sub main @MAIN
    .local pmc o, cl
    newclass cl, "Foo"
    subclass cl, cl, "Bar"
    $I0 = find_type "Bar"
    o = new $I0
    print o
    $P0 = global "ok2"
    store_global "Bar", "__get_string", $P0
    print o
.end
.sub ok2
    .return("ok 2\n")
.end
.namespace [ "Foo" ]
.sub __get_string
    .return("ok 1\n")
.end
CODE
ok 1
ok 2
OUTPUT
