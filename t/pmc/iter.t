#! perl -w

use Parrot::Test tests => 2;
use Test::More;
output_is(<<'CODE', <<'OUTPUT', "new iter");
	new P2, .PerlArray
	new P1, .Iterator, P2
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "int test");

	new P0, .PerlArray	# empty array
	new P2, .PerlArray	# array with 2 elements
	push P2, 10
	push P2, 20
	set I0, P2
	new P1, .Iterator, P2
	print "ok 1\n"
	set I1, P1
	eq I0, I1, ok2		# iter.length() == array.length()
	print "not "
ok2:	print "ok 2\n"
	new P1, .Iterator, P0
	set P1, 0		# reset PIter
	print "ok 3\n"
	unless P1, ok4		# if(iter) == false on empty
	print "not "
ok4:	print "ok 4\n"
	new P1, .Iterator, P2
	set P1, 0		# reset PIter
	if P1, ok5		# if(iter) == true on non empty
	print "not "
ok5:	print "ok 5\n"
	# now iterate over P2
	# while (P1) { element = shift(P1) }
	unless P1, nok6
        shift I3, P1
	eq I3, 10, ok6
nok6:	print "not "
ok6:	print "ok 6\n"
	unless P1, nok7
        shift I3, P1
	eq I3, 20, ok7
nok7:	print "not "
ok7:	print "ok 7\n"
	unless P1, ok8		# if(iter) == false after last
	print "not "
ok8:	print "ok 8\n"

	# now iterate from end
	set P1, 3		# reset PIter
	if P1, ok9		# if(iter) == true on non empty
	print "not "
ok9:	print "ok 9\n"
	# while (P1) { element = pop(P1) }
	unless P1, nok10
        pop I3, P1
	eq I3, 20, ok10
nok10:	print "not "
ok10:	print "ok 10\n"
	unless P1, nok11
        pop I3, P1
	eq I3, 10, ok11
nok11:	print "not "
ok11:	print "ok 11\n"
	unless P1, ok12		# if(iter) == false after last
	print "not "
ok12:	print "ok 12\n"
	end

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
OUTPUT

