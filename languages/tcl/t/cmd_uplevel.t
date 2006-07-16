#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;
use Test::More;

language_output_is("tcl", <<'TCL', <<'OUT', 'upvar $command');
  proc test {} {uplevel {set a 42}}
  test
  puts $a
TCL
42
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "uplevel - bad args");
  uplevel
TCL
wrong # args: should be "uplevel ?level? command ?arg ...?"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "uplevel - bad level");
  uplevel a b
TCL
bad level "a"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "uplevel 0");
  proc test {} {uplevel 0 {set a 42}; puts $a}
  test
TCL
42
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "uplevel #0");
  proc a {} {uplevel #0 {set a 42}}
  proc b {} {a}
  a
  puts $a
TCL
42
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "uplevel - from one lexical to another");
  proc add2to_a {} {uplevel {set a [expr {$a+2}]}}
  proc test {} { set a 1; add2to_a; puts $a }
  test
TCL
3
OUT

