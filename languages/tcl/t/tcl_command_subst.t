#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 5
 puts [set a]
EOTCL
$expected = "5\n";
language_output_is("tcl",$tcl,$expected,"all");

$tcl = <<'EOTCL';
 set a 5
 puts [set a]b
EOTCL
$expected = "5b\n";
language_output_is("tcl",$tcl,$expected,"leading");

$tcl = <<'EOTCL';
 set a "St\[ring Parsing"
 puts $a
EOTCL
$expected = "St[ring Parsing\n";
language_output_is("tcl",$tcl,$expected,"escaped brace");

$tcl = <<'EOTCL';
 set a "St\\\[ring Parsing"
 puts $a
EOTCL
$expected = "St\\[ring Parsing\n";
language_output_is("tcl",$tcl,$expected,"escaped brace");

$tcl = <<'EOTCL';
 set a [set b \[]
 puts -nonewline $a
EOTCL
$expected = "[";
language_output_is("tcl",$tcl,$expected,"embedded escaped open brace");

$tcl = <<'EOTCL';
 set a [set b \]]
 puts -nonewline $a
EOTCL
$expected = "]";
language_output_is("tcl",$tcl,$expected,"embedded escaped close brace");

$tcl = <<'EOTCL';
 set a "2 [set b 3]"
 puts -nonewline $a
EOTCL
$expected = "2 3";
language_output_is("tcl",$tcl,$expected,"command subst inside string");

$tcl = <<'EOTCL';
 puts [set a [set b 2]]
EOTCL
$expected = "2\n";
language_output_is("tcl",$tcl,$expected,"nested command subst");
