#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set b(c) 2
 puts [array exists b]
EOTCL
$expected = "1\n";
language_output_is("tcl",$tcl,$expected,"array exists yes");

$tcl = <<'EOTCL';
 set a 2
 puts [array exists a]
EOTCL
$expected = "0\n";
language_output_is("tcl",$tcl,$expected,"array exists no");

$tcl = <<'EOTCL';
 puts [array exists a]
EOTCL
$expected = "0\n";
language_output_is("tcl",$tcl,$expected,"array exists missing");

$tcl = <<'EOTCL';
 set a(1) 1
 puts [array size a]
EOTCL
$expected = "1\n";
language_output_is("tcl",$tcl,$expected,"array size 1");

$tcl = <<'EOTCL';
 set a(1) 1; set a(2) 2
 puts [array size a]
EOTCL
$expected = "2\n";
language_output_is("tcl",$tcl,$expected,"array size 2");

$tcl = <<'EOTCL';
 set a 1
 puts [array size a]
EOTCL
$expected = "0\n";
language_output_is("tcl",$tcl,$expected,"array size not array");

$tcl = <<'EOTCL';
 puts [array size a]
EOTCL
$expected = "0\n";
language_output_is("tcl",$tcl,$expected,"array size no var");

