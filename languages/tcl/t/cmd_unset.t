#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

language_output_is("tcl",<<'TCL',"can't unset \"a\": no such variable\n","unset nothing");
 unset a
TCL

language_output_is("tcl",<<'TCL',<<'OUT',"unset something");
 set a 2
 unset a
TCL
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset something, use it again");
 set a 2
 unset a
 puts $a
TCL
can't read "a": no such variable
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"set/unset array element");
 set a(2) 2
 unset a(2)
 puts $a(2)
TCL
can't read "a(2)": no such element in array
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"set/unset array");
 set a(2) 2
 unset a
 puts $a(2)
TCL
can't read "a(2)": no such variable
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset missing array element");
 set a(1) 1
 unset a(2)
TCL
can't unset "a(2)": no such element in array
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset element in missing array");
 unset a(2)
TCL
can't unset "a(2)": no such variable
OUT

