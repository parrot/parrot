#! perl -w

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUTPUT', "runinterp");
	newinterp P0, 0
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
