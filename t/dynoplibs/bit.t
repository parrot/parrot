#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/bit.t - Bitwise Dynops

=head1 SYNOPSIS

        % prove t/dynoplibs/bit.t

=head1 DESCRIPTION

Tests basic arithmetic on various combinations of Parrot integer and
number types.

=cut

.loadlib 'bit_ops'

.sub main :main
    .include 'test_more.pir'

    plan(56)

    bnot_p_p_creates_destination()
    bands_null_string()
    bands_2()
    bands_3()
    bands_cow()
    bors_null_string()
    bors_2()
    bors_3()
    bors_cow()
    bxors_null_string()
    bxors_2()
    bxors_3()
    bxors_cow()
    bnots_null_string()
    bnots_2()
    bnots_cow()
    # END_OF_TESTS

.end

.sub 'bnot_p_p_creates_destination'
    $P0 = box 3
    $P1 = bnot $P0
    is( $P1, -4, 'bnot_p_p_creates_destination')
.end

.sub bands_null_string
    null $S1
    set $S2, "abc"
    $S1 = bands $S1, $S2
    null $S3
    is( $S1, $S3, 'ok1' )

    set $S1, ""
    $S1 = bands $S1, $S2
    nok( $S1, 'ok2' )

    null $S2
    set $S1, "abc"
    $S1 = bands $S1, $S2
    null $S3
    is( $S1, $S3, 'ok3' )

    set $S2, ""
    $S1 = bands $S1, $S2
    nok( $S1, 'ok4' )
.end

.sub bands_2
    set $S1, "abc"
    set $S2, "EE"
    $S1 = bands $S1, $S2
    is( $S1, "A@", 'bands 2' )
    is( $S2, "EE", 'bands 2' )
.end

.sub bands_3
    set $S1, "abc"
    set $S2, "EE"
    bands $S0, $S1, $S2
    is( $S0, "A@", 'bands 3' )
    is( $S1, "abc", 'bands 3' )
    is( $S2, "EE", 'bands 3' )
.end

.sub bands_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bands $S1, "bar"
    is( $S2, "foo", 'bands COW' )
.end

.sub bors_null_string
    null $S1
    null $S2
    $S1 = bors $S1, $S2
    null $S3
    is( $S1, $S3, 'bors NULL string' )

    null $S1
    set $S2, ""
    $S1 = bors $S1, $S2
    null $S3
    is( $S1, $S3, 'bors NULL string' )

    $S2 = bors $S2, $S1
    is( $S2, $S3, 'bors NULL string' )

    null $S1
    set $S2, "def"
    $S1 = bors $S1, $S2
    is( $S1, "def", 'bors NULL string' )

    null $S2
    $S1 = bors $S1, $S2
    is( $S1, "def", 'bors NULL string' )

    null $S1
    null $S2
    bors $S3, $S1, $S2
    null $S4
    is( $S3, $S4, 'bors NULL string' )

    set $S1, ""
    bors $S3, $S1, $S2
    is( $S3, $S4, 'bors NULL string' )

    bors $S3, $S2, $S1
    is( $S3, $S4, 'bors NULL string' )

    set $S1, "def"
    bors $S3, $S1, $S2
    is( $S3, "def", 'bors NULL string' )

    bors $S3, $S2, $S1
    is( $S3, "def", 'bors NULL string' )
.end

.sub bors_2
    set $S1, "abc"
    set $S2, "EE"
    $S1 = bors $S1, $S2
    is( $S1, "egc", 'bors 2' )
    is( $S2, "EE", 'bors 2' )
.end

.sub bors_3
    set $S1, "abc"
    set $S2, "EE"
    bors $S0, $S1, $S2
    is( $S0, "egc", 'bors 3' )
    is( $S1, "abc", 'bors 3' )
    is( $S2, "EE", 'bors 3' )
.end

.sub bors_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bors $S1, "bar"
    is( $S2, "foo", 'bors COW' )
.end

.sub bxors_null_string
    null $S1
    null $S2
    $S1 = bxors $S1, $S2
    null $S3
    is( $S1, $S3, 'bxors NULL string' )

    null $S1
    set $S2, ""
    $S1 = bxors $S1, $S2
    null $S3
    is( $S1, $S3, 'bxors NULL string' )

    $S2 = bxors $S2, $S1
    is( $S2, $S3, 'bxors NULL string' )

    null $S1
    set $S2, "abc"
    $S1 = bxors $S1, $S2
    is( $S1, "abc", 'bxors NULL string' )

    null $S2
    $S1 = bxors $S1, $S2
    is( $S1, "abc", 'bxors NULL string' )

    null $S1
    null $S2
    bxors $S3, $S1, $S2
    null $S4
    is( $S3, $S4, 'bxors NULL string' )

    set $S1, ""
    bxors $S3, $S1, $S2
    is( $S3, $S4, 'bxors NULL string' )

    bxors $S3, $S2, $S1
    is( $S3, $S4, 'bxors NULL string' )

    set $S1, "abc"
    bxors $S3, $S1, $S2
    is( $S3, "abc", 'bxors NULL string' )

    bxors $S3, $S2, $S1
    is( $S3, "abc", 'bxors NULL string' )
.end

.sub bxors_2
    set $S1, "a2c"
    set $S2, "Dw"
    $S1 = bxors $S1, $S2
    is( $S1, "%Ec", 'bxors 2' )
    is( $S2, "Dw", 'bxors 2' )

    set $S1, "abc"
    set $S2, "   X"
    $S1 = bxors $S1, $S2
    is( $S1, "ABCX", 'bxors 2' )
    is( $S2, "   X", 'bxors 2' )
.end

.sub bxors_3
    set $S1, "a2c"
    set $S2, "Dw"
    bxors $S0, $S1, $S2
    is( $S0, "%Ec", 'bxors 3' )
    is( $S1, "a2c", 'bxors 3' )
    is( $S2, "Dw", 'bxors 3' )

    set $S1, "abc"
    set $S2, "   Y"
    bxors $S0, $S1, $S2
    is( $S0, "ABCY", 'bxors 3' )
    is( $S1, "abc", 'bxors 3' )
    is( $S2, "   Y", 'bxors 3' )
.end

.sub bxors_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bxors $S1, "bar"
    is( $S2, "foo", 'bxors COW' )
.end

.sub bnots_null_string
    null $S1
    null $S2
    bnots $S1, $S2
    null $S3
    is( $S1, $S3, 'bnots NULL string' )

    null $S1
    set $S2, ""
    bnots $S1, $S2
    null $S3
    is( $S1, $S3, 'bnots NULL string' )

    bnots $S2, $S1
    is( $S2, $S3, 'bnots NULL string' )
.end

# This was the previous test used for t/native_pbc/string.t
.sub bnots_2
    skip( 4, "No unicode yet" )
    # getstdout $P0
    # push $P0, "utf8"
    # set $S1, "a2c"
    # bnots $S2, $S1
    # is( $S1, "a2c", 'bnots 2' )
    # is( $S2, "\xC2\x9E\xC3\x8D\xC2\x9C", 'bnots 2' )
    #
    # bnots $S1, $S1
    # is( $S1, "\xC2\x9E\xC3\x8D\xC2\x9C", 'bnots 2' )
    #
    # bnots $S1, $S1
    # is( $S1, "a2c", 'bnots 2' )
.end

.sub bnots_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    bnots $S1, $S1
    is( $S2, "foo", 'bnots COW' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
