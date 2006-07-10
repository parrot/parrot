#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"after - no args");
  after
TCL
wrong # args: should be "after option ?arg arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"after - simple delay");
  after 10 ; puts ok
TCL
ok
OUT
