#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test::Util 'create_tempfile';

use Parrot::Test tests => 45;

=head1 NAME

t/pmc/mmd.t - Multi-Method Dispatch

=head1 SYNOPSIS

    % prove t/pmc/multidispatch.t

=head1 DESCRIPTION

Tests the multi-method dispatch.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'Integer_divide_Integer  10 / 3 = 1003', todo => 'TT #452' );

.sub 'test' :main
    .local pmc divide
    divide = get_global "Integer_divide_Integer"
    add_multi "divide", "Integer,Integer,Integer", divide

    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P2 = new ['Integer']
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
.end

.sub Integer_divide_Integer
    .param pmc left
    .param pmc right
    .param pmc lhs
    $I0 = left
    $I1 = right
    $I2 = $I0/$I1     # don't call divide Integer/Integer here
    lhs = $I2         # '
    lhs += 1000  # prove that this function has been called
    .return(lhs)
.end
CODE
1003
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "1+1=3", todo => 'TT #452' );

.sub _main :main
    .local pmc add
    add = get_global "add"
    add_multi "add", "Integer,Integer,Integer", add

    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P2 = new ['Integer']
    $P1 = 1
    $P2 = 1
    $P0 = $P1 + $P2
    print $P0
    print "\n"
.end

.sub add
    .param pmc left
    .param pmc right
    .param pmc lhs
    $I0 = left
    $I1 = right
    $I2 = $I0 + $I1
    inc $I2
    lhs = $I2
    .return (lhs)
.end
CODE
3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PASM divide - override builtin 10 / 3 = 42", todo => 'TT #452' );

.sub _main :main
    .local pmc divide
    divide = get_global "Integer_divide_Integer"
    add_multi "divide", "Integer,Integer,Integer", divide

    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P2 = new ['Integer']
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
.end

.sub Integer_divide_Integer
    .param pmc left
    .param pmc right
    .param pmc lhs
    lhs = 42
    .return(lhs)
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "INTVAL return numeq", todo => 'TT #452' );

.sub _main :main
    .local pmc comp
    comp = get_global "Float_cmp_Integer"
    add_multi "cmp", "Float,Integer", comp

    $P1 = new ['Float']
    $P2 = new ['Integer']
    $P1 = 47.11
    $P2 = 47
    $I0 = cmp $P1, $P2   # XXX cmp calls cmp_num
    print $I0
    print "\n"
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .begin_return
    .set_return -42
    .end_return
.end
CODE
-42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "find_multi" );

.sub _main :main
    .local pmc comp
    comp = get_global "Float_cmp_Integer"
    add_multi "cmp_num", "Float,Integer", comp
    $P0 = find_multi "cmp_num", "Float,Integer"
    if_null $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    end
nok:
    print "not ok\n"
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .begin_return
    .set_return -42
    .end_return
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "find_multi - invoke it" );

.sub _main :main
    .local pmc comp
    comp = get_global "Float_cmp_Integer"
    add_multi "cmp_num", "Float,Integer", comp
    $P0 = find_multi "cmp_num", "Float,Integer"
    if_null $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    $P1 = new ['Float']
    $P2 = new ['Integer']
    $P1 = 47.11
    $P2 = 47
    $I0 = $P0($P1, $P2)
    print $I0
    print "\n"
    end
nok:
    print "not ok\n"
.end
.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .begin_return
    .set_return -42
    .end_return
.end
CODE
ok 1
ok 2
-42
OUTPUT

pir_output_is( <<'CODE', <<'OUT', "first dynamic MMD call" );

.sub main :main
    .local pmc F, B, f, b, m, s
    newclass F, "Foo"
    f = new ['Foo']
    newclass B, "Bar"
    b = new ['Bar']
    # create a multi the hard way
    ## m = new MultiSub
    ## s = get_global "Foo", "foo"
    ## push m, s
    ## s = get_global "Bar", "foo"
    ## push m, s
    ## set_global "foo", m
    print "calling foo(f, b)\n"
    foo(f, b)
    print "calling foo(b, f)\n"
    foo(b, f)
.end

.sub foo :multi(Foo, Bar)
    .param pmc x
    .param pmc y
    print "  Foo::foo\n"
.end

.sub foo :multi(Bar, Foo)
    .param pmc x
    .param pmc y
    print "  Bar::foo\n"
.end
CODE
calling foo(f, b)
  Foo::foo
calling foo(b, f)
  Bar::foo
OUT

pir_output_is( <<'CODE', <<'OUT', "MMD second arg int/float dispatch" );
.sub foo :multi(_, Integer)
    .param pmc first
    .param pmc second
    print "(_, Int) method:  "
    print first
    print ', '
    print second
    print "\n"
.end
.sub foo :multi(_, Float)
    .param pmc first
    .param pmc second
    print "(_, Float) method:  "
    print first
    print ', '
    print second
    print "\n"
.end
.sub main :main
    $P0 = new ['Float']
    $P0 = 9.5
    foo(1, $P0)
    $P1 = new ['Integer']
    $P1 = 3
    foo(1, $P1)
.end
CODE
(_, Float) method:  1, 9.5
(_, Int) method:  1, 3
OUT

pir_error_output_like( <<'CODE', <<'OUT', "MMD single method, dispatch failure" );
## Compare this to the previous example.
.sub foo :multi(_, Float)
    .param pmc first
    .param pmc second
    print "(_, Float) method:  "
    print first
    print ', '
    print second
    print "\n"
.end
.sub main :main
    $P0 = new ['Float']
    $P0 = 9.5
    foo(1, $P0)
    $P1 = new ['Integer']
    $P1 = 3
    foo(1, $P1)
.end
CODE
/\A\(_, Float\) method:  1, 9\.5
No applicable candidates/
OUT

pir_output_is( <<'CODE', <<'OUT', "MMD on argument count" );
.sub main :main
    p("ok 1\n")
    p("-twice", "ok 2\n")
.end

.sub p :multi(string)
    .param string s
    print s
.end

.sub p :multi(string, string)
    .param string opt
    .param string s
    if opt != '-twice' goto no_twice
    print s
    print s
    .return()
no_twice:
    print s
.end
CODE
ok 1
ok 2
ok 2
OUT

pir_output_is( <<'CODE', <<'OUT', "MMD on native types" );
.sub main :main
    p("ok 1\n")
    p(42)
.end

.sub p :multi(string)
    .param string s
    print s
.end

.sub p :multi(int)
    .param int i
    print i
    print "\n"
.end
CODE
ok 1
42
OUT

pir_output_is( <<'CODE', <<'OUT', 'MMD on PMC types' );
.sub 'test' :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)

    $P0 = subclass 'PString', "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass 'String', "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end
CODE
String ok 1
PSt ok 2
PSt ok 3
String ok 4
OUT

pir_output_is( <<'CODE', <<'OUT', 'MMD on PMC types quoted' );
.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)

    $P0 = subclass "PString", "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p :multi("String")
    .param pmc p
    print "String "
    print p
.end

.sub p :multi("PString")
    .param pmc p
    print "PSt "
    print p
.end
CODE
String ok 1
PSt ok 2
PSt ok 3
String ok 4
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'MMD on PMC types, invalid' );
.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)
    $P0 = subclass "PString", "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
    $P0 = new ['Integer']
    p($P0)
.end

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end
CODE
/String ok 1
PSt ok 2
PSt ok 3
String ok 4
No applicable candidates/
OUT

pir_output_is( <<'CODE', <<'OUT', 'MMD on PMC types 3' );
.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)

    $P0 = subclass "PString", "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)

    .local pmc pint
    pint = subclass 'Integer', 'PInt'
    $P0 = new ['PInt']
    $P0 = 42
    p($P0)
.end

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end

.sub p :multi(Integer)
    .param pmc p
    print "Intege "
    print p
    print "\n"
.end

CODE
String ok 1
PSt ok 2
PSt ok 3
String ok 4
Intege 42
OUT

pir_output_is( <<'CODE', <<'OUT', 'MMD on PMC types, global namespace' );
.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)

    $P0 = subclass "PString", "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end
CODE
String ok 1
PSt ok 2
PSt ok 3
String ok 4
OUT

pir_output_is( <<'CODE', <<'OUT', 'MMD on PMC types, package namespace' );
.namespace ["Some"]

.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    p($P0)

    .local pmc pstring
    pstring = subclass 'String', 'PString'
    $P1 = new ['PString']
    $P1 = "ok 2\n"
    p($P1)

    $P0 = subclass "PString", "Xstring"
    $P0 = new ['Xstring']
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new ['Ystring']
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end
CODE
String ok 1
PSt ok 2
PSt ok 3
String ok 4
OUT

pir_output_is( <<'CODE', <<'OUT', "MMD on PMC types - Any", todo => 'GH #328' );

.sub main :main
    $P0 = new ['String']
    $P0 = "ok 1\n"
    $P1 = new ['PerlInt']
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = new ['PerlInt']
    $P0 = 42
    p($P0)
    $P0 = new ['PerlInt']
    $P0 = 43
    q($P0)
.end

.namespace []

.sub p :multi(String)
    .param pmc p
    print "String "
    print p
.end

.sub p :multi(PString)
    .param pmc p
    print "PSt "
    print p
.end

.sub p :multi(_)
    .param pmc p
    print "Any    "
    print p
    print "\n"
.end

.sub q :multi(pmc)
    .param pmc p
    print "Any    "
    print p
    print "\n"
.end

CODE
String ok 1
PSt ok 2
Any    42
Any    43
OUT

pir_output_is( <<'CODE', <<'OUTPUT', "add as function - Int, Float" );
.sub main :main
    .local pmc d, l, r, a
    d = new ['Integer']
    l = new ['Integer']
    r = new ['Float']
    l = 3
    r = 39.42
    a = get_root_global ["MULTI"], "add"
    d = a(l, r, d)
    print d
    print "\n"
    end
.end
CODE
42.42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "add as method" );
.sub main :main
    .local pmc d, l, r
    l = new ['Integer']
    r = new ['Integer']
    l = 3
    r = 39
    d = l."add"(r, d)
    print d
    print "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "add as method - inherited", todo => 'GH #328' );
.sub main :main
    .local pmc d, l, r
    .local pmc pint
    pint = subclass 'Integer', 'PInt'
    l = new ['PInt']
    r = new ['PInt']
    l = 3
    r = 39
    d = l."add"(r, d)
    print d
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "add as method - Int, Float" );
.sub main :main
    .local pmc d, l, r
    l = new ['Integer']
    r = new ['Float']
    l = 3
    r = 39.42
    d = l."add"(r, d)
    print d
    print "\n"
    end
.end
CODE
42.42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "bound add method" );
.sub main :main
    .local pmc d, l, r, m
    d = new ['Integer']
    l = new ['Integer']
    r = new ['Float']
    l = 3
    r = 39.42
    m = get_global ['scalar'], "add"
    d = m(r, l, d)
    print d
    print "\n"
    r = new ['Integer']
    r = 39
    m = get_global ['Integer'], "add"
    d = m(r, l, d)
    print d
    print "\n"
    end
.end
CODE
42.42
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Integer subclasses" );
.sub main :main
    .local pmc d, l, r, cl
    cl = subclass "Integer", "AInt"
    d = new ['AInt']
    l = new ['AInt']
    r = new ['AInt']
    l = 4
    r = 38
    print l
    print "\n"
    print r
    print "\n"
    # dispatches to Parrot_Integer_add_Integer
    add d, l, r
    print d
    print "\n"
    add l, r
    print l
    print "\n"
.end

CODE
4
38
42
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Integer subclasses, add" );
.sub main :main
    $P0 = subclass "Integer", "AInt"
    $P0 = new ['AInt']
    $P1 = new ['Integer']
    set $P0, 6
    set $P1, 2

    $P2 = add  $P0, $P1
    print $P2
    print "\n"
.end
.namespace ["AInt"]
.sub add :multi(AInt, Integer, PMC)
    .param pmc l
    .param pmc r
    .param pmc d
    print l
    print r
    print "\n"
    d = new ['Integer']
    d = 2
    .return(d)
.end
CODE
62
2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "mmd bug reported by Jeff" );
.namespace ['Foo']

.sub bar :method :multi(Foo, string)
    .param string arg
    print "string\n"
.end

.sub bar :method :multi(Foo, pmc)
    .param pmc arg
    print "PMC\n"
.end

.sub bar :method :multi(Foo)
    print "nothing\n"
.end

.namespace []

.sub main :main
    newclass $P0, 'Foo'

    $P0 = new ['Foo']

    $P0.'bar'('Bar!')

    $P1 = new ['String']
    $P1 = "Bar!"
    $P0.'bar'($P1)

    $P0.'bar'()
.end
CODE
string
PMC
nothing
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "use a core func for an object");
.sub main :main
    .local pmc d, l, r, cl
    cl = newclass "AInt"
    addattribute cl, ".i"
    d = new ['AInt']
    l = new ['AInt']
    r = new ['AInt']
    .local pmc func
    .local string typ
    func = find_multi "add", "Float,Float,PMC"
    $S0 = typeof l
    typ = $S0 . ","
    typ .= $S0
    typ .= ","
    typ .= $S0
    add_multi "add", typ, func
    l = 4
    r = 38
    print l
    print "\n"
    print r
    print "\n"
    add d, l, r
    print d
    print "\n"
.end
.namespace ["AInt"]
.sub init :vtable :method
    $P0 = new ['Integer']
    setattribute self, ".i", $P0
.end
.sub set_integer_native :vtable :method
    .param int i
    $P0 = getattribute self, ".i"
    $P0 = i
.end
.sub set_number_native :vtable :method
    .param num f
    $P0 = getattribute self, ".i"
    $P0 = f
.end
.sub get_string :vtable :method
    $P0 = getattribute self, ".i"
    $S0 = $P0
    .return ($S0)
.end
.sub get_number :vtable :method
    $P0 = getattribute self, ".i"
    $N0 = $P0
    .return ($N0)
.end
CODE
4
38
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multisub vs find_name" );
.sub main :main
    $P0 = find_name "foo"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
.sub foo :method :multi(string)
    .param pmc x
    print "  foo\n"
.end
.sub foo :method :multi(pmc)
    .param pmc x
    print "  foo\n"
.end
CODE
MultiSub
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multisub w void" );
.sub main :main
    foo('xx')
    foo()
    foo('xx')
.end
.sub foo :multi(string)
    .param pmc x
    print "foo string\n"
.end
.sub foo :multi()
    print "foo\n"
.end
CODE
foo string
foo
foo string
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multisub w/o .HLL" );
.sub main :main
    $P0 = new ['Integer']
    $P0 = 3
    $P9 = 'foo'($P0)

    $P0 = new ['ResizablePMCArray']
    push $P0, 4
    $P1 = new ['String']
    $P1 = 'hello'
    $P9 = 'foo'($P0, $P1)
.end

.sub 'foo' :multi(Integer)
    print "foo(Integer)\n"
    .return (0)
.end

.sub 'foo' :multi(ResizablePMCArray, _)
    print "foo(ResizablePMCArray,_)\n"
    .return (0)
.end
CODE
foo(Integer)
foo(ResizablePMCArray,_)
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multisub w/ .HLL, rt #39161" );
.HLL 'Perl6'
.sub main :main
    $P0 = new ['Integer']
    $P0 = 3
    $P9 = 'foo'($P0)

    $P0 = new ['ResizablePMCArray']
    push $P0, 4
    $P1 = new ['String']
    $P1 = 'hello'
    $P9 = 'foo'($P0, $P1)
.end

.sub 'foo' :multi(Integer)
    print "foo(Integer)\n"
    .return (0)
.end

.sub 'foo' :multi(ResizablePMCArray, _)
    print "foo(ResizablePMCArray,_)\n"
    .return (0)
.end
CODE
foo(Integer)
foo(ResizablePMCArray,_)
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multisub w/ flatten" );
# see also 'rt #39173
.sub main :main
    .local pmc int_pmc
    int_pmc = new ['Integer']
    int_pmc = 3

    .local pmc args
    args = new ['ResizablePMCArray']
    push args, int_pmc
    'foo'( args :flat )

    .local pmc string_pmc
    string_pmc = new ['String']
    string_pmc = 'hello'

    args = new ['ResizablePMCArray']
    push args, string_pmc
    'foo'( args :flat )
    end
.end

.sub 'foo' :multi(Integer)
    print "foo(Integer)\n"
.end

.sub 'foo' :multi(String)
    print "foo(String)\n"
.end
CODE
foo(Integer)
foo(String)
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "keyed class name and multi" );
.sub main :main
    .local pmc class
    newclass class, [ 'Some'; 'Class' ]

    .local pmc instance
    instance = new [ 'Some'; 'Class' ]

    .local string name
    name = typeof instance

    print "Type: "
    print name
    print "\n"
    end
.end
CODE
Type: Some;Class
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "keyed class name and multi" );
.sub main :main
    .local pmc class
    newclass class, [ 'Some'; 'Class' ]

    .local pmc instance
    instance = new [ 'Some'; 'Class' ]

    foo( instance )
    end
.end

.sub 'foo' :multi( [ 'Some'; 'Class' ])
    print "Called multi for class\n"
.end

.sub 'foo' :multi(_)
    print "Called wrong multi\n"
.end
CODE
Called multi for class
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "unicode sub names and multi" );
.sub utf8:"\u7777" :multi(string)
  .param pmc arg
  print 'String:'
  say arg
.end
.sub utf8:"\u7777" :multi(int)
  .param pmc arg
  print 'Int:'
  say arg
.end

.sub main :main
  utf8:"\u7777"('what')
  utf8:"\u7777"(23)
.end
CODE
String:what
Int:23
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "autoboxing on multis" );
.sub box_me_up :multi(string)
    .param string first
    .param pmc    second

    .local string promoted_type
    promoted_type = typeof second
    print "BMU autobox type: "
    print promoted_type
    print "\n"
.end

.sub box_me_up :multi()
    print "BMU no autobox, so sad\n"
.end

.sub box_me_up :multi(int, int)
    print "BMU inty, so bad\n"
.end

.sub main :main
    box_me_up( 'foo', 'bar' )
.end
CODE
BMU autobox type: String
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '_ matches native types' );
.sub main :main
  .local pmc asub
  asub = get_global 'main'

  foo('world', asub) # should call :multi(_, Sub)
.end

.sub foo :multi(_, Sub)
  .param pmc x
  .param pmc y
  print x
  print " "
  say ":multi(_, Sub)"
.end

.sub foo :multi(Integer, Sub)
  .param int x
  .param pmc y
  print x
  print " "
  say ":multi(int, Sub)"
.end
CODE
world :multi(_, Sub)
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'type mix with _' );
.sub main :main
    $P0 = new ['Integer']
    $P0 = 3
    'foo'($P0)
    'foo'(2)
    'foo'("1")
    $P0 = new ['String']
    $P0 = "0"
    'foo'($P0)
    $P0 = new ['Hash']
    'foo'($P0)
.end

.sub 'foo' :multi(Integer)
    .param pmc i
    print "foo(Integer)\n"
.end

.sub 'foo' :multi(_)
    .param pmc i
    print "foo(_)\n"
.end

.sub 'foo' :multi(int)
    .param int i
    print "foo(int)\n"
.end

.sub 'foo' :multi(String)
    .param pmc i
    print "foo(String)\n"
.end

.sub 'foo' :multi(string)
    .param string i
    print "foo(string)\n"
.end
CODE
foo(Integer)
foo(int)
foo(string)
foo(String)
foo(_)
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', ':multi with :outer' );
.sub main :main
    new $P0, ['String']
    assign $P0, 'arg0'
    new $P1, ['String']
    assign $P1, 'arg1'

    $P99 = "foo"($P0)

    $P99 = "foo"($P0, $P1)

    $P99 = "bar"($P0)

    $P99 = "bar"($P0, $P1)
.end


.sub "foo" :multi(_)
    .param pmc x
    print "foo(_)  : "
    say x
    .return (x)
.end

.sub "foo" :multi(_,_)
    .param pmc x
    .param pmc y
    print "foo(_,_): "
    print x
    print " "
    say y
    .return (y)
.end

.sub "bar" :outer("main") :multi(_)
    .param pmc x
    print "bar(_)  : "
    say x
    .return (x)
.end

.sub "bar" :outer("main") :multi(_,_)
    .param pmc x
    .param pmc y
    print "bar(_,_): "
    print x
    print " "
    say y
    .return (y)
.end
CODE
foo(_)  : arg0
foo(_,_): arg0 arg1
bar(_)  : arg0
bar(_,_): arg0 arg1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multi-dispatch on PMCNULL" );

.sub main :main
    null $P0
    foo($P0)
.end
.sub foo :multi(String)
    say "string"
.end
.sub foo :multi(_)
    say "any"
.end
CODE
any
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "multi-dispatch with :optional" );

.sub 'main' :main
    foo('Hello')
    foo('Goodbye', 2)
    foo(1)
    foo(100, 200)
.end

.sub foo :multi(string)
    .param string s
    .param int    i      :optional
    .param int    have_i :opt_flag

    say s
    unless have_i goto done
    say i
  done:
.end

.sub foo :multi(int)
    .param int x
    .param int i      :optional
    .param int have_i :opt_flag

    say x
    unless have_i goto done
    say i
  done:
.end
CODE
Hello
Goodbye
2
1
100
200
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.autoboxed MMD with :optional' );

.sub 'main' :main
    foo('Hello')
    foo('Goodbye', 2)
    foo(1)
    foo(100, 200)
    foo(77.7)
    foo(77.7, 88.8)
.end

.sub foo :multi(String)
    .param pmc s
    .param pmc i      :optional
    .param int have_i :opt_flag

    say s
    unless have_i goto done
    say i
  done:
.end

.sub foo :multi(Integer)
    .param pmc x
    .param pmc i      :optional
    .param int have_i :opt_flag

    say x
    unless have_i goto done
    say i
  done:
.end

.sub foo :multi(Float)
    .param pmc x
    .param pmc i      :optional
    .param int have_i :opt_flag

    say x
    unless have_i goto done
    say i
  done:
.end
CODE
Hello
Goodbye
2
1
100
200
77.7
77.7
88.8
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'more .autoboxed MMD with :optional' );

.sub 'main' :main
    foo('Hello', 'Hi')
    foo('Goodbye', 'Ta ta', 2)
    foo(1, 2)
    foo(100, 200, 400)
    foo(77.7, 88.8)
    foo(77.7, 88.8, 99.9)
.end

.sub foo :multi(String, String)
    .param pmc x
    .param pmc y
    .param pmc i      :optional
    .param int have_i :opt_flag

    print x
    print y
    unless have_i goto done
    print i
  done:
    say ''
.end

.sub foo :multi(Integer, Integer)
    .param pmc x
    .param pmc y
    .param pmc i      :optional
    .param int have_i :opt_flag

    print x
    print y
    unless have_i goto done
    print i
  done:
    say ''
.end

.sub foo :multi(Float, Float)
    .param pmc x
    .param pmc y
    .param pmc i      :optional
    .param int have_i :opt_flag

    print x
    print y
    unless have_i goto done
    print i
  done:
    say ''
.end
CODE
HelloHi
GoodbyeTa ta2
12
100200400
77.788.8
77.788.899.9
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'Integer subclass and MMD - TT #784' );
.sub main :main
    .local pmc int_c
    int_c = get_class "Integer"

    .local pmc sub_c
    sub_c = subclass int_c, "MyInt"

    $P1 = new 'Integer'
    $P1 = 4
    $P1 -= 3
    say $P1

    $P1 = new 'MyInt'
    $P1 = 4
    $P1 -= 3
    say $P1
.end
CODE
1
1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'int autoboxes to scalar - TT #1133' );
    .sub 'foo' :multi(['scalar'])
        .param pmc x
        say "Scalar!"
    .end

    .sub 'foo' :multi()
        .param pmc x
        $I0 = isa x, 'scalar'
        print "Scalar? "
        say $I0
    .end

    .sub 'main' :main
        'foo'(1)
        $P0 = box 1
        'foo'($P0)
    .end
CODE
Scalar!
Scalar!
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
