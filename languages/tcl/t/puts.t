#! perl -w

use strict;
use lib qw(../../../lib .);
use Test::More tests => 2;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts -nonewline "whee"
EOTCL
$expected = "whee";
is(output($tcl),$expected,"nonewline");

$tcl = <<'EOTCL';
 puts "whee"
EOTCL
$expected = "whee\n";
is(output($tcl),$expected,"with newline");

unlink("test.tcl");
