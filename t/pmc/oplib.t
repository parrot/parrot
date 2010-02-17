#! parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/oplib.t - OpLib PMC

=head1 SYNOPSIS

    % prove t/pmc/oplib.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)
    get_singleton()
.end

.sub get_singleton
    $P0 = new ['OpLib']
    $I0 = isnull $P0
    is($I0, 0)

    # TODO: How to test that this is actually a singleton?
    #$P1 = new ['OpLib']
    #is($P0, $P1)
.end

