#! perl -w

use Parrot::Test tests => 12;

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
  skip("No thread config yet" ,1) unless $^O eq 'linux';

output_is(<<'CODE', <<'OUTPUT', "thread 1");
    set I5, 1
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
    find_method P0, P5, "thread"
    invoke	# start the thread

    print P7
    print I5
    print S5
    sleep 1
    print P7
    print I5
    print S5
    # get tid of thread
    set I5, P5
    # wait for it
    find_method P0, P2, "join"
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
    invoke P1	# ret and be done with thread

# output from threads could be reversed
CODE
ok 1
ok 2
from 1 interp
hello from 2 thread
ParrotThread tid 1
Sub
from 1 interp
OUTPUT
}

1;
