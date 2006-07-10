#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"gets - no args");
  gets
TCL
wrong # args: should be "gets channelId ?varName?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"gets - bad channel ");
  gets a
TCL
can not find channel named "a"
OUT

# XXX Need to test actually reading something in. 
