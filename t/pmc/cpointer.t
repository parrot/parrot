#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/cpointer.t - test CPointer PMC

=head1 SYNOPSIS

    % prove t/pmc/cpointer.t

=head1 DESCRIPTION

Tests the CPointer PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    instantiate()
.end


.sub instantiate
    new $P0, 'CPointer'
    ok(1, 'Instantiated CPointer')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
