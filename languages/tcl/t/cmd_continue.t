#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;
use vars qw($TODO);

TODO: {
local $TODO = 'broken because $a returns a TclConst and not a number';

language_output_is("tcl",<<'TCL',<<OUT,"continue from for");
 for {set a 0} {$a < 10} {incr a} {
   if {$a > 5} { continue }
   puts $a
 }
 puts $a
TCL
0
1
2
3
4
5
10
OUT

language_output_is("tcl",<<'TCL',<<OUT,"continue from while");
 set a 0
 while {$a <= 10} {
   incr a
   if {$a < 5} { continue }
   puts $a
 }
 puts "--"
 puts $a
TCL
5
6
7
8
9
10
11
--
11
OUT

}

