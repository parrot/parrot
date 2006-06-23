#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is('punie', <<'CODE', <<'OUT', 'simple comparisons');

$x = 4;

if ($x eq $x) { print "ok 1\n"; } else { print "not ok 1\n";}
if ($x ne '5') { print "ok 2\n"; } else { print "not ok 2\n";}

if ($x == $x) { print "ok 3\n"; } else { print "not ok 3\n";}
if ($x != 5) { print "ok 4\n"; } else { print "not ok 4\n";}

if ($x < 5) { print "ok 5\n"; } else { print "not ok 5\n";}
if ($x > 3) { print "ok 6\n"; } else { print "not ok 6\n";}
if ($x >= 4) { print "ok 7\n"; } else { print "not ok 7\n";}
if ($x >= 3) { print "ok 8\n"; } else { print "not ok 8\n";}
if ($x <= 4) { print "ok 9\n"; } else { print "not ok 9\n";}
if ($x <= 5) { print "ok 10\n"; } else { print "not ok 10\n";}

$y = 'b';
if ($y eq $y) { print "ok 11\n"; } else { print "not ok 11\n";}
if ($y ne 'a') { print "ok 12\n"; } else { print "not ok 12\n";}
if ($y lt 'c') { print "ok 13\n"; } else { print "not ok 13\n";}
if ($y gt 'a') { print "ok 14\n"; } else { print "not ok 14\n";}
if ($y le 'c') { print "ok 15\n"; } else { print "not ok 15\n";}
if ($y le 'b') { print "ok 16\n"; } else { print "not ok 16\n";}
if ($y ge 'a') { print "ok 17\n"; } else { print "not ok 17\n";}
if ($y ge 'b') { print "ok 18\n"; } else { print "not ok 18\n";}

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
ok 15
ok 16
ok 17
ok 18
OUT

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'base.cond');
#!./perl

# $Header: base.cond,v 1.0 87/12/18 13:11:41 root Exp $

# make sure conditional operators work

print "1..4\n";

$x = '0';

$x eq $x && (print "ok 1\n");
$x ne $x && (print "not ok 1\n");
$x eq $x || (print "not ok 2\n");
$x ne $x || (print "ok 2\n");

$x == $x && (print "ok 3\n");
$x != $x && (print "not ok 3\n");
$x == $x || (print "not ok 4\n");
$x != $x || (print "ok 4\n");

EOC
1..4
ok 1
ok 2
ok 3 
ok 4
OUT

}
