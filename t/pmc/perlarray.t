#! perl -w

use Parrot::Test tests => 4;

output_is(<<'CODE', <<'OUTPUT', "size of the array");
	new P0,PerlArray
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
        new P0,PerlArray
	set P0,3,0
	set I1,P0,0
	print I1
	print "\n"

	set P0,2
	set P0,3.7,1
	set N1,P0,1
	print N1
	print "\n"

	set P0,3
	set P0,"hey",2
	set S1,P0,2
	print S1
	print "\n"
        
        end
CODE
3
3.700000
hey
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "same, but with implicit resizing");
        new P0,PerlArray
	set P0,3,0
	set I1,P0,0
	print I1
	print "\n"

	set P0,3.7,1
	set N1,P0,1
	print N1
	print "\n"

	set P0,"hey",2
	set S1,P0,2
	print S1
	print "\n"

        end
CODE
3
3.700000
hey
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "If P");
        new P0, PerlArray
        if P0, TR
        print "false\n"
        branch NEXT   
TR:     print "true\n"

NEXT:   set P0, 1, 0
        if P0, TR2
        print "false\n"
        branch NEXT2
TR2:    print "true\n"

NEXT2:  new P1, PerlArray
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

1;
