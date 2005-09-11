#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'base_cond.t');
#!./perl

# $Header: base.term,v 1.0 87/12/18 13:11:59 root Exp $

print "1..6\n";

# check "" interpretation

$x = "\n";
if ($x lt ' ') {print "ok 1\n";} else {print "not ok 1\n";}

# check `` processing

$x = `echo hi there`;
if ($x eq "hi there\n") {print "ok 2\n";} else {print "not ok 2\n";}

# check $#array

$x[0] = 'foo';
$x[1] = 'foo';
$tmp = $#x;
print "#3\t:$tmp: == :1:\n";
if ($#x == '1') {print "ok 3\n";} else {print "not ok 3\n";}

# check numeric literal

$x = 1;
if ($x == '1') {print "ok 4\n";} else {print "not ok 4\n";}

# check <> pseudoliteral

open(try, "/dev/null") || (die "Can't open /dev/null.");
if (<try> eq '') {print "ok 5\n";} else {print "not ok 5\n";}

open(try, "/etc/passwd") || (die "Can't open /etc/passwd.");
if (<try> ne '') {print "ok 6\n";} else {print "not ok 6\n";}

EOC
1..6
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUT

}
