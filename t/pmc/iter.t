#! perl -w

use Parrot::Test tests => 4;
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

output_is(<<'CODE', <<'OUTPUT', "hash iter 1");
	new P0, .PerlHash	# empty Hash
	new P2, .PerlHash	# Hash with 2 elements
	set P2["ab"], 100
	set P2["xy"], "value"
	set I0, P2
	new P1, .Iterator, P2
	print "ok 1\n"
	set I1, P1
	eq I0, I1, ok2		# iter.length() == hash.length()
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
	# while (P1) { key = shift(P1) }
	unless P1, nok6
        shift S3, P1		# get hash.key
	eq S3, "ab", ok6
	eq S3, "xy", ok6
nok6:	print " not "
ok6:	print "ok 6\n"
	unless P1, nok7
        shift S3, P1
	eq S3, "ab", ok7
	eq S3, "xy", ok7
nok7:	print "not "
ok7:	print "ok 7\n"
	unless P1, ok8		# if(iter) == false after last
	print "not "
ok8:	print "ok 8\n"
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
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "hash iter 2");
	new P0, .PerlHash	# Hash for iteration
	new P2, .PerlHash	# for test

	set I0, 65
	set I1, 35
	set I10, I1
fill:
	chr S0, I0
	set P0[S0], I0
	# XXX
	# swapping the next two lines breaks JIT/i386
	# the reason is the if/unless optimization: When the
	# previous opcode sets flags, these are used - but
	# there is no check, that the same register is used in the "if".
	inc I0
	dec I1
	if I1, fill

	new P1, .Iterator, P0
	set I0, P1
	eq I0, I10, ok1
	print "not "
ok1:
	print "ok 1\n"
	set P1, 0
get:
	unless P1, done
        shift S3, P1		# get hash.key
	set I0, P0[S3]		# and value
	set P2[S3], I0
	branch get

done:
	set I0, P2
	eq I0, I10, ok2
	print "not "
ok2:
	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT
