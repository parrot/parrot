#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/scalar.t - test the scalar PMC


=head1 SYNOPSIS

    % prove t/pmc/scalar.t

=head1 DESCRIPTION

Tests the scalar PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)

    $P0 = new 'scalar'
    ok(1, "scalar creation didn't explode")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
