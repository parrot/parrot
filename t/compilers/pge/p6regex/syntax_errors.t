#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/compilers/pge/p6regex/syntax_errors.t - How PGE catches syntax errors

=head1 DESCRIPTION

Tries to compile a bunch of know broken P6 regexps, testing the
exceptions that get thrown.

=head1 SYNOPSIS

	% prove t/compilers/pge/p6regex/syntax_errors.t

=cut

p6rule_throws('{{ ',
    qr/Missing closing braces for closure/, 'unterminated closure');

p6rule_throws('\\1',
    qr/\\1 and \\012 illegal/, 'back references');

p6rule_throws('\x[',
    qr/Missing close bracket for \\x/, 'unterminated \\x[..]');

p6rule_throws('\X[',
    qr/Missing close bracket for \\x/, 'unterminated \\X[..]');

p6rule_throws(' :i a',
    qr/Too late for modifier/, 'whitespace before modifier', todo => 'not implemented');

# remember to change the number of tests :-)
BEGIN { plan tests => 5; }
