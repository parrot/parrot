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

    plan(14)
    test_create()               # 2 tests
    test_push_string()          # 9 tests
    test_push_string_unicode()  # 1 test
    test_i_concatenate()        # 1 test

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
    sb = new ["StringBuilder"]

    push sb, "foo"
    $S0 = sb
    is( $S0, "foo", "First string pushed")

    push sb, "bar"
    $S1 = sb
    is( $S1, "foobar", "Second string pushed")

    is( $S0, "foo", "... without clobbering first string")

    $I0 = sb
    is( $I0, 128, "... and capacity still 128" )

    # Push large string which will cause reallocate
    $S99 = repeat "x", 128
    push sb, $S99

    $S0 = concat "foobar", $S99
    $S1 = sb
    is( $S0, $S1, "Push 128 chars string works")

    $I0 = sb
    is( $I0, 256, "... and capacity increased" )

    $S99 = repeat "x", 1000
    push sb, $S99

    $S0 = concat $S0, $S99
    $S1 = sb
    is( $S0, $S1, "Push 1000 chars string works")

    $I0 = sb
    is( $I0, 2048, "... and capacity increased" )

    $S99 = repeat "x", 12000
    push sb, $S99

    $S0 = concat $S0, $S99
    $S1 = sb
    is( $S0, $S1, "Push 10000 chars string works")

    $I0 = sb
    is( $I0, 16384, "... and capacity increased" )

.end

.sub 'test_push_string_unicode'
    .local pmc sb
    sb = new ["StringBuilder"]

    push sb, "le"
    push sb, unicode:"o "
    push sb, iso-8859-1:"tötsch"

    $S0 = sb
    is( $S0, iso-8859-1:"leo tötsch", "Unicode strings appened")
.end

.sub 'test_i_concatenate'
    .local pmc sb
    sb = new ["StringBuilder"]

    concat sb, "foo"

    $P0 = new ["String"]
    $P0 = "bar"
    concat sb, $P0

    sb .= "baz"

    $S0 = sb
    is( $S0, "foobarbaz", "StringBuilder handles concat properly")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

