#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/deprecated.t - Tests for Deprecated Ops

=head1 SYNOPSIS

    % prove t/dynoplibs/deprecated.t

=head1 DESCRIPTION

Tests for ops residing in src/dynoplibs/deprecated.ops

=cut

.const int TESTS = 105

.loadlib 'deprecated_ops'

.sub 'test' :main
    .include 'test_more.pir'

    plan(TESTS)

    test_cleari()
    test_exchange_i()
    test_clearn()
    test_exchange_n()
    test_clears()
    test_exchange_s()
.end

.sub 'test_exchange_i'
    $I10 = 10
    $I20 = 20
    exchange $I10, $I20
    is($I10, 20, 'exchange - first operand ok')
    is($I20, 10, 'exchange - second operand ok')

    $I30 = 30
    exchange $I30, $I30
    is($I30, 30, 'exchange - reflexive')
.end


.sub 'test_cleari'
    $I0 = 0xdeadbee
    $I1 = 0xdeadbee
    $I2 = 0xdeadbee
    $I3 = 0xdeadbee
    $I4 = 0xdeadbee
    $I5 = 0xdeadbee
    $I6 = 0xdeadbee
    $I7 = 0xdeadbee
    $I8 = 0xdeadbee
    $I9 = 0xdeadbee
    $I10 = 0xdeadbee
    $I11 = 0xdeadbee
    $I12 = 0xdeadbee
    $I13 = 0xdeadbee
    $I14 = 0xdeadbee
    $I15 = 0xdeadbee
    $I16 = 0xdeadbee
    $I17 = 0xdeadbee
    $I18 = 0xdeadbee
    $I19 = 0xdeadbee
    $I20 = 0xdeadbee
    $I21 = 0xdeadbee
    $I22 = 0xdeadbee
    $I23 = 0xdeadbee
    $I24 = 0xdeadbee
    $I25 = 0xdeadbee
    $I26 = 0xdeadbee
    $I27 = 0xdeadbee
    $I28 = 0xdeadbee
    $I29 = 0xdeadbee
    $I30 = 0xdeadbee
    $I31 = 0xdeadbee

    cleari

    is($I0, 0, 'cleari - $I0 cleared')
    is($I1, 0, 'cleari - $I1 cleared')
    is($I2, 0, 'cleari - $I2 cleared')
    is($I3, 0, 'cleari - $I3 cleared')
    is($I4, 0, 'cleari - $I4 cleared')
    is($I5, 0, 'cleari - $I5 cleared')
    is($I6, 0, 'cleari - $I6 cleared')
    is($I7, 0, 'cleari - $I7 cleared')
    is($I8, 0, 'cleari - $I8 cleared')
    is($I9, 0, 'cleari - $I9 cleared')
    is($I10, 0, 'cleari - $I10 cleared')
    is($I11, 0, 'cleari - $I11 cleared')
    is($I12, 0, 'cleari - $I12 cleared')
    is($I13, 0, 'cleari - $I13 cleared')
    is($I14, 0, 'cleari - $I14 cleared')
    is($I15, 0, 'cleari - $I15 cleared')
    is($I16, 0, 'cleari - $I16 cleared')
    is($I17, 0, 'cleari - $I17 cleared')
    is($I18, 0, 'cleari - $I18 cleared')
    is($I19, 0, 'cleari - $I19 cleared')
    is($I20, 0, 'cleari - $I20 cleared')
    is($I21, 0, 'cleari - $I21 cleared')
    is($I22, 0, 'cleari - $I22 cleared')
    is($I23, 0, 'cleari - $I23 cleared')
    is($I24, 0, 'cleari - $I24 cleared')
    is($I25, 0, 'cleari - $I25 cleared')
    is($I26, 0, 'cleari - $I26 cleared')
    is($I27, 0, 'cleari - $I27 cleared')
    is($I28, 0, 'cleari - $I28 cleared')
    is($I29, 0, 'cleari - $I29 cleared')
    is($I30, 0, 'cleari - $I30 cleared')
    is($I31, 0, 'cleari - $I31 cleared')
.end

.sub test_clearn
    set     $N0, 547972.0
    set     $N1, 547972.0
    set     $N2, 547972.0
    set     $N3, 547972.0
    set     $N4, 547972.0
    set     $N5, 547972.0
    set     $N6, 547972.0
    set     $N7, 547972.0
    set     $N8, 547972.0
    set     $N9, 547972.0
    set     $N10, 547972.0
    set     $N11, 547972.0
    set     $N12, 547972.0
    set     $N13, 547972.0
    set     $N14, 547972.0
    set     $N15, 547972.0
    set     $N16, 547972.0
    set     $N17, 547972.0
    set     $N18, 547972.0
    set     $N19, 547972.0
    set     $N20, 547972.0
    set     $N21, 547972.0
    set     $N22, 547972.0
    set     $N23, 547972.0
    set     $N24, 547972.0
    set     $N25, 547972.0
    set     $N26, 547972.0
    set     $N27, 547972.0
    set     $N28, 547972.0
    set     $N29, 547972.0
    set     $N30, 547972.0
    set     $N31, 547972.0
    clearn
    is( $N0, "0", 'clearn' )
    is( $N1, "0", 'clearn' )
    is( $N2, "0", 'clearn' )
    is( $N3, "0", 'clearn' )
    is( $N4, "0", 'clearn' )
    is( $N5, "0", 'clearn' )
    is( $N6, "0", 'clearn' )
    is( $N7, "0", 'clearn' )
    is( $N8, "0", 'clearn' )
    is( $N9, "0", 'clearn' )
    is( $N10, "0", 'clearn' )
    is( $N11, "0", 'clearn' )
    is( $N12, "0", 'clearn' )
    is( $N13, "0", 'clearn' )
    is( $N14, "0", 'clearn' )
    is( $N15, "0", 'clearn' )
    is( $N16, "0", 'clearn' )
    is( $N17, "0", 'clearn' )
    is( $N18, "0", 'clearn' )
    is( $N19, "0", 'clearn' )
    is( $N20, "0", 'clearn' )
    is( $N21, "0", 'clearn' )
    is( $N22, "0", 'clearn' )
    is( $N23, "0", 'clearn' )
    is( $N24, "0", 'clearn' )
    is( $N25, "0", 'clearn' )
    is( $N26, "0", 'clearn' )
    is( $N27, "0", 'clearn' )
    is( $N28, "0", 'clearn' )
    is( $N29, "0", 'clearn' )
    is( $N30, "0", 'clearn' )
    is( $N31, "0", 'clearn' )
.end

.sub test_exchange_n
    set $N1, 1.234560
    set $N2, 9.876540
    exchange $N1, $N2
    is( $N1, "9.87654", 'exchange' )
    is( $N2, "1.23456", 'exchange' )
    set $N3, -100.200300
    exchange $N3, $N3
    is( $N3, "-100.2003", 'exchange' )
.end

.sub test_clears
    set $S0, "BOO 0"
    set $S1, "BOO 1"
    set $S2, "BOO 2"
    set $S3, "BOO 3"
    set $S4, "BOO 4"
    set $S5, "BOO 5"
    set $S6, "BOO 6"
    set $S7, "BOO 7"
    set $S8, "BOO 8"
    set $S9, "BOO 9"
    set $S10, "BOO 10"
    set $S11, "BOO 11"
    set $S12, "BOO 12"
    set $S13, "BOO 13"
    set $S14, "BOO 14"
    set $S15, "BOO 15"
    set $S16, "BOO 16"
    set $S17, "BOO 17"
    set $S18, "BOO 18"
    set $S19, "BOO 19"
    set $S20, "BOO 20"
    set $S21, "BOO 21"
    set $S22, "BOO 22"
    set $S23, "BOO 23"
    set $S24, "BOO 24"
    set $S25, "BOO 25"
    set $S26, "BOO 26"
    set $S27, "BOO 27"
    set $S28, "BOO 28"
    set $S29, "BOO 29"
    set $S30, "BOO 30"
    set $S31, "BOO 31"
    clears
    is( $S0, "", '' )
    is( $S1, "", '' )
    is( $S2, "", '' )
    is( $S3, "", '' )
    is( $S4, "", '' )
    is( $S5, "", '' )
    is( $S6, "", '' )
    is( $S7, "", '' )
    is( $S8, "", '' )
    is( $S9, "", '' )
    is( $S10, "", '' )
    is( $S11, "", '' )
    is( $S12, "", '' )
    is( $S13, "", '' )
    is( $S14, "", '' )
    is( $S15, "", '' )
    is( $S16, "", '' )
    is( $S17, "", '' )
    is( $S18, "", '' )
    is( $S19, "", '' )
    is( $S20, "", '' )
    is( $S21, "", '' )
    is( $S22, "", '' )
    is( $S23, "", '' )
    is( $S24, "", '' )
    is( $S25, "", '' )
    is( $S26, "", '' )
    is( $S27, "", '' )
    is( $S28, "", '' )
    is( $S29, "", '' )
    is( $S30, "", '' )
    is( $S31, "", '' )
.end

.sub test_exchange_s
    set $S0, "String #0"
    set $S1, "String #1"
    exchange $S0, $S1
    is( $S0, "String #1", 'exchange' )
    is( $S1, "String #0", 'exchange' )

    set $S2, "String #2"
    exchange $S2, $S2
    is( $S2, "String #2", 'exchange' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
