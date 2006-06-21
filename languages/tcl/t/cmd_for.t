#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"for no args");
 for
TCL
wrong # args: should be "for start test next command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"for 1 arg");
 for pete's
TCL
wrong # args: should be "for start test next command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"for 2 arg");
 for pete's sake
TCL
wrong # args: should be "for start test next command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"for 3 arg");
 for pete's sake don't
TCL
wrong # args: should be "for start test next command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"for too many args");
 for pete's sake don't do that.
TCL
wrong # args: should be "for start test next command"
OUT



language_output_is("tcl",<<'TCL',<<OUT,"simple for");
 for {set a 0} {$a < 5} {incr a} {
   puts $a 
 }
TCL
0
1
2
3
4
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"variable for last arg");
set a {puts $i}
for {set i 0} {$i < 5} {set i [expr $i+1]} $a
TCL
0
1
2
3
4
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"test not met initially")
for {set x 11} {$x < 10} {incr x} {puts x}
TCL
OUT

