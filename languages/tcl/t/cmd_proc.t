#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use vars qw($TODO);

my($tcl,$expected);

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

TODO: {
local $TODO = "not done yet, but doable";

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
}

TODO: {
local $TODO = "Not doable until multiple-level lists are usable";
language_output_is("tcl",<<'TCL',<<OUT,"default args");
 proc me {{a 2}} {
  puts $a
 }
 me
TCL
2
OUT
}
