#! perl -w

use Parrot::Test tests => 16;

output_is(<<'CODE', <<'OUTPUT', "runinterp - new style");
	new P0, .ParrotInterpreter
	print "calling\n"
	# set_addr/invoke ?
	runinterp P0, foo
	print "ending\n"
	end
	print "bad things!\n"
foo:
	print "In 2\n"
	end
CODE
calling
In 2
ending
OUTPUT
output_like(<<'CODE', <<'OUTPUT', "restart trace");
	printerr "ok 1\n"
	set I0, 1
	trace I0
	printerr "ok 2\n"
	dec I0
	trace I0
	printerr "ok 3\n"
	end
CODE
/^ok\s1\n
(?:PC=7.*)?\n
ok\s2\n
(?:PC=9.*)?\n
(?:PC=11.*)?\n
ok\s3\n$/x
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings");
	new P0, .PerlUndef
	set I0, P0
	printerr "nada:"
	warningson 1
	new P1, .PerlUndef
	set I0, P1
	end
CODE
/^nada:Use of uninitialized value in integer context/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "getinterp");
    .include "interpinfo.pasm"
    getinterp P0
    print "ok 1\n"
    set I0, P0[.INTERPINFO_ACTIVE_PMCS]
    interpinfo I1, .INTERPINFO_ACTIVE_PMCS
    eq I0, I1, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "access argv");
    .include "iglobals.pasm"
    getinterp P1
    set P2, P1[.IGLOBALS_ARGV_LIST]
    set I0, P5
    set I1, P2
    eq I0, I1, ok1
    print "not "
ok1:
    print "ok 1\n"
    set S0, P5[0]
    set S1, P2[0]
    eq S0, S1, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "runinterp - set flags");
    .include "interpflags.pasm"
    new P0, .ParrotInterpreter
    print "calling\n"
    set P0[-1], .INTERPFLAG_PARROT_TRACE_FLAG
    runinterp P0, foo
    print "ending\n"
    end
    print "bad things!\n"
foo:
    print "In 2\n"
    end
CODE
/calling\n
PC=\d+.*\n
In\s2\n
PC=\d+.*\n
ending\n/x
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "check_events");
    print "before\n"
    check_events
    print "after\n"
    end
CODE
before
after
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "clone and runinterp");
    set I0, 1
    set S0, " interp\n"
    new P0, .PerlString
    set P0, "from "

    getinterp P2
    clone P3, P2
    print "ok 1\n"
    runinterp P3, _foo
    print P0
    print I0
    print S0
    end

_foo:
    set I0, 2
    set S0, " clone\n"
    set P0, "hello from "
    print P0
    print I0
    print S0
    end
CODE
ok 1
hello from 2 clone
from 1 interp
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "clone and invoke interp");
    set I0, 1
    set S0, " interp\n"
    new P0, .PerlString
    set P0, "from "

    getinterp P2
    clone P3, P2
    print "ok 1\n"
    set_addr P3, _foo
    invoke P3
    print P0
    print I0
    print S0
    end

_foo:
    set I0, 2
    set S0, " clone\n"
    set P0, "hello from "
    print P0
    print I0
    print S0
    end
CODE
ok 1
hello from 2 clone
from 1 interp
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "clone and invoke interp - sweep");
    set I0, 1
    set S0, " interp\n"
    new P0, .PerlString
    set P0, "from "

    getinterp P2
    clone P3, P2
    print "ok 1\n"
    set_addr P3, _foo
    invoke P3
    print P0
    print I0
    print S0
    end

_foo:
    set I0, 2
    set S0, " clone\n"
    set P0, "hello from "
    print P0
    print I0
    print S0
    sweep 1
    print P0
    print I0
    print S0
    end
CODE
ok 1
hello from 2 clone
hello from 2 clone
from 1 interp
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "clone and invoke interp - ret via invoke");
    set I0, 1
    set S0, " interp\n"
    new P0, .PerlString
    set P0, "from "

    getinterp P2
    clone P3, P2
    print "ok 1\n"
    set_addr P3, _foo
    invoke P3
cont:
    print P0
    print I0
    print S0
    end

_foo:
    set I0, 2
    set S0, " clone\n"
    set P0, "hello from "
    print P0
    print I0
    print S0
    invoke P1
CODE
ok 1
hello from 2 clone
from 1 interp
OUTPUT

SKIP: {
  skip("No thread config yet", 5) unless ($^O eq 'linux' or $^O eq 'darwin');

output_is(<<'CODE', <<'OUTPUT', "interp identity");
    getinterp P2
    clone P3, P2
    eq P3, P2, ok1
    print "not"
ok1:
    print "ok 1\n"
    new P4, .ParrotThread
    ne P4, P2, ok2
    print "not"
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "thread type 1");
    set I5, 10
    #
    # set regs P5 = thread-interp, P6 = sub
    find_global P6, "_foo"
    new P5, .ParrotThread
    find_method P0, P5, "thread1"
    invoke	# start the thread

    sleep 1
    print "main "
    print I5
    print "\n"
    # get tid of thread
    set I5, P5
    # wait for it
    find_method P0, P5, "join"
    invoke
    end

.pcc_sub _foo:
    # check if vars are fresh
    inc I5
    print "thread "
    print I5
    print "\n"
    set I3, 0   # no retval
    invoke P1	# ret and be done with thread

# output from threads could be reversed
CODE
thread 1
main 10
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "thread type 2");
    set I5, 10
    set S5, " interp\n"
    new P7, .PerlString
    set P7, "from "

    getinterp P2
    #
    # set regs P5 = thread-interp, P6 = sub
    print "ok 1\n"
    find_global P6, "_foo"
    print "ok 2\n"
    new P5, .ParrotThread
    set I3, 3
    find_method P0, P5, "thread2"
    invoke	# start the thread

    sleep 1	# now the thread should run
    print P7
    print I5
    print S5
    # get tid of thread
    set I5, P5
    # wait for it
    find_method P0, P5, "join"
    invoke
    end

.pcc_sub _foo:
    # check if vars a really separate
    inc I5
    set S5, " thread\n"
    set P7, "hello from "
    print P7
    print I5
    print S5
    typeof S0, P2
    print S0
    print " tid "
    set I0, P2
    print I0
    print "\n"
    typeof S0, P0
    print S0
    print "\n"
    set I3, 0
    invoke P1	# ret and be done with thread

CODE
ok 1
ok 2
hello from 1 thread
ParrotThread tid 1
Sub
from 10 interp
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "thread - kill");
    bounds 1	# assert slow core -S and -g are fine too
    find_global P6, "_foo"
    new P5, .ParrotThread
    set I10, P5
    print "start "
    print I10
    print "\n"
    find_method P0, P5, "thread3"
    set I3, 2
    invoke	# start the thread
    sleep 1

    set I5, I10
    getinterp P2
    find_method P0, P2, "kill"
    invoke

    print "done\n"
    end

.pcc_sub _foo:
    print "in thread\n"
    # run a endless loop
lp:
    noop
    branch lp
    print "never\n"
    invoke P1
CODE
start 1
in thread
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "join, get retval");
##PIR##
.sub _main
    .const int MAX = 1000
    .sym pmc kid
    .sym pmc Adder
    Adder = global "_add"
    kid = new ParrotThread
    .sym pmc from
    from = new PerlInt
    from = 0
    .sym pmc to
    to = new PerlInt
    to = MAX
    .sym pmc Thread_new
    find_method Thread_new, kid, "thread3"
    .pcc_begin prototyped
    .arg kid
    .arg Adder
    .arg from
    .arg to
    .nci_call Thread_new
    .pcc_end

    .sym int tid
    tid = kid
    .sym pmc Thread_join
    find_method Thread_join, kid, "join"
    .pcc_begin prototyped
    .arg tid
    .nci_call Thread_join
    .sym pmc result
    .result result
    .pcc_end
    print result
    print "\n"
    # sum = n * (n + 1)/2
    .sym pmc Mul
    Mul = new PerlInt
    assign Mul, to
    inc Mul
    Mul = to * Mul
    Mul = Mul / 2
    print Mul
    print "\n"
    end
.end

.sub _add prototyped
   .param pmc self
   .param pmc sub
   .param pmc from
   .param pmc to
   .sym   pmc sum
   sum = new PerlInt
loop:
    add sum, from
    inc from
    le from, to, loop

    .pcc_begin_return
    .return sum
    .pcc_end_return
.end
CODE
500500
500500
OUTPUT

}

1;
