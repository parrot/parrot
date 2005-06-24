#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"middle");
  set a whee
  puts "foo $a bar"
TCL
foo whee bar
OUT

language_output_is("tcl",<<'TCL',<<OUT,"left");
  set a whee
  puts "$a bar"
TCL
whee bar
OUT

language_output_is("tcl",<<'TCL',<<OUT,"right");
  set a whee
  puts "bar $a"
TCL
bar whee
OUT

language_output_is("tcl",<<'TCL',<<OUT,"all");
  set a whee
  puts $a
TCL
whee
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array");
   set a(b) whee
   puts $a(b)
TCL
whee
OUT

language_output_is("tcl",<<'TCL',<<OUT,"scalar as array");
  set a 2
  puts $a(b)
TCL
can't read \"a(b)\": variable isn't array
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array as scalar");
  set a(b) 2
  puts $a
TCL
can't read \"a\": variable is an array
OUT

TODO: {
local $TODO = "bugs";
  language_output_is("tcl",<<'TCL',<<'OUT','${} substitute an array');
  set x(0) 44
  puts ${x(0)}
TCL
44
OUT
}
