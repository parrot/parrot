#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 11;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"return value");
 set a [proc me {} {
  puts 2
 }]
 me
 puts $a
TCL
2

OUT

language_output_is("tcl",<<'TCL',<<OUT,"noarg");
 proc me {} {
  puts 2
 }
 me
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"onearg");
 proc me {a} {
  puts $a
 }
 me 2
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"twoarg");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2  3
TCL
2
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too many args");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2 3 4
TCL
wrong # args: should be "me a b"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too few args");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2
TCL
wrong # args: should be "me a b"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad varargs");
 proc me {a b args} {
  puts $a
  puts $b
 }
 me 2
TCL
wrong # args: should be "me a b args"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"vararg");
 proc me {a args} {
  puts $a
  puts $args
 }
 me 2 3 4 5 6
TCL
2
3 4 5 6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"vararg empty");
 proc me {a args} {
  puts $a
  puts $args
 }
 me 2
TCL
2

OUT

TODO: {
  local $TODO = "unimplemented, pending new CC.";

language_output_is("tcl",<<'TCL',<<OUT,"default args");
 proc me {{a 2}} {
  puts $a
 }
 me
 me 7
TCL
2
7
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad default args");
 proc me {{a 2 3}} {
  puts $a
 }
TCL
too many fields in argument specifier "a 2 3"
OUT
}
