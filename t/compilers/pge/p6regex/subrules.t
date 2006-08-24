#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test tests => 7;
use Parrot::Test::PGE;


=head1 NAME

t/p6regex/subrules.t - PGE subrules tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Named regexes'> section

=head1 SYNOPSIS

	% prove t/p6regex/subrules.t

=cut


p6rule_is  ("   int argc ",
    [
        [ type    => 'int | double | float | char' ],
        [ ident   => '\w+' ],
        [ _MASTER => ':w<type> <ident>' ],
    ],
    "simple subrules");

p6rule_isnt("doggy",
    [
        [ type    => 'int | double | float | char' ],
        [ ident   => '\w+' ],
        [ _MASTER => ':w<type> <ident>' ],
    ],
    "simple subrules");

p6rule_is  ("(565) 325-2935",
    [
        [ digits => '\d+' ],
        [ exch => '\(<digits>\)' ],
        [ _MASTER => ':w<exch> <digits>-<digits>' ],
    ],
    "nested subrules");

p6rule_isnt("0-900-04-41-59",
    [
        [ digits => '\d+' ],
        [ exch => '\(<digits>\)' ],
        [ _MASTER => ':w<exch> <digits>-<digits>' ],
    ],
    "nested subrules");

p6rule_is("ab",
    [
        [ alpha => '<[aeiou]>' ],
        [ _MASTER => '^ <alpha> <PGE::Match::alpha>' ],
    ],
    "named and lexical subrules");

#p6rule_isnt("ba",
#    [
#        [ alpha => '<[aeiou]>' ],
#        [ _MASTER => '^ <alpha> <PGE::Match::alpha>' ],
#    ],
#    "named and lexical subrules");

p6rule_isnt("   ab", '^ <ws>: \ ab', "cut on subrules");

p6rule_isnt('whence',
    [
        [ subrule => 'when <commit> ever' ],
        [ _MASTER => '<subrule> | whence' ],
    ],
    "<commit> in nested subrule");



