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
p6rule_isnt("abc", '\LABC\E', 'retired metachars (\L...\E)');
p6rule_is  ("UabcE", '\Uabc\E', 'retired metachars (\U...\E)');
p6rule_isnt("ABC", '\Uabc\E', 'retired metachars (\U...\E)');
p6rule_is  ("QabcE", '\Qabc\E', 'retired metachars (\Q...\E)');
p6rule_isnt("abc d", '\Qabc d?\E', 'retired metachars (\Q...\E)');


## \G -- deprecated
## TODO add tests here


## \1 -- backreferences deprecated
## TODO add tests here


## setup for unicode whitespace tests
## see http://www.unicode.org/Public/UNIDATA/PropList.txt for White_Space list
my $ws= {
	horizontal_ascii => [qw/ \x0009 \x0020 \x00a0 /],
	horizontal_unicode => [qw/
		\x1680 \x180e \x2000 \x2001 \x2002 \x2003 \x2004 \x2005
		\x2006 \x2007 \x2008 \x2009 \x200a \x202f \x205f \x3000
	/],
	vertical_ascii => [qw/ \x000a \x000b \x000c \x000d \x0085 /],
	vertical_unicode => [qw/ \x2028 \x2029 /],
};

push @{ $ws->{horizontal} } =>
	@{ $ws->{horizontal_ascii} }, @{ $ws->{horizontal_unicode} };

push @{ $ws->{vertical} } =>
	@{ $ws->{vertical_ascii} }, @{ $ws->{vertical_unicode} };

push @{ $ws->{whitespace_ascii} } =>
	@{ $ws->{horizontal_ascii} }, @{ $ws->{vertical_ascii} };

push @{ $ws->{whitespace_unicode} } =>
	@{ $ws->{horizontal_unicode} }, @{ $ws->{vertical_unicode} };

push @{ $ws->{whitespace} } =>
	@{ $ws->{whitespace_ascii} }, @{ $ws->{whitespace_unicode} };


## \s -- match unicode whitespace
## \h and \H -- horizontal whitespace, including unicode
## \v and \V -- vertical whitespace, including unicode
p6rule_is  (join('', @{$ws->{whitespace_ascii}}), '^ \s+ $', 'ascii whitespace (\s)', todo => 'not yet implemented');
p6rule_is  (join('', @{$ws->{horizontal_ascii}}), '^ \h+ $', 'ascii horizontal whitespace (\h)', todo => 'not yet implemented');
p6rule_is  (join('', @{$ws->{vertical_ascii}}), '^ \v+ $', 'ascii vertical whitespace (\v)', todo => 'not yet implemented');
p6rule_isnt(join('', @{$ws->{vertical_ascii}}), '^ \h+ $', 'ascii horizontal whitespace (\h)');
p6rule_isnt(join('', @{$ws->{horizontal_ascii}}), '^ \v+ $', 'ascii vertical whitespace (\v)');
SKIP: {
	skip 'unicode support unavailable' => 5
		unless $PConfig{has_icu};
p6rule_is  (join('', @{$ws->{whitespace_unicode}}), '^ \s+ $', 'unicode whitespace (\s)', todo => 'not yet implemented');
p6rule_is  (join('', @{$ws->{horizontal_unicode}}), '^ \h+ $', 'unicode horizontal whitespace (\h)', todo => 'not yet implemented');
p6rule_is  (join('', @{$ws->{vertical_unicode}}), '^ \v+ $', 'unicode vertical whitespace (\v)', todo => 'not yet implemented');
p6rule_isnt(join('', @{$ws->{vertical_unicode}}), '^ \h+ $', 'unicode horizontal whitespace (\h)');
p6rule_isnt(join('', @{$ws->{horizontal_unicode}}), '^ \v+ $', 'unicode vertical whitespace (\v)');
}


## \t and \T -- tabs
p6rule_is  ("abc\tdef", 'c \t d', 'horizontal tab (\t)', todo => 'not yet implemented');
p6rule_is  ("abc\011def", 'c \t d', 'horizontal tab (\t)', todo => 'not yet implemented');
p6rule_is  ("abc\x0009def", 'c \t d', 'horizontal tab (\t)', todo => 'not yet implemented');
p6rule_is  ("abc\t\tdef", 'c \t+ d', 'horizontal tab (\t)', todo => 'not yet implemented');
p6rule_isnt('abcdef', 'a \t+ f', 'horizontal tab (\t)');
p6rule_isnt('abc\tdef', 'b \t c', 'horizontal tab (\t)');
p6rule_is  ("a", '\T', 'not horizontal tab (\T)', todo => 'not yet implemented');
p6rule_is  ("abc", 'a \T c', 'not horizontal tab (\T)', todo => 'not yet implemented');
p6rule_isnt("", '\T', 'not horizontal tab (\T)');
p6rule_isnt("abc\tdef", 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt('abc\o11def', 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt('abc\x0009def', 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt("abc\t\tdef", 'c \T+ d', 'not horizontal tab (\T)');
p6rule_is  ('abcdef', 'a \T+ f', 'not horizontal tab (\T)', todo => 'not yet implemented');


## \r and \R -- returns
p6rule_is  ("abc\rdef", 'c \r d', 'return (\r)', todo => 'not yet implemented');
p6rule_is  ("abc\015def", 'c \r d', 'return (\r)', todo => 'not yet implemented');
p6rule_is  ("abc\x000ddef", 'c \r d', 'return (\r)', todo => 'not yet implemented');
p6rule_is  ("abc\r\rdef", 'c \r+ d', 'return (\r)', todo => 'not yet implemented');
p6rule_isnt('abcdef', 'a \r+ f', 'return (\r)');
p6rule_isnt('abc\rdef', 'b \r c', 'return (\r)');
p6rule_is  ("a", '\R', 'not return (\R)', todo => 'not yet implemented');
p6rule_is  ("abc", 'a \R c', 'not return (\R)', todo => 'not yet implemented');
p6rule_isnt("", '\R', 'not return (\R)');
p6rule_isnt("abc\rdef", 'c \R d', 'not return (\R)');
p6rule_isnt('abc\o15def', 'c \R d', 'not return (\R)');
p6rule_isnt('abc\x000ddef', 'c \R d', 'not return (\R)');
p6rule_isnt("abc\r\rdef", 'c \R+ d', 'not return (\R)');
p6rule_is  ('abcdef', 'a \R+ f', 'not return (\R)', todo => 'not yet implemented');


## \f and \F -- formfeed
p6rule_is  ("abc\fdef", 'c \f d', 'formfeed (\f)', todo => 'not yet implemented');
p6rule_is  ("abc\014def", 'c \f d', 'formfeed (\f)', todo => 'not yet implemented');
p6rule_is  ("abc\x000cdef", 'c \f d', 'formfeed (\f)', todo => 'not yet implemented');
p6rule_is  ("abc\f\fdef", 'c \f+ d', 'formfeed (\f)', todo => 'not yet implemented');
p6rule_isnt('abcdef', 'a \f+ f', 'formfeed (\f)');
p6rule_isnt('abc\fdef', 'b \f c', 'formfeed (\f)');
p6rule_is  ("a", '\F', 'not formfeed (\F)', todo => 'not yet implemented');
p6rule_is  ("abc", 'a \F c', 'not formfeed (\F)', todo => 'not yet implemented');
p6rule_isnt("", '\F', 'not formfeed (\F)');
p6rule_isnt("abc\fdef", 'c \F d', 'not formfeed (\F)');
p6rule_isnt('abc\o14def', 'c \F d', 'not formfeed (\F)');
p6rule_isnt('abc\x000cdef', 'c \F d', 'not formfeed (\F)');
p6rule_isnt("abc\f\fdef", 'c \F+ d', 'not formfeed (\F)');
p6rule_is  ('abcdef', 'a \F+ f', 'not formfeed (\F)', todo => 'not yet implemented');


## \e and \E -- escape
p6rule_is  ("abc\edef", 'c \e d', 'escape (\e)', todo => 'not yet implemented');
p6rule_is  ("abc\033def", 'c \e d', 'escape (\e)', todo => 'not yet implemented');
p6rule_is  ("abc\x001bdef", 'c \e d', 'escape (\e)', todo => 'not yet implemented');
p6rule_is  ("abc\e\edef", 'c \e+ d', 'escape (\e)', todo => 'not yet implemented');
p6rule_isnt('abcdef', 'a \e+ f', 'escape (\e)');
p6rule_isnt('abc\edef', 'b \e c', 'escape (\e)');
p6rule_is  ("a", '\E', 'not escape (\E)', todo => 'not yet implemented');
p6rule_is  ("abc", 'a \E c', 'not escape (\E)', todo => 'not yet implemented');
p6rule_isnt("", '\E', 'not escape (\E)');
p6rule_isnt("abc\edef", 'c \E d', 'not escape (\E)');
p6rule_isnt('abc\o33def', 'c \E d', 'not escape (\E)');
p6rule_isnt('abc\x001bdef', 'c \E d', 'not escape (\E)');
p6rule_isnt("abc\e\edef", 'c \E+ d', 'not escape (\E)');
p6rule_is  ('abcdef', 'a \E+ f', 'not escape (\E)', todo => 'not yet implemented');


## \x and \X -- hex characters
p6rule_is  ("abc!def", 'c \x0021 d', 'hex (\x)', todo => 'not yet implemented');
p6rule_is  ("abc\x0021def", 'c \x0021 d', 'hex (\x)', todo => 'not yet implemented');
p6rule_is  ("abc\033def", 'c \x0021 d', 'hex (\x)', todo => 'not yet implemented');
p6rule_is  ("abc!!def", 'c \x0021+ d', 'hex (\x)', todo => 'not yet implemented');
p6rule_isnt('abcdef', 'a \x0021+ f', 'hex (\x)');
p6rule_isnt('abc!def', 'b \x0021 c', 'hex (\x)');
p6rule_is  ("a", '\X0021', 'not hex (\X)', todo => 'not yet implemented');
p6rule_is  ("abc", 'a \X0021 c', 'not hex (\X)', todo => 'not yet implemented');
p6rule_isnt("", '\X0021', 'not hex (\X)');
p6rule_isnt("abc!def", 'c \X0021 d', 'not hex (\X)');
p6rule_isnt('abc\o33def', 'c \X0021 d', 'not hex (\X)');
p6rule_isnt('abc\x0021def', 'c \X0021 d', 'not hex (\X)');
p6rule_isnt("abc!!def", 'c \X0021+ d', 'not hex (\X)');
p6rule_is  ('abcdef', 'a \X0021+ f', 'not hex (\X)', todo => 'not yet implemented');


## remember to change the number of tests :-)
BEGIN { plan tests => 144; }
