#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use vars qw($TODO);

my($tcl,$expected);

TODO: {
  local $TODO = "pending a language_output_like test.";
    
$tcl = <<"EOTCL";
 puts [time { expr 2+2 }]
EOTCL
$expected = <<EOF;
20 microseconds per iteration
EOF
language_output_is("tcl",$tcl,$expected,"simple time");
}
