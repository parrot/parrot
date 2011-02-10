#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

t/pmc/nativepccmethod.t - NativePCCMethods

=head1 SYNOPSIS

    % prove t/pmc/nativepccmethod.t

=head1 DESCRIPTION

Tests the C<NativePCCMethod> PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(4)
    test_call_null()
    test_clone()
    test_defined()
.end

.sub test_call_null
throws_substring(<<"CODE", "attempt to call NULL native function", "cannot call NULL native function")
    .sub main
        $P0 = new ['NativePCCMethod']
        $P0()
    .end
CODE
.end

.sub test_clone
    $P0 = new ['NativePCCMethod']
    $P1 = clone $P0
    ok(1, "can clone NativePCCMethod")
.end

.sub test_defined
    $P0 = new ['NativePCCMethod']
    $I0 = isfalse $P0
    is($I0, 1, "undefined NativePCCMethod is false")

    $I1 = get_addr $P0
    is($I1, 0, "undefined NativePCCMethod points to null")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
