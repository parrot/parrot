#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 5;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 incr a
 puts $a
EOTCL
$expected = "3\n";
is(output($tcl),$expected,"simple");

$tcl = <<'EOTCL';
 set a 1
 incr a 5
 puts $a
EOTCL
$expected = "6\n";
is(output($tcl),$expected,"offset");

$tcl = <<'EOTCL';
 set a 2
 incr a -1
 puts $a
EOTCL
$expected = "1\n";
is(output($tcl),$expected,"negative offset");

$tcl = <<'EOTCL';
 set a 1
 set b [incr a]
 puts $b
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"return value");

$tcl = <<'EOTCL';
 set a -2
 incr a
 puts $a
EOTCL
$expected = "-1\n";
is(output($tcl),$expected,"negative base");
