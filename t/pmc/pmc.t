#! perl -w

use Parrot::Test tests => 10;

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

#
# Let perl do the computation.
#
output_is(<<'CODE', (123+123), "add integer to self");
	new P0, 0
	set P0, 123
	add P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (456-456), "sub integer from self");
	new P0, 0
	set P0, 456
	sub P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (124*124), "multiply integer by self");
	new P0, 0
	set P0, 124
	mul P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (23/23), "divide integer by self");
	new P0, 0
	set P0, 23
	div P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (123+321), "add integer to other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	add P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (321-123), "subtract integer from other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	sub P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (123*321), "multiply integer by other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	mul P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (246/123), "divide integer by other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 246
	div P1, P1, P0
	print P1
	end
CODE

1;
