#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

# Should check xit value. needs updating for stacktrace,
# Also needs TODO tests for missing functionality.

language_output_is("tcl",<<'TCL',<<OUT,"simple error");
  error "dead\n"
TCL
dead
OUT
