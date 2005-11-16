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

t/p6rules/builtins.t - PGE tests of builtin rules

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<<'Extensible metasyntax (<...>)'>> and
B<'Nothing is illegal'> sections

=head1 SYNOPSIS

	% prove t/p6rules/builtins.t

=cut


my $str = 
  "\t\n\r !\"#\$%&'()*+,-./:;<=>?@[\\]^`_{|}0123456789ABCDEFGHIJabcdefghij";

p6rule_isnt($str,  'abc <fail> def', '<fail>');

p6rule_like($str,  '<upper>',
    qr/mob<upper>: <A @ 45>/, '<upper>');
p6rule_like($str,  '<?upper>',
    qr/mob: <A @ 45>/, '<?upper>');
p6rule_like($str,  '<?upper>+', 
    qr/mob: <ABCDEFGHIJ @ 45>/, '<?upper>+');

p6rule_like($str,  '<lower>',
    qr/mob<lower>: <a @ 55>/, '<lower>');
p6rule_like($str,  '<?lower>',
    qr/mob: <a @ 55>/, '<?lower>');
p6rule_like($str,  '<?lower>+', 
    qr/mob: <abcdefghij @ 55>/, '<?lower>+');

p6rule_like($str,  '<alpha>',
    qr/mob<alpha>: <A @ 45>/, '<alpha>');
p6rule_like($str,  '<?alpha>',
    qr/mob: <A @ 45>/, '<?alpha>');
p6rule_like($str,  '<?alpha>+', 
    qr/mob: <ABCDEFGHIJabcdefghij @ 45>/, '<?alpha>+');

p6rule_like($str,  '<digit>',
    qr/mob<digit>: <0 @ 35>/, '<digit>');
p6rule_like($str,  '<?digit>',
    qr/mob: <0 @ 35>/, '<?digit>');
p6rule_like($str,  '<?digit>+', 
    qr/mob: <0123456789 @ 35>/, '<?digit>+');

p6rule_like($str,  '<xdigit>',
    qr/mob<xdigit>: <0 @ 35>/, '<xdigit>');
p6rule_like($str,  '<?xdigit>',
    qr/mob: <0 @ 35>/, '<?xdigit>');
p6rule_like($str,  '<?xdigit>+', 
    qr/mob: <0123456789ABCDEF @ 35>/, '<?xdigit>+');

p6rule_like($str,  '<space>',
    qr/mob<space>: <\s* @ 0>/, '<space>');
p6rule_like($str,  '<?space>',
    qr/mob: <\s* @ 0>/, '<?space>');
p6rule_like($str,  '<?space>+', 
    qr/mob: <\s* @ 0>/, '<?space>+');

p6rule_like($str,  '<blank>',
    qr/mob<blank>: <\t @ 0>/, '<blank>');
p6rule_like($str,  '<?blank>',
    qr/mob: <\t @ 0>/, '<?blank>');
p6rule_like($str,  '<?blank>+', 
    qr/mob: <\t @ 0>/, '<?blank>+');

p6rule_like($str,  '<cntrl>',
    qr/mob<cntrl>: <\t @ 0>/, '<cntrl>');
p6rule_like($str,  '<?cntrl>',
    qr/mob: <\t @ 0>/, '<?cntrl>');
p6rule_like($str,  '<?cntrl>+', 
    qr/mob: <\t\n\r @ 0>/, '<?cntrl>+');

p6rule_like($str,  '<punct>',
    qr/mob<punct>: <! @ 4>/, '<punct>');
p6rule_like($str,  '<?punct>',
    qr/mob: <! @ 4>/, '<?punct>');
p6rule_like($str,  '<?punct>+', 
    qr/mob: <.*\} @ 4>/, '<?punct>+');

p6rule_like($str,  '<alnum>',
    qr/mob<alnum>: <0 @ 35>/, '<alnum>');
p6rule_like($str,  '<?alnum>',
    qr/mob: <0 @ 35>/, '<?alnum>');
p6rule_like($str,  '<?alnum>+', 
    qr/mob: <0123456789ABCDEFGHIJabcdefghij @ 35>/, '<?alnum>+');

p6rule_like($str,  '<sp>',
    qr/mob<sp>: <  @ 3>/, '<sp>');
p6rule_like($str,  '<?sp>+', 
    qr/mob: <  @ 3>/, '<?sp>+');

p6rule_like($str,  '<lt>',
    qr/mob<lt>: << @ 21>/, '<lt>');
p6rule_like($str,  '<?lt>+', 
    qr/mob: << @ 21>/, '<?lt>+');

p6rule_like($str,  '<gt>',
    qr/mob<gt>: <> @ 23>/, '<gt>');
p6rule_like($str,  '<?gt>+', 
    qr/mob: <> @ 23>/, '<?gt>+');

p6rule_like($str,  '<dot>',
    qr/mob<dot>: <. @ 17>/, '<dot>');
p6rule_like($str,  '<?dot>+', 
    qr/mob: <. @ 17>/, '<?dot>+');

p6rule_like("2+3 ab2", '<ident>',  
    qr/mob<ident>: <ab2 @ 4>/, 'capturing builtin');

p6rule_like("abacad", '<before .d> a.', 
    qr/mob: <ad @ 4>/,
    'lookahead <before>');

p6rule_isnt("abacad", '<before c> ....', 'lookahead <before>');

p6rule_isnt("abcd", '<before> .', 'null <before>');

p6rule_like  ("aabaaa", '<!before ..b> aa', 
    qr/mob: <aa @ 3>/,
    'negated lookahead');

p6rule_is  ('ab', '<after a>b', 'lookbehind <after>');
p6rule_isnt('cb', '<after a>b', 'lookbehind <after>');
p6rule_isnt('b', '<after a>b', 'lookbehind <after>');
p6rule_is  ('ab', '<!after c>b', 'lookbehind <!after>');
p6rule_isnt('cb', '<!after c>b', 'lookbehind <!after>');
p6rule_is  ('b', '<!after c>b', 'lookbehind <!after>');
p6rule_isnt('dbcb', '<!after <[cd]>>b', 'lookbehind <!after>');
p6rule_is  ('dbaacb', '<!after <[cd]>><[ab]>', 'lookbehind <!after>');
p6rule_isnt('dbcb', '<!after c|d>b', 'lookbehind <!after>');
p6rule_is  ('dbaacb', '<!after c|d><[ab]>', 'lookbehind <!after>');
p6rule_is  ('cbaccb', '<!after cd><[ab]>', 'lookbehind <!after>');
p6rule_is  ('a', '$ <after ^a>', 'lookbehind <after>');
p6rule_is  ('axxbxxyc', '<after x+>y', 'lookbehind <after>');

## leading + -- enumerated char class
p6rule_is  ('az', '<[a..z]>+', 'metasyntax with leading + (<+...>)');
p6rule_is  ('az', '<+[a..z]>+', 'metasyntax with leading + (<+...>)');
p6rule_is  ('az', '<+alpha>+', 'metasyntax with leading + (<+...>)',
    todo => 'not yet implemented');


## null pattern is illegal
p6rule_like($str, '', '/Missing term at offset.*/',
    'null pattern ()');


## <null> -- null pattern
p6rule_is  ('',  '<null>', 'null pattern (<null>)');
p6rule_like($str,  '^ <null>',
    qr/mob<null>: < @ 0>/, 'null pattern (<null>)');
p6rule_like($str,  '<null> $',
    qr/mob<null>: < @ 65>/, 'null pattern (<null>)');
p6rule_is  ($str,  'abc <null> def', 'null pattern (<null>)');
p6rule_like($str, "abc <null> def",
    qr/mob<null>: < @ 58>/, 'null pattern (<null>)');
p6rule_is  ($str, 'x | y | <null>', 'null pattern (<null>)');
p6rule_is  ($str, 'x | y | <?null>', 'null pattern (<null>)');


## remember to change the number of tests :-)
BEGIN { plan tests => 68; }
