#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

my($tcl,$expected);

$tcl = <<'EOTCL';
 for {set a 0} {$a < 20} {incr a} {
   if {$a > 10} { break }
 }
 puts $a
EOTCL
$expected = "11\n";
language_output_is("tcl",$tcl,$expected,"break from for");

$tcl = <<'EOTCL';
 set a 20
 while {$a} {
   incr a -1
   if {$a < 10} { break }
 }
 puts $a
EOTCL
$expected = "9\n";
language_output_is("tcl",$tcl,$expected,"break from while");
