#! perl -w

use Parrot::Test tests => 6;
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

output_is(<<'CODE', <<'OUTPUT', "call subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "invoke P1\n"
    compreg P1, "PASM"
    compile P0, P1, S5
    find_global P0, "_foo"
    invokecc
    print "back\n"
    end
CODE
foo
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call 2 subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "invoke P1\n"
    concat S5, ".pcc_sub _bar:\n"
    concat S5, "print \"bar\\n\"\n"
    concat S5, "invoke P1\n"
    compreg P1, "PASM"
    compile P0, P1, S5
    find_global P0, "_foo"
    invokecc
    print "back\n"
    find_global P0, "_bar"
    invokecc
    print "fin\n"
    end
CODE
foo
back
bar
fin
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nano forth sub");
_main:
    load_bytecode "examples/assembly/nanoforth2.pasm"
    print "ok 1\n"
    find_global P0, "_nano_forth_compiler"
    defined I0, P0
    if I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    set S5, "1 7 + . 2 3 - .\n"
    pushp
    invokecc
    popp
    set S5, ": i 1 + ; 5 i .\n"
    pushp
    invokecc
    popp
    set S5, ": i 1 + ; : j i i ; 9 j .\n"
    invokecc
    end
CODE
ok 1
ok 2
8
-1
6
11
OUTPUT
