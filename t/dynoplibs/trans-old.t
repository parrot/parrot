#!perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 13;
use Math::Trig qw( tan sec atan asin acos asec cosh sinh tanh sech );

=head1 NAME

t/op/trans.t - Transcendental Mathematical Ops

=head1 SYNOPSIS

    % prove t/op/trans.t

=head1 DESCRIPTION

Tests the transcendental mathematical operations.

=cut

# This defines two macros:
# fp_eq N, N, LABEL
# fp_ne N, N, LABEL
# which will conditionally branch
# to LABEL if abs(n,n) < epsilon

pasm_output_is( <<"CODE", <<OUTPUT, "sinh" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 1.0
        sinh N2, N1
        .fp_eq_pasm  (N2, 1.175201, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 1
        sinh N2, I1
        .fp_eq_pasm  (N2, 1.175201, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "tanh" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 1.0
        tanh N2, N1
        .fp_eq_pasm  (N2, 0.761594, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 1
        tanh N2, I1
        .fp_eq_pasm  (N2, 0.761594, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "sech" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 1.0
        sech N2, N1
        .fp_eq_pasm  (N2, 0.648054, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 1
        sech N2, I1
        .fp_eq_pasm  (N2, 0.648054, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, 'atan2' );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N0, 0.0
        set I0, 0
        set N1, 1.0
        set I1, 1
        set N2, 1.0
        set I2, 1
        set I3, -1
        set N3, -1.0

        atan N4, N1, N2
        .fp_eq_pasm  (N4, 0.785398, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        atan N4, N1, I2
        .fp_eq_pasm  (N4, 0.785398, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        atan N4, I1, N2
        .fp_eq_pasm  (N4, 0.785398, EQ3)
        print "not "
EQ3:    print "ok 3\\n"

        atan N4, I1, I2
        .fp_eq_pasm  (N4, 0.785398, EQ4)
        print "not "
EQ4:    print "ok 4\\n"

        atan N4, N3, 1.0
        .fp_eq_pasm   (N4, -0.785398, EQ5)
        print "not "
EQ5:    print "ok 5\\n"

        atan N4, N1, 0
        .fp_eq_pasm   (N4, 1.570796, EQ6)
        print "not "
EQ6:    print "ok 6\\n"

        atan N4, I3, 0.0
        .fp_eq_pasm   (N4, -1.570796, EQ7)
        print "not "
EQ7:    print "ok 7\\n"

        atan N4, I3, -1
        .fp_eq_pasm   (N4, -2.356194, EQ8)
        print "not "
EQ8:    print "ok 8\\n"

        atan N4, 1.0, N3
        .fp_eq_pasm   (N4, 2.356194, EQ9)
        print "not "
EQ9:    print "ok 9\\n"

        atan N4, 1.0, I0
        .fp_eq_pasm   (N4, 1.570796, EQ10)
        print "not "
EQ10:   print "ok 10\\n"

        atan N4, 1, N1
        .fp_eq_pasm   (N4, 0.785398, EQ11)
        print "not "
EQ11:   print "ok 11\\n"

        atan N4, 1, I1
        .fp_eq_pasm   (N4, 0.785398, EQ12)
        print "not "
EQ12:   print "ok 12\\n"

        atan N4, 0.0, 1.0
        .fp_eq_pasm   (N4, 0.000000, EQ13)
        print "not "
EQ13:   print "ok 13\\n"

        atan N4, -1.0, 0
        .fp_eq_pasm   (N4, -1.570796, EQ14)
        print "not "
EQ14:   print "ok 14\\n"

        atan N4, 1, -1.0
        .fp_eq_pasm   (N4, 2.356194, EQ15)
        print "not "
EQ15:   print "ok 15\\n"

        atan N4, 0, 1
        .fp_eq_pasm   (N4, 0.000000, EQ16)
        print "not "
EQ16:   print "ok 16\\n"
        end
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

pasm_output_is( <<"CODE", <<'OUTPUT', 'atan, part 2' );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        atan N4, -0.0, -0.0
        .fp_eq_pasm   (N4, -3.1415926, EQ1)
        print "not "
EQ1:    print "ok 1\\n"
        end
CODE
ok 1
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "log2" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 10.0
        log2 N2, N1
        .fp_eq_pasm  (N2, 3.321928, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 10
        log2 N2, I1
        .fp_eq_pasm  (N2, 3.321928, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "log10" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 15.0
        log10 N2, N1
        .fp_eq_pasm  (N2, 1.176091, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 15
        log10 N2, I1
        .fp_eq_pasm  (N2, 1.176091, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "ln" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 10.0
        ln N2, N1
        .fp_eq_pasm  (N2, 2.302585, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 10
        ln N2, I1
        .fp_eq_pasm  (N2, 2.302585, EQ2)
        print "not "
EQ2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "exp" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 10.0
        exp N2, N1
        .fp_eq_pasm  (N2, 22026.465795, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        set I1, 10
        exp N2, I1
        .fp_eq_pasm (N2, 22026.465795, EQ2)
        print "not "
EQ2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<OUTPUT, "pow" );
        .loadlib 'trans_ops'
        .include 'fp_equality.pasm'
        set N1, 3.0
        set I1, 3
        set N2, 5.0
        set I2, 5
        pow N3, N1, N2
        .fp_eq_pasm  (N3, 243.0, EQ1)
        print "not "
EQ1:    print "ok 1\\n"

        pow N3, N1, I2
        .fp_eq_pasm  (N3, 243.0, EQ2)
        print "not "
EQ2:    print "ok 2\\n"

        pow N3, I1, N2
        .fp_eq_pasm  (N3, 243.0, EQ3)
        print "not "
EQ3:    print "ok 3\\n"

        pow N3, I1, I2
        .fp_eq_pasm  (N3, 243.0, EQ4)
        print "not "
EQ4:    print "ok 4\\n"

        set N0, 0.0
        set I0, 0
        set N1, 1.0
        set I1, 1
        set N2, 4.0
        set I2, 4
        pow N3, N2, 2.5
        .fp_eq_pasm  (N3, 32.0, EQ5)
        print "not "
EQ5:    print "ok 5\\n"

        pow N3, N2, -2
        .fp_eq_pasm  (N3, 0.0625, EQ6)
        print "not "
EQ6:    print "ok 6\\n"

        pow N3, I2, 0.5
        .fp_eq_pasm  (N3, 2.0, EQ7)
        print "not "
EQ7:    print "ok 7\\n"

        pow N3, I2, 0
        .fp_eq_pasm  (N3, 1.0, EQ8)
        print "not "
EQ8:    print "ok 8\\n"

        pow N3, 0.0, N2
        .fp_eq_pasm  (N3, 0.0, EQ9)
        print "not "
EQ9:    print "ok 9\\n"

        pow N3, 2.5, 0.0
        .fp_eq_pasm  (N3, 1.0, EQ10)
        print "not "
EQ10:   print "ok 10\\n"

        pow N3, 2.5, I2
        .fp_eq_pasm  (N3, 39.0625, EQ11)
        print "not "
EQ11:   print "ok 11\\n"

        pow N3, 2.0, -4
        .fp_eq_pasm  (N3, 0.0625, EQ12)
        print "not "
EQ12:   print "ok 12\\n"

        pow N3, 0, N2
        .fp_eq_pasm  (N3, 0.0, EQ13)
        print "not "
EQ13:   print "ok 13\\n"

        pow N3, 4, -0.5
        .fp_eq_pasm  (N3, 0.5, EQ14)
        print "not "
EQ14:   print "ok 14\\n"

        pow N3, 4, I2
        .fp_eq_pasm  (N3, 256.0, EQ15)
        print "not "
EQ15:   print "ok 15\\n"

        pow N3, 4, -1
        .fp_eq_pasm  (N3, 0.25, EQ16)
        print "not "
EQ16:   print "ok 16\\n"
        end
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

pasm_output_is( <<"CODE", <<OUTPUT, "sqrt" );
       .include 'fp_equality.pasm'
       set N1, 9.0
       sqrt N2, N1
       .fp_eq_pasm  (N2, 3.0, EQ1)
       print "not "
EQ1:   print "ok 1\\n"

       set I1, 9
       sqrt N2, I1
       .fp_eq_pasm  (N2, 3.0, EQ2)
       print "not "
EQ2:   print "ok 2\\n"

       end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "pow_n_n_ic" );
    .loadlib 'trans_ops'
    set N0, 2.0
    pow N1, N0, 0
    print N1
    print "\n"
    pow N1, N0, 1
    print N1
    print "\n"
    pow N1, N0, 2
    print N1
    print "\n"
    pow N1, N0, 3
    print N1
    print "\n"
    pow N1, N0, 4
    print N1
    print "\n"
    pow N1, N0, 5
    print N1
    print "\n"
    pow N1, N0, 6
    print N1
    print "\n"
    pow N1, N0, 7
    print N1
    print "\n"
    pow N1, N0, -1
    print N1
    print "\n"
    pow N1, N0, -2
    print N1
    print "\n"
    pow N1, N0, -3
    print N1
    print "\n"
    pow N1, N0, -4
    print N1
    print "\n"
    pow N1, N0, -5
    end
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

pasm_output_is( <<'CODE', <<OUTPUT, "pow_n_n_i" );
    .loadlib 'trans_ops'
    set N0, 2.0
    set I0, 0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    inc I0
    pow N1, N0, I0
    print N1
    print "\n"
    set I0, -1
    pow N1, N0, I0
    print N1
    print "\n"
    dec I0
    pow N1, N0, I0
    print N1
    print "\n"
    dec I0
    pow N1, N0, I0
    print N1
    print "\n"
    dec I0
    pow N1, N0, I0
    print N1
    print "\n"
    dec I0
    pow N1, N0, I0
    print N1
    print "\n"
    dec I0
    pow N1, N0, I0
    print N1
    print "\n"
    end
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
