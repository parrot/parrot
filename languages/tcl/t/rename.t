#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 rename puts fnord
 fnord $a
EOTCL
$expected = "2\n";
is(output($tcl),$expected,"rename");

$tcl = <<'EOTCL';
 rename puts ""
 puts "Whee"
EOTCL
$expected = "";
is(output($tcl),$expected,"remove");

unlink("test.tcl");
