#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 97;
use Test::More;

language_output_is("tcl",<<TCL,<<OUT,"int");
 puts [expr 42]
TCL
42
OUT

language_output_is("tcl",<<TCL,<<OUT,"unary -");
 puts [expr -2]
TCL
-2
OUT

language_output_is("tcl",<<TCL,<<OUT,"unary +");
 puts [expr +2]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"unary ~");
 puts [expr ~0]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"unary !");
 puts [expr !2]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"double unary !");
 puts [expr !!2]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"mul");
 puts [expr 2 * 3]
TCL
6
OUT

language_output_is("tcl",<<TCL,<<OUT,"div");
 puts [expr 6 / 2]
TCL
3
OUT

language_output_is("tcl",<<TCL,<<OUT,"remainder");
 puts [expr 3 % 2]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"plus");
 puts [expr 2 + 3]
TCL
5
OUT

language_output_is("tcl",<<TCL,<<OUT,"minus");
 puts [expr 2 - 3]
TCL
-1
OUT


language_output_is("tcl",<<TCL,<<OUT,"left shift");
 puts [expr 16 << 2]
TCL
64
OUT

language_output_is("tcl",<<TCL,<<OUT,"right shift");
 puts [expr 16 >> 2]
TCL
4
OUT

language_output_is("tcl",<<TCL,<<OUT,"lt, numeric, not alpha...");
 puts [expr 10 < 9]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"lt, numeric, not alpha, with vars");
 set a 10
 puts [expr $a < 9]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"lt, true");
 puts [expr 2 < 3]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"lt, false");
 puts [expr 3 < 2]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"gt, true");
 puts [expr 3 > 2]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"gt, false");
 puts [expr 2 > 3]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"lte, lt");
 puts [expr 2 <= 3]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"lte, gt");
 puts [expr 3 <= 2]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"lte, eq");
 puts [expr 3 <= 3]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"gte, gt");
 puts [expr 3 >= 2]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"gte, lt");
 puts [expr 2 >= 3]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"gte, eq");
 puts [expr 3 >= 3]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"==, eq");
 puts [expr 2 == 2]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"==, ne");
 puts [expr 2 == 1]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"==, ne");
 puts [expr 1 != 1]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"==, eq");
 puts [expr 2 != 1]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"&");
 puts [expr 5 & 6 ]
TCL
4
OUT

language_output_is("tcl",<<TCL,<<OUT,"|");
 puts [expr 5 | 6 ]
TCL
7
OUT

language_output_is("tcl",<<TCL,<<OUT,"^");
 puts [expr 5 ^ 6 ]
TCL
3
OUT

language_output_is("tcl",<<TCL,<<OUT,"&&, both sides");
 proc true {} {puts T; return 1}
 proc false {} {puts F; return 0}
 puts [expr {[true] && [false]}]
TCL
T
F
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"||, both sides");
 proc true {} {puts T; return 1}
 proc false {} {puts F; return 0}
 puts [expr {[false] || [true]}]
TCL
F
T
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"&&, short circuited");
 proc true {} {puts T; return 1}
 proc false {} {puts F; return 0}
 puts [expr {[false] && [true]}]
TCL
F
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"||, short circuited");
 proc true {} {puts T; return 1}
 proc false {} {puts F; return 0}
 puts [expr {[true] || [false]}]
TCL
T
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"abs");
 puts [expr abs(1-2)]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"acos");
 puts [expr acos(0)]
TCL
1.57079632679
OUT

language_output_is("tcl",<<TCL,<<OUT,"asin");
 puts [expr asin(1)]
TCL
1.57079632679
OUT

language_output_is("tcl",<<TCL,<<OUT,"atan");
 puts [expr atan(1)]
TCL
0.785398163397
OUT

language_output_is("tcl",<<TCL,<<OUT,"cos");
 puts [expr cos(1)]
TCL
0.540302305868
OUT

language_output_is("tcl",<<TCL,<<OUT,"cosh");
 puts [expr cosh(1)]
TCL
1.54308063482
OUT

language_output_is("tcl",<<TCL,<<OUT,"exp");
 puts [expr exp(1)]
TCL
2.71828182846
OUT

language_output_is("tcl",<<TCL,<<OUT,"log");
 puts [expr log(32)]
TCL
3.4657359028
OUT

language_output_is("tcl",<<TCL,<<OUT,"log10");
 puts [expr log10(32)]
TCL
1.50514997832
OUT

language_output_is("tcl",<<TCL,<<OUT,"sin");
 puts [expr sin(1)]
TCL
0.841470984808
OUT

language_output_is("tcl",<<TCL,<<OUT,"sinh");
 puts [expr sinh(1)]
TCL
1.17520119364
OUT

language_output_is("tcl",<<TCL,<<OUT,"sqrt");
 puts [expr sqrt(64)]
TCL
8.0
OUT

language_output_is("tcl",<<TCL,<<OUT,"tan");
 puts [expr tan(1)]
TCL
1.55740772465
OUT

language_output_is("tcl",<<TCL,<<OUT,"tanh");
 puts [expr tanh(1)]
TCL
0.761594155956
OUT

# misc.

language_output_is("tcl",<<TCL,<<OUT,"simple precedence");
 puts [expr 2*3+4*2]
TCL
14
OUT

language_output_is("tcl",<<TCL,<<OUT,"parens");
 puts [expr 2*(3+4)*2]
TCL
28
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"premature end of expr '('");
  puts [expr "("]
TCL
syntax error in expression "(": premature end of expression
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"float division");
puts [expr 1 / 3.0]
TCL
0.333333333333
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"nested expr (braces)");
 puts [expr {2 * [expr {2 - 1}]}];
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"braced operands.");
 set n 1
 puts [expr {$n * 1}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"puts inside an expr");
  puts [expr {[puts 2]}]
TCL
2

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"eq, extra characters after quotes");
  puts [expr {"foo"eq{foo}}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"eq, extra characters after brace");
  puts [expr {{foo}eq"foo"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"eq (false)");
  puts [expr {"foo"eq{baz}}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"ne (true)");
  puts [expr {{foo}ne{baz}}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"ne (false)");
  puts [expr {{foo}ne{foo}}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string == (true)");
  puts [expr {"foo"=="foo"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string == (false)");
  puts [expr {"foo"=="baz"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string != (true)");
  puts [expr {"foo" != "baz"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string != (false)");
  puts [expr {"foo"!="foo"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string <= (less)");
  puts [expr {"abb"<="abc"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string <= (greater)");
  puts [expr {"abc"<="abb"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string <= (equal)");
  puts [expr {"abc"<="abc"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string >= (less)");
  puts [expr {"abb" >= "abc"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string >= (greater)");
  puts [expr {"abc" >= "abb"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string >= (equal)");
  puts [expr {"abc" >= "abc"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string < (less)");
  puts [expr {"abb" < "abc"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string < (greater)");
  puts [expr {"abc" < "abb"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string < (equal)");
  puts [expr {"abc" < "abc"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string > (less)");
  puts [expr {"abb" > "abc"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string > (greater)");
  puts [expr {"abc" > "abb"}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string > (equal)");
  puts [expr {"abc" > "abc"}]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unknown math function");
  puts [expr fink()]
TCL
unknown math function "fink"
OUT

TODO: {
  local $TODO = "not all string cases are currently working properly";

language_output_is("tcl",<<TCL,<<OUT,"string mul");
 puts [expr {"a" * "b"}]
TCL
can't use non-numeric string as operand of "*"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string div");
 puts [expr {"a" / "b"}]
TCL
can't use non-numeric string as operand of "/"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string remainder");
 puts [expr {"a" % "b"}]
TCL
can't use non-numeric string as operand of "%"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string plus");
 puts [expr {"a" + "b"}]
TCL
can't use non-numeric string as operand of "+"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string minus");
 puts [expr {"a" - "b"}]
TCL
can't use non-numeric string as operand of "-"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string left shift");
 puts [expr {"a" << "b"}]
TCL
can't use non-numeric string as operand of "<<"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string right shift");
 puts [expr {"a" >> "b"}]
TCL
can't use non-numeric string as operand of ">>"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string &");
 puts [expr {"a" & "b"}]
TCL
can't use non-numeric string as operand of "&"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string |");
 puts [expr {"a" | "b"}]
TCL
can't use non-numeric string as operand of "|"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string ^");
 puts [expr {"a" ^ "b"}]
TCL
can't use non-numeric string as operand of "^"
OUT

}

language_output_is("tcl",<<TCL,<<OUT,"octal");
 puts [expr 000012345]
TCL
5349
OUT

language_output_is("tcl",<<TCL,<<OUT,"neg octal");
 puts [expr -000012345]
TCL
-5349
OUT

language_output_is("tcl",<<TCL,<<OUT,"pos octal");
 puts [expr +000012345]
TCL
5349
OUT

language_output_is("tcl",<<TCL,<<OUT,"bad octal");
 puts [expr 0000912345]
TCL
expected integer but got "0000912345" (looks like invalid octal number)
OUT

language_output_is("tcl",<<TCL,<<OUT,"floats aren't octal");
 puts [expr 000012345.0]
TCL
12345.0
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string > int");
 puts [expr {"a" > 10}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string int < int");
 puts [expr {"2" < 10}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string int < string int");
 puts [expr {"2" < "10"}]
TCL
1
OUT

