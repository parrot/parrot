#! perl -w

use Parrot::Test tests => 32;

output_is(<<CODE, <<OUTPUT, "set_i_ic");
	# XXX: Need a test for writing outside the set of available
	# registers.  Parrot doesn't check for this at the moment.
	set	I0, 0
	set	I1, 1
	set	I2, 2
	set	I3, 3
	set	I4, 4
	set	I5, 5
	set	I6, 6
	set	I7, 7
	set	I8, 8
	set	I9, 9
	set	I10, 10
	set	I11, 11
	set	I12, 12
	set	I13, 13
	set	I14, 14
	set	I15, 15
	set	I16, 16
	set	I17, 17
	set	I18, 18
	set	I19, 19
	set	I20, 20
	set	I21, 21
	set	I22, 22
	set	I23, 23
	set	I24, 24
	set	I25, 25
	set	I26, 26
	set	I27, 27
	set	I28, 28
	set	I29, 29
	set	I30, 30
	set	I31, 31

	print	I0
	print	"\\n"
	print	I1
	print	"\\n"
	print	I2
	print	"\\n"
	print	I3
	print	"\\n"
	print	I4
	print	"\\n"
	print	I5
	print	"\\n"
	print	I6
	print	"\\n"
	print	I7
	print	"\\n"
	print	I8
	print	"\\n"
	print	I9
	print	"\\n"
	print	I10
	print	"\\n"
	print	I11
	print	"\\n"
	print	I12
	print	"\\n"
	print	I13
	print	"\\n"
	print	I14
	print	"\\n"
	print	I15
	print	"\\n"
	print	I16
	print	"\\n"
	print	I17
	print	"\\n"
	print	I18
	print	"\\n"
	print	I19
	print	"\\n"
	print	I20
	print	"\\n"
	print	I21
	print	"\\n"
	print	I22
	print	"\\n"
	print	I23
	print	"\\n"
	print	I24
	print	"\\n"
	print	I25
	print	"\\n"
	print	I26
	print	"\\n"
	print	I27
	print	"\\n"
	print	I28
	print	"\\n"
	print	I29
	print	"\\n"
	print	I30
	print	"\\n"
	print	I31
	print	"\\n"
        end
	set	I0, 0
	end
CODE
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
OUTPUT

output_is(<<CODE, <<OUTPUT, "set_i");
	set	I0, 42
	set	I1, I0
	print	I1
	print	"\\n"
        end
CODE
42
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

        end
CODE
574908040
862362060
1724724120
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "abs(i, i|ic|n|nc)");
	set	I0, 1
	abs	I1, -1
	abs	I0, I0
	set	I2, -1
	abs	I2, I2
	print	I0
	print	"\n"	
	print	I1
	print	"\n"	
	print	I2
	print	"\n"	

	set	N0, 1.001
	abs	I0, N0
	abs	I1, 1.001
	print	I0
	print	I1
	print	"\n"

        set     N0, -1.001
        abs     I0, N0
        abs     I1, -1.001
	print	I0
	print	I1
	print	"\n"        

	end
CODE
1
1
1
11
11
OUTPUT

output_is(<<CODE, <<OUTPUT, "sub_(i|ic, i|ic)");
	set	I0, 0x12345678
	set	I1, 0x01234567
	sub	I2, I0, I1
	print	I2
	print	"\\n"

	set	I1, 1234
	sub	I0, I1, 1230
	print	I0
	sub	I0, 1244, I1
	print	I0
	sub	I0, 13, 12
	print	I0
	print	"\\n"
        end
CODE
286331153
4101
OUTPUT

output_is(<<CODE, <<OUTPUT, "mul_i");
	set	I0, 7
	set	I1, 29
	mul	I2, I0, I1
	print	I2
	print	"\\n"

	mul	I2, I0, 29
	print	I2
	print	"\\n"
        end
CODE
203
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

	set	I0, 12
	div	I1, 144, I0
	print	I1
	div	I1, I0, 3
	print	I1
	div	I1, 120, 12
	print	I1
	print	"\\n"

        end
CODE
3
5
-2
12410
OUTPUT

output_is(<<CODE, <<OUTPUT, "mod_i");
	set	I0, 5
	set	I1, 0
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 0
	set	I1, 3
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 5
	set	I1, 3
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 5
	set	I1, -3
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, -5
	set	I1, 3
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, -5
	set	I1, -3
	mod	I2, I0, I1
	print	I2
	print	"\\n"

	set	I0, 12
	mod	I1, I0, 10
	print	I1
	mod	I1, 14, I0
	print	I1
	mod	I1, 13, 11
	print	I1
	print	"\\n"

        end
CODE
5
0
2
-1
1
-2
222
OUTPUT

output_is(<<CODE, <<OUTPUT, "cmod_i");
	set	I0, 5
	set	I1, 3
#	cmod_i	I2, I0, I1
	cmod	I2, I0, I1
	print	I2
	print	"\\n"
	print	I0
	print	"\\n"
	print	I1
	print	"\\n"

	set	I0, 12
	cmod	I1, I0, 10
	print	I1
	cmod	I1, 14, I0
	print	I1
	cmod	I1, 13, 11
	print	I1
	print	"\\n"
        end
CODE
2
5
3
222
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_i_ic");
	set	I0, 0x12345678
	set	I1, 0x12345678
	set	I2, 0x76543210

	eq	I0, I1, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	eq	I1, I2, ERROR
        branch TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_ic_ic");
	set	I0, -42

	eq	I0, 42, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	eq	I0, -42, TWO
        branch ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"

	set	I0, 12
	eq	I0, 12, THREE
	print	"not good three "
THREE:	print	"ok 3\\n"

	eq	12, 12, FOUR
	print	"12 not 12, what? "
FOUR:	print	"ok 4\\n"

	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq i, i|ic (pop label from stack)");
	set	I0, 12
	set	I1, 12

	print	"the word\\n"
	bsr	BR1
	print	"done 1\\n"
	bsr	BR2
	print	"done 2\\n"
	bsr	BR3
	print	"done 3\\n"

	end

BR1:	eq	12, I0
	print	"not equal, or did not jump "
	ret

BR2:	eq	10, 10
	print	"not equal, or did not jump 2 "
	ret

BR3:	eq	I0, I1
	print	"not equal, equal int regs "
	ret

CODE
the word
done 1
done 2
done 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_i_ic");
	set	I0, 0xa0b0c0d
	set	I1, 0xa0b0c0d
	set	I2, 0

	ne	I0, I2, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ne	I0, I1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_ic_ic");
	set	I0, 427034409

	ne	I0, 427034409, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ne	I0, 427034408, TWO
        branch  ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne ic, i (pop label off stack)");

	set	I0, 12
	set	I1, 10

	print	"start\\n"
	bsr	BR1
	print	"done 1\\n"
	bsr	BR2
	print	"done 2\\n"
	bsr	BR3
	print	"done 3\\n"

	end

BR1:	ne	I0, 10
	print	"bad "
	ret

BR2:	ne	10, 12
	print	"10 is 12! "
	ret

BR3:	ne	I0, I1
	print	"10 is 12, even when in I reg "
	ret
CODE
start
done 1
done 2
done 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_i_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0
	set	I3, 0

	lt	I1, I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	lt	I0, I1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	lt	I2, I3, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_ic_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	lt	I0, -2147483648, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	lt	I1, 2147483647, TWO
        branch  ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	lt	I0, 0, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
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

	le	I1, I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	le	I0, I1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	le	I2, I3, THREE
        branch  ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_ic_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	le	I0, -2147483648, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	le	I1, 2147483647, TWO
        branch  ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	le	I2, 0, THREE
        branch  ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
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

	gt	I1, I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	gt	I0, I1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	gt	I2, I3, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_ic_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0

	gt	I0, 2147483647, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	gt	I1, -2147483648, TWO
        branch  ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	gt	I0, 0, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
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

	ge	I1, I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ge	I0, I1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	ge	I2, I3, THREE
        branch  ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print "bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_ic_ic");
	set	I0, -2147483648
	set	I1, 2147483647
	set	I2, 0

	ge	I0, 2147483647, ERROR
        branch  ONE
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	ge	I1, -2147483648, TWO
        branch  ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	ge	I2, 0, THREE
        branch  ERROR
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
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

        end
CODE
1
5
OUTPUT

output_is(<<CODE, <<OUTPUT, "inc_i_i");
	set	I0, 0
        set     I1, 2
        set     I2, -2

	inc	I0, I1
	print	I0
	print	"\\n"

	inc	I0, I2
	print	I0
	print	"\\n"
        end
CODE
2
0
OUTPUT

output_is(<<CODE, <<OUTPUT, "inc_i_ic");
	set	I0, 0

	inc	I0, 5
	print	I0
	print	"\\n"

	inc	I0, -10
	print	I0
	print	"\\n"
        end
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

        end
CODE
-1
-5
OUTPUT

output_is(<<CODE, <<OUTPUT, "dec_i_i");
	set	I0, 0
        set     I1, 3
        set     I2, -3
 
	dec	I0, I1
	print	I0
	print	"\\n"

	dec	I0, I2
	print	I0
	print	"\\n"
        end
CODE
-3
0
OUTPUT

output_is(<<CODE, <<OUTPUT, "dec_i_ic");
	set	I0, 0

	dec	I0, 5
	print	I0
	print	"\\n"

	dec	I0, -10
	print	I0
	print	"\\n"
        end
CODE
-5
5
OUTPUT

output_is(<<CODE, <<OUTPUT, "set_n_i");
	set	I0, 0
	set	N0, I0
	print	N0
	print	"\\n"

	set	I1, 2147483647
	set	N1, I1
	print	N1
	print	"\\n"

	set	I2, -2147483648
	set	N2, I2
	print	N2
	print	"\\n"
        end
CODE
0.000000
2147483647.000000
-2147483648.000000
OUTPUT

output_is(<<CODE, <<OUTPUT, "cleari");
	set	I0, 0xdeadbee
	set	I1, 0xdeadbee
	set	I2, 0xdeadbee
	set	I3, 0xdeadbee
	set	I4, 0xdeadbee
	set	I5, 0xdeadbee
	set	I6, 0xdeadbee
	set	I7, 0xdeadbee
	set	I8, 0xdeadbee
	set	I9, 0xdeadbee
	set	I10, 0xdeadbee
	set	I11, 0xdeadbee
	set	I12, 0xdeadbee
	set	I13, 0xdeadbee
	set	I14, 0xdeadbee
	set	I15, 0xdeadbee
	set	I16, 0xdeadbee
	set	I17, 0xdeadbee
	set	I18, 0xdeadbee
	set	I19, 0xdeadbee
	set	I20, 0xdeadbee
	set	I21, 0xdeadbee
	set	I22, 0xdeadbee
	set	I23, 0xdeadbee
	set	I24, 0xdeadbee
	set	I25, 0xdeadbee
	set	I26, 0xdeadbee
	set	I27, 0xdeadbee
	set	I28, 0xdeadbee
	set	I29, 0xdeadbee
	set	I30, 0xdeadbee
	set	I31, 0xdeadbee
	cleari
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
        end
CODE
00000000000000000000000000000000
OUTPUT

output_is(<<CODE, <<OUTPUT, "neg_i");
    neg I0,3
    neg I0,I0
    print I0
    print "\\n"
    end
CODE
3
OUTPUT

1;
