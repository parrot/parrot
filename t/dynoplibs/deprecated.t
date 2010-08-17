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

.const int TESTS = 13

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
    test_clearp()
.end

.sub 'test_exchange_i'
    $I10 = 10
    $I20 = 20
    exchange $I10, $I20
    is($I10, 20, 'exchange i - first operand ok')
    is($I20, 10, 'exchange i - second operand ok')

    $I30 = 30
    exchange $I30, $I30
    is($I30, 30, 'exchange i - reflexive')
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

    $S0 = 'NO'

    ne $I0, 0, result
    ne $I1, 0, result
    ne $I2, 0, result
    ne $I3, 0, result
    ne $I4, 0, result
    ne $I5, 0, result
    ne $I6, 0, result
    ne $I7, 0, result
    ne $I8, 0, result
    ne $I9, 0, result
    ne $I10, 0, result
    ne $I11, 0, result
    ne $I12, 0, result
    ne $I13, 0, result
    ne $I14, 0, result
    ne $I15, 0, result
    ne $I16, 0, result
    ne $I17, 0, result
    ne $I18, 0, result
    ne $I19, 0, result
    ne $I20, 0, result
    ne $I21, 0, result
    ne $I22, 0, result
    ne $I23, 0, result
    ne $I24, 0, result
    ne $I25, 0, result
    ne $I26, 0, result
    ne $I27, 0, result
    ne $I28, 0, result
    ne $I29, 0, result
    ne $I30, 0, result
    ne $I31, 0, result

    $S0 = 'YES'
  result:
    is($S0, 'YES', 'cleari')
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

    $I0 = 0

    ne $N0, 0.0, result
    ne $N1, 0.0, result
    ne $N2, 0.0, result
    ne $N3, 0.0, result
    ne $N4, 0.0, result
    ne $N5, 0.0, result
    ne $N6, 0.0, result
    ne $N7, 0.0, result
    ne $N8, 0.0, result
    ne $N9, 0.0, result
    ne $N10, 0.0, result
    ne $N11, 0.0, result
    ne $N12, 0.0, result
    ne $N13, 0.0, result
    ne $N14, 0.0, result
    ne $N15, 0.0, result
    ne $N16, 0.0, result
    ne $N17, 0.0, result
    ne $N18, 0.0, result
    ne $N19, 0.0, result
    ne $N20, 0.0, result
    ne $N21, 0.0, result
    ne $N22, 0.0, result
    ne $N23, 0.0, result
    ne $N24, 0.0, result
    ne $N25, 0.0, result
    ne $N26, 0.0, result
    ne $N27, 0.0, result
    ne $N28, 0.0, result
    ne $N29, 0.0, result
    ne $N30, 0.0, result
    ne $N31, 0.0, result

    $I0 = 1
  result:
    is($I0, 1, 'clearn')
.end

.sub test_exchange_n
    set $N1, 1.234560
    set $N2, 9.876540
    exchange $N1, $N2
    is( $N1, "9.87654", 'exchange n' )
    is( $N2, "1.23456", 'exchange n' )
    set $N3, -100.200300
    exchange $N3, $N3
    is( $N3, "-100.2003", 'exchange n' )
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

    $I0 = 0

    unless_null $S0, result
    unless_null $S1, result
    unless_null $S2, result
    unless_null $S3, result
    unless_null $S4, result
    unless_null $S5, result
    unless_null $S6, result
    unless_null $S7, result
    unless_null $S8, result
    unless_null $S9, result
    unless_null $S10, result
    unless_null $S11, result
    unless_null $S12, result
    unless_null $S13, result
    unless_null $S14, result
    unless_null $S15, result
    unless_null $S16, result
    unless_null $S17, result
    unless_null $S18, result
    unless_null $S19, result
    unless_null $S20, result
    unless_null $S21, result
    unless_null $S22, result
    unless_null $S23, result
    unless_null $S24, result
    unless_null $S25, result
    unless_null $S26, result
    unless_null $S27, result
    unless_null $S28, result
    unless_null $S29, result
    unless_null $S30, result
    unless_null $S31, result

    $I0 = 1
  result:
    is($I0, 1, 'clears')
.end

.sub test_exchange_s
    set $S0, "String #0"
    set $S1, "String #1"
    exchange $S0, $S1
    is( $S0, "String #1", 'exchange s' )
    is( $S1, "String #0", 'exchange s' )

    set $S2, "String #2"
    exchange $S2, $S2
    is( $S2, "String #2", 'exchange s' )
.end

.sub test_clearp
    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P2 = new ['Integer']
    $P3 = new ['Integer']
    $P4 = new ['Integer']
    $P5 = new ['Integer']
    $P6 = new ['Integer']
    $P7 = new ['Integer']
    $P8 = new ['Integer']
    $P9 = new ['Integer']
    clearp
    $I0 = 0
    unless_null $P0, result
    unless_null $P1, result
    unless_null $P2, result
    unless_null $P3, result
    unless_null $P4, result
    unless_null $P5, result
    unless_null $P6, result
    unless_null $P7, result
    unless_null $P8, result
    unless_null $P9, result
    $I0 = 1
  result:
    is($I0, 1, 'clearp')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
