#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/string_nfg.t - test the NFG encoding and related string operations


=head1 SYNOPSIS

    % prove t/op/string_mem.t

=head1 DESCRIPTION

Tests the behaviour of nfg-encoded strings when subjecte to various
string operations.

=cut

.include 'stringinfo.pasm'

.const int TESTS = 3

.sub _main :main
    .include 'test_more.pir'

    plan(TESTS)

    without_graphemes()
.end

.sub without_graphemes

    $S0 = "Hello, world"
    $I0 = find_encoding 'nfg'
    $S1 = trans_encoding $S0, $I0
    $I1 = stringinfo $S0, .STRINGINFO_EXTRA
    is($I1, 0, "Lazy table creation.")

    $I0 = stringinfo $S0, .STRINGINFO_STRLEN
    $I1 = stringinfo $S1, .STRINGINFO_STRLEN
    is($I0, $I1, "Lenght is the same.")

    $I2 =  stringinfo $S1, .STRINGINFO_BUFLEN
    $I1 *= 4
    is($I2, $I1, "buflen = 4 * strlen")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
