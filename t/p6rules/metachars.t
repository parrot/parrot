# $Id$

use strict;
use warnings;
use Parrot::Test;
use Parrot::Test::PGE;


## tests based on http://dev.perl.org/perl6/doc/design/syn/S05.html, ver. 7
##   in the 'Changed metacharacters' and 'New metacharacters' sections


## . -- matches any char, including newline
p6rule_is  ('a', '.', 'dot (.)');
p6rule_is  ("\n", '.', 'dot (.)');
p6rule_isnt('', '.', 'dot (.)');

## \s and \S -- whitespace
p6rule_isnt('abcdef', 'a\s+f', 'whitespace (\s)');
p6rule_is  ("ab  cdef", 'ab\s+cdef', 'whitespace (\s)');
p6rule_is  ('abcdef', 'a\S+f', 'not whitespace (\S)');
p6rule_isnt("ab cdef", 'a\S+f', 'not whitespace (\S)');

## ^ and $ -- always matches start and end of string
p6rule_is  ("abcdef", '^ abc', 'start and end of string (^)');
p6rule_is  ("abc\ndef", '^ abc', 'start and end of string (^)');
p6rule_isnt("def\nabc", '^ abc', 'start and end of string (^)');
p6rule_isnt("def\nabc", 'def \n ^ abc', 'start and end of string (^)');
p6rule_is  ("abcdef", 'def $', 'start and end of string ($)');
p6rule_is  ("abc\ndef", 'def $', 'start and end of string ($)');
p6rule_isnt("def\nabc", 'def $', 'start and end of string ($)');
p6rule_isnt("def\nabc", 'def $ \n abc', 'start and end of string (^)');


## $ -- no longer matches optional preceding \n
p6rule_is  ("abc\n", 'abc \n $', 'end of string ($)');
p6rule_isnt("abc\n", 'abc $', 'end of string ($)');


## (\n and \N -- matches platform independent newline (or everything but)
p6rule_is  ("abc\ndef", 'c \n d', 'logical newline (\n)');
p6rule_is  ("abc\012def", 'c \n d', 'logical newline (\n)');
p6rule_is  ("abc\015def", 'c \n d', 'logical newline (\n)');
p6rule_is  ("abc\n\ndef", 'c \n+ d', 'logical newline (\n)');
p6rule_isnt('abcdef', 'a\n+f', 'logical newline (\n)');
p6rule_is  ("abc\012\015def", 'c \n d', 'logical newline (\n)', todo => 'specification unclear');
p6rule_is  ("abc\015\012def", 'c \n d', 'logical newline (\n)', todo => 'specification unclear');
p6rule_isnt("abc\ndef", 'b \n c', 'logical newline (\n)');
p6rule_is  ("a", '\N', 'not logical newline (\N)');
p6rule_is  ("abc", 'a \N c', 'not logical newline (\N)');
p6rule_isnt("", '\N', 'not logical newline (\N)');
p6rule_isnt("abc\ndef", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\012def", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\015def", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\n\ndef", 'c \N+ d', 'not logical newline (\N)');
p6rule_is  ('abcdef', 'a\N+f', 'not logical newline (\N)');
p6rule_is  ("abc\012\015def", 'c \N d', 'not logical newline (\N)', todo => 'specification unclear');
p6rule_is  ("abc\015\012def", 'c \N d', 'not logical newline (\N)', todo => 'specification unclear');
p6rule_is  ("abc\ndef", 'b \N \n', 'not logical newline (\N)');


## \A, \Z, and \z -- not metacharacters anymore
p6rule_is  ("Aabc", '\Aabc', 'retired metachars (\A)');
p6rule_isnt("abc\ndef", '\Aabc', 'retired metachars (\A)');
p6rule_is  ("abcZ", 'abc\Z', 'retired metachars (\Z)');
p6rule_isnt("abc\ndef", 'abc\Z', 'retired metachars (\Z)');
p6rule_is  ("abcz", 'abc\z', 'retired metachars (\z)');
p6rule_isnt("abc\ndef", 'def\z', 'retired metachars (\z)');


## # -- always introduces comment
p6rule_is  ("abc#def", 'abc # def', 'comments (#)');
p6rule_is  ("abc#def", 'abc # xyz', 'comments (#)');
p6rule_isnt("abc#def", <<"RULE", 'comments (#)');
abc # def
\$
RULE
p6rule_is  ("abc#def", 'abc \# def', 'comments (#)');
p6rule_isnt("abc#def", 'abc \# xyz', 'comments (#)');
p6rule_is  ("abc#def", '^ abc \# def $', 'comments (#)');


## ^^ and $$ -- line beginnings and endings
p6rule_is  ("abc\ndef", '^^ abc \n ^^ def', 'line beginnings and endings (^^)');
p6rule_isnt("abc\ndef\n", '^^ abc \n ^^ def \n ^^', 'line beginnings and endings (^^)');
p6rule_is  ("\n", '^^ \n', 'line beginnings and endings (^^)');
p6rule_isnt("\n", '\n ^^', 'line beginnings and endings (^^)');
p6rule_is  ("abc\ndef", 'abc $$ \n def $$', 'line beginnings and endings ($$)');
p6rule_isnt("abc\ndef\n", 'abc $$ \n def $$ \n $$', 'line beginnings and endings ($$)');
p6rule_is  ("\n", '$$ \n', 'line beginnings and endings ($$)');
p6rule_isnt("\n", '\n $$', 'line beginnings and endings ($$)');


## &
## TODO add tests here


## remember to change the number of tests :-)
BEGIN { plan tests => 56; }
