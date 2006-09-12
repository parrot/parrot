#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 16;


language_output_is('cardinal', <<'CODE', <<'OUT', 'array test');
my_ary=[1,2,3]
puts my_ary
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array set
intersection test');
first_ary=[1,2,3]
second_ary=[3,4,5]
puts (first_ary & second_ary)
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array sinple
repetition test');
my_ary=[1,2,3]
puts my_ary*3
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array non-repeating
repetition test');
my_ary=[1,2,3]
puts my_ary*'-'
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array concatenation test');
my_ary=[1,2,3]
puts my_ary+[4,5]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array difference test');
my_ary=[1,2,3]
puts my_ary - [3]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array comparison test');
big_ary=[1,2,3]
small_ary=[0,1]
same_ary=[1,2,3]
puts big_ary <=> same_ary
puts big_ary <=> small_ary
puts small_ary <=> big_ary
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array equality test');
my_ary=[1,2,3]
puts my_ary == [1,2,3]
puts my_ary == ['a']
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array index test');
my_ary=[1,2,3]
puts my_ary[0]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array negative index test');
my_ary=[1,2,3]
puts my_ary[-1]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array element
assignment test');
my_ary=[1,2,3]
my_ary[2] = 'a'
puts my_ary[2]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array element
assignment test');
my_ary=[1,2,3]
my_ary[2] = 'a'
puts my_ary[-1]
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array set union test');
first_ary=[1,2,3]
second_ary=[3,4,5]
puts (first_ary|second_ary)
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array assoc test');
first_ary=[1,2,3]
second_ary=[3,4,5]
both = [first_ary, second_ary]
puts (both.assoc(3))
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array simple at test');
my_ary=[1,2,3]
puts (my_array.at(1)
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'array negative
index at test');
my_ary=[1,2,3]
puts (my_array.at(-1))
CODE
OUT 
