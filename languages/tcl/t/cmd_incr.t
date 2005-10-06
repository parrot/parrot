#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;
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

language_output_is("tcl",<<'TCL',<<OUT,"error");
 set a 1
 incr a 3 2
 puts $a
TCL
wrong # args: should be "incr varName ?increment?"
OUT
