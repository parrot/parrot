#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/comp.t - Conditionals

=head1 SYNOPSIS

	% perl t/op/comp.t

=head1 DESCRIPTION

Tests various conditional branch operations.

=cut

use Parrot::Test tests => 8;

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
        new P0, .PerlInt
        new P1, .PerlInt
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
        new P0, .PerlNum
        set P0, -1.2
        new P1, .PerlString
        set P1, "-1.2"
        eq_num P0, P1, OK
        print "not "
OK:     print "ok\n"
        end
CODE
ok
OUTPUT

1;


