#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"no arg failure");
 format
TCL
wrong # args: should be "format formatString ?arg arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple format check");
 set a [format "%05d" 12]
 puts $a
TCL
00012
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "format width check");
  puts [format "%-*s - %s" 10 foo bar]
TCL
foo        - bar
OUT
