#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is('cardinal', <<'CODE', <<'OUT', 'pre code comment');
# Pre comments
puts 'Hello'
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'post code comment');
puts 'Hello'
# Post comments
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'end of line comment');
puts 'Hello' # end of line comments
CODE
OUT
