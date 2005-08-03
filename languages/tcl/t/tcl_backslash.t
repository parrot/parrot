#!/usr/bin/perl

#XXX need TODO tests for unicode

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 24;
use Test::More;
use vars qw($TODO);

my($tcl,$expected);

language_output_is("tcl",<<'TCL',<<'OUT',"in braces");
 puts {a\n}
TCL
a\n
OUT

$tcl = <<'EOTCL';
 puts -nonewline "\n"
EOTCL
$expected = chr(0xa);
language_output_is("tcl",$tcl,$expected,"newline");

$tcl = <<'EOTCL';
 puts -nonewline "\t"
EOTCL
$expected = chr(0x9);
language_output_is("tcl",$tcl,$expected,"tab");

$tcl = <<'EOTCL';
 puts -nonewline "\b"
EOTCL
$expected = chr(0x8);
language_output_is("tcl",$tcl,$expected,"backspace");

$tcl = <<'EOTCL';
 puts -nonewline "\f"
EOTCL
$expected = chr(0xc);
language_output_is("tcl",$tcl,$expected,"formfeed");

$tcl = <<'EOTCL';
 puts -nonewline "\r"
EOTCL
$expected = chr(0xd);
language_output_is("tcl",$tcl,$expected,"carriage return");

$tcl = <<'EOTCL';
 puts -nonewline "\v"
EOTCL
$expected = chr(0xb);
language_output_is("tcl",$tcl,$expected,"vertical tab");

$tcl = <<'EOTCL';
 puts -nonewline "\\"
EOTCL
$expected = "\\";
language_output_is("tcl",$tcl,$expected,"backslash");

$tcl = <<'EOTCL';
puts -nonewline "\q"
EOTCL
$expected = "q";
language_output_is("tcl",$tcl,$expected,"normal character");

$tcl = <<'EOTCL';
puts "a\
b"
EOTCL
$expected = "a b\n";
language_output_is("tcl",$tcl,$expected,"backslash newline substitution");

language_output_is("tcl",<<'TCL',<<OUT,"octal single char");
  set a \7
  puts $a
TCL
\cG
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal single char, extra");
  set a \79
  puts $a
TCL
\cG9
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double char");
  set a \12
  puts $a
TCL
\cJ
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double char, extra");
  set a \129
  puts $a
TCL
\cJ9
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple char");
  set a \123
  puts $a
TCL
S
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple char, extra");
  set a \1234
  puts $a
TCL
S4
OUT

TODO: {
local $TODO = "hex escapes recently un-implemented. Fix soon.";

language_output_is("tcl",<<'TCL',<<OUT,"hex single char");
  set a \x7
  puts $a
TCL
\cG
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex single char, extra");
  set a \x7q
  puts $a
TCL
\cGq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex double char");
  set a \x6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex double char, extra");
  set a \x6aq
  puts $a
TCL
jq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex triple char, skip ok?");
  set a \xb6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex triple char, extra");
  set a \xb6aq
  puts $a
TCL
jq
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex many char");
  set a \xaaaaaaaaaaab6a
  puts $a
TCL
j
OUT

language_output_is("tcl",<<'TCL',<<OUT,"hex many char, extra");
  set a \xaaaaaaaaaaab6aq
  puts $a
TCL
jq
OUT
}
