#! perl -w

use Parrot::Test tests => 3;

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

output_is(<<'CODE', <<'OUTPUT', "runinterp - new style");
	new P0, .ParrotInterpreter
	print "calling\n"
	# set_addr/invoke ?
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
output_like(<<'CODE', <<'OUTPUT', "restart trace");
	print 2, "ok 1\n"
	set I0, 1
	trace I0
	print 2, "ok 2\n"
	dec I0
	trace I0
	print 2, "ok 3\n"
	end
CODE
/^ok\s1\n
(?:PC=8.*)?\n
ok\s2\n
(?:PC=11.*)?\n
(?:PC=13.*)?\n
ok\s3\n$/x
OUTPUT

1;
