#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('cardinal', <<'CODE', <<'OUT', 'begin block test');
puts "This comes after"
BEGIN { 
  puts "Here I am"
  puts "Here I am"
  puts "Here I am"
}
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'end block test');
END { 
  puts "Here I am"
  puts "Here I am"
  puts "Here I am"
}
puts "This comes before"
CODE
OUT
