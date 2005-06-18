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

use Parrot::Test tests => 26;
use Test::More;

# Test calling convention operations
output_is(<<'CODE', <<OUTPUT, "foldup");
    new P19, .String
    new P18, .String
    new P17, .String
    new P16, .String
    new P21, .String
    new P20, .String
    new P22, .String
    new P24, .String
    new P28, .String
    new P29, .String
    new P30, .String
    new P27, .String
    new P26, .String
    new P25, .String
    new P23, .String
    set P20,"Foobar!"
    set P23,"Baxman!"
    newsub P0, .Sub, _foo
    set P5,P19
    set P6,P18
    set P7,P17
    set P8,P16
    set P9,P21
    set P10,P20
    set P11,P22
    set P12,P24
    set P13,P28
    set P14,P29
    set P15,P30
    new P3, .SArray
    set P3, 4
    push P3,P27
    push P3,P26
    push P3,P25
    push P3,P23
    set I0,1
    set I1,0
    set I2,0
    set I3,11
    set I4,0
    invokecc
    end
_foo:
    foldup P17
    set P16,P17[5]
    print P16
    print "\n"
    set P16,P17[14]
    print P16
    print "\n"
    set I0,1
    set I1,0
    set I2,0
    set I3,0
    set I4,0
    returncc

CODE
Foobar!
Baxman!
OUTPUT

output_is(<<'CODE', <<OUTPUT, "foldup_p_i w. skip");
    new P19, .String
    new P18, .String
    new P17, .String
    new P16, .String
    new P21, .String
    new P20, .String
    new P22, .String
    new P24, .String
    new P28, .String
    new P29, .String
    new P30, .String
    new P27, .String
    new P26, .String
    new P25, .String
    new P23, .String
    set P20,"Foobar!"
    set P23,"Baxman!"
    newsub P0, .Sub, _foo
    set P5,P19
    set P6,P18
    set P7,P17
    set P8,P16
    set P9,P21
    set P10,P20
    set P11,P22
    set P12,P24
    set P13,P28
    set P14,P29
    set P15,P30
    new P3, .SArray
    set P3,15
    push P3,P27
    push P3,P26
    push P3,P25
    push P3,P23
    set I0,1
    set I1,4
    set I2,0
    set I3,11
    invokecc
    end
_foo:
    foldup P17, 2
    set P16,P17[3]
    print P16
    print "\n"
    set P16,P17[12]
    print P16
    print "\n"
    set I0,1
    set I1,0
    set I2,0
    set I3,0
    set I4,0
    returncc

CODE
Foobar!
Baxman!
OUTPUT

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
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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

pir_output_like(<<'CODE', <<'OUTPUT', "argc mismatch, too few");
.sub main @MAIN
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
.sub main @MAIN
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

pir_output_is(<<'CODE', <<'OUTPUT', "argc mismatch, optional");
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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
.sub main @MAIN
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
