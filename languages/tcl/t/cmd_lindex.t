#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is("tcl",<<'TCL',<<OUT,"lindex with list");
 set a {a b c}
 puts [lindex $a 1]
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"lindex with string");
 set a "a b c"
 puts [lindex $a 1]
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"lindex with multiple indices")
 set a "a {a b} c"
 puts [lindex $a {1 1}]
TCL
b
OUT
