#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set code "set a 2"
 set b [eval $code]
 puts $b
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"simple eval");
