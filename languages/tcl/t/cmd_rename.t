#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 2
 rename puts fnord
 fnord $a
EOTCL
$expected = "2\n";
language_output_is("tcl",$tcl,$expected,"rename");

$tcl = <<'EOTCL';
 rename puts ""
 puts "Whee"
EOTCL
$expected = "invalid command name \"puts\"\n";
language_output_is("tcl",$tcl,$expected,"remove");
