#! perl -w
# These tests test the information providing opcodes
use Parrot::Test tests => 1;

output_is(<<'CODE', 'yes', "find_type");
	set I0, .PerlArray
	find_type I1, "PerlArray"
	eq I0, I1, YES
 NO:	print "no"
	end
 YES:   print "yes"
	end
CODE

