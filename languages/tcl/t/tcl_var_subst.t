#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 4;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a whee
 puts "foo $a bar"
EOTCL
$expected = "foo whee bar\n";
is(output($tcl),$expected,"middle");

$tcl = <<'EOTCL';
 set a whee
 puts "$a bar"
EOTCL
$expected = "whee bar\n";
is(output($tcl),$expected,"left");

$tcl = <<'EOTCL';
 set a whee
 puts "bar $a"
EOTCL
$expected = "bar whee\n";
is(output($tcl),$expected,"right");

$tcl = <<'EOTCL';
 set a whee
 puts $a
EOTCL
$expected = "whee\n";
is(output($tcl),$expected,"all");
