#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 35;
use Test::More;

language_output_is("tcl",<<'TCL',<<'OUT',"in braces");
 puts {a\n}
TCL
a\n
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"newline");
 puts \n
TCL


OUT

language_output_is("tcl",<<'TCL',<<OUT,"tab");
 puts \t
TCL
\t
OUT

language_output_is("tcl",<<'TCL',<<OUT,"backspace");
 puts \b
TCL
\x08
OUT

language_output_is("tcl",<<'TCL',<<OUT,"formfeed");
 puts \f
TCL
\x0c
OUT

language_output_is("tcl",<<'TCL',chr(0xd),"carriage return");
 puts -nonewline \r
TCL

language_output_is("tcl",<<'TCL',<<OUT,"vertical tab");
 puts \v
TCL
\x0b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"backslash");
 puts \\
TCL
\\
OUT

language_output_is("tcl",<<'TCL',<<OUT,"normal character");
 puts \q
TCL
q
OUT

language_output_is("tcl",<<'TCL',<<OUT,"backslash newline substitution");
 puts "a\
       b"
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal single digit");
  set a \7
  puts $a
TCL
\cG
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal single digit, extra");
  set a \79
  puts $a
TCL
\cG9
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double digit");
  set a \12
  puts $a
TCL
\cJ
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double digit, extra");
  set a \129
  puts $a
TCL
\cJ9
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple digit");
  set a \123
  puts $a
TCL
S
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple digit, extra");
  set a \1234
  puts $a
TCL
S4
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex single digit, invalid");
  set a \xq
  puts $a
TCL
xq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex single digit");
  set a \x7
  puts $a
TCL
\cG
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex single digit, extra");
  set a \x7q
  puts $a
TCL
\cGq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex double digit");
  set a \x6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex double digit, extra");
  set a \x6aq
  puts $a
TCL
jq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex triple digit, skip ok?");
  set a \xb6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex triple digit, extra");
  set a \xb6aq
  puts $a
TCL
jq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex many digit");
  set a \xaaaaaaaaaaab6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex many digit, extra");
  set a \xaaaaaaaaaaab6aq
  puts $a
TCL
jq
OUT


language_output_is("tcl",<<'TCL',<<OUT,"unicode single digit, invalid");
  set a \uq
  puts $a
TCL
uq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode one digit");
  set a \u7
  puts $a
TCL
\cG
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode one digit, extra");
  set a \u7q
  puts $a
TCL
\cGq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode two digits");
  set a \u6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode two digits, extra");
  set a \u6aq
  puts $a
TCL
jq
OUT

# expected values are in utf8 encoding.

language_output_is("tcl",<<'TCL',<<OUT,"unicode three digits");
  set a \u666
  puts $a
TCL
\xd9\xa6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode three digits, extra");
  set a \u666q
  puts $a
TCL
\xd9\xa6q
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode four digits");
  set a \u6666
  puts $a
TCL
\xe6\x99\xa6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unicode four digits, extra");
  set a \u6666q
  puts $a
TCL
\xe6\x99\xa6q
OUT

language_output_is("tcl",<<'TCL',<<OUT,"multiple substs, same word");
  set a \\\a\007\xaaaa07\u0007\uq
  puts $a
TCL
\\\cG\cG\cG\cGuq
OUT
