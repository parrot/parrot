#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

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

language_output_is("tcl",<<'TCL',<<'OUT',"variable for last arg")
set a {puts $i}
for {set i 0} {$i < 5} {set i [expr $i+1]} $a
TCL
0
1
2
3
4
OUT

