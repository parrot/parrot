#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;

language_output_is("tcl",<<'TCL',<<OUT,"bad args 1");
  foreach
TCL
wrong # args: should be "foreach varList list ?varList list ...? command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad args 2");
  foreach a b q {puts $a}
TCL
wrong # args: should be "foreach varList list ?varList list ...? command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple foreach string");
  foreach a {a b c} {puts $a}
TCL
a
b
c
OUT

language_output_is("tcl",<<'TCL',<<OUT,"double foreach string");
  foreach a {a b c} b {d e f} {puts "$a $b"}
TCL
a d
b e
c f
OUT

language_output_is("tcl",<<'TCL',<<OUT,"double foreach uneven string");
  foreach a {a b c} b {d e f g h} {puts "$a $b"}
TCL
a d
b e
c f
 g
 h
OUT

language_output_is("tcl",<<'TCL',<<OUT,"double foreach list");
  foreach a [list a b c] b [list d e f] {puts "$a $b"}
TCL
a d
b e
c f
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple foreach list");
  foreach a [list a b c] {puts $a}
TCL
a
b
c
OUT

language_output_is("tcl",<<'TCL',<<OUT,"foreach break");
  foreach a [list a b c] {puts $a; break}
TCL
a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"foreach continue");
  foreach a [list 1 2 3] {if {$a <2} {continue} ; puts $a}
TCL
2
3
OUT
