#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"missing unreferenced global");
  proc a {} {
    global q
    puts "ok"
 }
 a
TCL
ok
OUT

language_output_is("tcl",<<'TCL',<<OUT,"missing global");
  proc a {} {
    global q
    puts $q
 }
 a
TCL
can't read "q": no such variable
OUT

language_output_is("tcl",<<'TCL',<<OUT,"one global");
  proc a {} {
    global q
    puts $q
 }
 set q 2
 a
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"few globals");
  proc a {} {
    global q r s
    puts "$q $r $s"
 }
 set q 1
 set r 2
 set s 3
 a
TCL
1 2 3
OUT

TODO: {

local $TODO= "global doesn't deal if we haven't defined the global yet.";

language_output_is("tcl",<<'TCL',<<OUT,"vivify global");
proc j {} {
  global a
  set a 1
}
j
puts $a
TCL
1
OUT
}

TODO: {
 local $TODO="global doesn't allow you to actually change the variable";
language_output_is("tcl",<<'TCL',<<'OUT',"changing value");
 set a 4
 proc inca2 {} {
  global a
  set a [expr $a + 2]
 }
 puts $a
 inca2
 puts $a
TCL
4
6
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"nonvivifying global");
proc j {} {
  global a
}
j
puts $a
TCL
can't read "a": no such variable
OUT
