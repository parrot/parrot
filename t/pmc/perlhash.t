#! perl

use Parrot::Test tests => 8;
use Test::More;

SKIP: { skip("Hashes unimplemented", 8);
output_is(<<'CODE', <<OUTPUT, "simple set / get");
	new P0, PerlHash
	set S0, "one"
	set S1, "two"

	set_keyed P0, S0, 1		# $P0{one} = 1
	set_keyed P0, S1, 2		# $P0{two} = 2

	get_keyed I0, P0, S0
	get_keyed I1, P0, S1

	print I0
	print "\n"
	print I1
	print "\n"
    end
CODE
1
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "more than one PerlHash");
	new P0, PerlHash
	set S0, "key"
	set_keyed P0, S0, 1
		
        new P1, PerlHash
        set S1, "another_key"
        set_keyed P1, S1, 2

	get_keyed I0, P0, S0
	get_keyed I1, P1, S1

	print I0
	print "\n"
	print I1
	print "\n"
        end
CODE
1
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "hash keys with nulls in them");
	new P0, PerlHash
	set S0, "parp\0me"
	set S1, "parp\0you"

	set_keyed P0, S0, 1		# $P0{parp\0me} = 1
	set_keyed P0, S1, 2		# $P0{parp\0you} = 2

	get_keyed I0, P0, S0
	get_keyed I1, P0, S1

	print I0
	print "\n"
	print I1
	print "\n"
    end
CODE
1
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "nearly the same hash keys");
	new P0, PerlHash
	set S0, "a\0"
	set S1, "\0a"

	set_keyed P0, S0, 1
	set_keyed P0, S1, 2

	get_keyed I0, P0, S0
	get_keyed I1, P0, S1

	print I0
	print "\n"
	print I1
	print "\n"

	end
CODE
1
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "The same hash keys");
	new P0, PerlHash
	set S0, "Happy"
	set S1, "Happy"

	set_keyed P0, S0, 1
	get_keyed I0, P0, S0
	print I0
	print "\n"

	set_keyed P0, S1, 2
	get_keyed I1, P0, S1

	print I1
	print "\n"

	end
CODE
1
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "size of the hash");
	new P0, PerlHash
	
	set_keyed P0, 0, 1
	set I0, P0
	print I0
	print "\n"	

	set_keyed P0, 1, 1
	set I0, P0
	print I0
	print "\n"	

	set_keyed P0, 0, 1
	set I0, P0
	print I0
	print "\n"	

	end
CODE
1
2
2
OUTPUT


# NB Next test depends on "key2" hashing to zero, which it does with
# the current algorithm; if the algorithm changes, change the test!

output_is(<<'CODE', <<OUTPUT, "key that hashes to zero");
        new P0, PerlHash
        set S0, "key2"
        set_keyed P0, S0, 1
        get_keyed I0, P0, S0
	print I0
	print "\n"	
	end
CODE
1
OUTPUT

output_is(<<CODE, <<OUTPUT, "Initial PerlHash tests");
	new	P0, PerlHash

	set_keyed	P0, "foo", -7
	set_keyed	P0, "bar", 3.5
	set_keyed	P0, "baz", "value"

	get_keyed	I0, P0, "foo"
	get_keyed	N0, P0, "bar"
	get_keyed	S0, P0, "baz"

	eq	I0,-7,OK_1
	print	"not "
OK_1:	print	"ok 1\\n"
	eq	N0,3.500000,OK_2
	print	N0
OK_2:	print	"ok 2\\n"
	eq	S0,"value",OK_3
	print	S0
OK_3:	print	"ok 3\\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

} # SKIP

1;
