#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 40;
use run_tcl;

my($tcl,$expected);

$tcl = "puts -nonewline [ expr 2 * 3]";
$expected = "6";
is(output($tcl),$expected,"mul");

$tcl = "puts -nonewline [ expr 6 / 2]";
$expected = "3";
is(output($tcl),$expected,"div");

$tcl = "puts -nonewline [ expr 3 % 2]";
$expected = "1";
is(output($tcl),$expected,"remainder");

$tcl = "puts -nonewline [ expr 2 + 3]";
$expected = "5";
is(output($tcl),$expected,"plus");

$tcl = "puts -nonewline [ expr 2 - 3]";
$expected = "-1";
is(output($tcl),$expected,"minus");

$tcl = "puts -nonewline [ expr 16 << 2]";
$expected = "64";
is(output($tcl),$expected,"left shift");

$tcl = "puts -nonewline [ expr 16 >> 2]";
$expected = "4";
is(output($tcl),$expected,"right shift");

$tcl = "puts -nonewline [ expr 2 < 3]";
$expected = "1";
is(output($tcl),$expected,"lt, true");

$tcl = "puts -nonewline [ expr 3 < 2]";
$expected = "0";
is(output($tcl),$expected,"lt, false");

$tcl = "puts -nonewline [ expr 3 > 2]";
$expected = "1";
is(output($tcl),$expected,"gt, true");

$tcl = "puts -nonewline [ expr 2 > 3]";
$expected = "0";
is(output($tcl),$expected,"gt, false");

$tcl = "puts -nonewline [ expr 2 <= 3]";
$expected = "1";
is(output($tcl),$expected,"lte, lt");

$tcl = "puts -nonewline [ expr 3 <= 2]";
$expected = "0";
is(output($tcl),$expected,"lte, gt");

$tcl = "puts -nonewline [ expr 3 <= 3]";
$expected = "1";
is(output($tcl),$expected,"lte, eq");

$tcl = "puts -nonewline [ expr 3 >= 2]";
$expected = "1";
is(output($tcl),$expected,"gte, gt");

$tcl = "puts -nonewline [ expr 2 >= 3]";
$expected = "0";
is(output($tcl),$expected,"gte, lt");

$tcl = "puts -nonewline [ expr 3 >= 3]";
$expected = "1";
is(output($tcl),$expected,"gte, eq");

$tcl = "puts -nonewline [ expr 1 == 1]";
$expected = "1";
is(output($tcl),$expected,"==, eq");

$tcl = "puts -nonewline [ expr 2 == 1]";
$expected = "0";
is(output($tcl),$expected,"==, ne");

$tcl = "puts -nonewline [ expr 1 != 1]";
$expected = "0";
is(output($tcl),$expected,"==, ne");

$tcl = "puts -nonewline [ expr 2 != 1]";
$expected = "1";
is(output($tcl),$expected,"==, eq");

$tcl = "puts -nonewline [ expr 5 & 6 ]";
$expected = "4";
is(output($tcl),$expected,"&");

$tcl = "puts -nonewline [ expr 5 | 6 ]";
$expected = "7";
is(output($tcl),$expected,"|");

$tcl = "puts -nonewline [ expr 5 ^ 6 ]";
$expected = "3";
is(output($tcl),$expected,"^");

#
# now, functions - the accuracy and int vs. float nature here is
# still an issue - we're testing to make sure that the functions
# exist, basically. better tests will need to be written (or the tcl
# test suite used.) (XXX)
#

$tcl = "puts -nonewline [ expr abs(1-2)]";
$expected = "1";
is(output($tcl),$expected,"abs");

$tcl = "puts -nonewline [ expr acos(0)]";
$expected = "1.570796";
is(output($tcl),$expected,"acos");

$tcl = "puts -nonewline [ expr asin(1)]";
$expected = "1.570796";
is(output($tcl),$expected,"asin");

$tcl = "puts -nonewline [ expr atan(1)]";
$expected = "0.785398";
is(output($tcl),$expected,"atan");

$tcl = "puts -nonewline [ expr cos(1)]";
$expected = "0.540302";
is(output($tcl),$expected,"cos");

$tcl = "puts -nonewline [ expr cosh(1)]";
$expected = "1.543081";
is(output($tcl),$expected,"cosh");

$tcl = "puts -nonewline [ expr exp(1)]";
$expected = "2.718282";
is(output($tcl),$expected,"exp");

$tcl = "puts -nonewline [ expr log(32)]";
$expected = "3.465736";
is(output($tcl),$expected,"log");

$tcl = "puts -nonewline [ expr log10(32)]";
$expected = "1.505150";
is(output($tcl),$expected,"log10");

$tcl = "puts -nonewline [ expr sin(1)]";
$expected = "0.841471";
is(output($tcl),$expected,"sin");

$tcl = "puts -nonewline [ expr sinh(1)]";
$expected = "1.175201";
is(output($tcl),$expected,"sinh");

$tcl = "puts -nonewline [ expr sqrt(64)]";
$expected = "8.0";
is(output($tcl),$expected,"sqrt");

$tcl = "puts -nonewline [ expr tan(1)]";
$expected = "1.557408";
is(output($tcl),$expected,"tan");

$tcl = "puts -nonewline [ expr tanh(1)]";
$expected = "0.761594";
is(output($tcl),$expected,"tanh");

# misc.

$tcl = "puts -nonewline [ expr 2*3+4*2]";
$expected = "14";
is(output($tcl),$expected,"simple precedence");

$tcl = "puts -nonewline [ expr 2*(3+4)*2]";
$expected = "28";
is(output($tcl),$expected,"parens");
