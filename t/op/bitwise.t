#!perl
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 27;
use Parrot::Config;

=head1 NAME

t/op/bitwise.t - Bitwise Ops

=head1 SYNOPSIS

        % prove t/op/bitwise.t

=head1 DESCRIPTION

Tests various bitwise logical operations.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_i_i (>>)" );
        set I0, 0b001100
        set I1, 0b010100
        set I2, 1
        set I3, 2
        shr I4, I0, I2
        shr I2, I0, I2
        shr I1, I1, I3
        print I4
        print "\n"
        print I2
        print "\n"
        print I1
        print "\n"
        print I0
        print "\n"
        end
CODE
6
6
5
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_i (>>)" );
        set I0, 0b001100
        set I1, 0b010100
        set I2, 1
        set I3, 2
        shr I0, I2
        shr I1, I3
        print I0
        print "\n"
        print I1
        print "\n"
        end
CODE
6
5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_i_ic (>>)" );
        set     I0, 0b001100
        set     I1, 0b010100
        shr     I2, I0, 1
        shr     I1, I1, 2
        print   I2
        print   "\n"
        print   I1
        print   "\n"
        print   I0
        print   "\n"
        end
CODE
6
5
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_ic_i (>>)" );
        set I0, 1
        set I1, 2
        shr I2, 0b001100, I0
        shr I1, 0b010100, I1
        print I2
        print "\n"
        print I1
        print "\n"
        end
CODE
6
5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_ic_ic (>>)" );
        shr I2, 0b001100, 1
        shr I1, 0b010100, 2
        print I2
        print "\n"
        print I1
        print "\n"
        end
CODE
6
5
OUTPUT

# The crux of this test is that a proper logical right shift
# will clear the most significant bit, so the shifted value
# will be a positive value on any 2's or 1's complement CPU
pasm_output_is( <<'CODE', <<'OUTPUT', "lsr_i_ic_ic (>>)" );
        lsr I2, -40, 1
        lt I2, 0, BAD
        print "OK\n"
        end
BAD:
        print "Not OK"
        print "\n"
        end
CODE
OK
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "lsr_i_ic (>>)" );
        set I2, -100
        lsr I2, 1
        lt I2, 0, BAD
        print "OK\n"
        end
BAD:
        print "Not OK"
        print "\n"
        end
CODE
OK
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "lsr_i_i_i (>>)" );
        set I0, -40
        set I1, 1
        lsr I2, I0, I1
        lt I2, 0, BAD
        print "OK\n"
        end
BAD:
        print "Not OK"
        print "\n"
        end
CODE
OK
OUTPUT

# ... and the missing op signature was untested and wrong in JIT/i386
pasm_output_is( <<'CODE', <<'OUTPUT', "lsr_i_i_ic (>>)" );
        set I0, -40
        lsr I2, I0, 1
        lt I2, 0, BAD
        print "OK\n"
        end
BAD:
        print "Not OK"
        print "\n"
        end
CODE
OK
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shr_i_i_ic (>>) negative" );
        set I0, -40
        shr I2, I0, 1
        ge I2, 0, BAD
        print "OK\n"
        end
BAD:
        print "Not OK"
        print "\n"
        end
CODE
OK
OUTPUT
pasm_output_is( <<'CODE', <<'OUTPUT', "shl_i_i_i (<<)" );
        set I0, 0b001100
        set I1, 0b010100
        set I2, 2
        set I3, 1
        shl I4, I0, I2
        shl I2, I0, I2
        shl I1, I1, I3
        print I4
        print "\n"
        print I2
        print "\n"
        print I1
        print "\n"
        print I0
        print "\n"
        end
CODE
48
48
40
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shl_i_i_ic (<<)" );
        set I0, 0b001100
        set I1, 0b010100
        shl I2, I0, 2
        shl I1, I1, 1
        print I2
        print "\n"
        print I1
        print "\n"
        print I0
        print "\n"
        end
CODE
48
40
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shl_i_ic_i (<<)" );
        set I0, 2
        set I1, 1
        shl I2, 0b001100, I0
        shl I1, 0b010100, I1
        print I2
        print "\n"
        print I1
        print "\n"
        end
CODE
48
40
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shl_i_ic_ic (<<)" );
        shl I2, 0b001100, 2
        shl I1, 0b010100, 1
        print I2
        print "\n"
        print I1
        print "\n"
        end
CODE
48
40
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "shl_i_i (<<)" );
        set I0, 0b001100
        set I1, 0b010100
        set I2, 1
        set I3, 2
        shl I0, I2
        shl I1, I3
        print I0
        print "\n"
        print I1
        print "\n"
        end
CODE
24
80
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bxor_i_i_i (^)" );
        set     I0, 0b001100
        set     I1, 0b100110
        bxor    I2, I0, I1
        print   I2
        print   "\n"
        bxor    I1, I0, I1
        print   I1
        print   "\n"
        print   I0
        print   "\n"
        end
CODE
42
42
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bxor_i_i_ic (^)" );
        set I0, 0b001100
        bxor I2, I0, 0b100110
        print I2
        print "\n"
        print I0
        print "\n"
        bxor I0, I0, 0b100110
        print I0
        print "\n"
        end
CODE
42
12
42
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bxor_i|ic (^)" );
        set I0, 0b001100
        set I2, 0b000011
        bxor I2, I0
        print I2
        print "\n"

        set I2, 0b001100
        bxor  I2, I0
        print I2
        print "\n"

        set I2, 0b101010
        bxor I2, I2
        print I2
        print "\n"

        set I2, 0b010101
        bxor I2, 0b000011
        print I2
        print "\n"

        end
CODE
15
0
0
22
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "band_i_i_i (&)" );
        set     I0, 0b001100
        set     I1, 0b010110
        band    I2, I0,I1
        print   I2
        print   "\n"
        band    I1,I0,I1
        print   I1
        print   "\n"
        print   I0
        print   "\n"
        end
CODE
4
4
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "band_i_i_ic (&)" );
        set I0, 0b001100
        band I2, I0,0b010110
        print I2
        print "\n"
        print I0
        print "\n"
        band I0,I0,0b010110
        print I0
        print "\n"
        end
CODE
4
12
4
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "band_i_i|ic (&)" );
        set I0, 0b001100
        set I2, 0b000011
        band I2, I0
        print I2
        print "\n"

        set I2, 0b001100
        band  I2, I0
        print I2
        print "\n"

        set I2, 0b101010
        band I2, I2
        print I2
        print "\n"

        set I2, 0b010101
        band I2, 0b000011
        print I2
        print "\n"

        end
CODE
0
12
42
1
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bor_i_i_i (|)" );
        set I0, 0b001100
        set I1, 0b010110
        bor I2, I0,I1
        print I2
        print "\n"
        bor I1,I0,I1
        print I1
        print "\n"
        print I0
        print "\n"
        end
CODE
30
30
12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bor_i_i_ic (|)" );
        set I0, 0b001100
        bor I2, I0,0b010110
        print I2
        print "\n"
        print I0
        print "\n"
        bor I0,I0,0b010110
        print I0
        print "\n"
        end
CODE
30
12
30
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "bor_i_i|ic (|)" );
        set I0, 0b001100
        set I2, 0b000011
        bor I2, I0
        print I2
        print "\n"

        set I2, 0b001100
        bor  I2, I0
        print I2
        print "\n"

        set I2, 0b101010
        bor I2, I2
        print I2
        print "\n"

        set I2, 0b010101
        bor I2, 0b000011
        print I2
        print "\n"

        end
CODE
15
12
42
23
OUTPUT

# use C<and> to only check low order bits, this should be platform nice
pasm_output_is( <<'CODE', <<'OUTPUT', "bnot_i_i (~)" );
        set     I0, 0b001100
        set     I1, 0b001100
        set     I31, 0b111111
        bnot    I2, I0
        band    I2, I2, I31
        print   I2
        print   "\n"
        bnot    I1, I1
        band    I1, I1, I31
        print   I1
        print   "\n"
        print   I0
        print   "\n"
        end
CODE
51
51
12
OUTPUT

my $int_bits = $PConfig{intvalsize} * 8;
pasm_output_is( <<"CODE", <<'OUTPUT', 'rot_i_i_ic_ic' );
    set I0, 0b001100
    rot I1, I0, 1, $int_bits   # 1 left
    print I1
    print "\\n"
    rot I1, I0, -1, $int_bits   # 1 right
    print I1
    print "\\n"
    end
CODE
24
6
OUTPUT

SKIP: {
    skip 'no BigInt lib found' => 1
        unless $PConfig{gmp};

    my @todo;
    @todo = ( todo => 'broken with JIT (RT #43245)' )
        if ( defined $ENV{TEST_PROG_ARGS} and 
            $ENV{TEST_PROG_ARGS} =~ /-j/ );

    pir_output_is( <<'CODE', <<'OUT', "I-reg shl and PMC shl are consistent", @todo );
## The PMC shl op will promote Integer to Bigint when needed.  We can't stuff a
## BigInt in an I register, but we can produce the same result modulo wordsize.
## [Only we cheat by using the word size minus one, so that we don't have to
## deal with negative numbers.  -- rgr, 2-Jun-07.]
.sub main :main
    ## Figure out the wordsize.  We need integer_modulus because assigning a
    ## too-big BigInt throws an error otherwise.
    .include 'sysinfo.pasm'
    .local int i_bytes_per_word, i_bits_per_word_minus_one
    .local pmc bits_per_word_minus_one, integer_modulus
    i_bytes_per_word = sysinfo .SYSINFO_PARROT_INTSIZE
    i_bits_per_word_minus_one = 8 * i_bytes_per_word
    dec i_bits_per_word_minus_one
    bits_per_word_minus_one = new 'Integer'
    bits_per_word_minus_one = i_bits_per_word_minus_one
    integer_modulus = new 'BigInt'
    integer_modulus = 1
    integer_modulus <<= bits_per_word_minus_one

    ## Test shifting a positive number.
    new $P0, 'Integer'
    set $P0, 1000001
    test_shift($P0, integer_modulus)

    ## Test shifting a negative number.
    set $P0, -1000001
    test_shift($P0, integer_modulus)
.end

.sub test_shift
    .param pmc number
    .param pmc integer_modulus
    new $P1, 'Integer'
    set $P1, 1
    .local int i_number
    i_number = number

    ## Start the loop.
loop:
    if $P1 > 100 goto done
    ## shift number and i_number into $P2 and $I2.
    shl $P2, number, $P1
    $I1 = $P1
    shl $I2, i_number, $I1
    ## compare in I registers.
    $P3 = mod $P2, integer_modulus
    $I3 = $P3
    if $I2 >= 0 goto pos_check
    ## The register op gave a negative result, but the modulus will always be
    ## positive.  If the truncated result is correct, then the difference will
    ## be the most negative INTVAL, which is the only number for which -x==x.
    $I4 = $I3 - $I2
    $I5 = - $I4
    if $I4 == $I5 goto ok
    goto bad
pos_check:
    if $I2 == $I3 goto ok
bad:
    print "oops; not ok: "
    print i_number
    print ' << '
    print $I1
    print ' gives I '
    print $I2
    print ' vs. P '
    print $P3
    print ".\n"
    print $I5
    print "\n"
ok:
    ## set up for the next one
    inc $P1
    goto loop
done:
    print "done.\n"
.end
CODE
done.
done.
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
