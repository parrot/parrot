#!/usr/bin/perl

#XXX need TODO tests for octal, hex, unicode

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts -nonewline "\n"
EOTCL
$expected = chr(0xa);
language_output_is("tcl",$tcl,$expected,"newline");

$tcl = <<'EOTCL';
 puts -nonewline "\t"
EOTCL
$expected = chr(0x9);
language_output_is("tcl",$tcl,$expected,"tab");

$tcl = <<'EOTCL';
 puts -nonewline "\b"
EOTCL
$expected = chr(0x8);
language_output_is("tcl",$tcl,$expected,"backspace");

$tcl = <<'EOTCL';
 puts -nonewline "\f"
EOTCL
$expected = chr(0xc);
language_output_is("tcl",$tcl,$expected,"formfeed");

$tcl = <<'EOTCL';
 puts -nonewline "\r"
EOTCL
$expected = chr(0xd);
language_output_is("tcl",$tcl,$expected,"carriage return");

$tcl = <<'EOTCL';
 puts -nonewline "\v"
EOTCL
$expected = chr(0xb);
language_output_is("tcl",$tcl,$expected,"vertical tab");

$tcl = <<'EOTCL';
 puts -nonewline "\\"
EOTCL
$expected = "\\";
language_output_is("tcl",$tcl,$expected,"backslash");

$tcl = <<'EOTCL';
puts -nonewline "\1"
EOTCL
$expected = "1";
language_output_is("tcl",$tcl,$expected,"normal character");

$tcl = <<'EOTCL';
puts "a\
b"
EOTCL
$expected = "a b\n";
language_output_is("tcl",$tcl,$expected,"backslash newline substitution");
