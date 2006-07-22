#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 13;
use Test::More;

language_output_is("tcl", <<'TCL', <<'OUT', "unset nothing");
 unset a
TCL
can't unset "a": no such variable
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset something");
 set a 2
 unset a
TCL
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset something, use it again");
 set a 2
 unset a
 puts $a
TCL
can't read "a": no such variable
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"set/unset array element");
 set a(2) 2
 unset a(2)
 puts $a(2)
TCL
can't read "a(2)": no such element in array
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"set/unset array");
 set a(2) 2
 unset a
 puts $a(2)
TCL
can't read "a(2)": no such variable
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset missing array element");
 set a(1) 1
 unset a(2)
TCL
can't unset "a(2)": no such element in array
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"unset element in missing array");
 unset a(2)
TCL
can't unset "a(2)": no such variable
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset - no args');
 puts [unset]
TCL

OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset -nocomplain');
 set -nocomplain 2
 unset -nocomplain
 puts ${-nocomplain}
TCL
2
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset -nocomplain -nocomplain');
 set -nocomplain 2
 unset -nocomplain -nocomplain
 puts ${-nocomplain}
TCL
can't read "-nocomplain": no such variable
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset -nocomplain foo');
  unset -nocomplain foo
  puts 1
TCL
1
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset -nocomplain -- foo');
  set -- 2
  unset -nocomplain -- foo
  puts ${--}
TCL
2
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset foo bar');
  set foo 2
  set bar 3
  unset foo bar
  puts [catch {puts $foo}]
  puts [catch {puts $bar}]
TCL
1
1
OUT

