#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is("tcl",<<'TCL',<<OUT,"append nothing");
  set a [list a b]
  lappend a 
  puts $a
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"append one");
  set a [list a b]
  lappend a c
  puts $a
TCL
a b c
OUT

language_output_is("tcl",<<'TCL',<<OUT,"append multiple");
  set a [list a b]
  lappend a c d e f g
  puts $a
TCL
a b c d e f g
OUT
