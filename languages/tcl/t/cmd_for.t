#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
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
