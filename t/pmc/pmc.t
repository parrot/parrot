#! perl -w

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, 0
	print "ending\n"
	end
CODE
starting
ending
OUTPUT
1;
