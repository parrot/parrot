#!./parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/include/fp_equality.t - Test runtime/parrot/include/fp_equality.pasm

=head1 SYNOPSIS

        % prove t/include/fp_equality.t

=head1 DESCRIPTION

Tests fp_* functions.

=cut

.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'
    .local num epsilon, zplus, zminus
    .local num oplus, ominus
    plan(4)
    epsilon = 0.00000005
    oplus  = 1 + epsilon
    ominus = 1 - epsilon
    zplus  = 0 + epsilon
    zminus = 0 - epsilon

    .fp_eq_ok(zplus, 0, 'zero')
    .fp_eq_ok(0, zplus, 'zero')

    .fp_eq_ok(oplus, 1, 'one')
    .fp_eq_ok(1, oplus, 'one')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
