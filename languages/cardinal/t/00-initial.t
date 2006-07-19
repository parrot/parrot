#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple put test');
puts("Test1")
CODE
Test1
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple put test');
puts('Test2')
CODE
Test2
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple put test');
puts(100)
CODE
100
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple put test');
puts(100.1)
CODE
100.1
OUT
