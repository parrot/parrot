#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 for {set a 0} {$a < 20} {incr a} {
   if {$a > 10} { break }
 }
 puts $a
EOTCL
$expected = "11\n";
is(output($tcl),$expected,"break from for");

$tcl = <<'EOTCL';
 set a 20
 while {$a} {
   incr a -1
   if {$a < 10} { break }
 }
 puts $a
EOTCL
$expected = "9\n";
is(output($tcl),$expected,"break from while ");

