#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple for loop test inclusive range');
for x in (1..10)
  puts x
end
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple for loop test exclusive range');
for x in (1...10)
  puts x
end
CODE
OUT
