#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

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
is(output($tcl),$expected,"simple for");
