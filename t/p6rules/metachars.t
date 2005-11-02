# $Id$

use strict;
use warnings;
use Parrot::Test;
use Parrot::Test::PGE;
use Parrot::Config;


## tests based on http://dev.perl.org/perl6/doc/design/syn/S05.html, ver. 7
##   in the 'Changed metacharacters' , 'New metacharacters', and
##   'Backslash Reform' sections


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


## \p and \P -- deprecated
p6rule_is  ("pabc", '\pabc', 'retired metachars (\p)');
p6rule_is  ("Pabc", '\Pabc', 'retired metachars (\P)');
## TODO add \p and \P tests here


## \L...\E, \U...\E, \Q...\E -- deprecated
p6rule_is  ("LabcE", '\Labc\E', 'retired metachars (\L...\E)');
p6rule_isnt("abc", '\UABC\E', 'retired metachars (\L...\E)');
p6rule_is  ("UabcE", '\Labc\E', 'retired metachars (\U...\E)');
p6rule_isnt("ABC", '\Uabc\E', 'retired metachars (\U...\E)');
p6rule_is  ("QabcE", '\Qabc\E', 'retired metachars (\Q...\E)');
p6rule_isnt("abc d", '\Qabc d?\E', 'retired metachars (\Q...\E)');


## \G -- deprecated
## TODO add tests here


## \1 -- backreferences deprecated
## TODO add tests here


## \s -- match unicode whitespace
## see http://www.unicode.org/Public/UNIDATA/PropList.txt for White_Space list
p6rule_is  ("\x0009\x000a\x000b\x000c\x000d\x0020\x0085\x00a0", '\s+', 'unicode whitespace (\s)', todo => 'not yet implemented');
SKIP: {
	skip 'unicode support unavailable' => 2
		unless defined $PConfig{HAS_ICU};
p6rule_is  ("\x1680\x180e\x2000\x2001\x2002\x2003\x2004\x2005", '\s+', 'unicode whitespace (\s)', todo => 'not yet implemented');
p6rule_is  ("\\x2006\x2007\x2008\x2009\x200ax2028\x2029\x202f\x205f\x3000", '\s+', 'unicode whitespace (\s)', todo => 'not yet implemented');
}

## \h and \H -- horizontal whitespace, including unicode
## \v and \V -- vertical whitespace, including unicode
## \t and \T -- tabs
## \r and \R -- returns
## \f and \F -- formfeed
## \E -- anything but escape
## \x and \X -- hex characters


## remember to change the number of tests :-)
BEGIN { plan tests => 67; }
