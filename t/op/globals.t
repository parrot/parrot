#! perl -w

use Parrot::Test tests => 1;

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

1; # HONK
