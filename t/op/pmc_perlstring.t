#! perl -w

use Parrot::Test tests => 5;

output_is(<<CODE, <<OUTPUT, "ensure that concat ppp copies strings");
	new P0, PerlString
	new P1, PerlString
	new P2, PerlString
	set P0, "foo"
	concat	P1, P0, P0

	print	P0
	print "\\n"

	print	P1
	print "\\n"

	set P1, "You can't teach an old dog new..."
	set P2, "clear physics"
	concat P0, P1, P2

	print P1
	print "\\n"
	print P2
	print "\\n"
	print P0
	print "\\n"
	end
CODE
foo
foofoo
You can't teach an old dog new...
clear physics
You can't teach an old dog new...clear physics
OUTPUT

output_is(<<CODE, <<OUTPUT, "ensure that concat pps copies strings");
	new P0, PerlString
	new P1, PerlString

	set S0, "Grunties"
	set P1, "fnargh"
	concat P0, P1, S0

	print S0
	print "\\n"
	print P1
	print "\\n"
	print P0
	print "\\n"

	end
CODE
Grunties
fnargh
fnarghGrunties
OUTPUT

output_is(<<CODE, <<OUTPUT, "Setting string copies");
	new P0, PerlString
	set S0, "C2H5OH + 10H20"
	set P0, S0
	chopn S0, 8

	print S0
	print "\\n"
	print P0
	print "\\n"
	end
CODE
C2H5OH
C2H5OH + 10H20
OUTPUT

output_is(<<CODE, <<OUTPUT, "repeat");
	new P0, PerlString
	set P0, "x"
	new P1, PerlInt
	set P1, 12
	new P2, PerlString

	repeat P2, P0, P1
	bsr PRINTA

	end

PRINTA:	print P0
	print "\\n"
	print P1
	print "\\n"
	print P2
	print "\\n"
	ret
CODE
x
12
xxxxxxxxxxxx
OUTPUT

output_is(<<CODE, <<OUTPUT, "if(PerlString)");
        new P0, PerlString
	set S0, "True"
	set P0, S0
        if P0, TRUE
        print "false"
        branch NEXT
TRUE:   print "true"
NEXT:   print "\\n"
  
        new P1, PerlString
        set S1, ""
        set P1, S1
        if P1, TRUE2
        print "false"
        branch NEXT2
TRUE2:  print "true"
NEXT2:  print "\\n"

        new P2, PerlString
        set S2, "0"
        set P2, S2
        if P2, TRUE3
        print "false"
        branch NEXT3
TRUE3:  print "true"
NEXT3:  print "\\n"

        new P3, PerlString
        set S3, "0123"
        set P3, S3
        if P3, TRUE4
        print "false"
        branch NEXT4
TRUE4:  print "true"
NEXT4:  print "\\n"

        new P4, PerlString
        if P4, TRUE5
        print "false"
        branch NEXT5
TRUE5:  print "true"
NEXT5:  print "\\n"
        end
CODE
true
false
false
true
false
OUTPUT

1;
