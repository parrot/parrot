#! perl -w

use Parrot::Test tests => 4;

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

1;