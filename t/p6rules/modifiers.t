#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/p6rules/modifiers.t - PGE rule modifier tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Modifiers'> section

=head1 SYNOPSIS

	% prove t/p6rules/modifiers.t

=cut


## setup template for pir tests
my $pre = <<PRE;
.sub 'main' :main
    load_bytecode "PGE.pbc"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    .local string target
    .local string pattern
    .local string modifier
    .local pmc p6rule_compile
    .local pmc rulesub
    .local pmc pir
    .local pmc exp
    .local pmc match
    p6rule_compile = compreg 'PGE::P6Rule'
    null match
    null rulesub
PRE
my $post = <<'POST';
    goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\n"
.end
POST


## :i and :ignorecase -- ignore case
p6rule_is  ('abcdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('aBcdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abCdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abcDef', ':i bcd', 'ignorecase (:i)');
p6rule_isnt('abc-ef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abcdef', ':ignorecase bcd', 'ignorecase (:ignorecase)');
p6rule_is  ('aBCDef', ':ignorecase bcd', 'ignorecase (:ignorecase)');
p6rule_isnt('abc-ef', ':ignorecase bcd', 'ignorecase (:ignorecase)');
p6rule_is  ('abcdef', ':i(0) bcd', 'ignorecase, repetition (:i(0))');
p6rule_isnt('abCdef', ':i(0) bcd', 'ignorecase, repetition (:i(0))');
p6rule_is  ('abcdef', ':i(1) bcd', 'ignorecase, repetition (:i(1))');
p6rule_is  ('abCdef', ':i(1) bcd', 'ignorecase, repetition (:i(1))');
p6rule_isnt('aBxDef', ':i(1) bcd', 'ignorecase, repetition (:i(1))');
p6rule_is  ('abcdef', ':0i bcd', 'ignorecase, repetition (:0i)');
p6rule_isnt('abCdef', ':0i bcd', 'ignorecase, repetition (:0i)');
p6rule_is  ('abcdef', ':1i bcd', 'ignorecase, repetition (:1i)');
p6rule_is  ('abCdef', ':1i bcd', 'ignorecase, repetition (:1i)');
p6rule_is  ('aBCDef', ':1i bcd', 'ignorecase, repetition (:1i)');
p6rule_isnt('aBxDef', ':1i bcd', 'ignorecase, repetition (:1i)');
p6rule_is  ('abcdef', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('abCdef', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('abcDef', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('abCDef', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_isnt('aBCDef', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_isnt('abCDEf', 'ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('abCDef', ':i ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('AbCDeF', ':i ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('AbcdeF', ':i ab [:i cd ] ef', 'ignorecase, lexical (:i)');
p6rule_is  ('AbCdEf', ':i a [:i(0) b [:i(1) c [:0i d [:1i e [:i(0) f ] ] ] ] ]', 'ignorecase, lexical (:i)');
p6rule_is  ('AabbCcddEeff', ':i aa [:i(0) bb [:i(1) cc [:0i dd [:1i ee [:i(0) ff ] ] ] ] ]', 'ignorecase, lexical (:i)');
p6rule_isnt('AbCdEF', ':i a [:i(0) b [:i(1) c [:0i d [:1i e [:i(0) f ] ] ] ] ]', 'ignorecase, lexical (:i)');
p6rule_isnt('AabbCcddEeFf', ':i aa [:i(0) bb [:i(1) cc [:0i dd [:1i ee [:i(0) ff ] ] ] ] ]', 'ignorecase, lexical (:i)');
p6rule_is  ('AbcdeF', ':i ab [:i(0) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('AbcdeF', ':i ab [:0i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('abCDef', ':0i ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_isnt('AbCDeF', ':0i ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_isnt('AbcdeF', ':0i ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('abcdef', ':0i ab [:i(0) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_isnt('AbcdeF', ':0i ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('AbCdeF', ':i(1) ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('AbcdeF', ':i(1) ab [:i(0) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_isnt('AbcDeF', ':i(1) ab [:i(0) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('ABCDEF', ':i(2) ab [:i(999) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('ABCDEF', ':1i ab [:i(1) cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_isnt('abcDeF', ':0i ab [:1i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('ABCDEF', ':2i ab [:999i cd ] ef', 'ignorecase, lexical repetition (:i)');
p6rule_is  ('abCDef', 'ab [:ignorecase cd ] ef', 'ignorecase, lexical (:ignorecase)');
p6rule_isnt('aBCDef', 'ab [:ignorecase cd ] ef', 'ignorecase, lexical (:ignorecase)');
p6rule_is  ('ABCDEF', ':1ignorecase ab [:ignorecase(1) cd ] ef', 'ignorecase, lexical repetition (:ignorecase)');


## :w and :words -- magically ignore whitespace
p6rule_is  ('a bcdef', ':w bcd', 'words (:w)');
p6rule_is  ('a bcd ef', ':w bcd', 'words (:w)');
p6rule_isnt('abcdef', ':w bcd', 'words (:w)');
p6rule_isnt('abcd ef', ':w bcd', 'words (:w)');
p6rule_isnt('ab cdef', ':w bcd', 'words (:w)');
p6rule_is  ('a b c d ef', ':w b c d', 'words (:w)');
p6rule_is  ('a b c def', ':w b c d', 'words (:w)');
p6rule_isnt('ab c d ef', ':w b c d', 'words (:w)');
p6rule_isnt('a bcdef', ':w b c d', 'words (:w)');
p6rule_isnt('abcdef', ':w b c d', 'words (:w)');
p6rule_is  ('a bcdef', ':words bcd', 'words (:words)');
p6rule_is  ('a bcd ef', ':words bcd', 'words (:words)');
p6rule_isnt('abcdef', ':words bcd', 'words (:words)');
p6rule_is  ('a b c d ef', ':words b c d', 'words (:words)');
p6rule_is  ('a b c def', ':words b c d', 'words (:words)');
p6rule_isnt('ab c d ef', ':words b c d', 'words (:words)');
p6rule_is  ('a b c def', ':w(1) b c [:w(0) d e f ]', 'words, lexical repetition (:w)');
p6rule_is  ('a b c def', ':w(1) b c [:w(0) d e f ]', 'words, lexical repetition (:w)');
p6rule_isnt('a b c def', ':w(0) b c [:w(1) d e f ]', 'words, lexical repetition (:w)');
p6rule_isnt('a b c def', ':w(0) b c [:w(0) d e f ]', 'words, lexical repetition (:w)');
p6rule_is  ('ab', ':w ab ', 'words, trailing ws');

## without :w
p6rule_is  ("foo\t \n-\n\t bar", 'foo\s*-?\s*bar', 'basic match');
p6rule_is  ('foo - bar', 'foo\s*-?\s*bar', 'basic match');
p6rule_is  ('foo   bar', 'foo\s+-?\s*bar', 'basic match \s+ \s*');
p6rule_is  ('foo  -bar', 'foo\s+-?\s*bar', 'basic match \s+ \s*');
p6rule_is  ('foo-  bar', 'foo\s*-?\s+bar', 'basic match \s* \s+');
p6rule_is  ('foo-bar', 'foo -? bar', 'basic match \s* \s*');
p6rule_is  ('foobar', 'foo -? bar', 'basic match');
p6rule_isnt('foo - bar', 'foo -? bar', 'basic non-match');

## with :w
p6rule_is  ("foo\n \t- \t\t\nbar", ':w foo -? bar', 'basic ws match');
p6rule_is  ('foo - bar', ':w foo -? bar', 'basic ws match');
p6rule_is  ('foo   bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo  -bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo-  bar', ':w foo -? bar', 'basic ws match \s* \s+');
p6rule_is  ('foo-bar', ':w foo -? bar', 'basic ws match \s* \s*');
p6rule_isnt('foobar', ':w foo -? bar', 'basic ws non-match');

## with :w not separated by a space
p6rule_isnt('foo - bar', ':w()foo -? bar', 'basic ws match');
p6rule_is  ('foo - bar', ':w[]foo -? bar', 'basic ws match',
    todo => 'words modifier [] separation not implemented');
p6rule_is  ('foo - bar', ':w\bfoo -? bar',
    'basic ws match with boundary modifier separation');
p6rule_is  ('foo - bar', ':w::foo -? bar',
    'basic ws match with backtrack no-op modifier separation');

p6rule_like('dog := spot', ':w::(\w+) \:= (\S+)', qr/mob 0: <dog @ 0>/,
    'words and capture together');
p6rule_like('dog := spot', ':w::(\w+) \:= (\S+)', qr/mob 1: <spot @ 7>/,
    'words and capture together');


## :once -- match only once
# N.B.: the :once modifier does not really belong to PGE or
# p6rule matching, but instead is something the caller keeps
# track of.  (pmichaud, 2005-11-05)


## TODO :c, :p, :g, :bytes, :codes, :graphs, :langs


## :perl5 -- use perl5 regexp syntax
p6rule_is  ('a bcd$ef', ':perl5 \A.*? bcd\Q$\E..\z', 'perl5 syntax (:perl5)', todo => 'not yet implemented');
## TODO lexical scoping of :perl5
## TODO add more tests


## :x -- repetition
p6rule_is  ('123456', ':x(6) \d', 'repetition (:x)');
p6rule_is  ('123456', ':x(3) \d', 'repetition (:x)');
p6rule_is  ('123456', ':x(0) \d', 'repetition (:x)');
## TODO more tests here


## :nth -- nth occurance
p6rule_is  ('a1a2a3', ':nth(3) a \d', 'nth occurance (:nth)');
p6rule_isnt('a1a2a3', ':nth(4) a \d', 'nth occurance (:nth)', todo => 'not yet implemented');
p6rule_isnt('a1a2a3', ':nth(0) a \d', 'nth occurance (:nth)', todo => 'not yet implemented');
## TODO more tests here


## TODO :ov, :ex, :rw, :keepall
##   user-defined modifiers


## remember to change the number of tests :-)
BEGIN { plan tests => 98; }
