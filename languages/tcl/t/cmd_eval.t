#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set code "set a 2"
 set b [eval $code]
 puts $b
EOTCL
$expected = "2\n";
language_output_is("tcl",$tcl,$expected,"simple eval");
