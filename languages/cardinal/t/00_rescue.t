#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple throw rescue test');
throw "Exception" rescue puts "Exception Caught"
CODE
OUT
