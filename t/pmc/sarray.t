#! perl -w

use Parrot::Test tests => 10;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "Setting sarray size");
	new P0, .SArray
	set I0, P0
	eq I0, 0, OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0, 1
	set P0[0], 100
	set I0, P0
	eq I0, 1, OK_2
	print "not "
OK_2:	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "attempt resize");
	new P0, .SArray
	set P0, 1
	set P0[0], 100
	set I0, P0
	eq I0, 1, OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0, 2
	end
CODE
ok 1
SArray: Can't resize!
OUTPUT
# '

output_is(<<'CODE', <<'OUTPUT', "indexed access");
	new P0, .SArray
	set P0, 3
	set P0[0], 100
	set P0[1], 200
	set P0[2], 300
	set I0, P0[0]
	eq I0, 100, ok1
	print "not "
ok1:	print "ok 1\n"
	set I0, P0[1]
	eq I0, 200, ok2
	print "not "
ok2:	print "ok 2\n"
	set I0, P0[2]
	eq I0, 300, ok3
	print "not "
ok3:	print "ok 3\n"
	set I0, P0[-1]
	eq I0, 300, ok4
	print "not "
ok4:	print "ok 4\n"
	set I0, P0[-2]
	eq I0, 200, ok5
	print "not "
ok5:	print "ok 5\n"
	set I0, P0[-3]
	eq I0, 100, ok6
	print "not "
ok6:	print "ok 6\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "push");
	new P0, .SArray
	set P0, 3
	push P0, 100
	push P0, 200
	push P0, 300
	set I0, P0[0]
	eq I0, 100, ok1
	print "not "
ok1:	print "ok 1\n"
	set I0, P0[1]
	eq I0, 200, ok2
	print "not "
ok2:	print "ok 2\n"
	set I0, P0[2]
	eq I0, 300, ok3
	print "not "
ok3:	print "ok 3\n"
	set I0, P0[-1]
	eq I0, 300, ok4
	print "not "
ok4:	print "ok 4\n"
	set I0, P0[-2]
	eq I0, 200, ok5
	print "not "
ok5:	print "ok 5\n"
	set I0, P0[-3]
	eq I0, 100, ok6
	print "not "
ok6:	print "ok 6\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "push / indexed");
	new P0, .SArray
	set P0, 3
	push P0, 100
	set P0[1], 200
	push P0, 300
	set I0, P0[0]
	eq I0, 100, ok1
	print "not "
ok1:	print "ok 1\n"
	set I0, P0[1]
	eq I0, 200, ok2
	print "not "
ok2:	print "ok 2\n"
	set I0, P0[2]
	eq I0, 300, ok3
	print "not "
ok3:	print "ok 3\n"
	set I0, P0[-1]
	eq I0, 300, ok4
	print "not "
ok4:	print "ok 4\n"
	set I0, P0[-2]
	eq I0, 200, ok5
	print "not "
ok5:	print "ok 5\n"
	set I0, P0[-3]
	eq I0, 100, ok6
	print "not "
ok6:	print "ok 6\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mixed indexed");
	new P0, .SArray
	set P0, 4
	set P0[0], 1000
	set N0, 222.22
	set P0[1], N0
	set S0, "string\n"
	set P0[2], S0
	new P1, .PerlUndef
	set P1, 42
	set P0[3], P1

	set I0, P0[0]
	eq I0, 1000, ok1
	print "not "
ok1:	print "ok 1\n"
	set N1, P0[1]
	eq N0, N1, ok2
	print "not "
ok2:	print "ok 2\n"
	set S1, P0[2]
	print S1
	set P3, P0[3]
	print P3
	print "\n"
	end
CODE
ok 1
ok 2
string
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mixed push");
	new P0, .SArray
	set P0, 4
	push P0, 1000
	set N0, 222.22
	push P0, N0
	set S0, "string\n"
	push P0, S0
	new P1, .PerlUndef
	set P1, 42
	push P0, P1

	set I0, P0[0]
	eq I0, 1000, ok1
	print "not "
ok1:	print "ok 1\n"
	set N1, P0[1]
	eq N0, N1, ok2
	print "not "
ok2:	print "ok 2\n"
	set S1, P0[2]
	print S1
	set P3, P0[3]
	print P3
	print "\n"
	end
CODE
ok 1
ok 2
string
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mixed push - clone");
	new P2, .SArray
	set P2, 4
	push P2, 1000
	set N0, 222.22
	push P2, N0
	set S0, "string\n"
	push P2, S0
	new P1, .PerlUndef
	set P1, 42
	push P2, P1

	clone P0, P2

	set I0, P0[0]
	eq I0, 1000, ok1
	print "not "
ok1:	print "ok 1\n"
	set N1, P0[1]
	eq N0, N1, ok2
	print "not "
ok2:	print "ok 2\n"
	set S1, P0[2]
	print S1
	set P3, P0[3]
	print P3
	print "\n"
	end
CODE
ok 1
ok 2
string
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "shift_integer");
	new P0, .SArray
	set P0, 3
	set P0[0], 100
	set P0[1], 200
	set P0[2], 300

	shift I0, P0
	eq I0, 100, ok1
	print "not "
ok1:	print "ok 1\n"
	set I0, P0
	eq I0, 2, ok2
ok2:	print "ok 2\n"

	shift I0, P0
	eq I0, 200, ok3
	print "not "
ok3:	print "ok 3\n"
	set I0, P0
	eq I0, 1, ok4
ok4:	print "ok 4\n"

	shift I0, P0
	eq I0, 300, ok5
	print "not "
ok5:	print "ok 5\n"
	set I0, P0
	eq I0, 0, ok6
ok6:	print "ok 6\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mixed shift");
	new P0, .SArray
	set P0, 4
	push P0, 1000
	set N0, 222.22
	push P0, N0
	set S0, "string\n"
	push P0, S0
	new P1, .PerlUndef
	set P1, 42
	push P0, P1

	shift I0, P0
	eq I0, 1000, ok1
	print "not "
ok1:	print "ok 1\n"
	shift N1, P0
	eq N0, N1, ok2
	print "not "
ok2:	print "ok 2\n"
	shift S1, P0
	print S1
	shift P3, P0
	print P3
	print "\n"
	end
CODE
ok 1
ok 2
string
42
OUTPUT
