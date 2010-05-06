#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/stringbuilder.t - StringBuilder

=head1 SYNOPSIS

    % prove t/pmc/stringbuilder.t

=head1 DESCRIPTION

Tests the C<StringBuilder> PMC.

=cut


.sub 'main' :main
    .include 'test_more.pir'

    plan(2)
    test_create()       # 2 tests

    # END_OF_TESTS
.end

.sub 'test_create'
    .local pmc sb
    sb = new ['StringBuilder']

    $I0 = isnull sb
    not $I0
    ok( $I0, 'StringBuilder created' )

    $S0 = sb
    is( $S0, '', '... with empty content')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

