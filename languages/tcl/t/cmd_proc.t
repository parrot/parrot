#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 16;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"return value");
 set a [proc me {} {
  puts 2
 }]
 me
 puts $a
TCL
2

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"return value from user-defined command");
 proc foo {} {
   append x {foo bar}
 }
 puts [foo]
TCL
foo bar
OUT

language_output_is("tcl",<<'TCL',<<OUT,"noarg");
 proc me {} {
  puts 2
 }
 me
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"onearg");
 proc me {a} {
  puts $a
 }
 me 2
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"twoarg");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2  3
TCL
2
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too many args");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2 3 4
TCL
wrong # args: should be "me a b"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too few args");
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2
TCL
wrong # args: should be "me a b"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad varargs");
 proc me {a b args} {
  puts $a
  puts $b
 }
 me 2
TCL
wrong # args: should be "me a b args"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"vararg");
 proc me {a args} {
  puts $a
  puts $args
 }
 me 2 3 4 5 6
TCL
2
3 4 5 6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"vararg empty");
 proc me {a args} {
  puts $a
  puts $args
 }
 me 2
TCL
2

OUT

language_output_is("tcl", <<'TCL', <<'OUT', "redefined inlinable builtin");
  proc incr {varName} {puts $varName}
  proc test {} { incr a }
  test
TCL
a
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "unknown namespace");
  proc a::b {} {puts a::b}
  a::b
TCL
can't create procedure "a::b": unknown namespace
OUT

language_output_is("tcl",<<'TCL',<<OUT,"default args");
 proc me {{a 2}} {
  puts $a
 }
 me
 me 7
TCL
2
7
OUT

language_output_is("tcl",<<'TCL',<<OUT,"bad default args");
 proc me {{a 2 3}} {
  puts $a
 }
TCL
too many fields in argument specifier "a 2 3"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "proc test {{a 2} b}");
  proc test {{a 2} b} {puts $a; puts $b}
  test 3
TCL
wrong # args: should be "test ?a? b"
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "proc default - too many args");
  proc test {{a 2}} {puts $a}
  test 3 4
TCL
wrong # args: should be "test ?a?"
OUT
