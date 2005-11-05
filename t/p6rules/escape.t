#!perl
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


p6rule_isnt('a=[ *f', 'a\w+f', 'word character');
p6rule_is  ("abcdef", 'a\w+f', 'word character');
p6rule_is  ('a&%- f', 'a\W+f', 'not word character');
p6rule_isnt("abcdef", 'a\W+f', 'not word character');

p6rule_isnt('abcdef', 'a\d+f', 'digit');
p6rule_is  ("ab42cdef", 'ab\d+cdef', 'digit');
p6rule_is  ('abcdef', 'a\D+f', 'not digit');
p6rule_isnt("ab0cdef", 'a\D+f', 'not digit');


# remember to change the number of tests :-)
BEGIN { plan tests => 8; }
