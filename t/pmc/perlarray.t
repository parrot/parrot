#! perl -w

use Parrot::Test tests => 6;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "size of the array");
	new P0,.PerlArray
        set P0,0
        set I0,P0
        print I0
        print "\n"

	set P0,1
	set I0,P0
	print I0
	print "\n"

        set P0,5
        set I0,P0
        print I0
        print "\n"
       
        end
CODE
0
1
5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get by index");
        new P0,.PerlArray
	set P0,0,3       # set P0[0], 3
	set I1,P0,0      # set I1, P0[0]
	print I1
	print "\n"

	set P0,2
	set P0,1,3.7     # set P0[1], 3.7
	set N1,P0,1      # set N1, P0[1]
	print N1
	print "\n"

	set P0,3
	set P0,2,"hey"   # set P0[2], "hey"
	set S1,P0,2      # set S1, P0[2]
	print S1
	print "\n"

        set P0, 4
        new P1, .PerlInt
        set P1, 42
	set P0,3,P1      # set P0[3], P1
	set P2,P0,3      # set S1, P0[3]
	print P2
	print "\n"

        end
CODE
3
3.700000
hey
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "same, but with implicit resizing");
        new P0,.PerlArray
	set P0,0,3       # set P0[0], 3
	set I1,P0,0      # set I1, P0[0]
	print I1
	print "\n"

	set P0,1,3.7     # set P0[1], 3.7
	set N1,P0,1      # set N1, P0[1]
	print N1
	print "\n"

	set P0,2,"hey"   # set P0[2], "hey"
	set S1,P0,2      # set S1, P0[2]
	print S1
	print "\n"

        new P1, .PerlInt
        set P1, 42
	set P0,3,P1      # set P0[3], P1
	set P2,P0,3      # set S1, P0[3]
	print P2
	print "\n"

        end
CODE
3
3.700000
hey
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "keys of different types");
        new P0, .PerlArray
        set P0, 5.0, 3
        set I0, P0
        bsr PRINT
        set P0, "10", 6
        set I0, P0
        bsr PRINT
        set P0, 15, 9
        set I0, P0
        bsr PRINT
        set I0, P0, 5
        bsr PRINT
        set I0, P0, 10
        bsr PRINT
        set I0, P0, 15
        bsr PRINT
        end
PRINT:
        print I0
        print "\n"
        ret
CODE
6
11
16
3
6
9
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "If P");
        new P0, .PerlArray
        if P0, TR
        print "false\n"
        branch NEXT   
TR:     print "true\n"

NEXT:   set P0, 0, 1      # set P0[0], 1
        if P0, TR2
        print "false\n"
        branch NEXT2
TR2:    print "true\n"

NEXT2:  new P1, .PerlArray
        set P1, 1
        if P1, TR3
        print "false\n"
        branch NEXT3
TR3:    print "true\n"

NEXT3:  set P1, 0
        if P1, TR4
        print "false\n"
        end
TR4:    print "true\n"        
        end

CODE
false
true
true
false
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Negative and Positive array accesses");
	new P0,.PerlArray

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,0,7         # set P0[0], 7

	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set I0,P0,0        # set I0, P0[0]
	eq I0,7,OK_3
	print "not "
OK_3:	print "ok 3\n"

	set I0,P0,-1       # set I0, P0[-1]
	eq I0,7,OK_4
	print "not "
OK_4:	print "ok 4\n"

	set P0,-1,7        # set P0[-1], 7

	set I0,P0
	eq I0,1,OK_5
	print "not "
OK_5:	print "ok 5\n"

	set I0,P0,0        # set I0, P0[0]
	eq I0,7,OK_6
	print "not "
OK_6:	print "ok 6\n"

	set I0,P0,-1       # set I0, P0[-1]
	eq I0,7,OK_7
	print "not "
OK_7:	print "ok 7\n"

	set P0,0,7.2       # set P0[0], 7.2

	set I0,P0
	eq I0,1,OK_8
	print "not "
OK_8:	print "ok 8\n"

	set N0,P0,0        # set N0, P0[0]
	eq N0,7.2,OK_9
	print "not "
OK_9:	print "ok 9\n"

	set N0,P0,-1       # set N0, P0[-1]
	eq N0,7.2,OK_10
	print "not "
OK_10:	print "ok 10\n"

	set P0,-1,7.2      # set P0[-1], 7.2

	set I0,P0
	eq I0,1,OK_11
	print "not "
OK_11:	print "ok 11\n"

	set N0,P0,0        # set N0, PO[0]
	eq N0,7.2,OK_12
	print "not "
OK_12:	print "ok 12\n"

	set N0,P0,-1       # set N0, P0[-1]
	eq N0,7.2,OK_13
	print "not "
OK_13:	print "ok 13\n"

	set P0,0,"Buckaroo" # set P0[0], "Buckaroo"

	set I0,P0
	eq I0,1,OK_14
	print "not "
OK_14:	print "ok 14\n"

	set S0,P0,0        # set S0, P0[0]
	eq S0,"Buckaroo",OK_15
	print "not "
OK_15:	print "ok 15\n"

	set S0,P0,-1       # set S0, P0[-1]
	eq S0,"Buckaroo",OK_16
	print "not "
OK_16:	print "ok 16\n"

	set P0,-1,"Buckaroo" # set P0[-1], "Buckaroo"

	set I0,P0
	eq I0,1,OK_17
	print "not "
OK_17:	print "ok 17\n"

	set S0,P0,0        # set S0, P0[0]
	eq S0,"Buckaroo",OK_18
	print "not "
OK_18:	print "ok 18\n"

	set S0,P0,-1       # set S0, P0[-1]
	eq S0,"Buckaroo",OK_19
	print "not "
OK_19:	print "ok 19\n"

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
ok 17
ok 18
ok 19
OUTPUT

1;
