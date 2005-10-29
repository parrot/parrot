#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/calling.t - Parrot Calling Conventions

=head1 SYNOPSIS

	% perl -Ilib t/op/calling.t

=head1 DESCRIPTION

Tests Parrot calling conventions.

=cut

use Parrot::Test tests => 39;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "set_args - parsing");
    noop
    set_args "(0b10, 0)", P0, I0
    print "Ok 1\n"
    set_args "()"
    print "Ok 2\n"
    end
CODE
Ok 1
Ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "var_args - parsing");
.pcc_sub main:
    print "Ok 1\n"
    set_args "(0b10, 0)", P0, I0
    get_results "(0)", I0
    find_name P1, "foo"
    print "Ok 2\n"
    invokecc P1
    print "Ok 5\n"
    end
.pcc_sub foo:
    get_params "(0b10, 0)", P0, I0
    print "Ok 3\n"
    set_returns "(0b100)", 42
    print "Ok 4\n"
    returncc
CODE
Ok 1
Ok 2
Ok 3
Ok 4
Ok 5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call - i, ic");
.pcc_sub main:
    set I16, 77
    set_args "(0b100, 0)", 42, I16
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0)", I16, I17
    print I16
    print "\n"
    print I17
    print "\n"
    returncc
CODE
42
77
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call - i, ic, return i, ic");
.pcc_sub main:
    set I16, 77
    set_args "(0b100, 0)", 42, I16
    get_results "(0, 0)", I16, I17
    find_name P1, "foo"
    invokecc P1
    print I16
    print "\n"
    print I17
    print "\nback\n"
    end
.pcc_sub foo:
    get_params "(0, 0)", I16, I17
    print I16
    print "\n"
    print I17
    print "\n"
    set I16, 88
    set_returns "(4, 0)", 99, I16
    returncc
CODE
42
77
99
88
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call - i, ic, return i, ic - adjust sig");
.pcc_sub main:
    set I16, 77
    set_args "(0, 0)", 42, I16
    get_results "(0, 0)", I16, I17
    find_name P1, "foo"
    invokecc P1
    print I16
    print "\n"
    print I17
    print "\nback\n"
    end
.pcc_sub foo:
    get_params "(0, 0)", I16, I17
    print I16
    print "\n"
    print I17
    print "\n"
    set I16, 88
    set_returns "(0, 0)", 99, I16
    returncc
CODE
42
77
99
88
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "all together now");
.pcc_sub main:
    set I16, 77
    set N16, 2.3
    set S16, "ok 1\n"
    new P16, .Integer
    set P16, 101
    set_args "(0, 0, 0, 0, 0, 0, 0)", 42, I16, 4.5, N16, S16, "ok 2\n", P16
    get_results "(0, 0, 0, 0)", I16, N16, S16, P16
    find_name P1, "foo"
    invokecc P1
    print I16
    print "\n"
    print N16
    print "\n"
    print S16
    print P16
    end
.pcc_sub foo:
    get_params "(0, 0, 0, 0, 0, 0, 0)", I16, I17, N16, N17, S16, S17, P16
    print I16
    print "\n"
    print I17
    print "\n"
    print N16
    print "\n"
    print N17
    print "\n"
    print S16
    print S17
    print P16
    print "\n"
    set I16, 88
    set N16, 5.5
    set S16, "ok 3\n"
    new P16, .String
    set P16, "ok 4\n"
    set_returns "(0, 0, 0, 0)", I16, N16, S16, P16
    returncc
CODE
42
77
4.500000
2.300000
ok 1
ok 2
101
88
5.500000
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "flatten arg");
.pcc_sub main:
    new P16, .String
    set P16, "ok 1\n"
    new P17, .ResizablePMCArray
    push P17, "ok 2\n"
    push P17, "ok 3\n"
    push P17, "ok 4\n"
    new P18, .String
    set P18, "ok 5\n"
    set_args "(0, 0x8, 0)", P16, P17, P18
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0, 0, 0, 0)", P1, P2, P3, P4, P5
    print P1
    print P2
    print P3
    print P4
    print P5
    returncc
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slurpy param");
.pcc_sub main:
    new P16, .String
    set P16, "ok 1\n"
    new P17, .String
    set P17, "ok 2\n"
    new P18, .String
    set P18, "ok 3\n"
    set_args "(0, 0, 0)", P16, P17, P18
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0x8)", P1, P2
    print P1
    set I0, P2
    print I0
    print "\n"
    set S0, P2[0]
    print S0
    set S0, P2[1]
    print S0
    returncc
CODE
ok 1
2
ok 2
ok 3
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "use it in PIR");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    # set_args and invoke must be adjacent
    set_args "(0)", $P0
    invokecc $P1
.end
.sub foo
    get_params "(0)", $P0
    print $P0
.end
CODE
hello
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "flatten + slurpy param");
.pcc_sub main:
    new P16, .String
    set P16, "ok 1\n"
    new P19, .ResizablePMCArray
    new P17, .String
    set P17, "ok 2\n"
    push P19, P17
    new P18, .String
    set P18, "ok 3\n"
    push P19, P18
    new P20, .ResizablePMCArray
    new P17, .String
    set P17, "ok 4\n"
    push P20, P17
    new P18, .String
    set P18, "ok 5\n"
    push P20, P18
    new P21, .String
    set P21, "ok 6\n"
    set_args "(0, 0x8, 0x8, 0)", P16, P19, P20, P21
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0x8)", P1, P2
    print P1
    set I0, P2
    print I0
    print "\n"
    set S0, P2[0]
    print S0
    set S0, P2[1]
    print S0
    set S0, P2[2]
    print S0
    set S0, P2[3]
    print S0
    set S0, P2[4]
    print S0
    set S0, P2[5]
    print S0
    returncc
CODE
ok 1
5
ok 2
ok 3
ok 4
ok 5
ok 6
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "use it in PIR");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    # set_args and invoke must be adjacent
    set_args "(0)", $P0
    invokecc $P1
.end
.sub foo
    get_params "(0)", $P0
    print $P0
.end
CODE
hello
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "type conversion - autobox");
.sub main :main
    $P0 = new String
    $P0 = "hello"
    find_name $P1, "foo"
    # set_args and invoke must be adjacent
    set_args "(0,0,0)", $P0, 42, "bar"
    invokecc $P1
.end
.sub foo
    get_params "(0x8)", $P0
    $S0 = $P0[0]
    print_item $S0
    $S0 = $P0[1]
    print_item $S0
    $S0 = $P0[2]
    print_item $S0
    print_newline
.end
CODE
hello 42 bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "type conversion - fetch");
.sub main :main
    $P0 = new .String
    $P0 = "hello"
    $P1 = new .Integer
    $P1 = 42
    $P2 = new .String
    $P2 = "again"
    $P3 = new .Float
    $P3 = 47.11
    find_name $P10, "foo"
    # set_args and invoke must be adjacent
    set_args "(0,0,0,0)", $P0, $P1, $P2, $P3
    invokecc $P10
.end
.sub foo
    get_params "(0,0,0,0)", $P0, $I0, $S0, $N0
    print_item $P0
    print_item $I0
    print_item $S0
    print_item $N0
    print_newline
    returncc
.end
CODE
hello 42 again 47.11
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "maybe flatten + slurpy param");
.pcc_sub main:
    new P16, .String
    set P16, "ok 1\n"
    new P19, .ResizablePMCArray
    new P17, .String
    set P17, "ok 2\n"
    push P19, P17
    new P18, .String
    set P18, "ok 3\n"
    push P19, P18
    new P20, .ResizablePMCArray
    new P17, .String
    set P17, "ok 4\n"
    push P20, P17
    new P18, .String
    set P18, "ok 5\n"
    push P20, P18
    new P21, .String
    set P21, "ok 6\n"
    set_args "(0x10, 0x10, 0x10, 0x10)", P16, P19, P20, P21
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0x8)", P1, P2
    print P1
    set I0, P2
    print I0
    print "\n"
    set S0, P2[0]
    print S0
    set S0, P2[1]
    print S0
    set S0, P2[2]
    print S0
    set S0, P2[3]
    print S0
    set S0, P2[4]
    print S0
    set S0, P2[5]
    print S0
    returncc
CODE
ok 1
5
ok 2
ok 3
ok 4
ok 5
ok 6
back
OUTPUT

SKIP: {
  skip("arg count check disabled", 2);
pir_output_like(<<'CODE', <<'OUTPUT', "argc mismatch, too few");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "(0)", $P0
    invokecc $P1
.end
.sub foo
    get_params "(0,0)", $P0, $P1
    print $P0
.end
CODE
/too few arguments passed/
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "argc mismatch, too many");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "(0,0)", $P0,77
    invokecc $P1
.end
.sub foo
    get_params "(0)", $P0
    print $P0
.end
CODE
/too many arguments passed/
OUTPUT
}

pir_output_is(<<'CODE', <<'OUTPUT', "argc mismatch, optional");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "(0)", $P0
    invokecc $P1
.end
.sub foo
    get_params "(0,0x20)", $P0, $P1
    print $P0
    if_null $P1, ok
    print "not "
ok:
    print "ok\n"
.end
CODE
hello
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "get_param later");
.pcc_sub main:
    set I16, 77
    set_args "(0b100, 0)", 42, I16
    get_results "(0, 0)", I16, I17
    find_name P1, "foo"
    invokecc P1
    print I16
    print "\n"
    print I17
    print "\nback\n"
    end
.pcc_sub foo:
    noop
    get_params "(0, 0)", I16, I17
    print I16
    print "\n"
    print I17
    print "\n"
    set I16, 88
    set_returns "(4, 0)", 99, I16
    returncc
CODE
42
77
99
88
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall 1");
.sub main :main
    .const .Sub f = "foo"
    print "main\n"
    get_results "(0)", $S0
    invokecc f
    print $S0
.end
.sub foo
    .const .Sub b = "bar"
    print "foo\n"
    set_returns "(0)", "foo_ret\n"
    tailcall b
.end
.sub bar
    print "bar\n"
    set_returns "(0)", "bar_ret\n"
    returncc
.end
CODE
main
foo
bar
bar_ret
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall 2 - pass arg");
.sub main :main
    .const .Sub f = "foo"
    print "main\n"
    get_results "(0)", $S0
    invokecc f
    print $S0
.end
.sub foo
    .const .Sub b = "bar"
    print "foo\n"
    set_args "(0)", "from_foo\n"
    set_returns "(0)", "foo_ret\n"
    tailcall b
.end
.sub bar
    get_params "(0)", $S0
    print "bar\n"
    print $S0
    set_returns "(0)", "bar_ret\n"
    returncc
.end
CODE
main
foo
bar
from_foo
bar_ret
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall 3 - pass arg");
.sub main :main
    .const .Sub f = "foo"
    print "main\n"
    get_results "(0)", $S0
    invokecc f
    print $S0
.end
.sub foo
    .const .Sub b = "bar"
    print "foo\n"
    set_args "(0)", "from_foo\n"
    set_returns "(0)", "foo_ret\n"
    tailcall b
.end
.sub bar
    print "bar\n"
    get_params "(0)", $S0
    print $S0
    set_returns "(0)", "bar_ret\n"
    returncc
.end
CODE
main
foo
bar
from_foo
bar_ret
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "get_params twice");
.pcc_sub main:
    new P16, .String
    set P16, "ok 1\n"
    new P17, .String
    set P17, "ok 2\n"
    new P18, .String
    set P18, "ok 3\n"
    set_args "(0, 0, 0)", P16, P17, P18
    find_name P1, "foo"
    invokecc P1
    print "back\n"
    end
.pcc_sub foo:
    get_params "(0, 0x8)", P1, P2
    print P1
    set I0, P2
    print I0
    print "\n"
    set S0, P2[0]
    print S0
    set S0, P2[1]
    print S0
    get_params "(0, 0, 0)", P1, P2, P3
    print P1
    print P2
    print P3
    returncc
CODE
ok 1
2
ok 2
ok 3
ok 1
ok 2
ok 3
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "empty args");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "()"
    invokecc $P1
.end
.sub foo
    get_params "(0x20)", $P1
    if_null $P1, ok
    print "not "
ok:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "optional args");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "(0x0)", $P0
    invokecc $P1
.end
.sub foo
    get_params "(0x20)", $P1
    unless_null $P1, ok
    print "not "
ok:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "optional, argcX");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    find_name $P1, "foo"
    set_args "(0,0)", $P0, 10
    invokecc $P1
.end
.sub foo
    .local int opt_argc
    get_params "(0,0,0x20,0x20,0x20,0x20,0x40)", $P0, $I0, $P1, $S1, $I1, $N1, opt_argc
    print $P0
    if_null $P1, ok
    print "not "
ok:
    print "ok\n"
    print opt_argc
    print "\n"
.end
CODE
hello
ok
0
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pir uses no ops");
.sub main :main
    $I0 = 77
    foo(42, $I0)
    print "back\n"
.end

.emit
.pcc_sub foo:
    get_params "(0, 0)", I16, I17
    print I16
    print "\n"
    print I17
    print "\n"
    returncc
.eom
CODE
42
77
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pir call evaled code");
.sub main :main
    .local string s
    s  = ".sub foo\n"
    s .= ".param int i\n"
    s .= ".param int j\n"
    s .= "print_item i\n"
    s .= "print_item j\n"
    s .= "print_newline\n"
    s .= ".return(99)\n"
    s .= ".end\n"
    .local pmc comp
    comp = compreg "PIR"
    $P0 = comp(s)
    $I0 = 77
    $I0 = foo(42, $I0)
    print $I0
    print "\n"
.end

CODE
42 77
99
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall 4 - pir calls");
.sub main :main
    .const .Sub f = "foo"
    print "main\n"
    $S0 = f()
    print $S0
.end
.sub foo
    .const .Sub b = "bar"
    print "foo\n"
    .return b("from_foo\n")
.end
.sub bar
    .param string s
    print "bar\n"
    print s
    .return ("bar_ret\n")
.end
CODE
main
foo
bar
from_foo
bar_ret
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "type conversion - native");
.sub main :main
    foo(42, "42", 42.20)
.end
.sub foo
    get_params "(0,0,0)", $I0, $I1, $I2
    print_item $I0
    print_item $I1
    print_item $I2
    print_newline
    # yeah fetch args again
    get_params "(0,0,0)", $N0, $N1, $N2
    print_item $N0
    print_item $N1
    print_item $N2
    print_newline
    get_params "(0,0,0)", $S0, $S1, $S2
    print_item $S0
    print_item $S1
    print_item $S2
    print_newline
.end
CODE
42 42 42
42.0 42.0 42.2
42 42 42.2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "type conversion - PIR const");
.const int MYCONST = -2
.sub main :main
    $P0 = new PerlString
    "foo"(MYCONST)
.end
.sub "foo"
    .param string str1 :optional
    print str1
    print "\n"
.end
CODE
-2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "optional args, :opt_flag");
.sub main :main
    $P0 = new String
    $P0 = "hello\n"
    foo($P0)
    foo()
.end
.sub foo
    .param pmc p1  :optional
    .param int i1  :opt_flag

    if_null p1, skip
    print p1
skip:
    print i1
    print "\n"
.end
CODE
hello
1
0
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "optional multiple :opt_flag");
.sub main :main
    $P0 = new String
    $P0 = "ok 1\n"
    foo($P0, "ok 2\n", "ok 3\n")
.end
.sub foo
    .param pmc p1  :optional
    .param int i1  :opt_flag
    .param pmc p2  :optional
    .param int i2  :opt_flag
    .param pmc p3  :optional
    .param int i3  :opt_flag
    .param pmc p4  :optional
    .param int i4  :opt_flag

    print p1
    print p2
    print p3
    if_null p4, ok
    print "not "
ok:
    print "ok 4\n"
    print_item i1
    print_item i2
    print_item i3
    print_item i4
    print_newline
.end


CODE
ok 1
ok 2
ok 3
ok 4
1 1 1 0
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "optional returns, void ret");
.sub main :main
    .local pmc f
    $I0 = 99
    f = global "foo"
    .pcc_begin
    .pcc_call f
    .result   $P0 :optional
    .result   $I0 :opt_flag
    .pcc_end
    unless $I0,  ex
    print "not "
ex:
    print "ok 1\n"
.end
.sub foo
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall 5 - arg/param conflict");
.sub main :main
    .local pmc a, b
    a = new Integer
    a = 1
    b = new Integer
    b = 2
    .local pmc c, d
    (c, d) = foo(a, b)
    eq_addr a, c, ok1
    print "not "
ok1:
    print "ok 1\n"
    eq_addr b, d, ok2
    print "not "
ok2:
    print "ok 2\n"
.end

.sub foo
    .param pmc a
    .param pmc b
    $P0 = new Integer
    $P0 = 3
    .return bar($P0, a, b)
.end

.sub bar
    .param pmc x
    .param pmc a
    .param pmc b
    .return (a, b)
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "OO argument passig");
.sub main :main
    .local pmc cl, o, f
    cl = newclass "Foo"
    o = new "Foo"
    o."bar"("ok 1\n")
    f = find_global "Foo", "bar"
    f(o, "ok 2\n")
    o."baz"("ok 3\n")
    f = find_global "Foo", "baz"
    f(o, "ok 4\n")
.end
.namespace ["Foo"]
.sub bar method
    .param string s
    print self
    print " "
    print s
.end
.sub baz
    .param pmc self
    .param string s
    print self
    print " "
    print s
.end
.sub __get_string method
    $S0 = typeof self
    .return ($S0)
.end
CODE
Foo ok 1
Foo ok 2
Foo ok 3
Foo ok 4
OUTPUT

# see also tcl in leo-ctx5 by Coke; Date 28.08.2005
pir_output_is(<<'CODE', <<'OUTPUT', "bug - :slurpy promotes to :flatten");
.sub main :main
    $P0 = new String
    $P0 = "ok 1\n"
    $P1 = new String
    $P1 = "ok 2\n"
    $P0 = foo($P0, $P1)
    print $P0
.end
.sub foo
    .param pmc p :slurpy
    .return bar(p)
.end
.sub bar
    .param pmc p
    .local pmc q
    q = p[0]
    print q
    q = p[1]
    .return (q)
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "tailcall to NCI");
.sub main :main
    .local pmc s
    s = new .String
    s = "OK 1\n"
    $S0 = s."lower"()
    print $S0
    s = "OK 2\n"
    $S1 = foo(s)
    print $S1
.end
.sub foo
    .param pmc s
    .return s."lower"()
.end
CODE
ok 1
ok 2
OUTPUT


# bug - repeated calls to eval'd sub crashes (pmichaud, 2005.10.27)
pir_output_is(<<'CODE', <<'OUTPUT', "repeated calls to eval'd sub");
.sub main :main
    .local string s
    .local pmc outer
    s =  ".namespace [ \"XYZ\" ]\n"
    s .= ".sub outer\n"
    s .= "    .param int n\n"
    s .= "    $I0 = n % 1000\n"
    s .= "    if $I0 goto end\n"
    s .= "    print n\n"
    s .= "    print \"\\n\"\n"
    s .= "  end:\n"
    s .= ".end\n"
    $P0 = compreg "PIR"
    $P0(s)
    outer = find_global "XYZ", "outer"
    $I1 = 0
  loop:
    inc $I1
    if $I1 > 10000 goto end
    outer($I1)
    goto loop
  end:
.end
CODE
1000
2000
3000
4000
5000
6000
7000
8000
9000
10000
OUTPUT
 
# bug - register conflict with :slurpy param (pmichaud, 2005.10.29)
pir_output_is(<<'CODE', <<'OUTPUT', ":slurpy register conflict");
.sub main :main
    xyz("abc", "def")
    xyz("ghi", "jkl", "POPME")
.end

.sub xyz
    .param pmc args            :slurpy

    $S0 = args[-1]
    if $S0 != "POPME" goto start
    $P0 = pop args
  start:
    $I1 = elements args
    $I0 = 0
  loop:
    if $I0 >= $I1 goto end
    $S0 = args[$I0]
    print $S0
    print "\n"
    inc $I0
    goto loop
  end:
.end
CODE
abc
def
ghi
jkl
OUTPUT
