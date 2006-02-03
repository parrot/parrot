#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('punie', <<'CODE', <<'OUT', 'printing simple strings');
print "ok 1\n";
print "ok 2\n";
CODE
ok 1
ok 2
OUT
