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
.end


.sub instantiate
    $P0 = new ['CallSignatureReturns']
    ok(1, 'Instantiated CallSignatureReturns')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
