#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/mmd.t - Multi-Method Dispatch

=head1 SYNOPSIS

	% perl -Ilib t/pmc/mmd.t

=head1 DESCRIPTION

Tests the multi-method dispatch.

=cut

use Parrot::Test tests => 25;

pir_output_is(<<'CODE', <<'OUTPUT', "PASM divide");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc divide
    divide = global "Integer_divide_PerlInt"
    mmdvtregister .MMD_DIVIDE, .Integer, .PerlInt, divide

    $P0 = new PerlInt
    $P1 = new Integer
    $P2 = new PerlInt
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
    end
.end

.sub Integer_divide_PerlInt
    .param pmc left
    .param pmc right
    .param pmc lhs
    $I0 = left
    $I1 = right
    $I2 = $I0/$I1   # don't call divide Integer/PerlInt here
    lhs = $I2       # '
    .return(lhs)
.end
CODE
3
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "1+1=3");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc add
    add = global "add"
    mmdvtregister .MMD_ADD, .Integer, .Integer, add

    $P0 = new Integer
    $P1 = new Integer
    $P2 = new Integer
    $P1 = 1
    $P2 = 1
    $P0 = $P1 + $P2
    print $P0
    print "\n"
    end
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

pir_output_is(<<'CODE', <<'OUTPUT', "PASM divide - override builtin");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc divide
    divide = global "Integer_divide_Integer"
    mmdvtregister .MMD_DIVIDE, .Integer, .Integer, divide

    $P0 = new Integer
    $P1 = new Integer
    $P2 = new Integer
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
    end
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

pir_output_is(<<'CODE', <<'OUTPUT', "INTVAL return numeq");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_CMP, .Float, .Integer, comp

    $P1 = new Float
    $P2 = new Integer
    $P1 = 47.11
    $P2 = 47
    $I0 = cmp $P1, $P2   # XXX cmp calls cmp_num
    print $I0
    print "\n"
    end
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
-42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "mmdvtfind");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_NUMCMP, .Float, .Integer, comp
    $P0 = mmdvtfind .MMD_NUMCMP, .Float, .Integer
    isnull $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    end
nok:
    print "not ok\n"
    end
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "mmdvtfind - invoke it");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_NUMCMP, .Float, .Integer, comp
    $P0 = mmdvtfind .MMD_NUMCMP, .Float, .Integer
    isnull $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    $P1 = new Float
    $P2 = new Integer
    $P1 = 47.11
    $P2 = 47
    $I0 = $P0($P1, $P2)
    print $I0
    print "\n"
    end
nok:
    print "not ok\n"
    end
.end
.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
ok 1
ok 2
-42
OUTPUT

my $temp = "temp.imc";
END { unlink $temp; };

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
.sub Integer_divide_Integer
    .param pmc left
    .param pmc right
    .param pmc lhs
    lhs = 42
    .return(lhs)
.end
EOF
close S;

pir_output_is(<<'CODE', <<'OUTPUT', "PASM MMD divide - loaded sub");

.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc divide
    load_bytecode "temp.imc"
    divide = global "Integer_divide_Integer"
    mmdvtregister .MMD_DIVIDE, .Integer, .Integer, divide

    $P0 = new Integer
    $P1 = new Integer
    $P2 = new Integer
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
    end
.end

CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM INTVAL");
.include "pmctypes.pasm"
.include "datatypes.pasm"
.include "mmd.pasm"
    find_global P10, "Integer_bxor_Intval"
    mmdvtregister .MMD_BXOR, .Integer, .DATATYPE_INTVAL, P10

    new P0, .Integer
    new P1, .Integer
    set P1, 3
    bxor P0, P1, 2
    print P0
    print "\n"
    new P0, .PerlInt
    new P1, .PerlInt
    set P1, 5
    bxor P0, P1, 2	# should call PerlInts builtin
    print P0
    print "\n"
    end
.pcc_sub Integer_bxor_Intval:
    print "ok\n"
    set I10, P5
    bxor I11, I10, I5
    set P6, I11
    returncc
CODE
ok
1
7
OUTPUT

pir_output_is(<<'CODE', <<'OUT', "first dynamic MMD call");

.namespace ["Main"]
.sub main @MAIN
    .local pmc F, B, f, b, m, s
    newclass F, "Foo"
    f = F."instantiate"()
    newclass B, "Bar"
    b = B."instantiate"()
    # create a multi the hard way
    m = new MultiSub
    s = find_global "Foo", "foo"
    push m, s
    s = find_global "Bar", "foo"
    push m, s
    global "foo" = m
    print "calling foo(f, b)\n"
    foo(f, b)
    print "calling foo(b, f)\n"
    foo(b, f)
.end

.namespace ["Foo"]
.sub foo method
    .param pmc x
    .param pmc y
    print "  Foo::foo\n"
.end

.namespace ["Bar"]
.sub foo method
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

pir_output_is(<<'CODE', <<'OUT', "MMD on argument count");
.namespace ["main"]
.sub main @MAIN
    p("ok 1\n")
    p("-twice", "ok 2\n")
.end

.namespace [""]

.sub p @MULTI(string)
    .param string s
    print s
.end

.sub p @MULTI(string, string)
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

pir_output_is(<<'CODE', <<'OUT', "MMD on mative types");
.namespace ["main"]
.sub main @MAIN
    p("ok 1\n")
    p(42)
.end

.namespace [""]

.sub p @MULTI(string)
    .param string s
    print s
.end

.sub p @MULTI(int)
    .param int i
    print i
    print "\n"
.end
CODE
ok 1
42
OUT

pir_output_is(<<'CODE', <<'OUT', "MMD on PMC types");
.namespace ["main"]
.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = subclass "PerlString", "Xstring"
    $P0 = new "Xstring"
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new "Ystring"
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.namespace [""]

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end
CODE
String ok 1
PerlSt ok 2
PerlSt ok 3
String ok 4
OUT

pir_output_like(<<'CODE', <<'OUT', "MMD on PMC types, invalid");
.namespace ["main"]
.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = subclass "PerlString", "Xstring"
    $P0 = new "Xstring"
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new "Ystring"
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
    $P0 = new Integer
    p($P0)
.end

.namespace [""]

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end
CODE
/String ok 1
PerlSt ok 2
PerlSt ok 3
String ok 4
Name 'p' not found/
OUT

pir_output_is(<<'CODE', <<'OUT', "MMD on PMC types 3");
.namespace ["main"]
.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = subclass "PerlString", "Xstring"
    $P0 = new "Xstring"
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new "Ystring"
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
    $P0 = new PerlInt
    $P0 = 42
    p($P0)
.end

.namespace [""]

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end

.sub p @MULTI(Integer)
    .param pmc p
    print "Intege "
    print p
    print "\n"
.end

CODE
String ok 1
PerlSt ok 2
PerlSt ok 3
String ok 4
Intege 42
OUT

pir_output_is(<<'CODE', <<'OUT', "MMD on PMC types, global namespace");
.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = subclass "PerlString", "Xstring"
    $P0 = new "Xstring"
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new "Ystring"
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end
CODE
String ok 1
PerlSt ok 2
PerlSt ok 3
String ok 4
OUT

pir_output_is(<<'CODE', <<'OUT', "MMD on PMC types, package namespace");

.namespace ["Some"]

.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = subclass "PerlString", "Xstring"
    $P0 = new "Xstring"
    $P0 = "ok 3\n"
    $P1 = subclass "String", "Ystring"
    $P1 = new "Ystring"
    $P1 = "ok 4\n"
    p($P0)
    p($P1)
.end

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end
CODE
String ok 1
PerlSt ok 2
PerlSt ok 3
String ok 4
OUT

pir_output_is(<<'CODE', <<'OUT', "MMD on PMC types - Any");

.sub main @MAIN
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new PerlString
    $P1 = "ok 2\n"
    p($P0)
    p($P1)
    $P0 = new PerlInt
    $P0 = 42
    p($P0)
    $P0 = new PerlInt
    $P0 = 43
    q($P0)
.end

.namespace [""]

.sub p @MULTI(String)
    .param pmc p
    print "String "
    print p
.end

.sub p @MULTI(PerlString)
    .param pmc p
    print "PerlSt "
    print p
.end

.sub p @MULTI(_)
    .param pmc p
    print "Any    "
    print p
    print "\n"
.end

.sub q @MULTI(pmc)
    .param pmc p
    print "Any    "
    print p
    print "\n"
.end

CODE
String ok 1
PerlSt ok 2
Any    42
Any    43
OUT

pir_output_is(<<'CODE', <<'OUTPUT', "__add as method");
.sub main @MAIN
    .local pmc d, l, r
    d = new Integer
    l = new Integer
    r = new Integer
    l = 3
    r = 39
    l."__add"(r, d)
    print d
    print "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "__add as method - inherited");
.sub main @MAIN
    .local pmc d, l, r
    d = new PerlInt
    l = new PerlInt
    r = new PerlInt
    l = 3
    r = 39
    l."__add"(r, d)
    print d
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "__add as method - Int, Float");
.sub main @MAIN
    .local pmc d, l, r
    d = new Integer
    l = new Integer
    r = new Float
    l = 3
    r = 39.42
    l."__add"(r, d)
    print d
    print "\n"
    end
.end
CODE
42.42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "__add as function - Int, Float");
.sub main @MAIN
    .local pmc d, l, r
    d = new Integer
    l = new Integer
    r = new Float
    l = 3
    r = 39.42
    "__add"(l, r, d)
    print d
    print "\n"
    end
.end
CODE
42.42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "bound __add method");
.sub main @MAIN
    .local pmc d, l, r, m
    d = new Integer
    l = new Integer
    r = new Float
    l = 3
    r = 39.42
    m = getattribute l, "__add"
    m(r, d)
    print d
    print "\n"
    r = new Integer
    r = 39
    m = getattribute l, "__add"
    m(r, d)
    print d
    print "\n"
    end
.end
CODE
42.42
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Integer subclasses");
.sub main @MAIN
    .local pmc d, l, r, cl
    cl = subclass "Integer", "AInt"
    d = new "AInt"
    l = new "AInt"
    r = new "AInt"
    l = 3
    r = 39
    print l
    print "\n"
    print r
    print "\n"
    # dispatches to Parrot_Integer_add_Integer
    add d, l, r
    print d
    print "\n"
    # dispatches to Parrot_Integer_add_Integer
    l."__add"(r, d)
    print d
    print "\n"
.end



CODE
3
39
42
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Integer subclasses, n_add");
.sub main @MAIN
    $P0 = subclass "Integer", "AInt"
    $P0 = new "AInt"
    $P1 = new Integer
    set $P0, 6
    set $P1, 2

    $P2 = n_add  $P0, $P1
    print $P2
    print "\n"
.end
.namespace ["AInt"]
.sub __add @MULTI(AInt, Integer)
    .param pmc l
    .param pmc r
    print l
    print r
    print "\n"
    $P0 = new Integer
    $P0 = 2
    .return($P0)
.end
CODE
62
2
OUTPUT

## my $temp = "temp.imc";
## END { unlink $temp; };

open P, ">$temp" or die "can't write $temp";
print P <<'EOF';
.namespace ["__parrot_core"]
.sub __add @MULTI(Integer, Integer)
    .param pmc l
    .param pmc r
    print l
    print r
    print "\n"
    $P0 = new Integer
    $P0 = 2
    .return($P0)
.end
EOF

pir_output_is(<<'CODE', <<'OUTPUT', "override builtin n_add");
.sub main
    load_bytecode "temp.imc"
    $P0 = new Integer
    $P1 = new Integer
    set $P0, 6
    set $P1, 2

    $P2 = n_add  $P0, $P1
    print $P2
    print "\n"
.end
CODE
62
2
OUTPUT
