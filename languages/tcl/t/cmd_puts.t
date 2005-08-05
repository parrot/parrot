#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;

# TODO:  Missing channelId tests.

language_output_is("tcl",<<'TCL',<<OUT,"no args");
 puts
TCL
wrong # args: should be "puts ?-nonewline? ?channelId? string"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too many args");
 puts a b c d
TCL
wrong # args: should be "puts ?-nonewline? ?channelId? string"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"-nonewline");
  puts -nonewline whee\n
TCL
whee
OUT

language_output_is("tcl",<<'TCL',<<OUT,"normal");
 puts whee
TCL
whee
OUT
