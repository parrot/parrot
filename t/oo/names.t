#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/names.t - Test OO name-related items

=head1 SYNOPSIS

    % prove t/oo/names.t

=head1 DESCRIPTION

Tests OO features related to names and namespaces.

=cut

.HLL "perl6"

.namespace []

.sub main :main
    .include 'test_more.pir'

    plan(2)

    hll_object_different_than_parrot_name()
    hll_object_same_as_parrot_name()
.end

.sub hll_object_different_than_parrot_name
    # works
    $P0 = new 'Class'
    $P0.'name'('AnObject')
    $S0 = $P0
    is ($S0, 'AnObject','HLL obj w/ name different than parrot obj created')
.end

.sub hll_object_same_as_parrot_name
    # fails
    $P0 = new 'Class'
    push_eh OK_1
    $P0.'name'('Object')
    pop_eh
    $S0 = $P0
    ok (1, 'HLL obj created w/ same name as parrot obj')
    .return()
OK_1:
    ok (0, 'HLL obj w/ same name as parrot obj not created')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
