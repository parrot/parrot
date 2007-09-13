#!perl

# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is( 'punie', <<'CODE', <<'OUT', 'simple math ops' );
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

language_output_is( 'punie', <<'CODE', <<'OUT', 'simple bitwise ops' );
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

language_output_is( 'punie', <<'CODE', <<'OUT', 'combined math ops' );
print 3 + 4 * 5, "\n";
print 3 * 4 + 5, "\n";
print 0 + ((2 + 3) * 7), "\n";
print 1 * 2 * 3 * 4, "\n";
print (5 * 6, "\n");
print 2 + (5 - 4) * 3, "\n";
print 2 + 5 - 4 * 3, "\n";
CODE
23
17
35
24
30
5
-5
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

