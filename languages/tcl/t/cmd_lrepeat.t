#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"no elements");
  puts [lrepeat 1 a]
TCL
a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"one element");
  puts [lrepeat 1 a b]
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"two elements");
  puts [lrepeat 2 a]
TCL
a a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"braces");
  puts [lrepeat 2 a b]
TCL
a b a b
OUT

# XXX Need an error case. Don't have a recent enough version of tcl locally.
