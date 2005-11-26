#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"eof no args");
  eof
TCL
wrong # args: should be "eof channelId"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"eof too many args");
  eof a b
TCL
wrong # args: should be "eof channelId"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"eof bad channelid");
  eof smarmy
TCL
can not find channel named "smarmy"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"eof an open channel");
  puts [eof stdin]
TCL
0
OUT

# TODO: create test files and read from them, testing the eof condition.
