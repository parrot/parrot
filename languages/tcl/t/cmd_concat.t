#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;

language_output_is("tcl",<<TCL,<<OUT,"concat nothing");
  puts [concat]
TCL

OUT

language_output_is("tcl",<<TCL,<<OUT,"concat one");
  puts [concat a]
TCL
a
OUT

language_output_is("tcl",<<TCL,<<OUT,"concat two");
  puts [concat a b]
TCL
a b
OUT

language_output_is("tcl",<<TCL,<<OUT,"concat sub list of one");
  puts [concat a {b}]
TCL
a b
OUT

language_output_is("tcl",<<TCL,<<OUT,"concat sub list of two");
  puts [concat a {b c}]
TCL
a b c
OUT

language_output_is("tcl",<<TCL,<<OUT,"concat sub sub list");
  puts [concat a {b c {d e}}]
TCL
a b c {d e}
OUT
