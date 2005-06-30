#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use vars qw($TODO);

my($tcl,$expected);

TODO: {
local $TODO = "GC BUG! FIX IT! FIIIIIX IT!";

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
language_output_is("tcl",$tcl,$expected,"continue from for");


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
language_output_is("tcl",$tcl,$expected,"continue from while");
}
