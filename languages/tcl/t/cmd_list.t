#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 15;
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

language_output_is("tcl",<<'TCL',<<'OUT',"spaces in two elements");
puts [list {1 2} {3 4}]
TCL
{1 2} {3 4}
OUT

TODO: {
local $TODO = "TclList -> string doesn't escape things yet.";

language_output_is("tcl",<<'TCL',<<'OUT',"braces with spaces");
  puts [list "} {" ]
TCL
\}\ \{
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"braces");
  puts [list \{ \} ]
TCL
\{ \}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"newline");
  puts [list "\n" ]
TCL
{
}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"semicolon");
  puts [list ";" ]
TCL
{;}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"tab");
  puts [list "\t" ]
TCL
{	}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"dollar");
  puts [list "$" ]
TCL
{$}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"backslash");
  puts [list "\\" ]
TCL
\\
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"open bracket");
  puts [list \[ ]
TCL
{[}
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"close bracket");
  puts [list \] ]
TCL
\]
OUT

}

