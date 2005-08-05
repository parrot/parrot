#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple return");
 proc joe {} {
   set a 10
   return $a
   set a 20
 }
 puts [joe]
TCL
10
OUT
