#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"insert beginning empty list");
  set a [list]
  puts [linsert $a 0 a]
TCL
a
OUT

TODO: {
local $TODO = "borked.";
language_output_is("tcl",<<'TCL',<<OUT,"insert beyond end of empty list");
  set a [list]
  puts [linsert $a 20 a]
TCL
a
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"insert end single list");
  set a [list a]
  puts [linsert $a end b]
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"insert middle double list");
  set a [list a c]
  puts [linsert $a end-1 b]
TCL
a b c
OUT

language_output_is("tcl",<<'TCL',<<OUT,"insert bad index");
  set a [list a c]
  puts [linsert $a q b]
TCL
bad index "q": must be integer or end?-integer?
OUT
