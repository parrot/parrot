#! perl -w

use Parrot::Test tests => 15;
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
	set P0[0],3
	set I1,P0[0]
	print I1
	print "\n"

	set P0,2
	set P0[1],3.7
	set N1,P0[1]
	print N1
	print "\n"

	set P0,3
	set P0[2],"hey"
	set S1,P0[2]
	print S1
	print "\n"

        set P0, 4
        new P1, .PerlInt
        set P1, 42
	set P0[3],P1
	set P2,P0[3]
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
	set P0[0],3
	set I1,P0[0]
	print I1
	print "\n"

	set P0[1],3.7
	set N1,P0[1]
	print N1
	print "\n"

	set P0[2],"hey"
	set S1,P0[2]
	print S1
	print "\n"

        new P1, .PerlInt
        set P1, 42
	set P0[3],P1
	set P2,P0[3]
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
        set P0[5.0], 3
        set I0, P0
        bsr PRINT
        set P0["10"], 6
        set I0, P0
        bsr PRINT
        set P0[15], 9
        set I0, P0
        bsr PRINT
        set I0, P0[5]
        bsr PRINT
        set I0, P0[10]
        bsr PRINT
        set I0, P0[15]
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

NEXT:   set P0[0], 1
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

	set P0[0],7

	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set I0,P0[0]
	eq I0,7,OK_3
	print "not "
OK_3:	print "ok 3\n"

	set I0,P0[-1]
	eq I0,7,OK_4
	print "not "
OK_4:	print "ok 4\n"

	set P0[-1],7

	set I0,P0
	eq I0,1,OK_5
	print "not "
OK_5:	print "ok 5\n"

	set I0,P0[0]
	eq I0,7,OK_6
	print "not "
OK_6:	print "ok 6\n"

	set I0,P0[-1]
	eq I0,7,OK_7
	print "not "
OK_7:	print "ok 7\n"

	set P0[0],7.2

	set I0,P0
	eq I0,1,OK_8
	print "not "
OK_8:	print "ok 8\n"

	set N0,P0[0]
	eq N0,7.2,OK_9
	print "not "
OK_9:	print "ok 9\n"

	set N0,P0[-1]
	eq N0,7.2,OK_10
	print "not "
OK_10:	print "ok 10\n"

	set P0[-1],7.2

	set I0,P0
	eq I0,1,OK_11
	print "not "
OK_11:	print "ok 11\n"

	set N0,P0[0]
	eq N0,7.2,OK_12
	print "not "
OK_12:	print "ok 12\n"

	set N0,P0[-1]
	eq N0,7.2,OK_13
	print "not "
OK_13:	print "ok 13\n"

	set P0[0],"Buckaroo"

	set I0,P0
	eq I0,1,OK_14
	print "not "
OK_14:	print "ok 14\n"

	set S0,P0[0]
	eq S0,"Buckaroo",OK_15
	print "not "
OK_15:	print "ok 15\n"

	set S0,P0[-1]
	eq S0,"Buckaroo",OK_16
	print "not "
OK_16:	print "ok 16\n"

	set P0[-1],"Buckaroo"

	set I0,P0
	eq I0,1,OK_17
	print "not "
OK_17:	print "ok 17\n"

	set S0,P0[0]
	eq S0,"Buckaroo",OK_18
	print "not "
OK_18:	print "ok 18\n"

	set S0,P0[-1]
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

output_is(<<'CODE', <<'OUTPUT', "Bracketed access test suite");
      new P0, .PerlArray

      #
      # Make sure an uninitialized PerlArray has a length of 0
      #
      set   I0, P0
      eq    I0, 0, OK_1
      print "not "
OK_1: print "ok 1\n"

#---------------------------------------------
#
# Integer constants
#

      #
      # Set index zero to 7
      #
      set   P0[0], 7

      #
      # Make sure the length is 1
      #
      set   I0, P0
      eq    I0, 1, OK_2
      print "not "
OK_2: print "ok 2\n"

      #
      # Make sure index zero is indeed 7
      set   I0, P0[0]
      eq    I0, 7, OK_3
      print "not "
OK_3: print "ok 3\n"

      #
      # Set index zero to -15
      #
      set   P0[0], -15

      #
      # Make sure the length is 1
      #
      set   I0, P0
      eq    I0, 1, OK_4
      print "not "
OK_4: print "ok 4\n"

      #
      # Make sure index zero is indeed 7
      set   I0, P0[0]
      eq    I0, -15, OK_5
      print "not "
OK_5: print "ok 5\n"

      #
      # Set index zero to 3.7
      #
      set   P0[0], 3.7

      #
      # Make sure the length is 1
      #
      set   I0, P0
      eq    I0, 1, OK_6
      print "not "
OK_6: print "ok 6\n"

      #
      # Make sure index zero is indeed 3.7
      #
      set   N0, P0[0]
      eq    N0, 3.700000, OK_7
      print "not "
OK_7: print "ok 7\n"

      #
      # Set index zero to "foo"
      #
      set   P0[0], "foo"

      #
      # Make sure the length is 1
      #
      set   I0, P0
      eq    I0, 1, OK_8
      print "not "
OK_8: print "ok 8\n"

      #
      # Make sure index zero is indeed "foo"
      #
      set   S0, P0[0]
      eq    S0, "foo", OK_9
      print "not "
OK_9: print "ok 9\n"

#---------------------------------------------
#
# Integer register
#
       set I31,0

       #
       # Set index zero to 7
       #
       set   P0[I31], 7

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_10
       print "not "
OK_10: print "ok 10\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0[I31]
       eq    I0, 7, OK_11
       print "not "
OK_11: print "ok 11\n"

       #
       # Set index zero to -15
       #
       set   P0[I31], -15

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_12
       print "not "
OK_12: print "ok 12\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0[I31]
       eq    I0, -15, OK_13
       print "not "
OK_13: print "ok 13\n"

       #
       # Set index zero to 3.7
       #
       set   P0[I31], 3.7
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_14
       print "not "
OK_14: print "ok 14\n"

       #
       # Make sure index zero is indeed 3.7
       #
       set   N0, P0[I31]
       eq    N0, 3.700000, OK_15
       print "not "
OK_15: print "ok 15\n"

       #
       # Set index zero to "foo"
       #
       set   P0[I31], "foo"
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_16
       print "not "
OK_16: print "ok 16\n"

       #
       # Make sure index zero is indeed "foo"
       #
       set   S0, P0[I31]
       eq    S0, "foo", OK_17
       print "not "
OK_17: print "ok 17\n"

#---------------------------------------------
#
# String constant
#
       #
       # Set index zero to 7
       #
       set   P0["bar"], 7

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_18
       print "not "
OK_18: print "ok 18\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0["bar"]
       eq    I0, 7, OK_19
       print "not "
OK_19: print "ok 19\n"

       #
       # Set index zero to -15
       #
       set   P0["bar"], -15

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_20
       print "not "
OK_20: print "ok 20\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0["bar"]
       eq    I0, -15, OK_21
       print "not "
OK_21: print "ok 21\n"

       #
       # Set index zero to 3.7
       #
       set   P0["bar"], 3.7
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_22
       print "not "
OK_22: print "ok 22\n"

       #
       # Make sure index zero is indeed 3.7
       #
       set   N0, P0["bar"]
       eq    N0, 3.700000, OK_23
       print "not "
OK_23: print "ok 23\n"

       #
       # Set index zero to "foo"
       #
       set   P0["bar"], "foo"
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_24
       print "not "
OK_24: print "ok 24\n"

       #
       # Make sure index zero is indeed "bar"
       #
       set   S0, P0["bar"]
       eq    S0, "foo", OK_25
       print "not "
OK_25: print "ok 25\n"

#---------------------------------------------
#
# String register
#
       set S31,"qux"
       #
       # Set index zero to 7
       #
       set   P0[S31], 7

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_26
       print "not "
OK_26: print "ok 26\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0[S31]
       eq    I0, 7, OK_27
       print "not "
OK_27: print "ok 27\n"

       #
       # Set index zero to -15
       #
       set   P0[S31], -15

       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_28
       print "not "
OK_28: print "ok 28\n"

       #
       # Make sure index zero is indeed 7
       #
       set   I0, P0[S31]
       eq    I0, -15, OK_29
       print "not "
OK_29: print "ok 29\n"

       #
       # Set index zero to 3.7
       #
       set   P0[S31], 3.7
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_30
       print "not "
OK_30: print "ok 30\n"

       #
       # Make sure index zero is indeed 3.7
       #
       set   N0, P0[S31]
       eq    N0, 3.700000, OK_31
       print "not "
OK_31: print "ok 31\n"

       #
       # Set index zero to "foo"
       #
       set   P0[S31], "foo"
 
       #
       # Make sure the length is 1
       #
       set   I0, P0
       eq    I0, 1, OK_32
       print "not "
OK_32: print "ok 32\n"

       #
       # Make sure index zero is indeed "bar"
       #
       set   S0, P0[S31]
       eq    S0, "foo", OK_33
       print "not "
OK_33: print "ok 33\n"

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
ok 20
ok 21
ok 22
ok 23
ok 24
ok 25
ok 26
ok 27
ok 28
ok 29
ok 30
ok 31
ok 32
ok 33
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray integer access, two locations");
      new P0, .PerlArray

      set P0[0],37
      set P0[1],-15

      set I0,P0[0]
      eq I0,37,OK_1
      print "not "
OK_1: print "ok 1\n"

      set I0,P0[1]
      eq I0,-15,OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set I0,P0[I1]
      eq I0,37,OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set I0,P0[I1]
      eq I0,-15,OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray integer/register access, two locations");
      new P0, .PerlArray

      set I0,0
      set P0[I0],37
      set I0,1
      set P0[I0],-15

      set I0,P0[0]
      eq I0,37,OK_1
      print "not "
OK_1: print "ok 1\n"

      set I0,P0[1]
      eq I0,-15,OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set I0,P0[I1]
      eq I0,37,OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set I0,P0[I1]
      eq I0,-15,OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray string register/access, two locations");
      new P0, .PerlArray

      set I0,0
      set P0[I0],"foo"
      set I0,1
      set P0[I0],"bar"

      set S0,P0[0]
      eq S0,"foo",OK_1
      print "not "
OK_1: print "ok 1\n"

      set S0,P0[1]
      eq S0,"bar",OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set S0,P0[I1]
      eq S0,"foo",OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set S0,P0[I1]
      eq S0,"bar",OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray string access, two locations");
      new P0, .PerlArray

      set P0[0],"foo"
      set P0[1],"bar"

      set S0,P0[0]
      eq S0,"foo",OK_1
      print "not "
OK_1: print "ok 1\n"

      set S0,P0[1]
      eq S0,"bar",OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set S0,P0[I1]
      eq S0,"foo",OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set S0,P0[I1]
      eq S0,"bar",OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray numeric access, two locations");
      new P0, .PerlArray

      set P0[0],3.100000
      set P0[1],-7.200000

      set N0,P0[0]
      eq N0,3.100000,OK_1
      print "not "
OK_1: print "ok 1\n"

      set N0,P0[1]
      eq N0,-7.200000,OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set N0,P0[I1]
      eq N0,3.100000,OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set N0,P0[I1]
      eq N0,-7.200000,OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray numeric/register access, two locations");
      new P0, .PerlArray

      set I0,0
      set P0[I0],3.100000
      set I0,1
      set P0[I0],-7.200000

      set N0,P0[0]
      eq N0,3.100000,OK_1
      print "not "
OK_1: print "ok 1\n"

      set N0,P0[1]
      eq N0,-7.200000,OK_2
      print "not "
OK_2: print "ok 2\n"

      set I1,0
      set N0,P0[I1]
      eq N0,3.100000,OK_3
      print "not "
OK_3: print "ok 3\n"

      set I1,1
      set N0,P0[I1]
      eq N0,-7.200000,OK_4
      print "not "
OK_4: print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Math on two PerlArrays");
    new P0, .PerlArray
    new P1, .PerlArray
    set P0, 3
    set P1, 6
    new P2, .PerlInt
    add P2, P0, P1
    set I0, P2
    eq I0, 9, ok1
    print "not "
ok1:
    print "ok 1\n"
    sub P2, P1, P0
    set I0, P2
    eq I0, 3, ok2
    print "not "
ok2:
    print "ok 2\n"
    mul P2, P0, P1
    set I0, P2
    eq I0, 18, ok3
    print "not "
ok3:
    print "ok 3\n"
    div P2, P1, P0
    set I0, P2
    eq I0, 2, ok4
    print "not "
ok4:
    print "ok 4\n"
    mod P2, P0, P1
    set I0, P2
    eq I0, 3, ok5
    print "not "
ok5:
    print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Testing clone");
    new P0, .PerlArray
    set P0[0], 1
    set P0[1], 2
    	
    clone P1, P0
    set P1[0], 3
    set P0[2], 4
    set P1[3], 5
    
    set I0, P0[0]
    eq I0, 1, ok1
    print "not "
ok1:
    print "ok 1\n"
    
    set I0, P1[0]
    eq I0, 3, ok2
    print "not "
ok2:
    print "ok 2\n"
    
    set P2, P1[2]
    unless P2, ok3
    print "not "
ok3:
    print "ok 3\n"
    
    set P2, P0[3]
    unless P2, ok4
    print "not "
ok4:
    print "ok 4\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

1;
