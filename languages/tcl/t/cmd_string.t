#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 35;
use vars qw($TODO);

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts -nonewline [string first a abcdef]
EOTCL
$expected = "0";
language_output_is("tcl",$tcl,$expected,"first, initial");

$tcl = <<'EOTCL';
 puts -nonewline [string first a federal]
EOTCL
$expected = "5";
language_output_is("tcl",$tcl,$expected,"first, middle");

$tcl = <<'EOTCL';
 puts -nonewline [string first c green ]
EOTCL
$expected = "-1";
language_output_is("tcl",$tcl,$expected,"first, failure");

$tcl = <<'EOTCL';
 puts -nonewline [string first c green 0]
EOTCL
$expected = "-1";
language_output_is("tcl",$tcl,$expected,"first, index, failure");

$tcl = <<'EOTCL';
 puts -nonewline [string first c abcd end-3]
EOTCL
$expected = "2";
language_output_is("tcl",$tcl,$expected,"first, index, end");

$tcl = <<'EOTCL';
 puts -nonewline [string first c abcd 20]
EOTCL
$expected = "-1";
language_output_is("tcl",$tcl,$expected,"first, index, overshot");

$tcl = <<'EOTCL';
 puts -nonewline [string first c abcd 1]
EOTCL
$expected = "2";
language_output_is("tcl",$tcl,$expected,"first, index");

$tcl = <<'EOTCL';
 puts -nonewline [string first c abcd joe]
EOTCL
$expected = "bad index \"joe\": must be integer or end?-integer?";
language_output_is("tcl",$tcl,$expected,"first, index, invalid index");

$tcl = <<'EOTCL';
 puts -nonewline [string first]
EOTCL
$expected = "wrong # args: should be \"string first subString string ?startIndex?\"";
language_output_is("tcl",$tcl,$expected,"first, too few args");

$tcl = <<'EOTCL';
 puts -nonewline [string first a b c d]
EOTCL
$expected = "wrong # args: should be \"string first subString string ?startIndex?\"";
language_output_is("tcl",$tcl,$expected,"first, too many args");

$tcl = <<'EOTCL';
 puts -nonewline [string index a b c]
EOTCL
$expected = "wrong # args: should be \"string index string charIndex\"";
language_output_is("tcl",$tcl,$expected,"index, too many args");

$tcl = <<'EOTCL';
 puts -nonewline [string index]
EOTCL
$expected = "wrong # args: should be \"string index string charIndex\"";
language_output_is("tcl",$tcl,$expected,"index, too few args");

$tcl = <<'EOTCL';
 puts -nonewline [string index abcde 0]
EOTCL
$expected = "a";
language_output_is("tcl",$tcl,$expected,"index, initial");

$tcl = <<'EOTCL';
 puts -nonewline [string index abcde end]
EOTCL
$expected = "e";
language_output_is("tcl",$tcl,$expected,"index, end");

$tcl = <<'EOTCL';
 puts -nonewline [string index abcde 10]
EOTCL
$expected = "";
language_output_is("tcl",$tcl,$expected,"index, too far");


TODO: {
local $TODO = "don't handle negative indices yet.";
$tcl = <<'EOTCL';
 puts -nonewline [string index abcde -1]
EOTCL
$expected = "";
language_output_is("tcl",$tcl,$expected,"index, too near?");
}


$tcl = <<'EOTCL';
 puts -nonewline [string length a b]
EOTCL
$expected = "wrong # args: should be \"string length string\"";
language_output_is("tcl",$tcl,$expected,"length, too many args");

$tcl = <<'EOTCL';
 puts -nonewline [string length]
EOTCL
$expected = "wrong # args: should be \"string length string\"";
language_output_is("tcl",$tcl,$expected,"length, too few args");

$tcl = <<'EOTCL';
 puts -nonewline [string length 10]
EOTCL
$expected = "2";
language_output_is("tcl",$tcl,$expected,"length, simple");

$tcl = <<'EOTCL';
 puts -nonewline [string length ""]
EOTCL
$expected = "0";
language_output_is("tcl",$tcl,$expected,"length, simple");

$tcl = <<'EOTCL';
 puts -nonewline [string range a b]
EOTCL
$expected = "wrong # args: should be \"string range string first last\"";
language_output_is("tcl",$tcl,$expected,"range, too many args");

$tcl = <<'EOTCL';
 puts -nonewline [string range a b c d]
EOTCL
$expected = "wrong # args: should be \"string range string first last\"";
language_output_is("tcl",$tcl,$expected,"range, too few args");

$tcl = <<'EOTCL';
 puts -nonewline [string range abcde 0 end]
EOTCL
$expected = "abcde";
language_output_is("tcl",$tcl,$expected,"range, total");

$tcl = <<'EOTCL';
 puts -nonewline [string range abcde 1 end-1]
EOTCL
$expected = "bcd";
language_output_is("tcl",$tcl,$expected,"range, partial");

$tcl = <<'EOTCL';
 puts -nonewline [string range abcde end-20 20]
EOTCL
$expected = "abcde";
language_output_is("tcl",$tcl,$expected,"range, overextended");

language_output_is("tcl",<<TCL,<<OUT,"string match * only");
  puts [string match * foo]
TCL
1
OUT

TODO: {
local $TODO = "? doesn't work. PGE issue?\n";
language_output_is("tcl",<<TCL,<<OUT,"string match ?");
  puts [string match a?c abc]
TCL
1
OUT
}

TODO: {
local $TODO = "[] doesn't work. PGE issue.\n";
language_output_is("tcl",<<TCL,<<OUT,"string match charset");
  puts [string match {a[bc]c} abc]
TCL
1
OUT
}

language_output_is("tcl",<<TCL,<<OUT,"string match charset, fail");
  puts [string match {a[ac]c} abc]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match \*");
  puts [string match {\*} *]
TCL
1
OUT

TODO: {
local $TODO = "Issue with \? - PGE issue?";
language_output_is("tcl",<<TCL,<<OUT,"string match \?");
  puts [string match {\?} ?]
TCL
1
OUT
}

TODO: {
local $TODO = "Parser error";
language_output_is("tcl",<<TCL,<<OUT,"string match \[");
  puts [string match {\[} {[}]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match \]");
  puts [string match {\]} {]}]
TCL
1
OUT
}

language_output_is("tcl",<<TCL,<<OUT,"string match case failure");
  puts [string match ABC abc]
TCL
0
OUT

TODO: {
local $TODO = "-nocase isn't implemented, pending PGE support";
language_output_is("tcl",<<TCL,<<OUT,"string match nocase");
  puts [string match -nocase ABC abc ]
TCL
1
OUT
}
