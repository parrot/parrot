#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts here
 exit
 puts nothere
EOTCL
$expected = "here\n";
is(output($tcl),$expected,"noarg");

unlink("test.tcl");
