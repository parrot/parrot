#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/callsignaturereturns.t - test CallSignatureReturns PMC

=head1 SYNOPSIS

    % prove t/pmc/callsignaturereturns.t

=head1 DESCRIPTION

Tests the CallSignatureReturns PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    instantiate()
    switch_storage()
.end


.sub instantiate
    $P0 = new ['CallSignatureReturns']
    ok(1, 'Instantiated CallSignatureReturns')
.end

# Check that internal switching of storage works.
.sub switch_storage
    .local pmc r
    (r :slurpy) = 'return_many'()
    sweep 1
    $S0 = join '', r
    is($S0, "This is very long string to return as characters", "Internal storage switched")
.end

.sub return_many
    .local pmc res
    res = split '', "This is very long string to return as characters"
    .return (res :flat)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
