#!perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 21;

=head1 NAME

t/op/trans.t - Transcendental Mathematical Ops

=head1 SYNOPSIS

    % prove t/op/trans.t

=head1 DESCRIPTION

Tests the transcendental mathematical operations.

=cut

# simple tests of "result = opcode val"
test_opcode("sinh", 1, 1.175201);
test_opcode("tanh", 1, 0.761594);
test_opcode("sech", 1, 0.648054);
test_opcode("sqrt", 9, 3);
test_opcode("log2", 10, 3.321928);
test_opcode("log10", 15, 1.176091);
test_opcode("ln", 10, 2.302585);
test_opcode("exp", 10, 22026.465795);

# more complicated tests
pir_output_is( <<'CODE', <<OUTPUT, 'atan2' );
.loadlib 'trans_ops'
.sub test
        .include 'fp_equality.pir'
        set $N0, 0.0
        set $I0, 0
        set $N1, 1.0
        set $I1, 1
        set $N2, 1.0
        set $I2, 1
        set $I3, -1
        set $N3, -1.0

        atan $N4, $N1, $N2
        .fp_eq  ($N4, 0.785398, EQ1)
        print "not "
EQ1:    say "ok 1"

        atan $N4, $N1, $I2
        .fp_eq  ($N4, 0.785398, EQ2)
        print "not "
EQ2:    say "ok 2"

        atan $N4, $I1, $N2
        .fp_eq  ($N4, 0.785398, EQ3)
        print "not "
EQ3:    say "ok 3"

        atan $N4, $I1, $I2
        .fp_eq  ($N4, 0.785398, EQ4)
        print "not "
EQ4:    say "ok 4"

        atan $N4, $N3, 1.0
        .fp_eq   ($N4, -0.785398, EQ5)
        print "not "
EQ5:    say "ok 5"

        atan $N4, $N1, 0
        .fp_eq   ($N4, 1.570796, EQ6)
        print "not "
EQ6:    say "ok 6"

        atan $N4, $I3, 0.0
        .fp_eq   ($N4, -1.570796, EQ7)
        print "not "
EQ7:    say "ok 7"

        atan $N4, $I3, -1
        .fp_eq   ($N4, -2.356194, EQ8)
        print "not "
EQ8:    say "ok 8"

        atan $N4, 1.0, $N3
        .fp_eq   ($N4, 2.356194, EQ9)
        print "not "
EQ9:    say "ok 9"

        atan $N4, 1.0, $I0
        .fp_eq   ($N4, 1.570796, EQ10)
        print "not "
EQ10:   say "ok 10"

        atan $N4, 1, $N1
        .fp_eq   ($N4, 0.785398, EQ11)
        print "not "
EQ11:   say "ok 11"

        atan $N4, 1, $I1
        .fp_eq   ($N4, 0.785398, EQ12)
        print "not "
EQ12:   say "ok 12"

        atan $N4, 0.0, 1.0
        .fp_eq   ($N4, 0.000000, EQ13)
        print "not "
EQ13:   say "ok 13"

        atan $N4, -1.0, 0
        .fp_eq   ($N4, -1.570796, EQ14)
        print "not "
EQ14:   say "ok 14"

        atan $N4, 1, -1.0
        .fp_eq   ($N4, 2.356194, EQ15)
        print "not "
EQ15:   say "ok 15"

        atan $N4, 0, 1
        .fp_eq   ($N4, 0.000000, EQ16)
        print "not "
EQ16:   say "ok 16"
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
ok 15
ok 16
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'atan, part 2' );
.loadlib 'trans_ops'
.sub test
        .include 'fp_equality.pir'
        atan $N4, -0.0, -0.0
        .fp_eq   ($N4, -3.1415926, EQ1)
        print "not "
EQ1:    say "ok 1"
.end
CODE
ok 1
OUTPUT


pir_output_is( <<'CODE', <<OUTPUT, "pow" );
.loadlib 'trans_ops'
.sub test
        .include 'fp_equality.pir'
        set $N1, 3.0
        set $I1, 3
        set $N2, 5.0
        set $I2, 5
        pow $N3, $N1, $N2
        .fp_eq  ($N3, 243.0, EQ1)
        print "not "
EQ1:    say "ok 1"

        pow $N3, $N1, $I2
        .fp_eq  ($N3, 243.0, EQ2)
        print "not "
EQ2:    say "ok 2"

        pow $N3, $I1, $N2
        .fp_eq  ($N3, 243.0, EQ3)
        print "not "
EQ3:    say "ok 3"

        pow $N3, $I1, $I2
        .fp_eq  ($N3, 243.0, EQ4)
        print "not "
EQ4:    say "ok 4"

        set $N0, 0.0
        set $I0, 0
        set $N1, 1.0
        set $I1, 1
        set $N2, 4.0
        set $I2, 4
        pow $N3, $N2, 2.5
        .fp_eq  ($N3, 32.0, EQ5)
        print "not "
EQ5:    say "ok 5"

        pow $N3, $N2, -2
        .fp_eq  ($N3, 0.0625, EQ6)
        print "not "
EQ6:    say "ok 6"

        pow $N3, $I2, 0.5
        .fp_eq  ($N3, 2.0, EQ7)
        print "not "
EQ7:    say "ok 7"

        pow $N3, $I2, 0
        .fp_eq  ($N3, 1.0, EQ8)
        print "not "
EQ8:    say "ok 8"

        pow $N3, 0.0, $N2
        .fp_eq  ($N3, 0.0, EQ9)
        print "not "
EQ9:    say "ok 9"

        pow $N3, 2.5, 0.0
        .fp_eq  ($N3, 1.0, EQ10)
        print "not "
EQ10:   say "ok 10"

        pow $N3, 2.5, $I2
        .fp_eq  ($N3, 39.0625, EQ11)
        print "not "
EQ11:   say "ok 11"

        pow $N3, 2.0, -4
        .fp_eq  ($N3, 0.0625, EQ12)
        print "not "
EQ12:   say "ok 12"

        pow $N3, 0, $N2
        .fp_eq  ($N3, 0.0, EQ13)
        print "not "
EQ13:   say "ok 13"

        pow $N3, 4, -0.5
        .fp_eq  ($N3, 0.5, EQ14)
        print "not "
EQ14:   say "ok 14"

        pow $N3, 4, $I2
        .fp_eq  ($N3, 256.0, EQ15)
        print "not "
EQ15:   say "ok 15"

        pow $N3, 4, -1
        .fp_eq  ($N3, 0.25, EQ16)
        print "not "
EQ16:   say "ok 16"
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
ok 15
ok 16
OUTPUT


pir_output_is( <<'CODE', <<OUTPUT, "pow_n_n_ic" );
.loadlib 'trans_ops'
.sub test
    set $N0, 2.0
    pow $N1, $N0, 0
    say $N1
    pow $N1, $N0, 1
    say $N1
    pow $N1, $N0, 2
    say $N1
    pow $N1, $N0, 3
    say $N1
    pow $N1, $N0, 4
    say $N1
    pow $N1, $N0, 5
    say $N1
    pow $N1, $N0, 6
    say $N1
    pow $N1, $N0, 7
    say $N1
    pow $N1, $N0, -1
    say $N1
    pow $N1, $N0, -2
    say $N1
    pow $N1, $N0, -3
    say $N1
    pow $N1, $N0, -4
    say $N1
    pow $N1, $N0, -5
.end
CODE
1
2
4
8
16
32
64
128
0.5
0.25
0.125
0.0625
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "pow_n_n_i" );
.loadlib 'trans_ops'
.sub test
    set $N0, 2.0
    set $I0, 0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    inc $I0
    pow $N1, $N0, $I0
    say $N1
    set $I0, -1
    pow $N1, $N0, $I0
    say $N1
    dec $I0
    pow $N1, $N0, $I0
    say $N1
    dec $I0
    pow $N1, $N0, $I0
    say $N1
    dec $I0
    pow $N1, $N0, $I0
    say $N1
    dec $I0
    pow $N1, $N0, $I0
    say $N1
    dec $I0
    pow $N1, $N0, $I0
    say $N1
.end
CODE
1
2
4
8
16
32
64
0.5
0.25
0.125
0.0625
0.03125
0.015625
OUTPUT

sub test_opcode {
    my $operator = shift;
    my $input    = shift;
    my $value    = shift;

    pir_output_is( <<"CODE", "good", "$operator float" );

.loadlib 'trans_ops'
.sub test
    .include 'fp_equality.pir'
    set \$N1, ${input}.0
    $operator \$N2, \$N1
    .fp_eq (\$N2, $value, EQ)
    print "not "
EQ:
    print "good"
.end
CODE

    pir_output_is( <<"CODE", "good", "$operator int" );

.loadlib 'trans_ops'
.sub test
    .include 'fp_equality.pir'
    set \$I1, ${input}
    $operator \$N2, \$I1
    .fp_eq (\$N2, $value, EQ)
    print "not "
EQ:
    print "good"
.end
CODE

}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
