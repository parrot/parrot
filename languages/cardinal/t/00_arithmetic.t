#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
puts("OK") if true
CODE
OK
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
puts('OK') unless false
CODE
Test2
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
puts("NOK") if false
CODE
OUT
language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
puts("NOK") unless true
CODE
OUT
