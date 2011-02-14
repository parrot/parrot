#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynoplibs/lorito.t - Lorito Dynops

=cut

.loadlib 'lorito_ops'

.sub main :main
    .include 'test_more.pir'

    plan(1)
    $P1 = get_cc
    isa_ok($P1,'LoritoContext')

.end
