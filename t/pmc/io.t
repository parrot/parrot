#! perl -w

use Parrot::Test tests => 4;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "open/close");
	open P0, "temp.file", ">"
	print P0, "a line\n"
	close P0
	open P0, "temp.file", "<"
	read S0, P0, 20
	print S0
	end
CODE
a line
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "timely destruction");
	interpinfo I0, 2	# DOD runs
	open P0, "temp.file", ">"
	print P0, "a line\n"
	null P0			# kill it
	sweep 0			# a lazy DOD has to close the PIO
	open P0, "temp.file", "<"
	read S0, P0, 20
	print S0
	interpinfo I1, 2	# DOD runs
	sub I1, I0
	print I1
	print "\n"
	end
CODE
a line
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "fdopen");
	fdopen P0, 1, ">"
	defined I0, P0
	unless I0, nok
	print P0, "ok\n"
	close P0
	end
nok:
	print "fdopen failed\n"
	end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "fdopen - no close");
	fdopen P0, 1, ">"
	defined I0, P0
	unless I0, nok
	print P0, "ok\n"
	end
nok:
	print "fdopen failed\n"
	end
CODE
ok
OUTPUT

unlink("temp.file");
