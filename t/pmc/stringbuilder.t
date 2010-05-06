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

    plan(5)
    test_create()       # 2 tests
    test_push_string()

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

.sub 'test_push_string'
    .local pmc sb
    sb = new ['StringBuilder']

    push sb, 'foo'
    $S0 = sb
    is( $S0, 'foo', 'First string pushed')

    push sb, 'bar'
    $S1 = sb
    is( $S1, 'foobar', 'Second string pushed')

    is( $S0, 'foo', '... without clobbering first string')

    # Push large string which will cause reallocate

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

