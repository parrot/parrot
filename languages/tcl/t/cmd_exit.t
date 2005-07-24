#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts here
 exit
 puts nothere
EOTCL
$expected = "here\n";
language_output_is("tcl",$tcl,$expected,"noarg");

# XXX should check return value of exit, also
