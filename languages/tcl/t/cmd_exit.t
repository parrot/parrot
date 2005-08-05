#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"noarg");
 puts here
 exit
 puts nothere
TCL
here
OUT

# TODO: should check return value of exit, also
