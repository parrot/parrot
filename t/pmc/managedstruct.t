#! perl -w

use Parrot::Test tests => 7;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "Setting ManagedStruct size");
	new P0,.ManagedStruct
	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"
	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"
	set P0,2
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
        new P0, .ManagedStruct
        set P0, 1
	set P0[0],7
	set I0,P0[0]
	eq I0,7,OK_1
	print "not "
OK_1:	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting second element");
        new P0, .ManagedStruct
        set P0, 2
	set P0[1], 7
	set I0, P0[1]
	eq I0,7,OK_1
	print "not "
OK_1:	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .ManagedStruct
        set P0, 1
	set P0[1], 99
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .ManagedStruct
        set P0, 1
	set I0, P0[2]
	eq I0, -1, OK_1
	print "not "
OK_1:	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Re-allocating space (growing)");
        new P0, .ManagedStruct
        set P0, 10
        set P0[5], 99
        set P0, 20
        set I0, P0[5]
        eq I0, 99, OK_1
	print "not "
OK_1:	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Re-allocating space (shrinking)");
        new P0, .ManagedStruct
        set P0, 10
        set P0[5], 99
        set P0, 2
        set I0, P0[5]
        eq I0, -1, OK_1
	print "not "
OK_1:	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

1;
