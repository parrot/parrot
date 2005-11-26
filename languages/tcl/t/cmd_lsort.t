#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 20;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"empty list");
  puts [lsort {}]
TCL

OUT

language_output_is("tcl",<<'TCL',<<OUT,"no args");
  lsort
TCL
wrong # args: should be "lsort ?options? list"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad option");
  lsort blah {}
TCL
bad option "blah": must be -ascii, -command, -decreasing, -dictionary, -increasing, -index, -integer, -real, or -unique
OUT

language_output_is("tcl",<<'TCL',<<OUT,"one elem");
  puts [lsort {SortMe}]
TCL
SortMe
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implicit ASCII");
  set a {a10 B2 b1 a1 a2}
  puts [lsort $a]
TCL
B2 a1 a10 a2 b1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"ASCII all same");
  puts [lsort {z z z}]
TCL
z z z
OUT

language_output_is("tcl",<<'TCL',<<OUT,"few same");
  puts [lsort {a z z t a monkey}]
TCL
a a monkey t z z
OUT

language_output_is("tcl",<<'TCL',<<OUT,"list of lists");
  puts [lsort {{a b c} {} {a c d} {z z t}}]
TCL
{} {a b c} {a c d} {z z t}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"list of lists mixed");
  puts [lsort {{3 2} {3 4} {} no way}]
TCL
{} {3 2} {3 4} no way
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"list of lists mixed var subst");
  set a {{3 2} {3 4} {} no way}
  puts [lsort $a]
TCL
{} {3 2} {3 4} no way
OUT

language_output_is("tcl",<<'TCL',<<OUT,"explicit increasing");
  set a {a10 B2 b1 a1 a2}
  puts [lsort -increasing $a]
TCL
B2 a1 a10 a2 b1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unique");
  set a {a10 B2 a2 B2 b1 a1 a2 z z t}
  puts [lsort -unique $a]
TCL
B2 a1 a10 a2 b1 t z
OUT

language_output_is("tcl",<<'TCL',<<OUT,"unique empty");
  set a {}
  puts [lsort -unique $a]
TCL

OUT

language_output_is("tcl",<<'TCL',<<OUT,"unique one elem");
  set a {A}
  puts [lsort -unique $a]
TCL
A
OUT

language_output_is("tcl",<<'TCL',<<OUT,"integer");
  set a {10 2 30 5 0 -5 2}
  puts [lsort -integer $a]
TCL
-5 0 2 2 5 10 30
OUT

language_output_is("tcl",<<'TCL',<<OUT,"integer unique");
  set a {10 2 30 5 0 -5 2 -5}
  puts [lsort -unique -integer $a]
TCL
-5 0 2 5 10 30
OUT

language_output_is("tcl",<<'TCL',<<OUT,"integer die");
  set a {10 10.2}
  puts [lsort -integer $a]
TCL
expected integer but got "10.2"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"decreasing");
  puts [lsort -decreasing {1 3 2 5 9 4 8 7 6}]
TCL
9 8 7 6 5 4 3 2 1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"decreasing integer unique");
  set a {10 2 30 5 0 -5 2}
  puts [lsort -decreasing -integer -unique $a]
TCL
30 10 5 2 0 -5
OUT

TODO: {
  local $TODO = "no excuses!";

language_output_is("tcl",<<'TCL',<<OUT,"dictionary");
  set a {a10 B2 b1 a1 a2}
  puts [lsort -dictionary $a]
TCL
a1 a2 a10 b1 B2
OUT
}
