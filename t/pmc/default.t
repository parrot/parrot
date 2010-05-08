#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/default.t - test default PMC


=head1 SYNOPSIS

    % prove t/pmc/default.t

=head1 DESCRIPTION

Tests the default PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(3)
    test_default()
    test_inspect_vtable_function()
.end

.sub test_default
    $I0 = 1
    push_eh bang
    new $P0, ['default']
    $I0 = 0
  bang:
    pop_eh
    ok($I0, "Couldn't create default PMC directly")
.end

.sub test_inspect_vtable_function
    $P0 = new ['String']
    $P1 = inspect $P0, 'flags'
    $I9 = 1 << 9   # PObj_is_PMC_FLAG
    $I29 = 1 << 29 # PObj_is_class_FLAG

    $I0 = $P1
    $I1 = $I0 & $I9
    ok($I1)

    $I1 = $I0 & $I29
    nok($I1)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
