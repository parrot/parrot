#! perl -w

use Parrot::Test tests => 3;
use Test::More;

# PASM1 is like PASM but appends an C<end> opcode

output_is(<<'CODE', <<'OUTPUT', "eval_sc");
	compreg P1, "PASM1"	# get compiler
	set S1, "in eval\n"
	compile P0, P1, "print S1"
	invoke			# eval code P0
	print "back again\n"
	end
CODE
in eval
back again
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eval_s - check nci globbered reg");
	compreg P1, "PASM1"
	set I0, 40
	set S1, "inc I0\ninc I0"
	compile P0, P1, S1
	invoke
	print I0
	print "\n"
	end
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eval_s - check nci param S5 ");
	compreg P1, "PASM1"
	set S1, "hello "
	set S5, "concat S1, 'parrot'"
	compile P0, P1, S5
	invoke
	print S1
	print "\n"
	end
CODE
hello parrot
OUTPUT
