#! perl -w

use Parrot::Test tests => 2;

output_is(<<'CODE', '12', "Fetch and store");
	new P0, .PerlInt
	new P1, .PerlInt
	set P0, 12
	set P1, 7
	store_global "Integer", P0
	find_global P1, "Integer"
	print P1
	end
CODE

output_like(<<'CODE', <<OUT, "not found exception");
	find_global P1, "no_such_global"
	print "ok 1\n"
	print P1
	end
CODE
/Global 'no_such_global' not found/
OUT
1; # HONK
