#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"{} conversion to list");
  puts [llength {a 
  "a b"   
  		b {b c}		  c {c d}
  }]
TCL
6
OUT

language_output_is("tcl",<<'TCL',<<OUT,"{} conversion to list");
  puts [llength "a 
  \"a b\"   
  		b {b c}		  c {c d}
  "]
TCL
6
OUT
