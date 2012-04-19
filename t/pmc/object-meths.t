#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 39;

=head1 NAME

t/pmc/object-meths.t - Object Methods

=head1 SYNOPSIS

    % prove t/pmc/object-meths.t

=head1 DESCRIPTION

Tests PMC object methods.

=cut

pasm_error_output_like( <<'CODE', <<'OUTPUT', "callmethodcc - unknown method" );
.pcc_sub :main main:
    newclass P2, "Foo"
    set S0, "nada"
    callmethodcc P2, S0
    print "should never reach here\n"
    end
CODE
/Method 'nada' not found for invocant of class 'Foo'/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "callmethod (STR) - unknown method" );
.pcc_sub :main main:
    newclass P2, "Foo"
    set S1, "nada"
    callmethod P2, S1, P1
    print "should never reach here\n"
    end
CODE
/Method 'nada' not found for invocant of class 'Foo'/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "callmethodcc - unknown method" );
.pcc_sub :main main:
    newclass P2, "Foo"
    set S0, "nada"
    callmethodcc P2, S0
    print "should never reach here\n"
    end
CODE
/Method 'nada' not found for invocant of class 'Foo'/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "callmethodcc (STR) - unknown method" );
.pcc_sub :main main:
    newclass P2, "Foo"
    set S1, "nada"
    callmethodcc P2, S1
    print "should never reach here\n"
    end
CODE
/Method 'nada' not found for invocant of class 'Foo'/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "callmethod 1" );
.sub main :main
    $P2 = newclass "Foo"
    $P3 = new $P2
    set $S0, "meth"

    print "main\n"
    $P3.'meth'()
    print "back\n"
    end
.end

.namespace ["Foo"]
.sub meth :method
    print "in meth\n"
    .return ()
.end
CODE
main
in meth
back
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "can class" );
.sub main :main
    $P2 = newclass "Foo"

    $P3 = new ['Sub']
    # Add a method to the class manually
    $P2.'add_method'("meth", $P3)

    # Classes only report 'can' for class methods, not instance methods
    can $I0, $P2, "meth"
    print $I0
    print "\n"
    end
.end
CODE
0
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "can object" );
.sub main :main
    $P2 = newclass "Foo"
    $P4 = new ['Foo']

    $P3 = new ['Sub']
    # Add a method to the class manually
    $P2.'add_method'("meth", $P3)

    can $I0, $P4, "meth"
    print $I0
    print "\n"
    can $I0, $P4, "no_such_meth"
    print $I0
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "constructor" );
.sub main :main
    $P1 = newclass "Foo"
    new $P3, ['Foo']
    print "ok 2\n"
    end
.end

.namespace ["Foo"]
.sub init :method :vtable
    print "ok 1\n"
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "constructor - init attr" );
.sub 'main' :main
    newclass $P1, "Foo"
    addattribute $P1, ".i"
    new $P3, ['Foo']
    say "ok 2"
    say $P3
    end
.end

.namespace ["Foo"]

.sub 'init' :vtable :method
    say "ok 1"
    new $P10, ['Integer']
    set $P10, 42
    setattribute self, ".i", $P10
    .return()
.end

.sub 'get_string' :vtable :method
    getattribute $P10, self, ".i"
    .return( $P10 )
.end
CODE
ok 1
ok 2
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "constructor - parents" );
.sub 'main' :main
    newclass $P1, "Foo"
    subclass $P2, $P1, "Bar"
    subclass $P3, $P2, "Baz"
    new $P3, ['Baz']
    new $P3, ['Bar']
    _sub()
    say "done"
    end
.end

.namespace ["Foo"]

.sub 'init' :vtable :method
    say "foo_init"
    typeof $S0, self
    say $S0
.end

.namespace ["Bar"]

.sub 'init' :vtable :method
    say "bar_init"
.end

.namespace ["Baz"]

.sub 'init' :vtable :method
    say "baz_init"
.end

.namespace [] # main again

.sub '_sub'
    say "in sub"
.end
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

pir_output_is( <<'CODE', <<'OUTPUT', "methods: self" );

.sub _main :main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    new A, ['A']
    new B, ['B']

    setprop A, "B", B

    A."foo"()
    B."foo"()

    end
.end

.namespace ["A"]

.sub foo :method
    .local pmc B

    print "A::foo\n"
    getprop B, self, "B"

    self."blah"()
    B."blah"()
    self."blah"()

.end

.sub blah :method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo :method
    print "B::foo\n"
.end

.sub blah :method
    print "B::blah\n"
.end
CODE
A::foo
A::blah
B::blah
A::blah
B::foo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "methods: self w arg" );

.sub _main :main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    new A, ['A']
    new B, ['B']

    A."foo"(B)
    B."foo"()

    end
.end

.namespace ["A"]

.sub foo :method
    .param pmc B

    print "A::foo\n"

    self."blah"()
    B."blah"()
    self."blah"()

.end

.sub blah :method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo :method
    print "B::foo\n"
.end

.sub blah :method
    print "B::blah\n"
.end
CODE
A::foo
A::blah
B::blah
A::blah
B::foo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "methods: self w arg and ret" );

.sub _main :main
    .local pmc A
    .local pmc B

    newclass A, "A"
    newclass B, "B"

    new A, ['A']
    new B, ['B']

    .local pmc r
    r = A."foo"(B)
    r."foo"()

    end
.end

.namespace ["A"]

.sub foo :method
    .param pmc B

    print "A::foo\n"

    self."blah"()
    B."blah"()
    self."blah"()
    .begin_return
    .set_return B
    .end_return

.end

.sub blah :method
    print "A::blah\n"
.end

.namespace ["B"]

.sub foo :method
    print "B::foo\n"
.end

.sub blah :method
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
    skip( "currently broken", 1 );
    pasm_output_is( <<'CODE', <<'OUTPUT', "exceptions and different runloops" );
.pcc_sub :main main:
_main:
    push_eh eh

    newclass P0, "Foo"

    print "new\n"
    new P2, ['Foo']
eh:
    print "back in main\n"
    end

.namespace ["Foo"]
.pcc_sub __init:
    print "in __init\n"

    # raise an exception
    callmethodcc self, "qux"

    print "never\n"
    returncc
CODE
new
in __init
back in main
OUTPUT
}

pir_output_is( <<'CODE', <<'OUTPUT', "find_method" );
.sub main :main
    $P3 = newclass "Foo"
    $P2 = new $P3

    $P0 = find_method $P2, 'meth'
    say 'main'
    $P2.$P0()
    say 'back'
    $I0 = defined $P0
    say $I0
    end
.end

.namespace ["Foo"]
.sub meth :method
    say 'in meth'
.end
CODE
main
in meth
back
1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'find_method builtin PMC class' );
.sub main :main
  $P0 = new [ 'String' ]
  $P0 = 'AbC'

  $P1 = find_method $P0, 'reverse'
  $P2 = $P0.$P1()
  say $P2
  $I0 = defined $P1
  say $I0
.end
CODE
CbA
1
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "find_method - unknown method" );
.pcc_sub :main main:
    newclass P2, "Foo"
    set S0, "nada"
    find_method P0, P2, S0
    print "nope\n"
    end
CODE
/Method 'nada' not found for invocant of class 'Foo'/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "constructor - diamond parents" );
#
# A   B A   E
#  \ /   \ /
#   C     D
#    \   /
#     \ /
#      F
.sub 'main' :main
    newclass $P1, "A"
    newclass $P2, "B"
    subclass $P3, $P1, "C"
    addparent $P3, $P2

    subclass $P4, $P1, "D"
    newclass $P5, "E"
    addparent $P4, $P5

    subclass $P6, $P3, "F"
    addparent $P6, $P4

    print "F isa D "
    isa $I0, $P6, "D"
    say $I0
    print "D isa F "
    isa $I0, $P4, "F"
    say $I0
    print "F isa C "
    isa $I0, $P6, "C"
    say $I0
    print "C isa F "
    isa $I0, $P3, "F"
    say $I0
    print "F isa E "
    isa $I0, $P6, "E"
    say $I0
    print "E isa F "
    isa $I0, $P5, "F"
    say $I0
    print "F isa A "
    isa $I0, $P6, "A"
    say $I0
    print "A isa F "
    isa $I0, $P1, "F"
    say $I0
    print "F isa B "
    isa $I0, $P6, "B"
    say $I0
    print "B isa F "
    isa $I0, $P2, "F"
    say $I0

    print "C isa A "
    isa $I0, $P3, "A"
    say $I0
    print "A isa C "
    isa $I0, $P1, "C"
    say $I0
    print "D isa A "
    isa $I0, $P4, "A"
    say $I0
    print "A isa D "
    isa $I0, $P1, "D"
    say $I0

    say "new F"
    new $P16, ['F']
    say "done"
.end

.namespace ["A"]

.sub 'init' :vtable :method
    say "A init"
.end

.namespace ["B"]

.sub 'init' :vtable :method
    say "B init"
.end

.namespace ["C"]

.sub 'init' :vtable :method
    say "C init"
.end

.namespace ["D"]

.sub 'init' :vtable :method
    say "D init"
.end

.namespace ["E"]

.sub 'init' :vtable :method
    say "E init"
.end

.namespace ["F"]

.sub 'init' :vtable :method
    say "F init"
.end
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
B init
A init
D init
C init
F init
done
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "constructor - vtable override" );
.sub main :main
  $P0 = newclass 'Foo'
  $P1 = subclass 'Foo', 'Bar'
  $P2 = new ['Bar']
.end

.namespace ['Foo']
.sub init :vtable :method
  print "foo init\n"
.end

.namespace ['Bar']
.sub init :vtable :method
  print "bar init\n"
.end

CODE
foo init
bar init
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "same method name in two namespaces" );

.namespace ["A"]
.sub foo :method
    .param int i

    .begin_return
    .end_return
.end

.namespace ["B"]
.sub foo :method
    .param int i

    .begin_return
    .end_return
.end

.namespace []
.sub _main :main
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "self - CURRENT_OBJECT" );

.sub _main :main
    .local pmc A

    newclass A, "A"
    new A, ['A']
    A."foo"()
    end
.end

.namespace ["A"]

.sub foo :method
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_OBJECT
    eq_addr self, $P0, ok
    print "not "
ok: print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Bug in method calling with nonconst keys" );

.sub _main :main
    newclass $P0, "Foo"

    new $P1, ['Foo']

    $I1 = $P1["foo"]

    $S0 = "foo"
    $I1 = $P1[$S0]

    end
.end

.namespace ["Foo"]

.sub get_integer_keyed :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "Bug in method calling with nonconst keys - clobber" );

.sub _main :main
    newclass $P0, "Foo"

    new $P1, ['Foo']

    $I1 = $P1["foo"]

    $S0 = "foo"
    $I1 = $P1[$S0]

    end
.end

.namespace ["Foo"]

.sub get_integer_keyed :vtable :method
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

pir_output_is( <<'CODE', <<'OUTPUT', "method cache invalidation" );
.sub main :main
    .local pmc o, cl
    newclass cl, "Foo"
    subclass cl, cl, "Bar"
    o = new ['Bar']
    print o
    $P0 = get_global "ok2"
    cl.'add_vtable_override'('get_string', $P0)
    print o
.end
.sub ok2
    .return("ok 2\n")
.end
.namespace [ "Foo" ]
.sub get_string :vtable :method
    .return("ok 1\n")
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "callmethod - method name" );
.sub main :main
    $P2 = newclass "Foo"
    $S0 = "meth"
    print "main\n"
    $P3 = new $P2
    $P3.$S0()
    print "back\n"
    end
.end

.namespace ["Foo"]
.sub meth :method
    print "in meth\n"
    getinterp $P0
    $P1 = $P0["sub"]
    print $P1
    print "\n"
    .return ()
.end
CODE
main
in meth
meth
back
OUTPUT

SKIP: {
    skip( "no bound NCI method", 1 );
    pir_output_is( <<'CODE', <<'OUTPUT', "bound NCI method" );
.sub main :main
    .local pmc s, l, f
    s = new ['String']
    s = "ABC\n"
    f = getattribute s, "lower"
    typeof $S0, f
    print $S0
    print "\n"
    l = f()
    print l
.end
CODE
Bound_NCI
abc
OUTPUT
}

pir_output_is( <<'CODE', <<'OUTPUT', "tailcallmeth" );
.sub main :main
    .local pmc cl, o, n
    cl = newclass "Foo"
    addattribute cl, "n"
    o = new ['Foo']
    n = new ['Integer']
    n = 2000
    setattribute o, [ "Foo" ], "n", n
    o.'go'()
    n = getattribute o, [ "Foo" ], "n"
    print n
    print "\n"
.end

.namespace ["Foo"]
.sub go :method
    .local pmc n
    n = getattribute self, [ "Foo" ], "n"
    dec n
    unless n goto done
    .tailcall self."go"()
done:
.end
CODE
0
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "kind of a super" );
.sub main :main
    .local pmc cl, o
    cl = subclass "String", "MyString"
    o = new ['MyString']
    o = "foo"
    print o
    print "\n"
.end

.namespace ["MyString"]
.sub set_string_native :vtable :method
    .param string s
    $P0 = getattribute self, ["String"], 'proxy'
    s .= s
    $P0 = s
.end
CODE
foofoo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "delegate keyed_int" );
.sub main :main
    .local pmc cl, o
    cl = newclass "MyClass"
    o = new ['MyClass']
    $I0 = 5
    $S0 = "foo"
    o[$I0] = 42
    o[$S0] = 42
    delete o[$I0]
    delete o[$S0]
    $I1 = defined o[$I0]
    $I1 = defined o[$S0]
    $I1 = exists o[$I0]
    $I1 = exists o[$S0]
.end

.namespace ["MyClass"]

.sub set_integer_keyed_int :vtable :method
    .param int key
    .param int val
    print "ikey\n"
.end

.sub set_integer_keyed :vtable :method
    .param string key
    .param int val
    print "skey\n"
.end

.sub delete_keyed_int :vtable :method
    .param int key
    print "del_ikey\n"
.end

.sub delete_keyed :vtable :method
    .param string key
    print "del_skey\n"
.end

.sub defined_keyed_int :vtable :method
    .param int key
    print "def_ikey\n"
    .return (0)
.end

.sub defined_keyed :vtable :method
    .param string key
    print "def_skey\n"
    .return (0)
.end

.sub exists_keyed_int :vtable :method
    .param int key
    print "exists_ikey\n"
    .return (0)
.end

.sub exists_keyed :vtable :method
    .param string key
    print "exists_skey\n"
    .return (0)
.end

CODE
ikey
skey
del_ikey
del_skey
def_ikey
def_skey
exists_ikey
exists_skey
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "delegate keyed_int PMC derived" );
.sub main :main
    .local pmc cl, o
    cl = subclass "ResizablePMCArray", "MyClass"
    o = new ['MyClass']
    $I0 = 5
    o[$I0] = 42
    $I1 = o[$I0]
    print $I1
    print "\n"
.end

.namespace ["MyClass"]

.sub get_integer_keyed_int :vtable :method
    .param int key
    print "ikey\n"
    .local pmc ar
    ar = getattribute self, ["ResizablePMCArray"], "proxy"
    $I0 = ar[key]
    .return ($I0)
.end

.sub set_integer_keyed_int :vtable :method
    .param int key
    .param int val
    print "pkey\n"
    .local pmc ar
    ar = getattribute self, ["ResizablePMCArray"], "proxy"
    ar[key] = val
.end

CODE
pkey
ikey
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "delegate keyed_int PMC derived - inherit" );
.sub main :main
    .local pmc cl, o
    cl = subclass "ResizablePMCArray", "MyClass"
    o = new ['MyClass']
    $I0 = 5
    o[$I0] = 42
    $I1 = o[$I0]
    print $I1
    print "\n"
.end

.namespace ["MyClass"]

.sub get_integer_keyed_int :vtable :method
    .param int key
    print "ikey\n"
    .local pmc ar
    ar = getattribute self, ["ResizablePMCArray"], "proxy"
    $I0 = ar[key]
    .return ($I0)
.end

CODE
ikey
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "addmethod op" );
.sub main :main
    .local pmc c
    c = newclass ['whatever']
    .const 'Sub' foo = "whatever_foo"
    addmethod c, "foo", foo
    $P0 = new ['whatever']
    $P0.'foo'()
.end

.sub whatever_foo :anon :method
    print "Foo!\n"
.end
CODE
Foo!
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "inherit a PMC METHOD" );
.sub main :main
    .local pmc cl, o
    cl = subclass 'Integer', 'MyInt'
    o = new ['MyInt']
    o = 10
    $S0 = o.'get_as_base'(16)
    print $S0
    print "\n"
.end
CODE
a
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "init calls" );
.sub main :main
    .local pmc cl, o
    cl = newclass 'MyClass'
    o = new ['MyClass']
    $P0 = new ['String']
    o = new ['MyClass'], $P0
.end

.namespace ['MyClass']

.sub init :method :vtable
    .param pmc initializer :optional
    print "init was called\n"
.end

.sub init_pmc :method :vtable
    .param pmc initializer
    print "init_pmc was called\n"
.end
CODE
init was called
init_pmc was called
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "overloading find_method vtable" );
.sub main :main
    .local pmc cl, o
    cl = newclass 'MyClass'
    o = new ['MyClass']
    o.'foo'()
.end

.namespace ['MyClass']

.sub find_method :method :vtable
    .param string methodname
    print "find_method was called\n"
    $P0 = get_hll_global ["MyClass"], methodname
    .return($P0)
.end

.sub foo
  print "foo was called\n"
.end

CODE
find_method was called
foo was called
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "overloading attribute accessor vtable" );
.sub main :main
    .local pmc cl, o
    cl = newclass 'MyClass'
    o = new ['MyClass']
    $P2 = new ['String']
    $P2 = "blue"
    setattribute o, "blue", $P2
    $P1 = getattribute o, "blue"
.end

.namespace ['MyClass']

.sub get_attr_str :method :vtable
    .param string attrname
    print "get_attr_str was called\n"
.end
.sub set_attr_str :method :vtable
    .param string attrname
    .param pmc val
    print "set_attr_str was called\n"
.end
CODE
set_attr_str was called
get_attr_str was called
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "method called on non-object" );
.namespace [ 'Foo' ]

.sub 'blah' :method
.end

.namespace []

.sub main :main
    $P1 = get_hll_global 'Foo'
    $P0 = $P1.'new'()
.end
CODE
/Method 'new' not found for non-object/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "overloading isa vtable" );
.namespace [ 'Foo' ]

.sub 'isa' :vtable("isa") :method
    .param string role
    .return(1)
.end

.namespace []

.sub main :main
    $P0 = newclass "Foo"
    $P1 = new $P0
    $I0 = isa $P1, "no_role_i_ever_heard_of"
    say $I0
.end
CODE
1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "overloading isa_pmc vtable" );
.namespace [ 'Foo' ]

.sub 'isa_pmc' :vtable("isa_pmc") :method
    .param string role
    .return(1)
.end

.namespace []

.sub main :main
    $P0 = newclass "Foo"
    $P1 = new $P0
    $P2 = box "no_role_i_ever_heard_of"
    $I0 = isa $P1, $P2
    say $I0
.end
CODE
1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
