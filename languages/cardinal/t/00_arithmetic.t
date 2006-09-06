#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple addition test');
puts(1+2)
CODE
3
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple subtraction test');
puts(4-2)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple division test');
puts(4/2)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple multiplication test');
puts(4*2)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple modulo test');
puts(3%2)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'compound statement test');
puts((4*3)%7)
CODE
OUT
