#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
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
is(output($tcl),$expected,"all");

unlink("test.tcl");
