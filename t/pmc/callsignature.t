#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/callsignature.t - test CallSignature PMC

=head1 SYNOPSIS

    % prove t/pmc/callsignature.t

=head1 DESCRIPTION

Tests the CallSignature PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    instantiate()
.end


.sub instantiate

    $P0 = new ['CallSignature']
    ok(1, 'Instantiated CallSignature')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
