#perl -w

use Parrot::Test tests=>1;

output_is(<<'CODE', <<'OUTPUT', "data type names");
	# first (native) type
	set I0, -100
	typeof S0, I0
	ne S0, "INTVAL", nok1
loop:
	valid_type I1, I0
	if I1, cont
	ne S0, "illegal", nok5
	branch ok
cont:
	ge I0, 0, nok2
	find_type I1, S0
	ne I0, I1, nok3
	inc I0
	typeof S0, I0
	branch loop

ok:
	print "ok 1\n"
	typeof S0, 1
	# other types are tested in t/pmc/pmc.t
	ne S0, "Array", nok4
	print "ok 2\n"
	end

nok1:	print "first type (INTVAL) not found\n"
	end
nok2:	print "ran past last type\n"
	end
nok3:	print "find_type returned "
	print I1
	print " for "
	print S0
	print " wanted "
	print I0
	print "\n"
	end
nok4:	print "type for Array wrong\n"
	end
nok5:   print "invalid typename not 'illegal'\n"
	end
CODE
ok 1
ok 2
OUTPUT

1;

