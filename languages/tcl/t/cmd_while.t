#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"while no args");
 while
TCL
wrong # args: should be "while test command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"while one args");
 while we
TCL
wrong # args: should be "while test command"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"while too many args");
 while we wait outside
TCL
wrong # args: should be "while test command"
OUT
language_output_is("tcl",<<'TCL',<<OUT,"simple while");
 set a 3
 while {$a} {
   puts $a
   incr a -1
 }
 puts "done"
TCL
3
2
1
done
OUT

# XXX - This test would work if you changed the ""'s to {}'s
language_output_is("tcl",<<'TCL',<<OUT,"while with semicolons, command in quotes");
 set a ""
 set i 1
 while {$i < 6} "append a *;  incr i"
 puts $a
TCL
*****
OUT

