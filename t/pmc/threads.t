#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/pmc/threads.t - Threads

=head1 SYNOPSIS

	% prove t/pmc/threads.t

=head1 DESCRIPTION

Tests running threads. All tests skipped unless running on known-good
platform.

=cut

my %platforms = map {$_=>1} qw/
    aix
    cygwin
    darwin
    dec_osf
    freebsd
    hpux
    irix
    linux
    openbsd
    solaris
    MSWin32
/;

if ($^O eq "cygwin" ) {
    my @uname = split / /, qx'uname -v';

    if ($uname[0] eq "2004-09-04" ) {
	plan skip_all => "This cygwin version is known to fail the thread tests";
	exit;
    }
}
if ($platforms{$^O}) {
   plan tests => 20;
}
else {
   plan skip_all => "No threading yet or test not enabled for '$^O'";
   # plan skip_all => "Needs COPY for argument passing";
}


pasm_output_is(<<'CODE', <<'OUTPUT', "interp identity");
    getinterp P2
    clone P3, P2
    ne P3, P2, ok1
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

# XXX FIXME rework tests since we don't really have thread types?

pir_output_is(<<'CODE', <<'OUTPUT', "thread type 1");
.sub main :main
    .local pmc threadfunc
    .local pmc thread
    I5 = 10
    threadfunc = global "foo"
    thread = new .ParrotThread
    thread.'run_clone'(threadfunc)

    sleep 1
    print "main "
    print I5
    print "\n"
    # get tid of thread
    $I0 = thread 
    # wait for it
    thread.'join'()
.end

.sub foo 
    # check if vars are fresh
    inc I5
    print "thread"
    # print I5 # not done because registers aren't guaranteed to be
               # initialized to anything in particular
    print "\n"
    set I3, 0   # no retval
    returncc	# ret and be done with thread
.end
# output from threads could be reversed
CODE
thread
main 10
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "thread type 1 -- repeated");
.sub real_main :main
    $I0 = 0
loop:
    main()
    inc $I0
    if $I0 < 2 goto loop
.end

.sub main
    .local pmc threadfunc
    .local pmc thread
    I5 = 10
    threadfunc = global "foo"
    thread = new .ParrotThread
    thread.'run_clone'(threadfunc)

    sleep 1
    print "main "
    print I5
    print "\n"
    # get tid of thread
    $I0 = thread 
    # wait for it
    thread.'join'()
.end

.sub foo 
    # check if vars are fresh
    inc I5
    print "thread"
    # print I5 # not done because registers aren't guaranteed to be
               # initialized to anything in particular
    print "\n"
    set I3, 0   # no retval
    returncc	# ret and be done with thread
.end
# output from threads could be reversed
CODE
thread
main 10
thread
main 10
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "thread type 2");
.sub main :main
    set I5, 10
    .local pmc thread
    .local pmc threadsub
    S5 = " interp\n"
    P6 = new .String
    P6 = 'from '

    print "ok 1\n"
    threadsub = global "foo"
    thread = new .ParrotThread
    thread.'run_clone'(threadsub, P6)
    sleep 1 # to let the thread run
    print P6
    print I5
    print S5
    thread.'join'()
.end

.sub foo
    .param pmc passed
    inc I5
    S5 = " thread\n"
    passed = 'hello from'
    print passed
    # print I5 # not done because register initialization is not guaranteed
    print S5
    $P0 = getinterp
    $S0 = typeof $P0
    print $S0
    print ' tid '
    $I0 = $P0
    print $I0
    print "\n"
.end
CODE
ok 1
hello from thread
ParrotThread tid 1
from 10 interp
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'thread - kill');
.sub main :main
    .local pmc threadsub
    .local pmc thread
    bounds 1	# assert slow core -S and -g are fine too
    threadsub = global "foo"
    thread = new .ParrotThread
    $I0 = thread
    print 'start '
    print $I0
    print "\n"
    thread.'run_clone'(threadsub)

    sleep 1 # to let the thread run

    thread.'kill'()

    print "done\n"
.end

.sub foo
    print "in thread\n"
    # run an endles loop
lp:
    noop
    branch lp
.end
CODE
start 1
in thread
done
OUTPUT
    

pir_output_is(<<'CODE', <<'OUTPUT', "join, get retval");
.sub _main
    .const int MAX = 1000
    .sym pmc kid
    .sym pmc Adder
    Adder = global '_add'
    kid = new ParrotThread
    .sym pmc from
    from = new Integer
    from = 0
    .sym pmc to
    to = new Integer
    to = MAX
    kid.'run_clone'(Adder, Adder, from, to)

    .local pmc result
    result = kid.'join'()
    print result
    print "\n"
    # sum = n * (n + 1)/2
    .sym pmc Mul
    Mul = new Integer
    assign Mul, to
    inc Mul
    Mul = to * Mul
    Mul = Mul / 2
    print Mul
    print "\n"
    end
.end

.sub _add
   .param pmc sub
   .param pmc from
   .param pmc to
   .sym   pmc sum
   sum = new Integer
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

SKIP: {
	skip("detatch broken on $^O", 1) if ($^O =~ /MSWin32/);
pir_output_like(<<'CODE', <<'OUTPUT', "detach");
.sub main :main
    .local pmc foo
    .local pmc queue
    .local pmc thread
    foo = global '_foo'
    queue = new .TQueue # flag for when the thread is done
    thread = new .ParrotThread
    thread.'run_clone'(foo, queue)
    
    thread.'detach'()
wait:
    defined $I0, queue
    if $I0 == 0 goto wait
    print "done\n"
.end

.sub _foo
    .param pmc queue
    print "thread\n"
    sleep 0.1
    $P1 = new .Integer
    push queue, $P1
.end
CODE
/(done\nthread\n)|(thread\ndone\n)/
OUTPUT
}

pir_output_is(<<'CODE', <<'OUTPUT', "share a PMC");
.sub main :main
    .local pmc foo
    foo = global "_foo"
    .local pmc to_share
    to_share = new Integer
    .local pmc shared_ref
    shared_ref = new SharedRef, to_share
    shared_ref = 20
    .local pmc thread
    thread = new ParrotThread
    thread.'run_clone'(foo, shared_ref)

    sleep 0.1 # to let the thread run
    
    .local pmc result
    thread.'join'()
    print "done\n"
    print shared_ref
    print "\n"
.end

.sub _foo
    .param pmc shared_ref
    print "thread\n"
    print shared_ref
    print "\n"
    inc shared_ref
.end
CODE
thread
20
done
21
OUTPUT

pir_output_is(<<'CODE', <<'OUT', "multi-threaded");
.sub main :main
    .local pmc queue
    queue = new TQueue
    .local pmc tmpInt
    tmpInt = new Integer
    tmpInt = 1
    push queue, tmpInt
    tmpInt = new Integer
    tmpInt = 2
    push queue, tmpInt
    tmpInt = new Integer
    tmpInt = 3
    push queue, tmpInt
    
    .local pmc thread
    thread = new ParrotThread
    .local pmc foo
    foo = global '_foo'
    thread.'run_clone'(foo, queue)
    thread.'join'()
    print "done main\n"
.end

.sub _foo
    .param pmc queue
    $I0 = queue
    print $I0
    print "\n"
loop:
    $I0 = queue
    if $I0 == 0 goto done 
    shift $P0, queue
    print $P0
    print "\n"
    branch loop
done:
    print "done thread\n"
.end
CODE
3
1
2
3
done thread
done main
OUT

pir_output_is(<<'CODE', <<'OUT', "sub name lookup in new thread");
.sub check
    $P0 = find_global 'Foo', 'foo'
    $I0 = isa $P0, 'Sub'
    if $I0 goto okay
    print "not "
okay:
    print "ok\n"
.end

.sub main :main
    check()
    $P0 = new ParrotThread
    .local pmc thread_main
    thread_main = find_global 'thread_main'
    $P0.'run_clone'(thread_main)
    $P0.'join'() # XXX
.end

.sub thread_main
    check()
.end

.namespace [ 'Foo' ]

.sub foo
    print "not reached\n"
.end
CODE
ok
ok
OUT

pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE only");

.namespace [ 'Test2' ]
.sub test2
    print "ok 2\n"
.end

.namespace [ 'Test3' ]
.sub test3
    print "ok 3\n"
.end

.namespace [ 'main' ]

.include 'errors.pasm'
.sub thread_func
    .param pmc test2
    print "ok 1\n"
    test2()
    .local pmc test3
    test3 = find_global 'Test3', 'test3'
    test3()
    .local pmc test4
    errorsoff .PARROT_ERRORS_GLOBALS_FLAG
    test4 = global 'test4'
    if null test4 goto okay
    print "not "
okay:
    print "ok 4\n"
.end

.include 'cloneflags.pasm'
.sub main :main
    .local pmc test4
    .local pmc test2

    test2 = find_global 'Test2', 'test2'

    test4 = new Integer
    test4 = 42
    store_global 'test4', test4

    .local pmc thread
    thread = new ParrotThread
    .local pmc thread_func
    thread_func = global 'thread_func'
    $I0 = .PARROT_CLONE_CODE 
    thread.'run'($I0, thread_func, test2)
    thread.'join'()
    print "ok 5\n"
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_GLOBALS");

.namespace [ 'Foo' ]
.sub 'is'
    .param pmc what
    .param pmc expect
    .param pmc label
    .param pmc shortlabel
    if what == expect goto okay
    print "# "
    print label
    print "\n"
    print "# got:      "
    print what
    print "\n"
    print "# expected: "
    print expect
    print "\nnot "
okay:
    print "ok "
    print shortlabel
    print "\n"
.end

.sub thread_test_func 
    $P0 = find_global 'Bar', 'alpha'
    'is'($P0, 1, 'Bar::alpha == 1', 'alpha')
    $P0 = 43
    sleep 0.1 # give enough time that the main thread might modify
              # any shared Foo::beta dn cause phantom errors
    $P0 = find_global 'beta'
    'is'($P0, 2, 'Foo::beta == 2 [accessed locally]', 'beta1')
    $P0 = 5
    $P0 = find_global 'beta'
    'is'($P0, 5, 'Foo::beta == 5 [accessed locally after assignment]', 'beta2')
    $P0 = find_global 'Foo', 'beta'
    'is'($P0, 5, 'Foo::beta == 5 [after assign; absolute]', 'beta3')
.end

.namespace [ 'main' ]

.sub test_setup 
    $P0 = new Integer
    $P0 = 1
    store_global 'Bar', 'alpha', $P0
    $P0 = new Integer
    $P0 = 2
    store_global 'Foo', 'beta', $P0
.end

.include 'cloneflags.pasm'
.sub main :main
    'test_setup'()

    .local pmc thread
    thread = new ParrotThread
    .local pmc _thread_func
    _thread_func = find_global 'Foo', 'thread_test_func'
    $I0 = .PARROT_CLONE_CODE
    bor $I0, $I0, .PARROT_CLONE_GLOBALS
    print "in thread:\n"
    thread.'run'($I0, _thread_func)
    $P0 = find_global 'Foo', 'beta'
    $P0 = 42
    thread.'join'()
    print "in main:\n"
    $P0 = 2
    _thread_func()
.end
CODE
in thread:
ok alpha
ok beta1
ok beta2
ok beta3
in main:
ok alpha
ok beta1
ok beta2
ok beta3
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_CLASSES; superclass not built-in");
.namespace [ 'Foo' ]

.sub foometh :method
    print "called Foo's foometh\n"
.end

.sub barmeth :method
    print "called Foo's barmeth\n"
.end

.namespace [ 'Bar' ]

.sub barmeth :method
    print "called Bar's barmeth\n"
.end

.sub __get_string :method
    .return ("A Bar")
.end

.namespace [ 'main' ]

.sub init 
    $P1 = newclass 'Foo'
    addattribute $P1, 'foo1'
    addattribute $P1, 'foo2'
    $P2 = subclass $P1, 'Bar'
    addattribute $P2, 'bar1'
.end

.sub thread_test_func
    $I0 = find_type 'Bar'
    $P0 = new $I0
    print $P0
    print "\n"
    $P0.'barmeth'()
    $P0.'foometh'()
    $I0 = isa $P0, 'Integer'
    print "Integer? "
    print $I0
    print "\n"
    $I0 = isa $P0, 'Foo'
    print "Foo? "
    print $I0
    print "\n"
    $I0 = isa $P0, 'Bar'
    print "Bar? "
    print $I0
    print "\n"
.end

.include 'cloneflags.pasm'
.sub main :main
    init()

    .local pmc thread
    thread = new ParrotThread
    .local pmc _thread_func
    _thread_func = find_global 'main', 'thread_test_func'
    $I0 = .PARROT_CLONE_CODE
    bor $I0, $I0, .PARROT_CLONE_CLASSES
    print "in thread:\n"
    thread.'run'($I0, _thread_func)
    thread.'join'()
    print "in main:\n"
    _thread_func()
.end
CODE
in thread:
A Bar
called Bar's barmeth
called Foo's foometh
Integer? 0
Foo? 1
Bar? 1
in main:
A Bar
called Bar's barmeth
called Foo's foometh
Integer? 0
Foo? 1
Bar? 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_CLASSES; superclass built-in");
.namespace [ 'Foo' ]

.sub foometh :method
    print "called Foo's foometh\n"
.end

.sub barmeth :method
    print "called Foo's barmeth\n"
.end

.namespace [ 'Bar' ]

.sub barmeth :method
    print "called Bar's barmeth\n"
.end

.sub __get_string :method
    .return ("A Bar")
.end

.namespace [ 'main' ]

.sub init 
    $P0 = getclass .Integer
    $P1 = subclass $P0, 'Foo'
    addattribute $P1, 'foo1'
    addattribute $P1, 'foo2'
    $P2 = subclass $P1, 'Bar'
    addattribute $P2, 'bar1'
.end

.sub thread_test_func
    $I0 = find_type 'Bar'
    $P0 = new $I0
    print $P0
    print "\n"
    $P0.'barmeth'()
    $P0.'foometh'()
    $I0 = isa $P0, 'Integer'
    print "Integer? "
    print $I0
    print "\n"
    $I0 = isa $P0, 'Foo'
    print "Foo? "
    print $I0
    print "\n"
    $I0 = isa $P0, 'Bar'
    print "Bar? "
    print $I0
    print "\n"
.end

.include 'cloneflags.pasm'
.sub main :main
    init()

    .local pmc thread
    thread = new ParrotThread
    .local pmc _thread_func
    _thread_func = find_global 'main', 'thread_test_func'
    $I0 = .PARROT_CLONE_CODE
    bor $I0, $I0, .PARROT_CLONE_CLASSES
    print "in thread:\n"
    thread.'run'($I0, _thread_func)
    thread.'join'()
    print "in main:\n"
    _thread_func()
.end
CODE
in thread:
A Bar
called Bar's barmeth
called Foo's foometh
Integer? 1
Foo? 1
Bar? 1
in main:
A Bar
called Bar's barmeth
called Foo's foometh
Integer? 1
Foo? 1
Bar? 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_GLOBALS| CLONE_HLL");
.HLL 'Test', ''
.sub setup 
    $P0 = new .Integer
    $P0 = 42
    store_global 'x', $P0
.end

.include 'interpinfo.pasm'
.sub test
    $P0 = find_global 'x'
    if $P0 == 42 goto okay1
    print "not "
okay1:
    print "ok 1\n"
    $P1 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P1['test']
    $P1 = $P1['x']
    $P1 = 43
    if $P0 == 43 goto okay2
    print "not "
okay2:
    print "ok 2\n"
.end

.HLL '', ''

.include 'cloneflags.pasm'

.sub main :main
    .local pmc setup
    .local pmc test
    setup = interpinfo .INTERPINFO_NAMESPACE_ROOT
    setup = setup['test']
    test = setup['test']
    setup = setup['setup']
    setup()

    .local pmc thread
    .local int flags
    thread = new ParrotThread
    flags = .PARROT_CLONE_CODE
    bor flags, flags, .PARROT_CLONE_GLOBALS
    bor flags, flags, .PARROT_CLONE_HLL
    print "in thread:\n"
    thread.'run'(flags, test)
    thread.'join'()
    print "in main:\n"
    test()
.end
CODE
in thread:
ok 1
ok 2
in main:
ok 1
ok 2
OUTPUT

pir_output_unlike(<<'CODE', qr/not/, "globals + constant table subs issue");
.namespace [ 'Foo' ]

.include 'interpinfo.pasm'
.sub 'is'
    .param pmc what
    .param pmc expect
    .local pmc number
    number = global 'test_num'
    if what == expect goto okay
    print "# got:      "
    print what
    print "\n"
    print "# expected: "
    print expect
    print "\nnot ok "
    print number
    print "\n"
    $P0 = interpinfo .INTERPINFO_CURRENT_CONT
loop:
    $I0 = defined $P0
    if $I0 == 0 goto done
    print "    "
    print $P0
    print "\n"
    $P0 = $P0.'continuation'()
    branch loop
done:
    .return ()
okay:
    print "ok "
    print number
    inc number
    print "\n"
.end

.sub setup
    $P0 = new Integer
    $P0 = 1
    store_global 'foo', $P0
.end

.sub _check_sanity
    $P0 = global 'foo'
    $P1 = find_global 'Foo', 'foo'
    is($P0, $P1)
.end

.sub mutate
    $P0 = new Integer
    $P0 = 2
    store_global 'foo', $P0
.end

.sub check_sanity
    _check_sanity()
    $P0 = global '_check_sanity'
    $P0()
    $P0 = find_global 'Foo', '_check_sanity'
    $P0()
.end

.sub _check_value
    .param int value
    $P0 = global 'foo'
    is($P0, value)
.end

.sub check_value
    .param int value
    _check_value(value)
    $P0 = global '_check_value'
    $P0(value)
    $P0 = find_global 'Foo', '_check_value'
    $P0(value)
.end

.sub full_check
    .const .Sub c_setup = 'setup'
    .const .Sub c_sanity = 'check_sanity'
    .const .Sub c_mutate = 'mutate'
    .const .Sub c_value = 'check_value'

    .local pmc g_setup
    g_setup = find_global 'Foo', 'setup'
    .local pmc g_sanity
    g_sanity = find_global 'Foo', 'check_sanity'
    .local pmc g_mutate
    g_mutate = find_global 'Foo', 'mutate'
    .local pmc g_value
    g_value = find_global 'Foo', 'check_value'

    c_setup()
    c_sanity()
    g_sanity()
    c_value(1)
    g_value(1)
    c_mutate()
    c_value(2)
    g_value(2)
    c_sanity()
    g_sanity()

    g_setup()
    c_sanity()
    g_sanity()
    c_value(1)
    g_value(1)
    g_mutate()
    c_value(2)
    g_value(2)
    c_sanity()
    g_sanity()
.end



.sub main :main
    $P0 = new Integer 
    $P0 = 1
    store_global 'test_num', $P0
    
    .const .Sub _check = 'full_check'
    _check()

    $P0 = new ParrotThread
    $P0.'run_clone'(_check)
    $P0.'join'()
.end
CODE

pir_output_is(<<'CODE', <<'OUTPUT', "CLONE_CODE|CLONE_GLOBALS|CLONE_HLL|CLONE_LIBRARIES");
.HLL 'Perl', 'perl_group'

.include 'interpinfo.pasm'

.loadlib 'myops_ops'

.sub test
    .param pmc passed_value
    .local int PerlIntType
    .local pmc the_value
    PerlIntType = find_type 'PerlInt'
    the_value = new PerlIntType
    the_value = 42
    store_global 'Foo', 'x', the_value
    $I0 = typeof passed_value
    $I1 = typeof the_value
    $I0 = $I0 - $I1
    print $I0
    print "\n"
    .local pmc ns
    ns = get_namespace ['Foo']
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    ns = $P0.'get_namespace'()
    ns = ns['Foo']
    $P0 = ns['x']
    if $P0 == the_value goto okay
    print "not "
okay:
    print "ok (equal)\n"

    $I0 = fortytwo
    print $I0
    print "\n"
.end

.include 'cloneflags.pasm'

.sub main :main
    .local pmc thread
    .local int flags
    thread = new ParrotThread
    flags = .PARROT_CLONE_CODE
    bor flags, flags, .PARROT_CLONE_GLOBALS
    bor flags, flags, .PARROT_CLONE_HLL
    bor flags, flags, .PARROT_CLONE_LIBRARIES

    .local pmc passed
    .local int PerlIntType
    PerlIntType = find_type 'PerlInt'
    passed = new PerlIntType
    passed = 15
    
    .local pmc thread_func
    thread_func = global 'test'
    print "in thread:\n"
    thread.'run'(flags, thread_func, passed)
    thread.'join'()
    print "in main:\n"
    thread_func(passed)
.end
CODE
in thread:
0
ok (equal)
42
in main:
0
ok (equal)
42
OUTPUT

pir_output_is(<<'CODE', <<'OUT', 'multi-threaded strings via SharedRef');
.sub main :main
    .local pmc queue
    .local pmc tmp_string
    .local pmc shared_ref

    queue = new TQueue
    tmp_string = new String
    tmp_string = "ok 1\n"
    shared_ref = new SharedRef, tmp_string
    push queue, shared_ref
    tmp_string = new String
    tmp_string = "ok 2\n"
    shared_ref = new SharedRef, tmp_string
    push queue, shared_ref
    tmp_string = new String
    tmp_string = "ok 3\n"
    shared_ref = new SharedRef, tmp_string
    push queue, shared_ref

    .local pmc thread
    .local pmc foo

    thread = new ParrotThread
    foo = global '_foo'
    thread.'run_clone'(foo, queue)
    thread.'join'()
    print "done main\n"
.end

.sub _foo
    .param pmc queue
    $I0 = queue
    print $I0
    print "\n"
loop:
    $I0 = queue
    if $I0 == 0 goto done
    shift $P0, queue
    print $P0
    branch loop
done:
    print "done thread\n"
.end
CODE
3
ok 1
ok 2
ok 3
done thread
done main
OUT

SKIP: {
skip("no shared Strings yet", 2);
pasm_output_is(<<'CODE', <<'OUT', "thread safe queue strings 1");
    new P10, .TQueue
    print "ok 1\n"
    set I0, P10
    print I0
    print "\n"
    new P7, .String
    set P7, "ok 2\n"
    push P10, P7
    new P7, .String
    set P7, "ok 3\n"
    push P10, P7
    set I0, P10
    print I0
    print "\n"

    shift P8, P10
    print P8
    shift P8, P10
    print P8
    end
CODE
ok 1
0
2
ok 2
ok 3
OUT

pasm_output_is(<<'CODE', <<'OUT', "multi-threaded strings");
    new P10, .TQueue
    new P7, .String
    set P7, "ok 1\n"
    push P10, P7
    new P7, .String
    set P7, "ok 2\n"
    push P10, P7
    new P7, .String
    set P7, "ok 3\n"
    push P10, P7
    set P6, P10

    find_global P5, "_foo"
    new P2, .ParrotThread
    callmethod "thread3"
    set I5, P2
    getinterp P2
    callmethod "join"
    print "done main\n"
    end

.pcc_sub _foo:
    set I0, P6
    print I0
    print "\n"
loop:
    set I0, P6
    unless I0, ex
    shift P8, P6
    print P8
    branch loop
ex:
    print "done thread\n"
    returncc
CODE
3
ok 1
ok 2
ok 3
done thread
done main
OUT
}
