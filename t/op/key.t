#! perl -w

use Parrot::Test tests => 5;

output_is(<<'CODE', <<'OUTPUT', "new key");
	print "starting\n"
	new_key S0
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "size of key");
	new_key S0
	size_key S0,3
	key_size I0,S0
	print I0
	print "\n"
	end
CODE
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "store integer in key, validate type");
	new_key S0
	size_key S0,1
	ke_set_value S0,0,-7
	ke_value I0,S0,0
	ke_type I1,S0,0
	print I0
	print "\n"
	print I1
	print "\n"
	end
CODE
-7
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "store number in key, validate type");
	new_key S0
	size_key S0,1
	ke_set_value S0,0,9.435
	ke_value N0,S0,0
	ke_type I1,S0,0
	print N0
	print "\n"
	print I1
	print "\n"
	end
CODE
9.435000
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "store string in key, validate type");
	new_key S0
	size_key S0,1
	ke_set_value S0,0,"foo"
	ke_value S1,S0,0
	ke_type I1,S0,0
	print S1
	print "\n"
	print I1
	print "\n"
	end
CODE
foo
2
OUTPUT

1;
