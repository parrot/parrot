#! perl -w

use Parrot::Test tests => 1;

#SKIP: { skip("runinterp not working at the moment", 1);
output_is(<<'CODE', <<'OUTPUT', "runinterp");
	newinterp P0, 1
	print "calling\n"
	runinterp P0, foo
	print "ending\n"
	end
	print "bad things!\n"
foo:
	print "In 2\n"
	end
CODE
calling
In 2
ending
OUTPUT

1;
