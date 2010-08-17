#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/unmanagedstruct.t - test the UnManagedStruct PMC

=head1 SYNOPSIS

    % prove t/pmc/unmanagedstruct.t

=head1 DESCRIPTION

Tests the UnManagedStruct PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    new $P0, ['UnManagedStruct']
    ok(1, 'Instantiated an UnManagedStruct PMC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
