#! perl -w

use Parrot::Test tests => 4;

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, 0
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
	new P0, 0
	set P0, 123
	print P0
    print "\n"
	end
CODE
123
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add integer to self");
	new P0, 0
	set P0, 123
	add P0, P0, P0
	print P0
    print "\n"
	end
CODE
246
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add integer to other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	add P1, P1, P0
	print P1
    print "\n"
	end
CODE
444
OUTPUT

1;
