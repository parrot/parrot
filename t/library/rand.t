#!perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/library/rand.t - rand tests

=head1 SYNOPSIS

    % prove t/library/rand.t

=cut

pir_output_is( << 'CODE', << 'OUTPUT', 'rand / srand' );
.sub test :main
    load_bytecode 'Math/Rand.pbc'
    .local pmc rand
    rand = get_global [ 'Math'; 'Rand' ], 'rand'
    .local pmc srand
    srand = get_global [ 'Math'; 'Rand' ], 'srand'
    $I0 = rand()
    say $I0
    $I0 = rand()
    say $I0
    $I0 = rand()
    say $I0
    $I0 = rand()
    say $I0
    srand(1)
    $I0 = rand()
    say $I0
    $I0 = rand()
    say $I0
.end
CODE
16838
5759
10113
17516
16838
5759
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'RAND_MAX' );
.sub test :main
    load_bytecode 'Math/Rand.pbc'
    .local pmc rand_max
    rand_max = get_global [ 'Math'; 'Rand' ], 'RAND_MAX'
    $I0 = rand_max()
    say $I0
.end
CODE
32767
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
