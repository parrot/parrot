#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is('punie', <<'CODE', <<'OUT', 'simple math ops');
print 1 + 2, "\n";
print 3 - 2, "\n";
print 4 * 4, "\n";
print 4 / 2, "\n";
print 5 % 2, "\n";
CODE
3
1
16
2
1
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'simple bitwise ops');
print 32 << 2, "\n";
print 32 >> 2, "\n";
print 36 & 4, "\n";
print 32 | 4, "\n";
print 36 ^ 4, "\n";
CODE
128
8
4
36
32
OUT
