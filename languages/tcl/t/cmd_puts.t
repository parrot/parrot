#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts -nonewline "whee"
EOTCL
$expected = "whee";
language_output_is("tcl",$tcl,$expected,"nonewline");

$tcl = <<'EOTCL';
 puts "whee"
EOTCL
$expected = "whee\n";
language_output_is("tcl",$tcl,$expected,"with newline");

# XXX Missing channelId tests.
