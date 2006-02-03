#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('punie', <<'CODE', <<'OUT', 'a simple label');
label1: print "ok 1\n";
CODE
ok 1
OUT
