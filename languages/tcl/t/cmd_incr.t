#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 incr a
 puts $a
EOTCL
$expected = "3\n";
language_output_is("tcl",$tcl,$expected,"simple");

$tcl = <<'EOTCL';
 set a 1
 incr a 5
 puts $a
EOTCL
$expected = "6\n";
language_output_is("tcl",$tcl,$expected,"offset");

$tcl = <<'EOTCL';
 set a 2
 incr a -1
 puts $a
EOTCL
$expected = "1\n";
language_output_is("tcl",$tcl,$expected,"negative offset");

$tcl = <<'EOTCL';
 set a 1
 set b [incr a]
 puts $b
EOTCL
$expected = "2\n";
language_output_is("tcl",$tcl,$expected,"return value");

$tcl = <<'EOTCL';
 set a -2
 incr a
 puts $a
EOTCL
$expected = "-1\n";
language_output_is("tcl",$tcl,$expected,"negative base");
