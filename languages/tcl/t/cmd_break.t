#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"break from for");
 for {set a 0} {$a < 20} {incr a} {
   if {$a > 10} { break }
 }
 puts $a
TCL
11
OUT

language_output_is("tcl",<<'TCL',<<OUT,"break from while");
 set a 20
 while {$a} {
   incr a -1
   if {$a < 10} { break }
 }
 puts $a
TCL
9
OUT
