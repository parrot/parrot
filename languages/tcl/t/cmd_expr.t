#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 40;

my($tcl,$expected);

$tcl = "puts -nonewline [ expr 2 * 3]";
$expected = "6";
language_output_is("tcl",$tcl,$expected,"mul");

$tcl = "puts -nonewline [ expr 6 / 2]";
$expected = "3";
language_output_is("tcl",$tcl,$expected,"div");

$tcl = "puts -nonewline [ expr 3 % 2]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"remainder");

$tcl = "puts -nonewline [ expr 2 + 3]";
$expected = "5";
language_output_is("tcl",$tcl,$expected,"plus");

$tcl = "puts -nonewline [ expr 2 - 3]";
$expected = "-1";
language_output_is("tcl",$tcl,$expected,"minus");

$tcl = "puts -nonewline [ expr 16 << 2]";
$expected = "64";
language_output_is("tcl",$tcl,$expected,"left shift");

$tcl = "puts -nonewline [ expr 16 >> 2]";
$expected = "4";
language_output_is("tcl",$tcl,$expected,"right shift");

$tcl = "puts -nonewline [ expr 2 < 3]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"lt, true");

$tcl = "puts -nonewline [ expr 3 < 2]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"lt, false");

$tcl = "puts -nonewline [ expr 3 > 2]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"gt, true");

$tcl = "puts -nonewline [ expr 2 > 3]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"gt, false");

$tcl = "puts -nonewline [ expr 2 <= 3]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"lte, lt");

$tcl = "puts -nonewline [ expr 3 <= 2]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"lte, gt");

$tcl = "puts -nonewline [ expr 3 <= 3]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"lte, eq");

$tcl = "puts -nonewline [ expr 3 >= 2]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"gte, gt");

$tcl = "puts -nonewline [ expr 2 >= 3]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"gte, lt");

$tcl = "puts -nonewline [ expr 3 >= 3]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"gte, eq");

$tcl = "puts -nonewline [ expr 1 == 1]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"==, eq");

$tcl = "puts -nonewline [ expr 2 == 1]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"==, ne");

$tcl = "puts -nonewline [ expr 1 != 1]";
$expected = "0";
language_output_is("tcl",$tcl,$expected,"==, ne");

$tcl = "puts -nonewline [ expr 2 != 1]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"==, eq");

$tcl = "puts -nonewline [ expr 5 & 6 ]";
$expected = "4";
language_output_is("tcl",$tcl,$expected,"&");

$tcl = "puts -nonewline [ expr 5 | 6 ]";
$expected = "7";
language_output_is("tcl",$tcl,$expected,"|");

$tcl = "puts -nonewline [ expr 5 ^ 6 ]";
$expected = "3";
language_output_is("tcl",$tcl,$expected,"^");

#
# now, functions - the accuracy and int vs. float nature here is
# still an issue - we're testing to make sure that the functions
# exist, basically. better tests will need to be written (or the tcl
# test suite used.) (XXX)
#

$tcl = "puts -nonewline [ expr abs(1-2)]";
$expected = "1";
language_output_is("tcl",$tcl,$expected,"abs");

$tcl = "puts -nonewline [ expr acos(0)]";
$expected = "1.570796";
language_output_is("tcl",$tcl,$expected,"acos");

$tcl = "puts -nonewline [ expr asin(1)]";
$expected = "1.570796";
language_output_is("tcl",$tcl,$expected,"asin");

$tcl = "puts -nonewline [ expr atan(1)]";
$expected = "0.785398";
language_output_is("tcl",$tcl,$expected,"atan");

$tcl = "puts -nonewline [ expr cos(1)]";
$expected = "0.540302";
language_output_is("tcl",$tcl,$expected,"cos");

$tcl = "puts -nonewline [ expr cosh(1)]";
$expected = "1.543081";
language_output_is("tcl",$tcl,$expected,"cosh");

$tcl = "puts -nonewline [ expr exp(1)]";
$expected = "2.718282";
language_output_is("tcl",$tcl,$expected,"exp");

$tcl = "puts -nonewline [ expr log(32)]";
$expected = "3.465736";
language_output_is("tcl",$tcl,$expected,"log");

$tcl = "puts -nonewline [ expr log10(32)]";
$expected = "1.505150";
language_output_is("tcl",$tcl,$expected,"log10");

$tcl = "puts -nonewline [ expr sin(1)]";
$expected = "0.841471";
language_output_is("tcl",$tcl,$expected,"sin");

$tcl = "puts -nonewline [ expr sinh(1)]";
$expected = "1.175201";
language_output_is("tcl",$tcl,$expected,"sinh");

$tcl = "puts -nonewline [ expr sqrt(64)]";
$expected = "8.0";
language_output_is("tcl",$tcl,$expected,"sqrt");

$tcl = "puts -nonewline [ expr tan(1)]";
$expected = "1.557408";
language_output_is("tcl",$tcl,$expected,"tan");

$tcl = "puts -nonewline [ expr tanh(1)]";
$expected = "0.761594";
language_output_is("tcl",$tcl,$expected,"tanh");

# misc.

$tcl = "puts -nonewline [ expr 2*3+4*2]";
$expected = "14";
language_output_is("tcl",$tcl,$expected,"simple precedence");

$tcl = "puts -nonewline [ expr 2*(3+4)*2]";
$expected = "28";
language_output_is("tcl",$tcl,$expected,"parens");
