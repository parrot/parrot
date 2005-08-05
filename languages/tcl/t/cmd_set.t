#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"set");
 set a 2
 puts $a
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"get");
 set a 1
 puts [set a]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"missing global");
 puts $a
TCL
can't read "a": no such variable
OUT

language_output_is("tcl",<<'TCL',<<OUT,"not an array");
 set b 1
 set b(c) 2
TCL
can't set "b(c)": variable isn't array
OUT
