#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 3;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 puts [append a]
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"noarg");

$tcl = <<'EOTCL';
 set a 1
 puts [append a 2 3]
EOTCL
$expected = "123\n";
is(output($tcl),$expected,"multiarg");

$tcl = <<'EOTCL';
 set a 1
 set b [append a 2]
 puts $b
EOTCL
$expected = "12\n";
is(output($tcl),$expected,"uniarg");

unlink("test.tcl");
