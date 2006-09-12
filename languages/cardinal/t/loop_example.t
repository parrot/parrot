#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

#language_output_is('cardinal', <<'CODE', <<'OUT', 'simple addition test');
#i = 10000000
#while i > 0
#  puts i
#  a = i + i + i
#  i = i - 1
#end
#CODE
#OUT
