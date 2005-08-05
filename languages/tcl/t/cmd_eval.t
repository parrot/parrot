#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple eval");
 set code "set a 2"
 set b [eval $code]
 puts $b
TCL
2
OUT
