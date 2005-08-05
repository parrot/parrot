#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;
use vars qw($TODO);

TODO: {
  local $TODO = "pending a language_output_like test.";
    
language_output_is("tcl",<<'TCL',<<OUT,"simple time");
 puts [time { expr 2+2 }]
TCL
20 microseconds per iteration
OUT

}
