#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/string_nfg.t - test the NFG encoding and related string operations


=head1 SYNOPSIS

    % prove t/op/string_mem.t

=head1 DESCRIPTION

Tests the behaviour of nfg-encoded strings when subjected to various
string operations.

=cut

.include 'stringinfo.pasm'

.const int TESTS = 8

.sub _main :main
    .include 'test_more.pir'

    plan(TESTS)

    literals_and_transcoding()
    transcode_without_graphemes()
    transcode_with_graphemes()
.end

.sub literals_and_transcoding

    $S0 = utf16:unicode:"\u006e\u0303\u0303\u0303\u0303\u00d1\u00d1"
    $I0 = find_encoding 'nfg'
    $S0 = trans_encoding $S0, $I0

    $S1 = nfg:unicode:"\u006e\u0303\u0303\u0303\u0303\u00d1\u00d1"

    $I0 = stringinfo $S0, .STRINGINFO_STRLEN
    $I1 = stringinfo $S1, .STRINGINFO_STRLEN
    is($I0, $I1, "Lenght is the same.")

    $I0 = stringinfo $S0, .STRINGINFO_BUFUSED
    $I1 = stringinfo $S1, .STRINGINFO_BUFUSED
    is($I0, $I1, "Bufused is the same.")

.end

.sub transcode_without_graphemes

    $S0 = "Hello, world"
    $I0 = find_encoding 'nfg'
    $S1 = trans_encoding $S0, $I0
    $I1 = stringinfo $S0, .STRINGINFO_EXTRA
    is($I1, 0, "Lazy table creation.")

    $I0 = stringinfo $S0, .STRINGINFO_STRLEN
    $I1 = stringinfo $S1, .STRINGINFO_STRLEN
    is($I0, $I1, "Lenght is the same.")

    $I2 =  stringinfo $S1, .STRINGINFO_BUFUSED
    $I1 *= 4
    is($I2, $I1, "bufused = 4 * strlen")

.end

.sub transcode_with_graphemes

    $S0 = utf16:unicode:"\u006e\u0303\u0303\u0303\u0303\u00d1\u00d1"
    $I0 = find_encoding 'nfg'
    $S1 = trans_encoding $S0, $I0

    $I1 = stringinfo $S1, .STRINGINFO_EXTRA
    isnt($I1, 0, "Lazy table creation.")

    $I0 = stringinfo $S0, .STRINGINFO_STRLEN
    $I1 = stringinfo $S1, .STRINGINFO_STRLEN
    isnt($I0, $I1, "Lenght is not the same.")

    $I2 =  stringinfo $S1, .STRINGINFO_BUFUSED
    $I1 *= 4
    is($I2, $I1, "bufused = 4 * strlen")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
