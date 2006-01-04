#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 10;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple");
 set a 2
 incr a
 puts $a
TCL
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"offset");
 set a 1
 incr a 5
 puts $a
TCL
6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"negative offset");
 set a 2
 incr a -1
 puts $a
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"return value");
 set a 1
 set b [incr a]
 puts $b
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"negative base");
 set a -2
 incr a
 puts $a
TCL
-1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"explicit positive offset");
 set a 2
 incr a +3
 puts $a
TCL
5
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too many args");
 set a 1
 incr a 3 2
 puts $a
TCL
wrong # args: should be "incr varName ?increment?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too few args");
 set a 1
 incr
 puts $a
TCL
wrong # args: should be "incr varName ?increment?"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"expected integer, got alpha");
  set a 1
  incr a a
TCL
expected integer but got "a"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"expected integer, got float");
  set a 1
  incr a 1.5
TCL
expected integer but got "1.5"
OUT

