#!perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/bitwise.t - Bitwise Ops

=head1 SYNOPSIS

	% perl t/op/bitwise.t

=head1 DESCRIPTION

Tests various bitwise logical operations.

=cut

use Parrot::Test tests => 23;

output_is(<<'CODE', <<'OUTPUT', "shr_i_i_i (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "shr_i_i (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "shr_i_i_ic (>>)");
	set	I0, 0b001100
	set	I1, 0b010100
	shr	I2, I0, 1
	shr	I1, I1, 2
	print	I2
	print	"\n"
	print	I1
	print	"\n"
	print	I0
	print	"\n"
	end
CODE
6
5
12
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "shr_i_ic_i (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "shr_i_ic_ic (>>)");
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
output_is(<<'CODE', <<'OUTPUT', "lsr_i_ic_ic (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "lsr_i_ic (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "lsr_i_i_i (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "shl_i_i_i (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "shl_i_i_ic (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "shl_i_ic_i (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "shl_i_ic_ic (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "shl_i_i (<<)");
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

output_is(<<'CODE', <<'OUTPUT', "bxor_i_i_i (^)");
	set	I0, 0b001100
	set	I1, 0b100110
	bxor	I2, I0, I1
	print	I2
	print	"\n"
	bxor	I1, I0, I1
	print	I1
	print	"\n"
	print	I0
	print	"\n"
	end
CODE
42
42
12
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bxor_i_i_ic (^)");
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

output_is(<<'CODE', <<'OUTPUT', "bxor_i|ic (^)");
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

output_is(<<'CODE', <<'OUTPUT', "band_i_i_i (&)");
	set	I0, 0b001100
	set	I1, 0b010110
	band	I2, I0,I1
	print	I2
	print	"\n"
	band	I1,I0,I1
	print	I1
	print	"\n"
	print	I0
	print	"\n"
        end
CODE
4
4
12
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "band_i_i_ic (&)");
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

output_is(<<'CODE', <<'OUTPUT', "band_i_i|ic (&)");
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

output_is(<<'CODE', <<'OUTPUT', "bor_i_i_i (|)");
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

output_is(<<'CODE', <<'OUTPUT', "bor_i_i_ic (|)");
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

output_is(<<'CODE', <<'OUTPUT', "bor_i_i|ic (|)");
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
output_is(<<'CODE', <<'OUTPUT', "bnot_i_i (~)");
	set	I0, 0b001100
	set	I1, 0b001100
	set	I31, 0b111111
	bnot	I2, I0
	band	I2, I2, I31
	print	I2
	print	"\n"
	bnot	I1, I1
	band	I1, I1, I31
	print	I1
	print	"\n"
	print	I0
	print	"\n"
        end
CODE
51
51
12
OUTPUT
1;
