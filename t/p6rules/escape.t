use strict;
use warnings;
use Parrot::Test tests => 16;
use Parrot::Test::PGE;


p6rule_isnt('abcdef', 'a\s+f', 'whitespace');
p6rule_is  ("ab  cdef", 'ab\s+cdef', 'whitespace');
p6rule_is  ('abcdef', 'a\S+f', 'not whitespace');
p6rule_isnt("ab cdef", 'a\S+f', 'not whitespace');

p6rule_isnt('a=[ *f', 'a\w+f', 'word character');
p6rule_is  ("abcdef", 'a\w+f', 'word character');
p6rule_is  ('a&%- f', 'a\W+f', 'not word character');
p6rule_isnt("abcdef", 'a\W+f', 'not word character');

p6rule_isnt('abcdef', 'a\d+f', 'digit');
p6rule_is  ("ab42cdef", 'ab\d+cdef', 'digit');
p6rule_is  ('abcdef', 'a\D+f', 'not digit');
p6rule_isnt("ab0cdef", 'a\D+f', 'not digit');

p6rule_isnt('abcdef', 'a\n+f', 'logical newline');
p6rule_is  ("ab\n\ncdef", 'ab\n+cdef', 'logical newline');
p6rule_is  ('abcdef', 'a\N+f', 'not logical newline');
p6rule_isnt("ab\ncdef", 'a\N+f', 'not logical newline');

# dont forget to change the number of tests :-)
