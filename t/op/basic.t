#! perl -w

use Parrot::Test tests => 15;

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

output_is(<<'CODE', q('Parrot' flies), "print double-quoted string, nested single");
       print "'Parrot' flies"
       end
CODE

output_is(<<'CODE', q("Parrot" flies), "print single-quoted string, nested double");
       print '"Parrot" flies'
       end
CODE

output_is(<<'CODE', q(Parrot flies), "print string with embedded hex escape");
       print "Parrot\x20flies"
       end
CODE

output_is(<<'CODE', <<OUTPUT, "print string with embedded newline");
       print "Parrot flies\n"
       end
CODE
Parrot flies
OUTPUT

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

output_is(<<'CODE', <<'OUTPUT', "set_addr");
       set_addr I1, FOO
       jump I1
       print "Jump failed\n"
       end

FOO:   print "Jump succeeded\n"
       end
CODE
Jump succeeded
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "multiple labels");
     if 0,FOO
     if 1,BAR
     print "not "
FOO:
BAR:
     print "ok 1\n"
     end
CODE
ok 1
OUTPUT

output_is(<<'CODE', 32, "Predeclared opcodes");
     set_i_ic I0,32
     print I0
     end
CODE

output_is(<<'CODE', <<'OUTPUT', "jsr");
     set_addr I1, FOO
     jsr I1
     print "and back again\n"
     end

FOO: print "There "
     ret

CODE
There and back again
OUTPUT

1; # HONK
