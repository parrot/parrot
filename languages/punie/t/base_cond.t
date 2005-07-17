#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use vars '$TODO';

$TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'base_cond.t');
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
