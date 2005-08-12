#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"no elements");
  puts [llength [list]]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"one element");
  puts [llength [list a]]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"two elements");
  puts [llength [list a b]]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"braces");
  puts [llength [list a b {c {d e}}]]
TCL
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"spaces");
  puts [llength [list a b "c {d e}"]]
TCL
3
OUT
