#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple format check");
 set a [format "%05d" 12]
 puts $a
TCL
00012
OUT
