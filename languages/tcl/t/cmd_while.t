#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple while");
 set a 3
 while {$a} {
   puts $a
   incr a -1
 }
 puts "done"
TCL
3
2
1
done
OUT
