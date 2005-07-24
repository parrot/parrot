#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a [format "%05d" 12]
 puts $a
EOTCL
$expected = "00012\n";
# it's a passthrough to parrot's format op, so...
language_output_is("tcl",$tcl,$expected,"simple format check");
