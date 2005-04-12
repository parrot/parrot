#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/comp.t - Conditionals

=head1 SYNOPSIS

	% perl -Ilib t/op/comp.t

=head1 DESCRIPTION

Tests various conditional branch operations.

=cut

use Parrot::Test tests => 80;

# some of these were failing with JIT/i386

output_is(<<'CODE', <<OUTPUT, "gt_ic_i_ic");
	set I0, 10
	gt 11, I0, ok1
	print "nok gt\n"
ok1:
	print "ok 1\n"
	gt 9, I0, nok1
	print "ok 2\n"
	branch ok2
nok1:
	print "nok gt 2\n"
ok2:
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "ge_ic_i_ic");
	set I0, 10
	ge 11, I0, ok1
	print "nok ge\n"
ok1:
	print "ok 1\n"
	ge 9, I0, nok1
	print "ok 2\n"
	branch ok2
nok1:
	print "nok ge 2\n"
ok2:
	ge 10, I0, ok3
	print "nok ge 3\n"
ok3:
	print "ok 3\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "le_ic_i_ic");
	set I0, 10
	le 9, I0, ok1
	print "nok le\n"
ok1:
	print "ok 1\n"
	le 11, I0, nok1
	print "ok 2\n"
	branch ok2
nok1:
	print "nok le 2\n"
ok2:
	le 10, I0, ok3
	print "nok le 3\n"
ok3:
	print "ok 3\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "lt_ic_i_ic");
	set I0, 10
	lt 9, I0, ok1
	print "nok lt\n"
ok1:
	print "ok 1\n"
	lt 10, I0, nok1
	print "ok 2\n"
	branch ok2
nok1:
	print "nok lt 2\n"
ok2:
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "eq_ic_i_ic");
	set I0, 10
	eq 9, I0, nok1
	print "ok 1\n"
	branch ok1
nok1:
	print "nok eq\n"
ok1:
	eq 10, I0, ok2
	print "nok eq 2\n"
	end
ok2:
	print "ok 2\n"
	eq 11, 10, nok3
	print "ok 3\n"
	end
nok3:
	print "nok 3 eq \n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "ne_ic_i_ic");
	set I0, 10
	ne 9, I0, ok1
	print "nok 1\n"
	branch nok1
ok1:
	print "ok 1\n"
nok1:
	ne 10, I0, nok2
	print "ok 2\n"
	branch ok2
nok2:
	print "nok 2\n"
ok2:
	ne 11, 10, ok3
	print "nok 3\n"
	end
ok3:
	print "ok 3\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "cmp");
        set I0, 10
        cmp I1, I0, 9
        set N0, -2.4
        cmp I2, -2.4, N0
        set S0, "Bruhaha"
        cmp I3, S0, "Crumbum"
        new P0, .Integer
        new P1, .Integer
        set P0, 452
        set P1, -15
        cmp I4, P0, P1

        print I1
        print "\n"
        print I2
        print "\n"
        print I3
        print "\n"
        print I4
        print "\n"
	end
CODE
1
0
-1
1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "eq_num");
        new P0, .Float
        set P0, -1.2
        new P1, .String
        set P1, "-1.2"
        eq_num P0, P1, OK
        print "not "
OK:     print "ok\n"
        end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isgt I1, I2, I3
        print I1
        set I2, I3
        isgt I1, I2, I3
        print I1
        inc I2
        isgt I1, I2, I3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_ic_i");
        set I1, 111
        set I3, 333
        isgt I1, 222, I3
        print I1
        isgt I1, 333, I3
        print I1
        isgt I1, 334, I3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_i_ic");
        set I1, 111
        set I2, 222
        isgt I1, I2, 223
        print I1
        isgt I1, I2, 222
        print I1
        isgt I1, I2, 221
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_ic_ic");
        set I1, 111
        isgt I1, 222, 223
        print I1
        isgt I1, 222, 222
        print I1
        isgt I1, 222, 221
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isgt I1, N2, N3
        print I1
        set N2, N3
        isgt I1, N2, N3
        print I1
        inc N2
        isgt I1, N2, N3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_nc_n");
        set I1, 111
        set N3, 3.33
        isgt I1, 2.22, N3
        print I1
        isgt I1, 3.33, N3
        print I1
        isgt I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_n_nc");
        set I1, 111
        set N2, 2.22
        isgt I1, N2, 2.23
        print I1
        isgt I1, N2, 2.22
        print I1
        isgt I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_nc_nc");
        set I1, 111
        isgt I1, 2.22, 2.23
        print I1
        isgt I1, 2.22, 2.22
        print I1
        isgt I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isgt I1, S2, S3
        print I1
        set S2, S3
        isgt I1, S2, S3
        print I1
        set S2, "Ccc"
        isgt I1, S2, S3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isgt I1, "Aaa", S3
        print I1
        isgt I1, "Bbb", S3
        print I1
        isgt I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isgt I1, S2, "Ccc"
        print I1
        isgt I1, S2, "Bbb"
        print I1
        isgt I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isgt_i_sc_sc");
        set I1, 111
        isgt I1, "Bbb", "Ccc"
        print I1
        isgt I1, "Bbb", "Bbb"
        print I1
        isgt I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
001
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isge I1, I2, I3
        print I1
        set I2, I3
        isge I1, I2, I3
        print I1
        inc I2
        isge I1, I2, I3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_ic_i");
        set I1, 111
        set I3, 333
        isge I1, 222, I3
        print I1
        isge I1, 333, I3
        print I1
        isge I1, 334, I3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_i_ic");
        set I1, 111
        set I2, 222
        isge I1, I2, 223
        print I1
        isge I1, I2, 222
        print I1
        isge I1, I2, 221
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_ic_ic");
        set I1, 111
        isge I1, 222, 223
        print I1
        isge I1, 222, 222
        print I1
        isge I1, 222, 221
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isge I1, N2, N3
        print I1
        set N2, N3
        isge I1, N2, N3
        print I1
        inc N2
        isge I1, N2, N3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_nc_n");
        set I1, 111
        set N3, 3.33
        isge I1, 2.22, N3
        print I1
        isge I1, 3.33, N3
        print I1
        isge I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_n_nc");
        set I1, 111
        set N2, 2.22
        isge I1, N2, 2.23
        print I1
        isge I1, N2, 2.22
        print I1
        isge I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_nc_nc");
        set I1, 111
        isge I1, 2.22, 2.23
        print I1
        isge I1, 2.22, 2.22
        print I1
        isge I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isge I1, S2, S3
        print I1
        set S2, S3
        isge I1, S2, S3
        print I1
        set S2, "Ccc"
        isge I1, S2, S3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isge I1, "Aaa", S3
        print I1
        isge I1, "Bbb", S3
        print I1
        isge I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isge I1, S2, "Ccc"
        print I1
        isge I1, S2, "Bbb"
        print I1
        isge I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isge_i_sc_sc");
        set I1, 111
        isge I1, "Bbb", "Ccc"
        print I1
        isge I1, "Bbb", "Bbb"
        print I1
        isge I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
011
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isle I1, I2, I3
        print I1
        set I2, I3
        isle I1, I2, I3
        print I1
        inc I2
        isle I1, I2, I3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_ic_i");
        set I1, 111
        set I3, 333
        isle I1, 222, I3
        print I1
        isle I1, 333, I3
        print I1
        isle I1, 334, I3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_i_ic");
        set I1, 111
        set I2, 222
        isle I1, I2, 223
        print I1
        isle I1, I2, 222
        print I1
        isle I1, I2, 221
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_ic_ic");
        set I1, 111
        isle I1, 222, 223
        print I1
        isle I1, 222, 222
        print I1
        isle I1, 222, 221
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isle I1, N2, N3
        print I1
        set N2, N3
        isle I1, N2, N3
        print I1
        inc N2
        isle I1, N2, N3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_nc_n");
        set I1, 111
        set N3, 3.33
        isle I1, 2.22, N3
        print I1
        isle I1, 3.33, N3
        print I1
        isle I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_n_nc");
        set I1, 111
        set N2, 2.22
        isle I1, N2, 2.23
        print I1
        isle I1, N2, 2.22
        print I1
        isle I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_nc_nc");
        set I1, 111
        isle I1, 2.22, 2.23
        print I1
        isle I1, 2.22, 2.22
        print I1
        isle I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isle I1, S2, S3
        print I1
        set S2, S3
        isle I1, S2, S3
        print I1
        set S2, "Ccc"
        isle I1, S2, S3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isle I1, "Aaa", S3
        print I1
        isle I1, "Bbb", S3
        print I1
        isle I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isle I1, S2, "Ccc"
        print I1
        isle I1, S2, "Bbb"
        print I1
        isle I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isle_i_sc_sc");
        set I1, 111
        isle I1, "Bbb", "Ccc"
        print I1
        isle I1, "Bbb", "Bbb"
        print I1
        isle I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
110
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        islt I1, I2, I3
        print I1
        set I2, I3
        islt I1, I2, I3
        print I1
        inc I2
        islt I1, I2, I3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_ic_i");
        set I1, 111
        set I3, 333
        islt I1, 222, I3
        print I1
        islt I1, 333, I3
        print I1
        islt I1, 334, I3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_i_ic");
        set I1, 111
        set I2, 222
        islt I1, I2, 223
        print I1
        islt I1, I2, 222
        print I1
        islt I1, I2, 221
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_ic_ic");
        set I1, 111
        islt I1, 222, 223
        print I1
        islt I1, 222, 222
        print I1
        islt I1, 222, 221
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        islt I1, N2, N3
        print I1
        set N2, N3
        islt I1, N2, N3
        print I1
        inc N2
        islt I1, N2, N3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_nc_n");
        set I1, 111
        set N3, 3.33
        islt I1, 2.22, N3
        print I1
        islt I1, 3.33, N3
        print I1
        islt I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_n_nc");
        set I1, 111
        set N2, 2.22
        islt I1, N2, 2.23
        print I1
        islt I1, N2, 2.22
        print I1
        islt I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_nc_nc");
        set I1, 111
        islt I1, 2.22, 2.23
        print I1
        islt I1, 2.22, 2.22
        print I1
        islt I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        islt I1, S2, S3
        print I1
        set S2, S3
        islt I1, S2, S3
        print I1
        set S2, "Ccc"
        islt I1, S2, S3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        islt I1, "Aaa", S3
        print I1
        islt I1, "Bbb", S3
        print I1
        islt I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        islt I1, S2, "Ccc"
        print I1
        islt I1, S2, "Bbb"
        print I1
        islt I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "islt_i_sc_sc");
        set I1, 111
        islt I1, "Bbb", "Ccc"
        print I1
        islt I1, "Bbb", "Bbb"
        print I1
        islt I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
100
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        iseq I1, I2, I3
        print I1
        set I2, I3
        iseq I1, I2, I3
        print I1
        inc I2
        iseq I1, I2, I3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_ic_i");
        set I1, 111
        set I3, 333
        iseq I1, 222, I3
        print I1
        iseq I1, 333, I3
        print I1
        iseq I1, 334, I3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_i_ic");
        set I1, 111
        set I2, 222
        iseq I1, I2, 223
        print I1
        iseq I1, I2, 222
        print I1
        iseq I1, I2, 221
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_ic_ic");
        set I1, 111
        iseq I1, 222, 223
        print I1
        iseq I1, 222, 222
        print I1
        iseq I1, 222, 221
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        iseq I1, N2, N3
        print I1
        set N2, N3
        iseq I1, N2, N3
        print I1
        inc N2
        iseq I1, N2, N3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_nc_n");
        set I1, 111
        set N3, 3.33
        iseq I1, 2.22, N3
        print I1
        iseq I1, 3.33, N3
        print I1
        iseq I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_n_nc");
        set I1, 111
        set N2, 2.22
        iseq I1, N2, 2.23
        print I1
        iseq I1, N2, 2.22
        print I1
        iseq I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_nc_nc");
        set I1, 111
        iseq I1, 2.22, 2.23
        print I1
        iseq I1, 2.22, 2.22
        print I1
        iseq I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        iseq I1, S2, S3
        print I1
        set S2, S3
        iseq I1, S2, S3
        print I1
        set S2, "Ccc"
        iseq I1, S2, S3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        iseq I1, "Aaa", S3
        print I1
        iseq I1, "Bbb", S3
        print I1
        iseq I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        iseq I1, S2, "Ccc"
        print I1
        iseq I1, S2, "Bbb"
        print I1
        iseq I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "iseq_i_sc_sc");
        set I1, 111
        iseq I1, "Bbb", "Ccc"
        print I1
        iseq I1, "Bbb", "Bbb"
        print I1
        iseq I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
010
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isne I1, I2, I3
        print I1
        set I2, I3
        isne I1, I2, I3
        print I1
        inc I2
        isne I1, I2, I3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_ic_i");
        set I1, 111
        set I3, 333
        isne I1, 222, I3
        print I1
        isne I1, 333, I3
        print I1
        isne I1, 334, I3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_i_ic");
        set I1, 111
        set I2, 222
        isne I1, I2, 223
        print I1
        isne I1, I2, 222
        print I1
        isne I1, I2, 221
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_ic_ic");
        set I1, 111
        isne I1, 222, 223
        print I1
        isne I1, 222, 222
        print I1
        isne I1, 222, 221
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isne I1, N2, N3
        print I1
        set N2, N3
        isne I1, N2, N3
        print I1
        inc N2
        isne I1, N2, N3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_nc_n");
        set I1, 111
        set N3, 3.33
        isne I1, 2.22, N3
        print I1
        isne I1, 3.33, N3
        print I1
        isne I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_n_nc");
        set I1, 111
        set N2, 2.22
        isne I1, N2, 2.23
        print I1
        isne I1, N2, 2.22
        print I1
        isne I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_nc_nc");
        set I1, 111
        isne I1, 2.22, 2.23
        print I1
        isne I1, 2.22, 2.22
        print I1
        isne I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isne I1, S2, S3
        print I1
        set S2, S3
        isne I1, S2, S3
        print I1
        set S2, "Ccc"
        isne I1, S2, S3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isne I1, "Aaa", S3
        print I1
        isne I1, "Bbb", S3
        print I1
        isne I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isne I1, S2, "Ccc"
        print I1
        isne I1, S2, "Bbb"
        print I1
        isne I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
101
OUTPUT

output_is(<<'CODE', <<OUTPUT, "isne_i_sc_sc");
        set I1, 111
        isne I1, "Bbb", "Ccc"
        print I1
        isne I1, "Bbb", "Bbb"
        print I1
        isne I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
101
OUTPUT

1;
