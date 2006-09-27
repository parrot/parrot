#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is('punie', <<'CODE', <<'OUT', 'simple conditionals');
if (1) {
  print "ok 1\n";
}
if (0) {
  print "not ok\n";
}
unless (0) {
  print "ok 2\n";
}
unless (1) {
  print "not ok\n";
}
CODE
ok 1
ok 2
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'else/elsif conditionals');
if (1) {
  print "ok 1\n";
} elsif (0) {
  print "not ok\n";
} else {
  print "not ok\n";
}
if (0) {
  print "not ok\n";
} elsif (1) {
  print "ok 2\n";
}
if (0) {
  print "not ok\n";
} elsif (0) {
  print "not ok\n";
} else {
  print "ok 3\n";
}
CODE
ok 1
ok 2
ok 3
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'conditional expression');
if (1 + 1) {
  print "ok 1\n";
}
CODE
ok 1
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'conditional with variable');
$x = 'test';
if ($x) { print "ok 1\n"; } else { print "not ok 1\n";}
CODE
ok 1
OUT

language_output_is('punie', <<'EOC', <<'OUT', 'base.if');
#!./perl

# $Header: base.if,v 1.0 87/12/18 13:11:45 root Exp $

print "1..2\n";

# first test to see if we can run the tests.

$x = 'test';
if ($x eq $x) { print "ok 1\n"; } else { print "not ok 1\n";}
if ($x ne $x) { print "not ok 2\n"; } else { print "ok 2\n";}

EOC
1..2
ok 1
ok 2
OUT

