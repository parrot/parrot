#! perl -w

use Parrot::Test tests => 5;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "Setting array size");
	new P0,.Array

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0,2.0
	set I0,P0
	eq I0,2,OK_3
	print "not "
OK_3:	print "ok 3\n"

        new P1, .PerlInt
        set P1, 3
	set P0,P1
	set I0,P0
	eq I0,3,OK_4
	print "not "
OK_4:	print "ok 4\n"


        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .Array
        set P0, 1

	set P0,0,-7 # set P0[0], -7
	set I0,P0,0 # set I0, P0[0]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,0,3.7 # set P0[0], 3.7
	set N0,P0,0 # set N0, P0[0]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0,0,"Buckaroo" # set P0[0], "Buckaroo"
	set S0,P0,0 # set S0, P0[0]
	eq S0,"Buckaroo",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting second element");
        new P0, .Array
        set P0, 2

	set P0[1], -7
	set I0, P0[1]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0[1], 3.7
	set N0, P0[1]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0[1],"Buckaroo"
	set S0, P0[1]
	eq S0,"Buckaroo",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

# TODO: Rewrite these properly when we have exceptions

output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .Array
        set P0, 1

	set P0[1], -7

	end
CODE
Array element out of bounds!
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .Array
        set P0, 1

	set I0, P0[1]
	end
CODE
Array element out of bounds!
OUTPUT

1;
