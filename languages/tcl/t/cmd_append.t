#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 puts [append a]
EOTCL
$expected = "2\n";
language_output_is('tcl', $tcl, $expected, 'noarg');

$tcl = <<'EOTCL';
 set a 1
 puts [append a 2 3]
EOTCL
$expected = "123\n";
language_output_is('tcl', $tcl, $expected, 'multiarg');

$tcl = <<'EOTCL';
 set a 1
 set b [append a 2]
 puts $b
EOTCL
$expected = "12\n";
language_output_is('tcl', $tcl, $expected, 'multiarg');
