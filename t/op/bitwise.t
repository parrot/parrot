#! perl -w

use Parrot::Test tests => 4;

output_is(<<'CODE', <<'OUTPUT', "shr_i_ic (>>)");
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

output_is(<<'CODE', <<'OUTPUT', "xor_i");
	set	I0, 0b001100
	set	I1, 0b100110
	xor	I2, I0, I1
	print	I2
	print	"\n"
	xor	I1, I0, I1
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

output_is(<<'CODE', <<'OUTPUT', "and_i");
	set	I0, 0b001100
	set	I1, 0b010110
	and	I2, I0,I1
	print	I2
	print	"\n"
	and	I1,I0,I1
	print	I1
	print	"\n"
	print	I0
	print	"\n"
CODE
4
4
12
OUTPUT

# use C<and> to only check low order bits, this should be platform nice
output_is(<<'CODE', <<'OUTPUT', "not_i");
	set	I0, 0b001100
	set	I1, 0b001100
	set	I31, 0b111111
	not	I2, I0
	and	I2, I2, I31
	print	I2
	print	"\n"
	not	I1, I1
	and	I1, I1, I31
	print	I1
	print	"\n"
	print	I0
	print	"\n"
CODE
51
51
12
OUTPUT
1;
