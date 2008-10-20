#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/oo/names.t - Test OO name-related items

=head1 SYNOPSIS

    % prove t/oo/names.t

=head1 DESCRIPTION

Tests OO features related to names and namespaces.

=cut

pir_output_is(
    <<'CODE', <<'OUT', 'Create HLL class same-named as Parrot class', todo => 'RT #43419' );
    .HLL "perl6", ""

    .namespace []

    .sub main :main
        # works
        $P0 = new 'Class'
        $P0.'name'('AnObject')
        $S0 = $P0
        say $S0

        # fails
        $P0 = new 'Class'
        $P0.'name'('Object')
        $S0 = $P0
        say $S0
    .end
CODE
perl6;AnObject
perl6;Object
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
