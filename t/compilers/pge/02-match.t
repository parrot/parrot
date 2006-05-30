#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/compilers/pge/02-match.t - test the Match class


=head1 SYNOPSIS

	% prove t/compilers/pge/02-match.t

=head1 DESCRIPTION

Tests the Match class directly.

=cut

pir_output_is(<<'CODE', <<'OUTPUT', 'concat on a Match object (rt#39135)');
.sub main :main
    load_bytecode 'PGE.pbc'

    $P0 = compreg 'PGE::P6Regex'
    $P1 = $P0('.+')
    $P2 = $P1('world')

    say $P2              # world

    $P3 = new .String
    $P3 = 'hello '

    $P4 = n_concat $P3, $P2
    say $P4              # hello world
.end

CODE
world
hello world
OUTPUT

BEGIN { plan tests => 1; }

