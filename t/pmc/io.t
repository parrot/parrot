#! perl -w

use Parrot::Test tests => 2;
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
	open P0, "temp.file", ">"
	print P0, "a line\n"
	null P0			# kill it
	sweep 0			# a lazy DOD has to close the PIO
	open P0, "temp.file", "<"
	read S0, P0, 20
	print S0
	interpinfo I0, 2	# DOD runs
	print I0
	print "\n"
	end
CODE
a line
1
OUTPUT

unlink("temp.file");
