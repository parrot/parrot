#! perl -w

use Parrot::Test tests => 3;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "PASM subs");
    new P0, .Sub
    set_addr I3, func
    set P0, I3
    set I5, 3
    save I5
    invoke
    print "done 1\n"
    set I5, 1
    clone P1, P0
    set P0, P1
    save I5
    invoke
    print "done 2\n"
    end

func:
    pushi
    restore I5
    print I5
    print "\n"
    eq I5, 0, endfunc
    dec I5
    save I5
    invoke
    inc I5
    print I5
    print " done\n"
endfunc:
    popi
    ret
CODE
3
2
1
0
1 done
2 done
3 done
done 1
1
0
1 done
done 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Continuations");
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

    new P1, .PerlInt
    set P1, 5

    invoke
    set P0, P2 # move sub $f to P0 for invoke

    new P1, .PerlInt
    set P1, 3

    invoke
    print P2
    print "\n"

    invoke
    print P2
    print "\n"

    invoke
    print P2
    print "\n"

    end

# foo takes a number n (P1) and returns a sub (in P2) that takes
# a number i (P1) and returns n incremented by i.
foo:
    new_pad 0
    store_lex 0, "n", P1
    new P2, .Sub	# P2 has now the lexical "n" in the pad
    set_addr I3, f
    set P2, I3
    pop_pad
    ret

# expects arg in P1, returns incremented result in P2
f:
    find_lex P2, "n"	# invoke-ing the Sub pushes the lexical pad
    			# of the closure on the pad stack
    add P2, P1		# n += shift
    pop_pad		# clean up
    ret

CODE
8
11
14
OUTPUT

1;
