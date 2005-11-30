#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"error no args");
  error
TCL
wrong # args: should be "error message ?errorInfo? ?errorCode?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error too many args");
  error a b c d
TCL
wrong # args: should be "error message ?errorInfo? ?errorCode?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple error");
  error "dead"
TCL
dead
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error with info");
  catch { error "dead" eek }
  puts $errorInfo
  puts $errorCode
TCL
eek
NONE
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error with code");
  catch { error "dead" eek mouse}
  puts $errorInfo
  puts $errorCode
TCL
eek
mouse
OUT
