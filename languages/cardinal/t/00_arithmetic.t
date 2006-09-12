#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 11;

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
language_output_is('cardinal', <<'CODE', <<'OUT', 'float addition test (sum is a whole number)');
puts(3.1+6.9)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'float addition test (sum is a decimal fraction)');
puts(3.1+6.7)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'float subtraction test');
puts(4.2-0.2)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'float multiplication test');
puts(4.2*3)
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'float division test');
puts(4.2/2.1)
CODE
OUT
