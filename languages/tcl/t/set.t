#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 puts $a
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"set");

$tcl = <<'EOTCL';
 set a 1
 puts [set a]
EOTCL
$expected = "1\n";
is(output($tcl),$expected,"get");

unlink("test.tcl");
