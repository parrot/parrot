#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

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
is(output($tcl),$expected,"simple return");
