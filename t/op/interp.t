#! perl -w

use Parrot::Test tests => 3;

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
	printerr "ok 1\n"
	set I0, 1
	trace I0
	printerr "ok 2\n"
	dec I0
	trace I0
	printerr "ok 3\n"
	end
CODE
/^ok\s1\n
(?:PC=7.*)?\n
ok\s2\n
(?:PC=9.*)?\n
(?:PC=11.*)?\n
ok\s3\n$/x
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings");
	new P0, .PerlUndef
	set I0, P0
	printerr "nada:"
	warningson 1
	new P1, .PerlUndef
	set I0, P1
	end
CODE
/^nada:Use of uninitialized value in integer context at.*/
OUTPUT
1;
