#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple return with value");
 proc joe {} {
   set a 10
   return $a
   set a 20
 }
 puts [joe]
TCL
10
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple return with no value");
 proc joe {} {
   return
 }
 puts [joe]
TCL

OUT
