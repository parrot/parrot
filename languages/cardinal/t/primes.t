#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple addition test');
for num in 1..10_000 do
 is_prime = 1
 for x in 2..(num - 1) do
   if (num % x == 0)
     is_prime = x
     break
   end
 end
 if is_prime == 1
   puts "#{num} is a prime number"
 else
   puts "#{num} equals #{is_prime} * #{num/is_prime}"
 end
end
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple addition test');
i = 10000000
while i > 0
  a = i + i + i
  i = i - 1
end
CODE
OUT

