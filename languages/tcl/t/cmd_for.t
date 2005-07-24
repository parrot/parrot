#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

my($tcl,$expected);

$tcl = <<'EOTCL';
 for {set a 0} {$a < 5} {incr a} {
   puts $a 
 }
EOTCL
$expected = <<EOF;
0
1
2
3
4
EOF
language_output_is("tcl",$tcl,$expected,"simple for");
