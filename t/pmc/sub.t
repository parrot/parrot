#! perl -w

use Parrot::Test tests => 6;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "PASM subs - invokecc");
    new P0, .Sub
    set_addr I3, func
    set P0, I3

    set I5, 3
    save I5

    invokecc

    restore I5
    print I5
    print "\n"
    end

func:
    print I5
    print "\n"

    eq I5, 0, endfunc
    dec I5

    save P1
    invokecc   # recursive invoke
    restore P1

endfunc:
    invoke P1
CODE
3
2
1
0
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - invokecc_p");
    new P0, .Sub
    set_addr I3, func
    set P0, I3

    set I5, 3
    save I5

    invokecc P0

    restore I5
    print I5
    print "\n"
    end

func:
    print I5
    print "\n"

    eq I5, 0, endfunc
    dec I5

    save P1
    invokecc P0  # recursive invoke
    restore P1

endfunc:
    invoke P1
CODE
3
2
1
0
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Continuation");
    new P5, .PerlInt
    set P5, 3
    store_global "foo", P5
    new P1, .Continuation
    set_addr I0, endcont
    set P1, I0
endcont:
    find_global P4, "foo"
    print "here "
    print P4
    print "\n"
    unless P4, done
    dec P4
    store_global "foo", P4
    print "going to cont\n"
    clone P0, P1
    invoke
done:
    print "done\n"
    end

CODE
here 3
going to cont
here 2
going to cont
here 1
going to cont
here 0
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "definedness of Continuation");
    new P1, .Continuation
    defined I1, P1
    print I1
    print "\n"
    set_addr I0, cont
    set P1, I0
    defined I1, P1
    print I1
    print "\n"
    end

cont:
    print "I'm a very boring continuation" 
    end 

CODE
0
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM sub as closure");
    # sub foo {
    #     my ($n) = @_;
    #     sub {$n += shift}
    # }
    # my $f = foo(5);
    # print &$f(3), "\n";
    # print &$f(3), "\n";
    # print &$f(3), "\n";
main:
    new P0, .Sub
    set_addr I3, foo
    set P0, I3

    new P11, .PerlInt
    set P11, 5

    invokecc
    set P0, P2 # move sub $f to P0 for invokecc

    new P11, .PerlInt
    set P11, 3

    save P0
    invokecc
    restore P0

    print P2
    print "\n"

    save P0
    invokecc
    restore P0

    print P2
    print "\n"

    invokecc
    print P2
    print "\n"

    end

# foo takes a number n (P11) and returns a sub (in P2) that takes
# a number i (P11) and returns n incremented by i.
foo:
    new_pad 0
    store_lex 0, "n", P11
    new P2, .Sub	# P2 has now the lexical "n" in the pad
    set_addr I3, f
    set P2, I3
    invoke P1

# expects arg in P11, returns incremented result in P2
f:
    find_lex P2, "n"	# invoke-ing the Sub pushes the lexical pad
    			# of the closure on the pad stack
    add P2, P11		# n += shift
    invoke P1

CODE
8
11
14
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - tail invoke");
    new P0, .Sub
    set_addr I3, func1
    set P0, I3

    invokecc
    print "done\n"
    end

func1:
    print "in func1\n"

    new P0, .Sub
    set_addr I3, func2
    set P0, I3

    invoke    # tail invoke (reuses context already in P1)
    print "this should not be called\n"

func2:
    print "in func2\n"
    invoke P1

CODE
in func1
in func2
done
OUTPUT

1;
