#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 for {set a 0} {$a < 10} {incr a} {
   if {$a > 5} { continue }
   puts $a
 }
 puts $a
EOTCL
$expected = <<EOF;
0
1
2
3
4
5
10
EOF
is(output($tcl),$expected,"continue from for");

$tcl = <<'EOTCL';
 set a 0
 while {$a <= 10} {
   incr a
   if {$a < 5} { continue }
   puts $a
 }
 puts "--"
 puts $a
EOTCL
$expected = <<EOF;
5
6
7
8
9
10
11
--
11
EOF
is(output($tcl),$expected,"continue from while ");

