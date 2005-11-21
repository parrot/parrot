#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;
use Parrot::Config;


=head1 NAME

t/p6rules/metachars.t - PGE metacharacter syntax tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Changed metacharacters'>, B<'New metacharacters'>, and
B<'Backslash Reform'> sections

=head1 SYNOPSIS

	% prove t/p6rules/metachars.t

=cut


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
p6rule_isnt("abc\012\015def", 'c \n d', 'logical newline (\n)');
p6rule_is  ("abc\015\012def", 'c \n d', 'logical newline (\n)');
p6rule_isnt("abc\ndef", 'b \n c', 'logical newline (\n)');
p6rule_is  ("a", '\N', 'not logical newline (\N)');
p6rule_is  ("abc", 'a \N c', 'not logical newline (\N)');
p6rule_isnt("", '\N', 'not logical newline (\N)');
p6rule_isnt("abc\ndef", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\012def", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\015def", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\n\ndef", 'c \N+ d', 'not logical newline (\N)');
p6rule_is  ('abcdef', 'a\N+f', 'not logical newline (\N)');
p6rule_isnt("abc\012\015def", 'c \N d', 'not logical newline (\N)');
p6rule_isnt("abc\015\012def", 'c \N d', 'not logical newline (\N)');
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


## | and &
p6rule_is  ("c", '<[a..d]> | <[b..e]>', 'alternation (|)');
p6rule_is  ("c", '<[a..d]> | <[d..e]>', 'alternation (|)');
p6rule_is  ("c", '<[a..b]> | <[b..e]>', 'alternation (|)');
p6rule_isnt("c", '<[a..b]> | <[d..e]>', 'alternation (|)');
p6rule_is  ("bcd", '<[a..d]>+ | <[b..e]>+', 'alternation (|)');
p6rule_is  ("bcd", '^ <[a..d]>+ | <[b..e]>+ $', 'alternation (|)');
p6rule_is  ("bcd", '<[a..c]>+ | <[b..e]>+', 'alternation (|)');
p6rule_is  ("bcd", '<[a..d]>+ | <[c..e]>+', 'alternation (|)');
p6rule_like("bcd", 'b|', '/Missing term/', 'alternation (|) - null right arg illegal');
p6rule_like("bcd", '|b', '/Missing term/', 'alternation (|) - null left arg illegal', todo => 'not yet implemented');
p6rule_like("bcd", '|', '/Missing term/', 'alternation (|) - null both args illegal', todo => 'not yet implemented');
p6rule_is  ("|", '\|', 'alternation (|) - literal must be escaped');
p6rule_isnt("|", '|', 'alternation (|) - literal must be escaped', todo => 'not yet implemented');
p6rule_is  ("c", '<[a..d]> & <[b..e]>', 'conjunction (&)');
p6rule_isnt("c", '<[a..d]> & <[d..e]>', 'conjunction (&)');
p6rule_isnt("c", '<[a..b]> & <[b..e]>', 'conjunction (&)');
p6rule_isnt("c", '<[a..b]> & <[d..e]>', 'conjunction (&)');
p6rule_is  ("bcd", '<[a..d]>+ & <[b..e]>+', 'conjunction (&)');
p6rule_is  ("bcd", '^ <[a..d]>+ & <[b..e]>+ $', 'conjunction (&)');
p6rule_is  ("bcd", '<[a..c]>+ & <[b..e]>+', 'conjunction (&)');
p6rule_is  ("bcd", '<[a..d]>+ & <[c..e]>+', 'conjunction (&)');
p6rule_like("bcd", 'b&', '/Missing term/', 'conjunction (&) - null right arg illegal');
p6rule_like("bcd", '&b', '/Missing term/', 'conjunction (&) - null left arg illegal', todo => 'not yet implemented');
p6rule_like("bcd", '&', '/Missing term/', 'conjunction (&) - null both args illegal', todo => 'not yet implemented');
p6rule_is  ("&", '\&', 'conjunction (&) - literal must be escaped');
p6rule_isnt("&", '&', 'conjunction (&) - literal must be escaped', todo => 'not yet implemented');
p6rule_isnt("a&|b", 'a&|b', 'alternation and conjunction (|&) - parse error', todo => 'not yet implemented');
p6rule_isnt("a|&b", 'a|&b', 'alternation and conjunction (&|) - parse error', todo => 'not yet implemented');


## \p and \P -- deprecated
p6rule_is  ("pabc", '\pabc', 'retired metachars (\p)');
p6rule_isnt("a", '\p{InConsonant}', 'retired metachars (\p)');
p6rule_is  ("Pabc", '\Pabc', 'retired metachars (\P)');
p6rule_isnt("a", '\P{InConsonant}', 'retired metachars (\P)');


## \L...\E, \U...\E, \Q...\E -- deprecated
p6rule_is  ("LabcE", '\Labc\E', 'retired metachars (\L...\E)');
p6rule_isnt("abc", '\LABC\E', 'retired metachars (\L...\E)');
p6rule_is  ("UabcE", '\Uabc\E', 'retired metachars (\U...\E)');
p6rule_isnt("ABC", '\Uabc\E', 'retired metachars (\U...\E)');
p6rule_is  ("QabcE", '\Qabc\E', 'retired metachars (\Q...\E)');
p6rule_isnt("abc d", '\Qabc d?\E', 'retired metachars (\Q...\E)');


## \G -- deprecated
p6rule_is  ("Gabc", '\Gabc', 'retired metachars (\G)');


## \1 -- backreferences deprecated
p6rule_is  ("1abc", '\1abc', 'retired metachars (\1)', todo => 'implement me');


## setup for unicode whitespace tests
## see http://www.unicode.org/Public/UNIDATA/PropList.txt for White_Space list
my $ws= {
	horizontal_iso_8859_1 => [qw/ \u0009 \u0020 \u00a0 /],
	horizontal_unicode => [qw/
           \u1680 \u180e \u2000 \u2001 \u2002 \u2003 
           \u2004 \u2005 \u2006 \u2007 \u2008 \u2009 
           \u200a \u202f \u205f \u3000
	/],
	vertical_iso_8859_1 => [qw/ \u000a \u000b \u000c \u000d \u0085 /],
	vertical_unicode => [qw/ \u2028 \u2029 /] 
};

push @{ $ws->{horizontal} } =>
	@{ $ws->{horizontal_iso_8859_1} }, @{ $ws->{horizontal_unicode} };

push @{ $ws->{vertical} } =>
	@{ $ws->{vertical_iso_8859_1} }, @{ $ws->{vertical_unicode} };

push @{ $ws->{whitespace_iso_8859_1} } =>
	@{ $ws->{horizontal_iso_8859_1} }, @{ $ws->{vertical_iso_8859_1} };

push @{ $ws->{whitespace_unicode} } =>
	@{ $ws->{horizontal_unicode} }, @{ $ws->{vertical_unicode} };

push @{ $ws->{whitespace} } =>
	@{ $ws->{whitespace_iso_8859_1} }, @{ $ws->{whitespace_unicode} };


## \s -- match unicode whitespace
## \h and \H -- horizontal whitespace, including unicode
## \v and \V -- vertical whitespace, including unicode
p6rule_is  (join('', @{$ws->{whitespace_iso_8859_1}}), '^ \s+ $', 
    '0-255 whitespace (\s)');
p6rule_is  (join('', @{$ws->{horizontal_iso_8859_1}}), '^ \h+ $', 
    '0-255 horizontal whitespace (\h)');
p6rule_is  (join('', @{$ws->{vertical_iso_8859_1}}), '^ \v+ $', 
    '0-255 vertical whitespace (\v)');
p6rule_isnt(join('', @{$ws->{vertical_iso_8859_1}}), '^ \h+ $', 
    '0-255 horizontal whitespace (\h)');
p6rule_isnt(join('', @{$ws->{horizontal_iso_8859_1}}), '^ \v+ $', 
    '0-255 vertical whitespace (\v)');
SKIP: {
	skip 'unicode support unavailable' => 5
		unless $PConfig{has_icu};
p6rule_is  (join('', @{$ws->{whitespace_unicode}}), '^ \s+ $', 'unicode whitespace (\s)');
p6rule_is  (join('', @{$ws->{horizontal_unicode}}), '^ \h+ $', 'unicode horizontal whitespace (\h)');
p6rule_is  (join('', @{$ws->{vertical_unicode}}), '^ \v+ $', 'unicode vertical whitespace (\v)');
p6rule_isnt(join('', @{$ws->{vertical_unicode}}), '^ \h+ $', 'unicode horizontal whitespace (\h)');
p6rule_isnt(join('', @{$ws->{horizontal_unicode}}), '^ \v+ $', 'unicode vertical whitespace (\v)');
}


## \t and \T -- tabs
p6rule_is  ("abc\tdef", 'c \t d', 'horizontal tab (\t)');
p6rule_is  ("abc\011def", 'c \t d', 'horizontal tab (\t)');
p6rule_is  ("abc\x09def", 'c \t d', 'horizontal tab (\t)');
p6rule_is  ("abc\t\tdef", 'c \t+ d', 'horizontal tab (\t)');
p6rule_isnt("abcdef", 'a \t+ f', 'horizontal tab (\t)');
p6rule_isnt("abc\tdef", 'b \t c', 'horizontal tab (\t)');
p6rule_is  ("a", '\T', 'not horizontal tab (\T)');
p6rule_is  ("abc", 'a \T c', 'not horizontal tab (\T)');
p6rule_isnt("", '\T', 'not horizontal tab (\T)');
p6rule_isnt("abc\tdef", 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt("abc\011def", 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt("abc\x09def", 'c \T d', 'not horizontal tab (\T)');
p6rule_isnt("abc\t\tdef", 'c \T+ d', 'not horizontal tab (\T)');
p6rule_is  ('abcdef', 'a \T+ f', 'not horizontal tab (\T)');


## \r and \R -- returns
p6rule_is  ("abc\rdef", 'c \r d', 'return (\r)');
p6rule_is  ("abc\015def", 'c \r d', 'return (\r)');
p6rule_is  ("abc\x0ddef", 'c \r d', 'return (\r)');
p6rule_is  ("abc\r\rdef", 'c \r+ d', 'return (\r)');
p6rule_isnt("abcdef", 'a \r+ f', 'return (\r)');
p6rule_isnt("abc\rdef", 'b \r c', 'return (\r)');
p6rule_is  ("a", '\R', 'not return (\R)');
p6rule_is  ("abc", 'a \R c', 'not return (\R)');
p6rule_isnt("", '\R', 'not return (\R)');
p6rule_isnt("abc\rdef", 'c \R d', 'not return (\R)');
p6rule_isnt("abc\015def", 'c \R d', 'not return (\R)');
p6rule_isnt("abc\x0ddef", 'c \R d', 'not return (\R)');
p6rule_isnt("abc\r\rdef", 'c \R+ d', 'not return (\R)');
p6rule_is  ("abcdef", 'a \R+ f', 'not return (\R)');


## \f and \F -- formfeed
p6rule_is  ("abc\fdef", 'c \f d', 'formfeed (\f)');
p6rule_is  ("abc\014def", 'c \f d', 'formfeed (\f)');
p6rule_is  ("abc\x0cdef", 'c \f d', 'formfeed (\f)');
p6rule_is  ("abc\f\fdef", 'c \f+ d', 'formfeed (\f)');
p6rule_isnt("abcdef", 'a \f+ f', 'formfeed (\f)');
p6rule_isnt("abc\fdef", 'b \f c', 'formfeed (\f)');
p6rule_is  ("a", '\F', 'not formfeed (\F)');
p6rule_is  ("abc", 'a \F c', 'not formfeed (\F)');
p6rule_isnt("", '\F', 'not formfeed (\F)');
p6rule_isnt("abc\fdef", 'c \F d', 'not formfeed (\F)');
p6rule_isnt("abc\014def", 'c \F d', 'not formfeed (\F)');
p6rule_isnt("abc\x0cdef", 'c \F d', 'not formfeed (\F)');
p6rule_isnt("abc\f\fdef", 'c \F+ d', 'not formfeed (\F)');
p6rule_is  ("abcdef", 'a \F+ f', 'not formfeed (\F)');


## \e and \E -- escape
p6rule_is  ("abc\edef", 'c \e d', 'escape (\e)');
p6rule_is  ("abc\033def", 'c \e d', 'escape (\e)');
p6rule_is  ("abc\x1bdef", 'c \e d', 'escape (\e)');
p6rule_is  ("abc\e\edef", 'c \e+ d', 'escape (\e)');
p6rule_isnt("abcdef", 'a \e+ f', 'escape (\e)');
p6rule_isnt("abc\edef", 'b \e c', 'escape (\e)');
p6rule_is  ("a", '\E', 'not escape (\E)');
p6rule_is  ("abc", 'a \E c', 'not escape (\E)');
p6rule_isnt("", '\E', 'not escape (\E)');
p6rule_isnt("abc\edef", 'c \E d', 'not escape (\E)');
p6rule_isnt("abc\033def", 'c \E d', 'not escape (\E)');
p6rule_isnt("abc\x1bdef", 'c \E d', 'not escape (\E)');
p6rule_isnt("abc\e\edef", 'c \E+ d', 'not escape (\E)');
p6rule_is  ("abcdef", 'a \E+ f', 'not escape (\E)');


## \x and \X -- hex characters
p6rule_is  ("abc!def", 'c \x0021 d', 'hex (\x)');
p6rule_is  ("abc\x21def", 'c \x0021 d', 'hex (\x)');
p6rule_is  ("abc\041def", 'c \x0021 d', 'hex (\x)');
p6rule_is  ("abc!!def", 'c \x0021+ d', 'hex (\x)');
p6rule_isnt('abcdef', 'a \x0021+ f', 'hex (\x)');
p6rule_isnt('abc!def', 'b \x0021 c', 'hex (\x)');
p6rule_is  ("a", '\X0021', 'not hex (\X)');
p6rule_is  ("abc", 'a \X0021 c', 'not hex (\X)');
p6rule_isnt("", '\X0021', 'not hex (\X)');
p6rule_isnt("abc!def", 'c \X0021 d', 'not hex (\X)');
p6rule_isnt("abc\041def", 'c \X0021 d', 'not hex (\X)');
p6rule_isnt("abc\x21def", 'c \X0021 d', 'not hex (\X)');
p6rule_isnt("abc!!def", 'c \X0021+ d', 'not hex (\X)');
p6rule_is  ("abcdef", 'a \X0021+ f', 'not hex (\X)');


## \o and \O -- octal characters
## NOTE: these metacharacters are not specified in S05, ver. 7,
## but have been implemented in PGE
p6rule_is  ("abc!def", 'c \o041 d', 'octal (\o)');
p6rule_is  ("abc\041def", 'c \o41 d', 'octal (\o)');
p6rule_is  ("abc!!def", 'c \o41+ d', 'octal (\o)');
p6rule_isnt('abcdef', 'a \o41+ f', 'octal (\o)');
p6rule_isnt('abc!def', 'b \o41 c', 'octal (\o)');
p6rule_is  ("a", '\O41', 'not octal (\O)');
p6rule_is  ("abc", 'a \O41 c', 'not octal (\O)');
p6rule_isnt("", '\O41', 'not octal (\O)');
p6rule_isnt("abc!def", 'c \O41 d', 'not octal (\O)');
p6rule_isnt("abc\041def", 'c \O41 d', 'not octal (\O)');
p6rule_isnt("abc!!def", 'c \O41+ d', 'not octal (\O)');
p6rule_is  ("abcdef", 'a \O41+ f', 'not octal (\O)');


## \b and \B -- word boundaries
my $str = q{abc
def
-==
ghi};

p6rule_is  ($str, '\bdef', 'word boundary \W\w');
p6rule_is  ($str, 'abc\b', 'word boundary \w\W');
p6rule_is  ($str, '\babc', 'BOS word boundary');
p6rule_is  ($str, 'ghi\b', 'EOS word boundary');
p6rule_isnt($str, 'a\b',   '\w\w word boundary');
p6rule_isnt($str, '-\b',   '\W\W word boundary');

p6rule_isnt($str, '\Bdef', 'nonword boundary \W\w');
p6rule_isnt($str, 'abc\B', 'nonword boundary \w\W');
p6rule_isnt($str, '\Babc', 'BOS nonword boundary');
p6rule_isnt($str, 'ghi\B', 'EOS nonword boundary');
p6rule_is  ($str, 'a\B',   '\w\w nonword boundary');
p6rule_is  ($str, '-\B',   '\W\W nonword boundary');


## \w an \W -- word characters
p6rule_isnt('a=[ *f', 'a\w+f', 'word character');
p6rule_is  ("abcdef", 'a\w+f', 'word character');
p6rule_is  ('a&%- f', 'a\W+f', 'not word character');
p6rule_isnt("abcdef", 'a\W+f', 'not word character');


## \d and \D -- digits
p6rule_isnt('abcdef', 'a\d+f', 'digit');
p6rule_is  ("ab42cdef", 'ab\d+cdef', 'digit');
p6rule_is  ('abcdef', 'a\D+f', 'not digit');
p6rule_isnt("ab0cdef", 'a\D+f', 'not digit');


## remember to change the number of tests :-)
BEGIN { plan tests => 208; }
