#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/string_pmc_bitwise.t - Bitwise dynops on String PMC

=head1 SYNOPSIS

    % prove t/dynoplibs/string-pmc_bitwise.t

=head1 DESCRIPTION

Test C<bit_ops> dynops lib on C<String> PMC.

=cut

.loadlib 'bit_ops'

.sub main :main
    .include 'test_more.pir'

    plan(47)

    bands_null_string()
    test_bands_2()
    test_bands_3()
    bors_null_string()
    test_bors_2()
    test_bors_3()
    bxors_null_string()
    bxors_2()
    bxors_3()
    bnots_null_string()
.end

.sub bands_null_string
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']

    null $S1
    set $P1, $S1

    set $S2, "abc"
    set $P2, $S2

    bands $P1, $P2

    null $S3
    set $P3, $S3

    is( $P1, $P3, 'band null, "abc" -> null' )

    set $P1, ""
    bands $P1, $P2
    nok( $P1, 'band "", "abc" -> false' )

    null $S2
    set $P2, $S2
    set $P1, "abc"

    bands $P1, $P2

    null $S3
    set $P3, $S3

    is( $P1, $P3, 'bands "abc", null -> null' )

    set $P2, ""
    bands $P1, $P2
    nok( $P1, 'bans "abc", "" -> false' )

.end

.sub test_bands_2
    new $P1, ['String']
    new $P2, ['String']
    set $P1, "abc"
    set $P2, "EE"
    bands $P1, $P2
    is( $P1, "A@", 'bands "abc", "EE" -> "A@"' )
    is( $P2, "EE", '$2 is unchanged' )
.end

.sub test_bands_3
    new $P1, ['String']
    new $P2, ['String']
    new $P0, ['String']
    set $P1, "abc"
    set $P2, "EE"
    bands $P0, $P1, $P2
    is( $P0, "A@",  'bands "abc", "EE" -> "A@"' )
    is( $P1, "abc", '$2 is unchanged' )
    is( $P2, "EE",  '$3 is unchanged' )
.end

.sub bors_null_string
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']

    null $S1
    null $S2
    set $P1, $S1
    set $P2, $S2
    bors $P1, $P2
    null $S3
    set $P3, $S3
    is( $P1, $P3, 'bors null, null -> null' )

    null $S1
    set $P1, $S1
    set $P2, ""
    bors $P1, $P2
    null $S3
    set $P3, $S3
    is( $P1, $P3, 'bors null, "" -> null' )

    bors $P2, $P1
    is( $P2, $P3, 'bors "", null -> null' )

    null $S1
    set $P1, $S1
    set $P2, "def"
    bors $P1, $P2
    is( $P1, "def", 'bors null, "def" -> "def" / true' )

    null $S2
    set $P2, $S2
    bors $P1, $P2
    is( $P1, "def", 'bors "def", null -> "def" / true' )

    null $S1
    null $S2
    set $P1, $S1
    set $P2, $S2
    bors $P3, $P1, $P2
    null $S4
    is( $P3, $S4, 'bors null, null -> null' )

    set $P1, ""
    bors $P3, $P1, $P2
    is( $P3, $S4, 'bors "", null -> null' )

    bors $P3, $P2, $P1
    is( $P3, $S4, 'bors null, "" -> null' )

    set $P1, "def"
    bors $P3, $P1, $P2
    is( $P3, "def", 'bors "def", null -> "def"' )

    bors $P3, $P2, $P1
    is( $P3, "def", 'bors null, "def" -> "def"' )
.end

.sub test_bors_2
    new $P1, ['String']
    new $P2, ['String']
    set $P1, "abc"
    set $P2, "EE"

    bors $P1, $P2
    is( $P1, "egc", 'bors "abc", "EE" -> "egc"' )
    is( $P2, "EE",  '$2 is unchanged' )
.end

.sub test_bors_3
    new $P1, ['String']
    new $P2, ['String']
    new $P0, ['String']
    set $P1, "abc"
    set $P2, "EE"

    bors $P0, $P1, $P2
    is( $P0, "egc", 'bors "abc", "EE" -> "egc"' )
    is( $P1, "abc", '$2 unchanged' )
    is( $P2, "EE",  '$3 unchanged' )
.end

.sub bxors_null_string
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']
    null $S1
    null $S2
    set $P1, $S1
    set $P2, $S2
    bxors $P1, $P2
    null $S3
    is( $P1, $S3, 'bxors null, null -> null' )

    null $S1
    set $P1, $S1
    set $P2, ""
    bxors $P1, $P2
    null $S3
    is( $P1, $S3, 'bxors null, "" -> null' )

    bxors $P2, $P1
    is( $S2, $S3, 'bxors "", null -> null' )

    null $S1
    set $P1, $S1
    set $P2, "abc"
    bxors $P1, $P2
    is( $P1, "abc", 'bxors null, "abc" -> "abc"' )

    null $S2
    set $P2, $S2
    bxors $P1, $P2
    is( $P1, "abc", 'bxors "abc", "null, -> "abc"' )

    null $S1
    null $S2
    set $P1, $S1
    set $P2, $S2
    bxors $P3, $P1, $P2
    null $S4
    is( $P3, $S4, 'bxors3 null, null -> null' )

    set $P1, ""
    bxors $P3, $P1, $P2
    is( $P3, $S4, 'bxors3 "", null -> null' )

    bxors $P3, $P2, $P1
    is( $P3, $S4, 'bxors3 null, null -> null' )

    set $P1, "abc"
    bxors $P3, $P1, $P2
    is( $P3, "abc", 'bxors3 "abc", null -> "abc"' )

    bxors $P3, $P2, $P1
    is( $P3, "abc", 'bxors3 null, "abc" -> "abc"' )
.end

.sub bxors_2
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']

    set $P1, "a2c"
    set $P2, "Dw"
    bxors $P1, $P2
    is( $P1, "%Ec", 'bxors "a2c", "Dw" -> "%Ec"' )
    is( $P2, "Dw", '... $2 unchanged' )

    set $P1, "abc"
    set $P2, "   X"
    bxors $P1, $P2
    is( $P1, "ABCX", 'bxors "abc", "   X" -> "ABCX"' )
    is( $P2, "   X", '... $2 unchanged' )
.end

.sub bxors_3
    new $P1, ['String']
    new $P2, ['String']
    new $P0, ['String']

    set $P1, "a2c"
    set $P2, "Dw"
    bxors $P0, $P1, $P2
    is( $P0, "%Ec", 'bxors "a2c", "Dw" -> "%Ec"' )
    is( $P1, "a2c", '... $2 unchanged' )
    is( $P2, "Dw",  '... $3 unchanged' )

    set $P1, "abc"
    set $P2, "   Y"
    bxors $P0, $P1, $P2
    is( $P0, "ABCY", 'bxors "abc", "   Y" -> "ABCY"' )
    is( $P1, "abc",  '... $2 unchanged' )
    is( $P2, "   Y", '... $3 unchanged' )
.end

.sub bnots_null_string
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']

    null $S1
    null $S2
    set $P1, $S1
    set $P2, $S2
    bnots $P1, $P2
    null $S3
    is( $P1, $S3, 'bnots null, null -> null' )

    null $S1
    set $P1, $S1
    set $P2, ""
    bnots $P1, $P2
    null $S3
    is( $P1, $S3, 'bnots null, "" -> null' )

    bnots $P2, $P1
    is( $S2, $S3, 'bnots "", null -> null' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
