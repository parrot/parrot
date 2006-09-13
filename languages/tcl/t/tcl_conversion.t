#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"{} conversion to list");
  puts [llength {a 
  "a b"   
  		b {b c}		  c {c d}
  }]
TCL
6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"\"\" conversion to list");
  puts [llength "a 
  \"a b\"   
  		b {b c}		  c {c d}
  "]
TCL
6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"\"\" conversion to list");
  set a "a {b c}  d"
  puts [llength $a]
  puts [lindex $a 1]
  puts [lindex $a 2]
TCL
3
b c
d
OUT

language_output_is('tcl', <<'TCL', <<'OUT', '\S after }');
lindex {{a b}3 4} 1
TCL
list element in braces followed by "3" instead of space
OUT

language_output_is('tcl', <<'TCL', <<'OUT', '\S after }');
lindex {{a b}3} 1
TCL
list element in braces followed by "3" instead of space
OUT

language_output_is('tcl', <<'TCL', <<'OUT', '\S after "');
lindex {"a b"3 4} 1
TCL
list element in quotes followed by "3" instead of space
OUT

language_output_is('tcl', <<'TCL', <<'OUT', '\S after "');
lindex {"a b"3} 1
TCL
list element in quotes followed by "3" instead of space
OUT

language_output_is('tcl', <<'TCL', <<'OUT', '[ in list');
  puts [list \{\[]
TCL
\{\[
OUT
