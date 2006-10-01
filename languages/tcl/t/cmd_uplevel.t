#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;
use Test::More;

language_output_is( "tcl", <<'TCL', <<'OUT', 'upvar $command' );
  proc test {} {uplevel {set a 42}}
  test
  puts $a
TCL
42
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "uplevel - bad args" );
  uplevel
TCL
wrong # args: should be "uplevel ?level? command ?arg ...?"
OUT

language_output_is( 'tcl', <<'TCL', <<'OUT', 'uplevel - bad args' );
  uplevel 0
TCL
wrong # args: should be "uplevel ?level? command ?arg ...?"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "uplevel - bad level" );
  uplevel a b
TCL
bad level "a"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "uplevel 0" );
  proc test {} {uplevel 0 {set a 42}; puts $a}
  test
TCL
42
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "uplevel #0" );
  proc a {} {uplevel #0 {set a 42}}
  proc b {} {a}
  a
  puts $a
TCL
42
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "uplevel - from one lexical to another" );
  proc add2to_a {} {uplevel {set a [expr {$a+2}]}}
  proc test {} { set a 1; add2to_a; puts $a }
  test
TCL
3
OUT

language_output_is( 'tcl',
    <<'TCL', <<'OUT', 'uplevel - from one lexical in an uplevel to another' );
proc test {} {
    set ok 0
    level1
    puts $ok
}
proc level1 {} {
    uplevel #0 deep1
}
proc deep1 {} {
    set ok 0
    deep2
    puts $ok
}
proc deep2 {} {
    uplevel 1 {set ok 1}
}
test
TCL
1
0
OUT

language_output_is( 'tcl', <<'TCL', <<'OUT', 'uplevel - reset environent on execption' );
  proc test {} {catch {uplevel #0 {error "foo"}}}
  set a 4
  test
  puts $a
TCL
4
OUT

