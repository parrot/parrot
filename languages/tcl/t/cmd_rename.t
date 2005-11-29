#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"rename");
 set a 2
 rename puts fnord
 fnord $a
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"remove");
 rename puts ""
 puts "Whee"
TCL
invalid command name "puts"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"non-existant command");
 rename foo blah
TCL
can't rename "foo": command doesn't exist
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"test fallback to interpreted versions of normally inlined commands.");
 set a 1
 incr a
 rename if {}
 incr a
 puts $a
TCL
3
OUT
