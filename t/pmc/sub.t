#! perl -w

use Parrot::Test tests => 52;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "PASM subs - newsub");
    print "main\n"
    newsub .Sub, .Continuation, _func, _ret
    invoke
_ret:
    print "back\n"
    end
_func:
    print "func\n"
    invoke P1
CODE
main
func
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - newsub 2");
    print "main\n"
    newsub P0, .Sub, _func
    invokecc
    print "back\n"
    end
_func:
    print "func\n"
    invoke P1
CODE
main
func
back
OUTPUT

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

    new P5, .PerlInt
    set P5, 5

    invokecc
    set P0, P5	# the closure

    new P5, .PerlInt
    set P5, 3

    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    end

# foo takes a number n (P5) and returns a sub (in P5) that takes
# a number i (P5) and returns n incremented by i.
foo:
    new_pad 0
    store_lex 0, "n", P5
    new P5, .Closure	# P5 has now the lexical "n" in the pad
    set_addr I3, f
    set P5, I3
    invoke P1		# ret

# expects arg in P5, returns incremented result in P5
f:
    find_lex P2, "n"	# invoke-ing the Sub pushes the lexical pad
    			# of the closure on the pad stack
    add P2, P5		# n += shift, the lexical is incremented
    new P5, .PerlInt
    set P5, P2
    invoke P1		# ret

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
    end

func2:
    print "in func2\n"
    invoke P1

CODE
in func1
in func2
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - tail invoke with newsub");
    newsub P0, .Sub, func1

    invokecc
    print "done\n"
    end

func1:
    print "in func1\n"

    newsub P0, .Sub, func2

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

output_is(<<'CODE', <<'OUTPUT', "sub calling a sub");
    print "main\n"
    newsub .Sub, .Continuation, _func1, ret1
    invoke
ret1:
    print "back\n"
    end

_func1:
    print "func1\n"
    pushbottomp
    newsub .Sub, .Continuation, _func2, ret2
    invoke
ret2:
    popbottomp
    print "func1\n"
    invoke P1

_func2:
    print "func2\n"
    invoke P1

CODE
main
func1
func2
func1
back
OUTPUT

for my $R (0..4) {
for my $N (254..258) {
output_is(<<"CODE", <<'OUTPUT', "test COW");
    print "main\\n"
    set I16, 0
    set I17, $N	 	#~1 chunk full
lp:
    save I16
    inc I16
    le I16, I17, lp
    newsub .Sub, .Continuation, _func, ret
    pushbottomi
    invoke
    popbottomi
ret:
lp2:
    restore I16
    eq I16, I17, ok
    print "nok I16: "
    print I16
    print " I17: "
    print I17
    print "\\n"
    end
ok:
    dec I17
    if I17, lp2
    print "back\\n"
    end
_func:
    print "func\\n"
    set I0, $R
lp3:
    unless I0, cont
    save I0
    dec I0
    branch lp3
cont:
    invoke P1
CODE
main
func
back
OUTPUT
}
}

output_like(<<'CODE', <<'OUTPUT', "interp - warnings");
    new P0, .PerlUndef
    set I0, P0
    printerr "main:"
    newsub .Sub, .Continuation, _func, _ret
    invoke
_ret:
    printerr ":back"
    new P0, .PerlUndef
    set I0, P0
    end
_func:
    warningson 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^main:Use of uninitialized value in integer context at.*:back$/sm
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings 2");
    warningson 1
    newsub .Sub, .Continuation, _func, _ret
    new P10, .PerlUndef
    set I0, P10
    printerr ":main"
    invoke
_ret:
    printerr ":back:"
    new P10, .PerlUndef
    set I0, P10
    printerr ":end"
    end
_func:
    warningsoff 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^Use of uninitialized value in integer context at.*:main:back:Use of un.*$/sm
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings 2 - updatecc");
    # the Continuation in PMC is created with warnings off
    newsub .Sub, .Continuation, _func, _ret
    # turn warnings on in main
    warningson 1
    new P10, .PerlUndef
    set I0, P10
    printerr ":main"
    # update the state of the return continuation
    updatecc
    invoke
_ret:
    printerr ":back:"
    new P10, .PerlUndef
    set I0, P10
    printerr ":end"
    end
_func:
    # turn off warnings in the sub
    warningsoff 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^Use of uninitialized value in integer context at.*:main:back:Use of un.*$/sm
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - clear_eh");
    newsub P20, .Exception_Handler, _handler
    set_eh P20
    print "ok 1\n"
    clear_eh
    print "ok 2\n"
    end
_handler:
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw");
    print "main\n"
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    throw P30
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    end
CODE
main
catched it
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw - message");
    print "main\n"
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    set S0, P5["_message"]	# P5 is the exception object
    print S0
    print "\n"
    end
CODE
main
catched it
something happend
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw - message, check P5");
    print "main\n"
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    set P30["_message"], "something happend"
    new P5, .PerlUndef
    set P5, "a string\n"
    throw P30
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    set S0, P5["_message"]	# P5 is the exception object
    print S0
    print "\n"
    save P0		# preserve reg
    set P0, P5["_P5"]	# original P5
    print P0
    restore P0
    end
CODE
main
catched it
something happend
a string
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw - lexical");
    print "main\n"
    new_pad 0
    new P0, .PerlInt
    set P0, 42
    store_lex -1, "$a", P0
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    throw P30
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    find_lex P0, "$a"
    print P0
    print "\n"
    end
CODE
main
catched it
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw - return");
    print "main\n"
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "back again\n"
    end
_handler:
    print "catched it\n"
    set S0, P5["_message"]	# P5 is the exception object
    print S0
    print "\n"
    set P2, P5["_invoke_cc"]	# the return continuation
    invoke P2
CODE
main
catched it
something happend
back again
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_eh - throw - return, change lexical");
    print "main\n"
    new_pad 0
    new P0, .PerlInt
    set P0, 42
    store_lex -1, "$a", P0
    newsub P20, .Exception_Handler, _handler
    set_eh P20

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "back again\n"
    find_lex P0, "$a"
    print P0
    print "\n"
    end
_handler:
    print "catched it\n"
    set S0, P5["_message"]	# P5 is the exception object
    print S0
    print "\n"
    find_lex P0, "$a"
    print P0
    print "\n"
    inc P0
    set P2, P5["_invoke_cc"]	# the return continuation
    invoke P2
CODE
main
catched it
something happend
42
back again
43
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "throw - no handler");
    new P0, .Exception
    set P0["_message"], "something happend"
    throw P0
    print "not reached\n"
    end
CODE
something happend
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "throw - no handler, no message");
    newsub P20, .Exception_Handler, _handler
    set_eh P20
    new P0, .Exception
    clear_eh
    throw P0
    print "not reached\n"
    end
_handler:
    end
CODE
No exception handler and no message
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "throw - no handler, no message");
    new P0, .Exception
    throw P0
    print "not reached\n"
    end
CODE
No exception handler and no message
OUTPUT
output_is(<<'CODE', <<'OUTPUT', "2 exception handlers");
    print "main\n"
    newsub P20, .Exception_Handler, _handler1
    set_eh P20
    newsub P21, .Exception_Handler, _handler2
    set_eh P21

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler1:
    print "catched it in 1\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    end
_handler2:
    print "catched it in 2\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    end
CODE
main
catched it in 2
something happend
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 exception handlers, throw next");
    print "main\n"
    newsub P20, .Exception_Handler, _handler1
    set_eh P20
    newsub P21, .Exception_Handler, _handler2
    set_eh P21

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler1:
    print "catched it in 1\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    end
_handler2:
    print "catched it in 2\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    throw P5	# XXX rethrow?
    end
CODE
main
catched it in 2
something happend
catched it in 1
something happend
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 exception handlers, throw next - return");
    print "main\n"
    newsub P20, .Exception_Handler, _handler1
    set_eh P20
    newsub P21, .Exception_Handler, _handler2
    set_eh P21

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "back in main\n"
    end
_handler1:
    print "catched it in 1\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    set P2, P5["_invoke_cc"]	# the return continuation
    invoke P2
_handler2:
    print "catched it in 2\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    throw P5
    print "back in 2\n"
    # XXX we cant return from here, the _return_cc in P5 is common
    # to both exception handlers
    end
CODE
main
catched it in 2
something happend
catched it in 1
something happend
back in 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "throw from a sub");
    print "main\n"
    newsub P20, .Exception_Handler, _handler
    set_eh P20
    newsub P0, .Sub, _sub
    invokecc
    print "back in main\n"
    end

_sub:
    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "back in sub\n"
    invoke P1
_handler:
    print "catched it\n"
    set S0, P5["_message"]
    print S0
    print "\n"
    set P2, P5["_invoke_cc"]	# the return continuation
    invoke P2
CODE
main
catched it
something happend
back in sub
back in main
OUTPUT

1;

