#! perl -w

use Parrot::Test tests => 7;

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
	print 'Parrot flies'
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print double-quoted string");
       print "Parrot flies"
       end
CODE

output_is(<<'CODE', 'Parrot	flies', "print double-quoted string, tabs");
       print "Parrot\tflies"
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


output_is(<<'CODE', <<'OUTPUT', "bsr_i");
	print	"start\n"
	
	bsr	LAB1

	print	"done\n"
	end

LAB1:	print	"lab 1\n"
	ret
CODE
start
lab 1
done
OUTPUT

1; # HONK
