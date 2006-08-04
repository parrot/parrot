#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 81;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"lt, numeric, not alpha, with vars");
 set a 10
 puts [expr $a < 9]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"lt, numeric, not alpha, with vars and braces");
 set a 10
 puts [expr {$a < 9}]
TCL
0
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

language_output_is("tcl", <<'TCL', <<'OUT', 'atan2(3, "a")');
  expr atan2(3,"a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'atan2("a", 3)');
  expr atan2("a",3)
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'atan2("a")');
  expr atan2("a")
TCL
too few arguments for math function
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "ceil(a)");
  expr ceil(a)
TCL
syntax error in expression "ceil(a)": variable references require preceding $
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'ceil("a")');
  expr ceil("a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'double("a")');
  expr double("a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "exp(exp(50)) - overflow");
  expr exp(exp(50))
TCL
floating-point value too large to represent
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "fmod(3,0) - domain error");
  expr fmod(3,0)
TCL
domain error: argument not in valid range
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'fmod(-4,"a")');
  expr fmod(-4,"a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'fmod("a",-4)');
  expr fmod("a",-4)
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'hypot(-3,"a")');
  expr hypot(-3,"a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'hypot("a",-3)');
  expr hypot("a",-3)
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'int("a")');
  expr int("a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "log(-4) - domain error");
  expr log(-4)
TCL
domain error: argument not in valid range
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'pow(2,"a")');
  expr pow(2,"a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'pow("a",2)');
  expr pow("a",2)
TCL
argument to math function didn't have numeric value
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'round("a")');
  expr round("a")
TCL
argument to math function didn't have numeric value
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "sqrt(-49) - domain error");
  expr sqrt(-49)
TCL
domain error: argument not in valid range
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'abs(1,2) - too many args');
  expr abs(1,2)
TCL
too many arguments for math function
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'hypot(1) - too few args');
  expr hypot(1)
TCL
too few arguments for math function
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
0.3333333333333333
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

language_output_is("tcl",<<TCL,<<OUT,"float remainder");
 puts [expr 3.2 % 2]
TCL
can't use floating-point value as operand of "%"
OUT

language_output_is("tcl",<<TCL,<<OUT,"float left shift");
 puts [expr 3.2 << 2]
TCL
can't use floating-point value as operand of "<<"
OUT

language_output_is("tcl",<<TCL,<<OUT,"float right shift");
 puts [expr 3.2 >> 2]
TCL
can't use floating-point value as operand of ">>"
OUT

language_output_is("tcl",<<TCL,<<OUT,"float &");
 puts [expr 3.2 & 2]
TCL
can't use floating-point value as operand of "&"
OUT

language_output_is("tcl",<<TCL,<<OUT,"float |");
 puts [expr 3.2 | 2]
TCL
can't use floating-point value as operand of "|"
OUT

language_output_is("tcl",<<TCL,<<OUT,"float ^");
 puts [expr 3.2 ^ 2]
TCL
can't use floating-point value as operand of "^"
OUT

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

language_output_is("tcl", <<'TCL', <<'OUT', "in - true");
  set list {b c d f}
  puts [expr {"b" in $list}]
TCL
1
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "in - false");
  set list {b c d f}
  puts [expr {"e" in $list}]
TCL
0
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "ni - true");
  set list {b c d f}
  puts [expr {"e" ni $list}]
TCL
1
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "ni - false");
  set list {b c d f}
  puts [expr {"b" ni $list}]
TCL
0
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "hex number");
  puts [expr {0xf}]
TCL
15
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "hex multiplication");
  puts [expr {0xf*0xa}]
TCL
150
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'bad hex');
  expr 0xg
TCL
syntax error in expression "0xg": extra tokens at end of expression
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'simple ternary');
  puts [ expr 1?"whee":"cry"]
TCL
whee
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'ternary, true, short circuit');
  expr {1?[puts ok]:[puts nok]}
TCL
ok
OUT

language_output_is("tcl", <<'TCL', <<'OUT', 'ternary, false, short circuit');
  expr {0?[puts true]:[puts false]}
TCL
false
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"string mul - don't confuse variables for strings.");
  set a 1; puts [expr {$a * 10}]
TCL
10
OUT

language_output_is("tcl",<<'TCL',<<'OUT','complicated expression required for test_more.tcl');
  puts [expr {"[eval {set a "aok"}]" ne "bork"}]
TCL
1
OUT
