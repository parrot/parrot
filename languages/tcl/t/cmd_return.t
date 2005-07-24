#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

my($tcl,$expected);

$tcl = <<'EOTCL';
 proc joe {} {
   set a 10
   return $a
   set a 20
 }

 puts [joe]
EOTCL
$expected = "10\n";
language_output_is("tcl",$tcl,$expected,"simple return");
