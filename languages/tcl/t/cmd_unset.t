#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is("tcl",<<'TCL',"can't unset \"a\": no such variable\n","unset nothing");
 unset a
TCL

language_output_is("tcl",<<'TCL',<<'OUT',"unset something");
 set a 2
 unset a
TCL
OUT

language_output_is("tcl",<<'TCL',"can't read \"a\": no such variable\n","unset something, use it again");
 set a 2
 unset a
 puts $a
TCL
