#! perl -w

use Parrot::Test tests => 26;

output_is(<<CODE, <<OUTPUT, "set_i_ic");
	# XXX: Need a test for writing outside the set of available
	# registers.  Parrot doesn't check for this at the moment.
	set	I0, 0x12345678
	print	I0
	print	"\\n"
	set	I31, 0x9abcdef1
	print	I31
	print	"\\n"

	set	I1, 2147483647
	print	I1
	print	"\\n"
	set	I2, -2147483648
	print	I2
	print	"\\n"
	set	I3, 4294967295
	print	I3
	print	"\\n"
CODE
305419896
-1698898191
2147483647
-2147483648
-1
OUTPUT

output_is(<<CODE, <<OUTPUT, "set_i");
	set	I0, 0x77665544
	set	I1, I0
	print	I1
	print	"\\n"
CODE
2003195204
OUTPUT

output_is(<<CODE, <<OUTPUT, "add_i");
	set	I0, 0x11223344
	add	I1, I0, I0
	print	I1
	print	"\\n"

	add	I2, I0, I1	
	print	I2
	print	"\\n"

	add	I2, I2, I2
	print	I2
	print	"\\n"

	set	I3, 2147483647
	set	I4, 1
	add	I5, I3, I4
	print	I5
	print	"\\n"
	set	I6, -1
	add	I7, I5, I6
	print	I7
	print	"\\n"
CODE
574908040
862362060
1724724120
-2147483648
2147483647
OUTPUT

output_is(<<CODE, <<OUTPUT, "sub_i");
	set	I0, 0x12345678
	set	I1, 0x01234567
	sub	I2, I0, I1
	print	I2
	print	"\\n"
CODE
286331153
OUTPUT

output_is(<<CODE, <<OUTPUT, "mul_i");
	set	I0, 7
	set	I1, 29
	mul	I2, I0, I1
	print	I2
	print	"\\n"
CODE
203
OUTPUT

output_is(<<CODE, <<OUTPUT, "div_i");
	set	I0, 0x33333333
	set	I1, 0x11111111
	div	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 11
	set	I1, 2
	div	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 9
	set	I1, -4
	div	I2, I0, I1
	print	I2
	print	"\\n"
CODE
3
5
-2
OUTPUT

output_is(<<CODE, <<OUTPUT, "mod_i");
	set	I0, 17
	set	I1, 5
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, -57
	set	I1, 10
	mod	I2, I0, I1
	print	I2
	print	"\\n"
CODE
2
-7
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_i_ic");
	set	I0, 0x12345678
	set	I1, 0x12345678
	set	I2, 0x76543210

	eq	I0, I1, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	eq	I1, I2, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_ic_ic");
	set	I0, -42

	eq	I0, 42, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	eq	I0, -42, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_i_ic");
	set	I0, 0xa0b0c0d0
	set	I1, 0xa0b0c0d0
	set	I2, 0

	ne	I0, I2, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ne	I0, I1, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_ic_ic");
	set	I0, 427034409

	ne	I0, 427034409, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ne	I0, 427034408, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_i_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0
	set	I3, 0

	lt	I1, I0, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	lt	I0, I1, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	lt	I2, I3, ERROR, THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_ic_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	lt	I0, -2147483648, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	lt	I1, 2147483647, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	lt	I0, 0, ERROR, THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_i_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0
	set	I3, 0

	le	I1, I0, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	le	I0, I1, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	le	I2, I3, THREE, ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_ic_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	le	I0, -2147483648, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	le	I1, 2147483647, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	le	I2, 0, THREE, ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_i_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0
	set	I3, 0

	gt	I1, I0, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	gt	I0, I1, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	gt	I2, I3, ERROR, THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_ic_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0

	gt	I0, 2147483647, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	gt	I1, -2147483648, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	gt	I0, 0, ERROR, THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_i_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0
	set	I3, 0

	ge	I1, I0, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ge	I0, I1, ERROR, TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	ge	I2, I3, THREE, ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_ic_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0

	ge	I0, 2147483647, ERROR, ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ge	I1, -2147483648, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	ge	I2, 0, THREE, ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "if_i_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	if_i_ic	I0, ONE, ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	if_i_ic	I1, TWO, ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	if_i_ic	I2, ERROR, THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "inc_i");
	set	I0, 0

	inc	I0
	print	I0
	print	"\\n"

	inc	I0
	inc	I0
	inc	I0
	inc	I0
	print	I0
	print	"\\n"

	# Overflow
	set	I1, 2147483647
	inc	I1
	print	I1
	print	"\\n"
CODE
1
5
-2147483648
OUTPUT

output_is(<<CODE, <<OUTPUT, "inc_i_ic");
	set	I0, 0

	inc	I0, 5
	print	I0
	print	"\\n"

	inc	I0, -10
	print	I0
	print	"\\n"
CODE
5
-5
OUTPUT

output_is(<<CODE, <<OUTPUT, "dec_i");
	set	I0, 0

	dec	I0
	print	I0
	print	"\\n"

	dec	I0
	dec	I0
	dec	I0
	dec	I0
	print	I0
	print	"\\n"

	# Overflow
	set	I1, -2147483648
	dec	I1
	print	I1
	print	"\\n"
CODE
-1
-5
2147483647
OUTPUT

output_is(<<CODE, <<OUTPUT, "dec_i_ic");
	set	I0, 0

	dec	I0, 5
	print	I0
	print	"\\n"

	dec	I0, -10
	print	I0
	print	"\\n"
CODE
-5
5
OUTPUT

output_is(<<CODE, <<OUTPUT, "iton_n_i");
	set	I0, 0
	iton	N0, I0
	print	N0
	print	"\\n"

	set	I1, 2147483647
	iton	N1, I1
	print	N1
	print	"\\n"

	set	I2, -2147483648
	iton	N2, I2
	print	N2
	print	"\\n"
CODE
0.000000
2147483647.000000
-2147483648.000000
OUTPUT

output_is(<<CODE, <<OUTPUT, "clear_i");
	set	I0, 0xdeadbeef
	set	I1, 0xdeadbeef
	set	I2, 0xdeadbeef
	set	I3, 0xdeadbeef
	set	I4, 0xdeadbeef
	set	I5, 0xdeadbeef
	set	I6, 0xdeadbeef
	set	I7, 0xdeadbeef
	set	I8, 0xdeadbeef
	set	I9, 0xdeadbeef
	set	I10, 0xdeadbeef
	set	I11, 0xdeadbeef
	set	I12, 0xdeadbeef
	set	I13, 0xdeadbeef
	set	I14, 0xdeadbeef
	set	I15, 0xdeadbeef
	set	I16, 0xdeadbeef
	set	I17, 0xdeadbeef
	set	I18, 0xdeadbeef
	set	I19, 0xdeadbeef
	set	I20, 0xdeadbeef
	set	I21, 0xdeadbeef
	set	I22, 0xdeadbeef
	set	I23, 0xdeadbeef
	set	I24, 0xdeadbeef
	set	I25, 0xdeadbeef
	set	I26, 0xdeadbeef
	set	I27, 0xdeadbeef
	set	I28, 0xdeadbeef
	set	I29, 0xdeadbeef
	set	I30, 0xdeadbeef
	set	I31, 0xdeadbeef
	clear_i
	print	I0
	print	I1
	print	I2
	print	I3
	print	I4
	print	I5
	print	I6
	print	I7
	print	I8
	print	I9
	print	I10
	print	I11
	print	I12
	print	I13
	print	I14
	print	I15
	print	I16
	print	I17
	print	I18
	print	I19
	print	I20
	print	I21
	print	I22
	print	I23
	print	I24
	print	I25
	print	I26
	print	I27
	print	I28
	print	I29
	print	I30
	print	I31
	print	"\\n"
CODE
00000000000000000000000000000000
OUTPUT
