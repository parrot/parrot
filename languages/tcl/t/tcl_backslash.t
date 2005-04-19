#!/usr/bin/perl

#XXX need TODO tests for hex, unicode

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 15;
use vars qw($TODO);

my($tcl,$expected);

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

TODO: {
local $TODO = "neither octal escapes nor expr currently work.";

language_output_is("tcl",<<'TCL',<<OUT,"octal single char");
  set a \a
  set b \7
  puts [expr {$a} eq {$b}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal single char, extra");
  set a "\a9"
  set b \79
  puts [expr {$a} eq {$b}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double char");
  set a \n
  set b \12
  puts [expr {$a} eq {$b}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal double char, extra");
  set a "\n9"
  set b \129
  puts [expr {$a} eq {$b}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple char");
  set a S
  set b \123
  puts [expr {$a} eq {$b}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"octal triple char, extra");
  set a S4
  set b \1234
  puts [expr {$a} eq {$b}]
TCL
1
OUT

}
