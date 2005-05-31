#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"no elements");
  puts [list]
TCL

OUT

language_output_is("tcl",<<'TCL',<<OUT,"one element");
  puts [list a]
TCL
a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"two elements");
  puts [list a b]
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"spaces with braces");
  puts [list a b {c {d e}}]
TCL
a b {c {d e}}
OUT

language_output_is("tcl",<<'TCL',<<OUT,"spaces with quotes");
  puts [list a b "c {d e}"]
TCL
a b {c {d e}}
OUT

TODO: {
local $TODO = "TclList -> string doesn't handle braces yet.";
language_output_is("tcl",<<'TCL',<<'OUT',"braces");
  puts [list \{ \} ]
TCL
\{ \}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"braces with spaces");
  puts [list "} {" ]
TCL
\}\ \{
OUT
}
