#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;

my($tcl,$expected);

$tcl = '  puts Parsing';
$expected = "Parsing\n";
language_output_is("tcl",$tcl,$expected,"leading spacex2 should be ok");


$tcl = <<'EOTCL';
 puts "Parsing"
EOTCL
$expected = "Parsing\n";
language_output_is("tcl",$tcl,$expected,"double quoting words, puts");

$tcl = <<'EOTCL';
 puts {Parsing}
EOTCL
$expected = "Parsing\n";
language_output_is("tcl",$tcl,$expected,"simple block quoting");

$tcl = <<'EOTCL';
 puts Parsing;
EOTCL
$expected = "Parsing\n";
language_output_is("tcl",$tcl,$expected,"bare words should be allowed");

$tcl = <<'EOTCL';
 puts #whee
 exit ;
EOTCL
$expected = "#whee\n";
language_output_is("tcl",$tcl,$expected,"hash isn't a comment if it starts a word");

$tcl = <<'EOTCL';
 puts {test}
 exit
 puts {bar}
EOTCL
$expected = "test\n";
language_output_is("tcl",$tcl,$expected,"no arg command");

$tcl = <<'EOTCL';
 puts {test}
 exit;
 puts {bar}
EOTCL
$expected = "test\n";
language_output_is("tcl",$tcl,$expected,"no arg command with semicolon");

$tcl = <<'EOTCL';
 puts {test}
 exit ;
EOTCL
$expected = "test\n";
language_output_is("tcl",$tcl,$expected,"no arg command with spaced semicolon");
