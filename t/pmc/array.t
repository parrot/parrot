#! perl -w

use Parrot::Test tests => 1;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "Basic array tests");
	new P0,Array

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set_keyed P0,0,-7 # set P0[0], -7
	get_keyed I0,P0,0 # set I0, P0[0]
	eq I0,-7,OK_3
	print "not "
OK_3:	print "ok 3\n"

	set_keyed P0,0,3.7 # set P0[0], 3.7
	get_keyed N0,P0,0 # set N0, P0[0]
	eq N0,3.7,OK_4
	print "not "
OK_4:	print "ok 4\n"

	set_keyed P0,0,"Buckaroo" # set P0[0], "Buckaroo"
	get_keyed S0,P0,0 # set S0, P0[0]
	eq S0,"Buckaroo",OK_5
	print "not "
OK_5:	print "ok 5\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

1;
