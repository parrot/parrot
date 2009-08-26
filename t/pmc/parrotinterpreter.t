#!parrot
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/parrotinterpreter.t - test the ParrotInterpreter PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotinterpreter.t

=head1 DESCRIPTION

Tests the ParrotInterpreter PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(3)
    test_new()
    test_hll_map()
.end

.sub test_new
    new $P0, ['ParrotInterpreter']
    ok(1,'new')
.end

.HLL 'Perl6'

.sub test_hll_map
    .include 'test_more.pir'
    $P0 = get_class 'Integer'
    $P1 = subclass $P0, 'MyInt'

    $P2 = getinterp
    $P2.'hll_map'($P0, $P1)

    $P3 = 'foo'()
    is($P3,3)
    $S0 = typeof $P3
    is($S0,"MyInt")
.end

.sub foo
    .return (3)
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
