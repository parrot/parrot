#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 18;
use Test::More;

language_output_is( "tcl", <<'TCL', <<OUT, "middle" );
  set a whee
  puts "foo $a bar"
TCL
foo whee bar
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "left" );
  set a whee
  puts "$a bar"
TCL
whee bar
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "right" );
  set a whee
  puts "bar $a"
TCL
bar whee
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "all" );
  set a whee
  puts $a
TCL
whee
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "array" );
   set a(b) whee
   puts $a(b)
TCL
whee
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "scalar as array" );
  set a 2
  puts $a(b)
TCL
can't read \"a(b)\": variable isn't array
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "array as scalar" );
  set a(b) 2
  puts $a
TCL
can't read \"a\": variable is array
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', '${} substitute an array' );
  set x(0) 44
  puts ${x(0)}
TCL
44
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "read global" );
  set x foo
  puts $::x
TCL
foo
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "write global" );
  set ::x foo
  puts $x
TCL
foo
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $array($key)' );
array set array {test ok}
set key test
puts $array($key)
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $foo($bar) - can\'t read' );
  puts $foo($bar)
TCL
can't read "bar": no such variable
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $foo($)' );
  array set foo {$ ok}
  puts $foo($)
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $foo([set key])' );
  array set foo {) ok}
  set key )
  puts $foo([set key])
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $foo([set key) - syntax error' );
  array set array {a 1 b 2 c 3}
  set foo b
  puts $array([set foo)
TCL
missing close-bracket
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $foo([set key]a)' );
  array set array {a 1 b 2 c 3}
  set foo b
  puts $array([set foo]a)
TCL
can't read "array(ba)": no such element in array
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', 'puts $array([set )])' );
  array set array {a 1 b 2 c 3}
  set ) b
  puts $array([set )])
TCL
2
OUT

language_output_is( 'tcl', <<'TCL', <<'OUT', '$x\\::bar' );
  namespace eval foo {  proc bar {} { puts ok }  }
  set x foo
  $x\::bar
TCL
ok
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
