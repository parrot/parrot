#! perl -w

use Parrot::Test tests => 37;

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, 0
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
	new P0, 0
	set P0, 123
	print P0
	print "\n"
	end
CODE
123
OUTPUT

#
# Let perl do the computation.
#
output_is(<<'CODE', (123+123), "add integer to self");
	new P0, 0
	set P0, 123
	add P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (456-456), "sub integer from self");
	new P0, 0
	set P0, 456
	sub P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (124*124), "multiply integer by self");
	new P0, 0
	set P0, 124
	mul P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (23/23), "divide integer by self");
	new P0, 0
	set P0, 23
	div P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', (123+321), "add integer to other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	add P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (321-123), "subtract integer from other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	sub P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (123*321), "multiply integer by other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	mul P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', (246/123), "divide integer by other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 246
	div P1, P1, P0
	print P1
	end
CODE

#
# Number tests
#
output_is(<<'CODE', sprintf("%f",123.123+123.123), "add number to self");
	new P0, 0
	set P0, 123.123
	add P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",456.456-456.456), "sub number from self");
	new P0, 0
	set P0, 456.456
	sub P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",124.124*124.124), "multiply number by self");
	new P0, 0
	set P0, 124.124
	mul P0, P0, P0
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",23.23/23.23), "divide number by self");
	new P0, 0
	set P0, 23.23
	div P0, P0, P0
	print P0
	end
CODE

#
# Number vs. number
#
output_is(<<'CODE', sprintf("%f",123.123+321.321), "add number to other");
	new P0, 0
	new P1, 0
	set P0, 123.123
	set P1, 321.321
	add P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', sprintf("%f",321.321-123.123), "subtract number from other");
	new P0, 0
	new P1, 0
	set P0, 123.123
	set P1, 321.321
	sub P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', sprintf("%f",123.123*321.321), "multiply number by other");
	new P0, 0
	new P1, 0
	set P0, 123.123
	set P1, 321.321
	mul P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', sprintf("%f",246.246/123.123), "divide number by other");
	new P0, 0
	new P1, 0
	set P0, 123.123
	set P1, 246.246
	div P1, P1, P0
	print P1
	end
CODE

#
# Number vs. integer
#
output_is(<<'CODE', sprintf("%f",123+321.321), "add integer to number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	add P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', '198.321000', "subtract integer from number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	sub P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', sprintf("%f",123*321.321), "multiply integer by number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	mul P1, P1, P0
	print P1
	end
CODE

output_is(<<'CODE', '2.002000', "divide integer by number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 246.246
	div P1, P1, P0
	print P1
	end
CODE

#
# Number vs. integer
#
output_is(<<'CODE', sprintf("%f",123+321.321), "add integer to number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	add P1, P0, P1
	print P1
	end
CODE

output_is(<<'CODE', '-198.321000', "subtract integer from number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	sub P1, P0, P1
	print P1
	end
CODE

output_is(<<'CODE', sprintf("%f",123*321.321), "multiply integer by number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321.321
	mul P1, P0, P1
	print P1
	end
CODE

output_is(<<'CODE', '0.499500', "divide integer by number");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 246.246
	div P1, P0, P1
	print P1
	end
CODE

#
# Concat tests
#
output_is(<<'CODE', '-5foo', "concatenate integer to string");
	new P0, 0
	new P1, 0
	set P0, -5
	set P1, "foo"
	concat P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', 'foo-7', "concatenate string to integer");
	new P0, 0
	new P1, 0
	set P0, "foo"
	set P1, -7
	concat P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', '5.430000bar', "concatenate number to string");
	new P0, 0
	new P1, 0
	set P0, 5.43
	set P1, "bar"
	concat P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', 'bar2.700000', "concatenate string to number");
	new P0, 0
	new P1, 0
	set P0, "bar"
	set P1, 2.7
	concat P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', 'foobar', "concatenate string to string");
	new P0, 0
	new P1, 0
	set P0, "foo"
	set P1, "bar"
	concat P0,P0,P1
	print P0
	end
CODE

#
# Arithmetic operators
#
output_is(<<'CODE', 13, "add integer to string integer");
	new P0, 0
	new P1, 0
	set P0, 6
	set P1, "7"
	add P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', 6, "add integer to string");
	new P0, 0
	new P1, 0
	set P0, 6
	set P1, "ab"
	add P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",13.5), "add integer to string number");
	new P0, 0
	new P1, 0
	set P0, 6
	set P1, "7.5"
	add P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",13.1), "add number to string integer");
	new P0, 0
	new P1, 0
	set P0, 6.1
	set P1, "7"
	add P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",6.1), "add number to string");
	new P0, 0
	new P1, 0
	set P0, 6.1
	set P1, "ab"
	add P0,P0,P1
	print P0
	end
CODE

output_is(<<'CODE', sprintf("%f",13.6), "add number to string number");
	new P0, 0
	new P1, 0
	set P0, 6.1
	set P1, "7.5"
	add P0,P0,P1
	print P0
	end
CODE

1;
