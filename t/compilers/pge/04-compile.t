#! perl
# $Id$

# Copyright (C) 2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/compilers/pge/04-compile.t - Test our ability to compile regexes into various names

=head1 SYNOPSIS

        % prove t/compilers/pge/04-compile.t

=head1 DESCRIPTION

Tests various arguments to the compiler.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'basic compile, no name/grammar' );
.namespace []

.sub main :main
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+')
    $P2 = $P1('ok 1')
    say $P2
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'compile into current namespace' );
.namespace []

.sub main :main
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'xyz', 'grammar'=>'')
    $P2 = 'xyz'('ok 1')
    say $P2
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'compile into a new grammar' );
.sub main :main
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'xyz', 'grammar'=>'PGE::Test')
    $P2 = get_hll_global ['PGE';'Test'], 'xyz'
    $P3 = $P2('ok 1')
    say $P3
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'compile into a new grammar, 2x' );
.sub main :main
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'abc', 'grammar'=>'PGE::Test')
    $P1 = p6compiler('.+', 'name'=>'xyz', 'grammar'=>'PGE::Test')
    $P2 = get_hll_global ['PGE';'Test'], 'abc'
    $P3 = $P2('ok 1')
    say $P3
.end
CODE
ok 1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

