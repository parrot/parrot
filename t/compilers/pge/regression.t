#! perl
# Copyright (C) 2001-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/compilers/pge/regression.t

=head1 SYNOPSIS

        % prove t/compilers/pge/regression.t

=head1 DESCRIPTION

PGE regression tests

=cut

.include 'load_bytecode.pir'

pir_output_is( <<'CODE', <<'OUTPUT', 'load_bytecode with .pir' );
.sub main :main
    '__load_bytecode'('PGE.pbc')
    '__load_bytecode'('dumper.pir')
    '__load_bytecode'('PGE/Dumper.pir')

    $P0 = compreg 'PGE::P5Regex'
    $P1 = $P0('aabb*')
    $P2 = $P1('fooaabbbar')

    _dumper($P2)
.end
CODE
"VAR1" => PMC 'PGE;Match' => "aabbb" @ 3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'load_bytecode with .pbc' );
.sub main :main
    '__load_bytecode'('PGE.pbc')
    '__load_bytecode'('dumper.pir')
    '__load_bytecode'('PGE/Dumper.pir')

    $P0 = compreg 'PGE::P5Regex'
    $P1 = $P0('aabb*')
    $P2 = $P1('fooaabbbar')

    _dumper($P2)
.end
CODE
"VAR1" => PMC 'PGE;Match' => "aabbb" @ 3
OUTPUT



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
