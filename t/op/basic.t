#! perl -w

use Parrot::Test tests => 5;

# It would be very embarrassing if these didn't work...
output_is(<<'CODE', '', "noop, end");
	noop
	end
CODE

output_is(<<'CODE', '1', "print 1");
	print	1
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print string");
	print "Parrot flies"
	end
CODE

output_is( <<'CODE', '42', "branch_ic" );
	set	I4, 42
	branch	HERE
	set	I4, 1234
HERE:
	print	I4
	end
CODE

SKIP: {
    skip( "label constants unimplemented in assembler", 1 );
output_is( <<'CODE', <<OUTPUT, "jump" );
	set	I4, 42
	set	I5, HERE
	jump	I5
	set	I4, 1234
HERE:
	print	I4
	end
CODE
I reg 4 is 42
OUTPUT
}
