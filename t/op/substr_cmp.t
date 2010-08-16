#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/substr_cmp.t - Parrot substring comparisons

=head1 SYNOPSIS

     % prove t/op/substr_cmp.t

=head1 DESCRIPTION

Tests the cmp_str_at opcode.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(16)

    test_cmp_str_at_i_s_sc_ic_ic()
.end

.sub 'test_cmp_str_at_i_s_sc_ic_ic'
    set $S0, 'my def = Int'
    $I0 = cmp_str_at $S0, 'my', 0, 2
    is( $I0, 0, "eq comparison at beginning" )

    $I0 = cmp_str_at $S0, 'has', 0, 3
    isnt( $I0, 0, "ne comparison at beginning " )

    $I0 = cmp_str_at $S0, 'def', 3, 3
    is( $I0, 0, "eq comparison at offset 3" )

    $I0 = cmp_str_at $S0, 'abc', 3, 3
    is( $I0, 1, "gt comparison at offset 3" )

    $I0 = cmp_str_at $S0, 'xyz', 3, 3
    is( $I0, -1, "lt comparison at offset 3" )

    $I0 = cmp_str_at $S0, 'Int', 9, 3
    is( $I0, 0, "eq comparison at end" )

    $I0 = cmp_str_at $S0, 'Integer', 9, 7
    is( $I0, -1, "short comparison at end" )

    $I0 = cmp_str_at $S0, 'Integer', 9, 3
    is( $I0, 0, "short comparison of both strings" )

    $I0 = cmp_str_at $S0, 'Float', 9, 5
    is( $I0, 1, "short gt comparison at end" )

    $I0 = cmp_str_at $S0, 'Float', 9, 1
    is( $I0, 1, "short gt comparison of both strings" )

    $I0 = cmp_str_at $S0, 'Float', 9, 0
    is( $I0, 0, "length of zero is always eq" )

    $I0 = cmp_str_at $S0, 'de', 3, 3
    is( $I0, 1, "2nd argument is short" )

    $I0 = cmp_str_at $S0, 'ab', 3, 3
    is( $I0, 1, "2nd argument is short" )

    $I0 = cmp_str_at $S0, 'xy', 3, 3
    is( $I0, -1, "2nd argument is short" )

    $I0 = cmp_str_at $S0, '', 0, 0
    is( $I0, 0, "2nd argument is empty" )

    $I0 = cmp_str_at $S0, 'my def = Integer', 0, 16
    is( $I0, -1, "2nd argument is longer" )

    $I0 = cmp_str_at $S0, 'my def = Integer', 15, 1
    is( $I0, -1, "offset out of bounds of first string" )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
