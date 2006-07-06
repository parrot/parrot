#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

language_output_is("tcl", <<'TCL', <<'OUT', 'upvar $var n');
 set a 2
 puts $a
 proc add3 var {
   upvar $var n
   set n [expr "3+$n"]
 }
 add3 a
 puts $a
TCL
2
5
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar - bad args");
  upvar 1
TCL
wrong # args: should be "upvar ?level? otherVar localVar ?otherVar localVar ...?"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar - bad level");
  upvar a b
TCL
bad level "a"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar 0 a b");
  upvar 0 a b
  set a 1
  puts $b
TCL
1
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar - variable already exists");
  set b 1
  upvar 0 a b
TCL
variable "b" already exists
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar 0 a(b) c");
  upvar 0 a(b) c
  array set a [list b 3]
  puts $c
TCL
3
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "upvar with array");
  array set a [list 1 2 3 4]
  upvar 0 a b
  puts [array get b 1]
TCL
1 2
OUT
