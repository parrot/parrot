#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 10;
use Test::More;

language_output_is("tcl",<<'TCL', <<'OUT',"all");
 set a 5
 puts [set a]
TCL
5
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"leading");
 set a 5
 puts [set a]b
TCL
5b
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"trailing");
 set a 5
 puts b[set a]
TCL
b5
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"escaped brace");
 set a "St\[ring Parsing"
 puts $a
TCL
St[ring Parsing
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"escaped brace");
 set a "St\\\[ring Parsing"
 puts $a
TCL
St\[ring Parsing
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"embedded escaped open brace");
 set a [set b \[]
 puts $a
TCL
[
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"embedded escaped close brace");
 set a [set b \]]
 puts $a
TCL
]
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"command subst inside string");
 set a "2 [set b 3]"
 puts $a
TCL
2 3
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"nested command subst");
 puts [set a [set b 2]]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"] in \"\"s");
 puts [set a "]"]
TCL
]
OUT

