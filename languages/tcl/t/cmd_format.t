#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a [format "%05d" 12]
 puts $a
EOTCL
$expected = "00012\n";
# it's a passthrough to parrot's format op, so...
is(output($tcl),$expected,"simple format check");
