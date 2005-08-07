#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;

language_output_is("tcl",<<'TCL',<<'OUT',"two arg replace");
  set a "{"
  puts [lset a b]
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"three arg replace");
  set a "{"
  puts [lset a {} b]
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"one index");
  set a "a b c"
  puts [lset a 1 c]
TCL
a c c
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"multiple indices");
  set a "a {b c} d"
  puts [lset a 1 0 c]
TCL
a {c c} d
OUT
