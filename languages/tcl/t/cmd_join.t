#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use vars qw($TODO);

language_output_is("tcl",<<TCL,<<OUT,"bad join 1");
  puts [join]
TCL
wrong # args: should be "join list ?joinString?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"bad join 2");
  puts [join [list] a b]
TCL
wrong # args: should be "join list ?joinString?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"join nothing");
  puts [join [list]]
TCL

OUT

language_output_is("tcl",<<TCL,<<OUT,"join one");
  puts [join [list a]]
TCL
a
OUT

language_output_is("tcl",<<TCL,<<OUT,"join few");
  puts [join [list a b c]]
TCL
a b c
OUT

language_output_is("tcl",<<TCL,<<OUT,"join with string");
  puts [join [list a b c] X]
TCL
aXbXc
OUT

language_output_is("tcl",<<TCL,<<OUT,"join with long string");
  puts [join [list a b c] XXXX]
TCL
aXXXXbXXXXc
OUT
