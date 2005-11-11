#!perl
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/p6rules/backtrack.t - PGE backtracking tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<Backtracking control> section

=head1 SYNOPSIS

	% prove t/p6rules/backtrack.t

=cut


## : -- cut over preceding atom
p6rule_is  ('bazaar', 'a* a', 'control');
p6rule_isnt('bazaar', 'a*:a', 'basic');

p6rule_is  ('abbabbababba', '^[a|b]*  aba', 'control');
p6rule_isnt('abbabbababba', '^[a|b]*: aba', 'outside a group');


## :: -- cut over surrounding group of alternations
p6rule_is  ('verify', '[ if    not | ify ]', 'control');
p6rule_isnt('verify', '[ if :: not | ify ]', 'inside a group');
p6rule_isnt('verify', '  if :: not | ify',   'the default all group');
p6rule_is  ('verify', '[ if :  not | ify ]', 'simple backtrack still works');
p6rule_is  ('verify', '[ if :: not | ify ] | verify', 'rule continues');


## ::: -- cut over entire rule
p6rule_is  ('whence', '[ when     ever ] | whence', 'full backtrack failure');
p6rule_isnt('whence', '[ when ::: ever ] | whence', 'full backtrack failure');

p6rule_is  ('xyabghij', 'ab::cd | gh::ij', 'group cut at top');
p6rule_isnt('xyabghij', 'ab:::cd | gh:::ij', 'rule cut at top');
p6rule_is  ('xyabghij', '[ab::cd | gh::ij]', 'group cut in group');
p6rule_isnt('xyabghij', '[ab:::cd | gh:::ij]', 'rule cut in group');


## <commit> -- cut over entire match
p6rule_isnt('whence', '[ when <commit> ever ] | whence', 'full backtrack failure');

p6rule_isnt('whence', 
    [
        [ subrule => 'when <commit> ever' ],
        [ _MASTER => '<subrule> | whence' ],
    ],
    "<commit> in nested subrule");
  
# remember to change the number of tests :-)
BEGIN { plan tests => 17; }
