#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 5;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 proc me {} {
  puts 2
 }
 me
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"noarg");

$tcl = <<'EOTCL';
 proc me {a} {
  puts $a
 }
 me 2
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"onearg");

$tcl = <<'EOTCL';
 proc me {a b} {
  puts $a
  puts $b
 }
 me 2  3
EOTCL
$expected = "2\n3\n";
is(output($tcl),$expected,"twoarg");

TODO: {
local $TODO = "not done yet.";

$tcl = <<'EOTCL';
 proc me {a args} {
  puts $a
  puts $args
 }
 me 2 3 4 5 6
EOTCL
$expected = "2\n3 4 5 6\n";
is(output($tcl),$expected,"vararg");

$tcl = <<'EOTCL';
 proc me {{a 2}} {
  puts $a
 }
 me
EOTCL
$expected = "2\n3 4 5 6\n";
is(output($tcl),$expected,"defaultarg");
}
