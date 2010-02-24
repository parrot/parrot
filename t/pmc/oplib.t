#! parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/oplib.t - OpLib PMC

=head1 SYNOPSIS

    % prove t/pmc/oplib.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)
    new_oplib()
.end

.sub new_oplib
    $P0 = new ['OpLib']
    $I0 = isnull $P0
    nok($I0, "new OpLib")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

