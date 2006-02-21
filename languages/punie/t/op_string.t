#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('punie', <<'CODE', <<'OUT', 'simple string ops');
print 'a' . 'b', "\n";
print 'a' x 5, "\n";
CODE
ab
aaaaa
OUT
