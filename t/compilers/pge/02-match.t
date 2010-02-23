#!parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/pge/02-match.t - test the Match class


=head1 SYNOPSIS

        % prove t/compilers/pge/02-match.t

=head1 DESCRIPTION

Tests the Match class directly.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(4)

    test_concat_on_a_match_object()
    test_push_on_a_match_object()
.end

.sub test_concat_on_a_match_object
    load_bytecode 'PGE.pbc'

    $P0 = compreg 'PGE::Perl6Regex'
    $P1 = $P0('.+')
    $P2 = $P1('world')

    is($P2, 'world', 'concat on a Match object (rt#39135)')

    $P3 = new 'String'
    $P3 = 'hello '

    $P4 = concat $P3, $P2
    is($P4, 'hello world', 'concat on a Match object (rt#39135)')
.end

.sub test_push_on_a_match_object
    .local pmc match, str, arr
    load_bytecode 'PGE.pbc'
    match = new ['PGE';'Match']
    str = new 'String'
    str = 'foo'
    push match, str
    arr = match.'list'()
    $I0 = elements arr
    is($I0, 1, 'push on a Match object')
    $P3 = match[0]
    is($P3, 'foo', 'push on a Match object')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
