#! perl -w

use Parrot::Test tests => 2;

output_is(<<'CODE', <<'OUTPUT', "time_i");
	time	I0
	time	I1
	ge	I0, 0, OK1
	branch	FAIL
OK1:	print "ok, (!= 1970) Grateful Dead not\n"
	ge	I1, I0, OK2
	branch FAIL
OK2:	print "ok, (now>before) timelords need not apply\n"
	branch	OK_ALL
FAIL:	print "failure\n"
	print "I0 was: "
	print I0
	print "\nI1 was: "
	print I0
	print "\n"
OK_ALL:
	end
CODE
ok, (!= 1970) Grateful Dead not
ok, (now>before) timelords need not apply
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "time_n");
	time	N0
	time	N1
	ge	N0, 0, OK1
	branch	FAIL
OK1:	print "ok, (!= 1970) Grateful Dead not\n"
	ge	N1, N0, OK2
	branch FAIL
OK2:	print "ok, (now>before) timelords need not apply\n"
	branch	OK_ALL
FAIL:	print "failure\n"
OK_ALL:
	end
CODE
ok, (!= 1970) Grateful Dead not
ok, (now>before) timelords need not apply
OUTPUT
1;
