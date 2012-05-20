#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.

=head1 NAME

t/pmc/null.t - test Null PMC

=head1 SYNOPSIS

    % prove t/pmc/null.t

=head1 DESCRIPTION

Tests the Null PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(1)

    $P0 = null

    new $P2, ['Undef']
    $I0 = issame $P0, $P2
    nok($I0, 'Null is not same as not Undef')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
