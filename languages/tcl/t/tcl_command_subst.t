#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 8;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 5
 puts [set a]
EOTCL
$expected = "5\n";
is(output($tcl),$expected,"all");

$tcl = <<'EOTCL';
 set a 5
 puts [set a]b
EOTCL
$expected = "5b\n";
is(output($tcl),$expected,"leading");

$tcl = <<'EOTCL';
 set a "St\[ring Parsing"
 puts $a
EOTCL
$expected = "St[ring Parsing\n";
is(output($tcl),$expected,"escaped brace");

TODO: {
 local $TODO = "unknown";
$tcl = <<'EOTCL';
 set a "St\\[ring Parsing"
 puts $a
EOTCL
$expected = "St\\[ring Parsing\n";
is(output($tcl),$expected,"semi-escaped brace");
}
$tcl = <<'EOTCL';
 set a "St\\\[ring Parsing"
 puts $a
EOTCL
$expected = "St\\[ring Parsing\n";
is(output($tcl),$expected,"escaped brace");

TODO: {
 local $TODO = "unknown";
$tcl = <<'EOTCL';
 set a [set b \[]
 puts -nonewline $a
EOTCL
$expected = "[";
is(output($tcl),$expected,"embedded escaped open brace");
}

$tcl = <<'EOTCL';
 set a [set b \]]
 puts -nonewline $a
EOTCL
$expected = "]";
is(output($tcl),$expected,"embedded escaped close brace");

TODO: {
local $TODO = "borked. needs fixing.";
$tcl = <<'EOTCL';
 set a "2 [set b 3]
 puts -nonewline $a
EOTCL
$expected = "2 3";
is(output($tcl),$expected,"command subst inside string");
}
