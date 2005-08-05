#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"rename");
 set a 2
 rename puts fnord
 fnord $a
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"remove");
 rename puts ""
 puts "Whee"
TCL
invalid command name "puts"
OUT
