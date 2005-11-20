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

t/p6rules/cclass.t - PGE capture tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<<'Extensible metasyntax (<...>)'>> section

=head1 SYNOPSIS

	% prove t/p6rules/cclass.t

=cut


# character class
p6rule_is  ('abcdef', '<[c]>', 'character class');
p6rule_is  ('abcdef', '<[dcb]>**{3}', 'repeated character class');
p6rule_is  ('abcdef', '^<[a]>', 'anchored character class');
p6rule_is  ('abcdef', '<-[e]>', 'negated character class');
p6rule_is  ('abcdef', '<[c]>', 'optional character class');
p6rule_is  ('abcdef', '<[dcb]>**{3}?', 'repeated optional character class');
p6rule_is  ('abcdef', '^<[a]>?', 'anchored optional character class');
p6rule_is  ('abcdef', '<-[e]>?', 'negated optional character class');
p6rule_isnt('abcdef', '<-[dcb]>**{3}', 'repeated negated character class');
p6rule_is  ('abcdef', '^<-[e]>', 'anchored negated character class');
p6rule_isnt('abcdef', '^<-[a]>', 'anchored negated character class');

# character class range
p6rule_is  ('abcdef', '<[b..d]>', 'character range');
p6rule_is  ('abxxef', '<[b..d]>', 'character range');
p6rule_is  ('axcxef', '<[b..d]>', 'character range');
p6rule_is  ('axxdef', '<[b..d]>', 'character range');
p6rule_isnt('axxxef', '<[b..d]>', 'character range');
p6rule_is  ('abcdef', '<-[b..d]>', 'negated character range');
p6rule_isnt('bbccdd', '<-[b..d]>', 'negated character range');

# optional character class range
p6rule_is  ('abcdef', '<[b..d]>?', 'optional character range');
p6rule_is  ('abxxef', '<[b..d]>?', 'optional character range');
p6rule_is  ('axcxef', '<[b..d]>?', 'optional character range');
p6rule_is  ('axxdef', '<[b..d]>?', 'optional character range');
p6rule_is  ('axxxef', '<[b..d]>?', 'optional character range');
p6rule_is  ('abcdef', '<-[b..d]>?', 'negated optional character range');
p6rule_is  ('bbccdd', '<-[b..d]>?', 'negated optional character range');

# escaped hyphen
p6rule_is  ('ab-def', '<[\-]>', 'escaped hyphen');
p6rule_isnt('abcdef', '<[\-]>', 'escaped hyphen');
p6rule_is  ('ab-def', '<[\-]>?', 'optional escaped hyphen');
p6rule_is  ('abcdef', '<[\-]>?', 'optional escaped hyphen');
p6rule_is  ('---x--', '<-[\-]>', 'negated escaped hyphen');
p6rule_isnt('------', '<-[\-]>', 'negated escaped hyphen');
p6rule_is  ('---x--', '<-[\-]>?', 'negated optional escaped hyphen');
p6rule_is  ('------', '<-[\-]>?', 'negated optional escaped hyphen');

# escaped hyphen in range
p6rule_is  ('ab-def', '<[\-+]>', 'escaped hyphen in range');
p6rule_is  ('ab+def', '<[\-+]>', 'escaped hyphen in range');
p6rule_isnt('abcdef', '<[\-+]>', 'escaped hyphen in range');
p6rule_is  ('ab-def', '<[+\-]>', 'escaped hyphen in range');
p6rule_is  ('ab+def', '<[+\-]>', 'escaped hyphen in range');
p6rule_isnt('abcdef', '<[+\-]>', 'escaped hyphen in range');
p6rule_is  ('---x--', '<-[\-+]>', 'negated escaped hyphen in range');
p6rule_isnt('------', '<-[\-+]>', 'negated escaped hyphen in range');
p6rule_is  ('---x--', '<-[+\-]>', 'negated escaped hyphen in range');
p6rule_isnt('------', '<-[+\-]>', 'negated escaped hyphen in range');

# optional escaped hyphen in range
p6rule_is  ('ab-def', '<[\-+]>?', 'optional escaped hyphen in range');
p6rule_is  ('ab+def', '<[\-+]>?', 'optional escaped hyphen in range');
p6rule_is  ('abcdef', '<[\-+]>?', 'optional escaped hyphen in range');
p6rule_is  ('ab-def', '<[+\-]>?', 'optional escaped hyphen in range');
p6rule_is  ('ab+def', '<[+\-]>?', 'optional escaped hyphen in range');
p6rule_is  ('abcdef', '<[+\-]>?', 'optional escaped hyphen in range');
p6rule_is  ('---x--', '<-[\-+]>?', 'negated optional escaped hyphen in range');
p6rule_is  ('------', '<-[\-+]>?', 'negated optional escaped hyphen in range');
p6rule_is  ('---x--', '<-[+\-]>?', 'negated optional escaped hyphen in range');
p6rule_is  ('------', '<-[+\-]>?', 'negated optional escaped hyphen in range');

# 'greater than' and 'less than' need no escapes
p6rule_is(  '><', '^><[<]>', 'lt character class');
p6rule_is(  '><', '^<[>]><', 'gt character class');
p6rule_is(  '><', '^<[><]>**{2}', 'gt, lt character class');
p6rule_is(  '><', '^<[<>]>**{2}', 'lt, gt  character class');
p6rule_isnt('><', '^<-[><]>', 'not gt, lt character class');
p6rule_isnt('><', '^<-[<>]>', 'not lt, gt  character class');

# remember to change the number of tests :-)
BEGIN { plan tests => 59; }
