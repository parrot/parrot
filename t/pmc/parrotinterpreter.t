#!perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/parrotinterpreter.t - test the ParrotInterpreter PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotinterpreter.t

=head1 DESCRIPTION

Tests the ParrotInterpreter PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'create new interpreter' );
.sub 'test' :main
    new $P0, ['ParrotInterpreter']
    print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'setting HLL map dynamically' );
.HLL 'Perl6'

.sub 'main' :main
    $P0 = get_class 'Integer'
    $P1 = subclass $P0, 'MyInt'

    $P2 = getinterp
    $P2.'hll_map'($P0, $P1)

    $P3 = 'foo'()
    say $P3                 # "3\n"
    $S0 = typeof $P3
    say $S0                 # "MyInt"
.end

.sub 'foo'
    .return (3)
.end
CODE
3
MyInt
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
