#! perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/pmc/threads.t - Threads

=head1 SYNOPSIS

    % prove t/pmc/threads.t

=head1 DESCRIPTION

Tests running threads. All tests skipped unless running on known-good
platform.

=cut

if ( $^O eq "cygwin" ) {
    my @uname = split / /, qx'uname -v';

    if ( $uname[0] eq "2004-09-04" ) {
        plan skip_all => "This cygwin version is known to fail the thread tests";
        exit;
    }
}
if ( $PConfig{HAS_THREADS} ) {
    plan tests => 14;
}
else {
    plan skip_all => "No threading enabled for '$^O'";
}

pasm_output_is( <<'CODE', <<'OUTPUT', "interp identity" );
    getinterp P2
    clone P3, P2
    ne P3, P2, ok1
    print "not"
ok1:
    print "ok 1\n"
    new P4, ['ParrotThread']
    ne P2, P4, ok2
    print "not"
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

SKIP: {
    skip 'busted on win32' => 2 if $^O eq 'MSWin32';

    pir_output_is( <<'CODE', <<'OUTPUT', "thread type 1" );
.sub main :main
    .local pmc threadfunc
    .local pmc thread
    $I5 = 10
    threadfunc = get_global "foo"
    thread = new ['ParrotThread']
    thread.'run_clone'(threadfunc)

    sleep 1
    print "main "
    print $I5
    print "\n"
    # get tid of thread
    $I0 = thread
    # wait for it
    thread.'join'()
.end

.sub foo
    # check if vars are fresh
    inc $I5
    print "thread"
    # print I5 # not done because registers aren't guaranteed to be
               # initialized to anything in particular
    print "\n"
    set $I3, 0   # no retval
    returncc    # ret and be done with thread
.end
# output from threads could be reversed
CODE
thread
main 10
OUTPUT

    pir_output_is( <<'CODE', <<'OUTPUT', "thread type 1 -- repeated" );
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
    $I5 = 10
    threadfunc = get_global "foo"
    thread = new ['ParrotThread']
    thread.'run_clone'(threadfunc)

    sleep 1
    print "main "
    print $I5
    print "\n"
    # get tid of thread
    $I0 = thread
    # wait for it
    thread.'join'()
.end

.sub foo
    # check if vars are fresh
    inc $I5
    print "thread"
    # print I5 # not done because registers aren't guaranteed to be
               # initialized to anything in particular
    print "\n"
    set $I3, 0   # no retval
    returncc    # ret and be done with thread
.end
# output from threads could be reversed
CODE
thread
main 10
thread
main 10
OUTPUT
}


pir_output_is( <<'CODE', <<'OUTPUT', "thread type 2" );
.sub main :main
    set $I5, 10
    .local pmc thread
    .local pmc threadsub
    $S5 = " interp\n"
    $P6 = new ['String']
    $P6 = 'from '

    print "ok 1\n"
    threadsub = get_global "foo"
    thread = new ['ParrotThread']
    thread.'run_clone'(threadsub, $P6)
    sleep 1 # to let the thread run
    print $P6
    print $I5
    print $S5
    thread.'join'()
.end

.sub foo
    .param pmc passed
    inc $I5
    $S5 = " thread\n"
    .local pmc salutation
    salutation = box 'hello from'
    print salutation
    # print I5 # not done because register initialization is not guaranteed
    print $S5
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
ThreadInterpreter tid 1
from 10 interp
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', 'thread - kill' );
.sub main :main
    .local pmc threadsub
    .local pmc thread
    bounds 1    # assert slow core -S and -g are fine too
    threadsub = get_global "foo"
    thread = new ['ParrotThread']
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
start -1
in thread
done
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "join, get retval" );
.sub _main
    .const int MAX = 1000
    .local pmc kid
    .local pmc Adder
    Adder = get_global '_add'
    kid = new ['ParrotThread']
    .local pmc from
    from = new ['Integer']
    from = 0
    .local pmc to
    to = new ['Integer']
    to = MAX
    kid.'run_clone'(Adder, Adder, from, to)

    .local pmc result
    result = kid.'join'()
    print result
    print "\n"
    # sum = n * (n + 1)/2
    .local pmc Mul
    Mul = new ['Integer']
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
   .local pmc sum
   sum = new ['Integer']
loop:
    add sum, from
    inc from
    le from, to, loop

    .begin_return
    .set_return sum
    .end_return
.end
CODE
500500
500500
OUTPUT

pir_output_is( <<'CODE', <<'OUT', "sub name lookup in new thread" );
.sub check
    $P0 = get_global ['Foo'], 'foo'
    $I0 = isa $P0, 'Sub'
    if $I0 goto okay
    print "not "
okay:
    print "ok\n"
.end

.sub main :main
    check()
    $P0 = new ['ParrotThread']
    .local pmc thread_main
    thread_main = get_global 'thread_main'
    $P0.'run_clone'(thread_main)
    $P0.'join'()
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

pir_output_is( <<'CODE', <<'OUTPUT', "CLONE_CODE only" );

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
    test3 = get_hll_global ['Test3'], 'test3'
    test3()
    .local pmc test4
    errorsoff .PARROT_ERRORS_GLOBALS_FLAG
    test4 = get_global 'test4'
    if null test4 goto okay
    print "not "
okay:
    print "ok 4\n"
.end

.include 'cloneflags.pasm'
.sub main :main
    .local pmc test4
    .local pmc test2

    test2 = get_hll_global ['Test2'], 'test2'

    test4 = new ['Integer']
    test4 = 42
    set_global 'test4', test4

    .local pmc thread
    thread = new ['ParrotThread']
    .local pmc thread_func
    thread_func = get_global 'thread_func'
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

pir_output_is( <<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_GLOBALS" );

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
    $P0 = get_hll_global [ 'Bar' ], 'alpha'
    'is'($P0, 1, 'Bar::alpha == 1', 'alpha')
    $P0 = 43
    sleep 0.2 # give enough time that the main thread might modify
              # any shared Foo::beta can cause phantom errors
    $P0 = get_global 'beta'
    'is'($P0, 2, 'Foo::beta == 2 [accessed locally]', 'beta1')
    $P0 = 5
    $P0 = get_global 'beta'
    'is'($P0, 5, 'Foo::beta == 5 [accessed locally after assignment]', 'beta2')
    $P0 = get_hll_global [ 'Foo' ], 'beta'
    'is'($P0, 5, 'Foo::beta == 5 [after assign; absolute]', 'beta3')
.end

.namespace [ 'main' ]

.sub test_setup
    $P0 = new ['Integer']
    $P0 = 1
    set_hll_global [ 'Bar' ], 'alpha', $P0
    $P0 = new ['Integer']
    $P0 = 2
    set_hll_global [ 'Foo' ], 'beta', $P0
.end

.include 'cloneflags.pasm'
.sub main :main
    'test_setup'()

    .local pmc thread
    thread = new ['ParrotThread']
    .local pmc _thread_func
    _thread_func = get_hll_global [ 'Foo' ], 'thread_test_func'
    $I0 = .PARROT_CLONE_CODE
    bor $I0, $I0, .PARROT_CLONE_GLOBALS
    print "in thread:\n"
    thread.'run'($I0, _thread_func)
    $P0 = get_hll_global [ 'Foo' ], 'beta'
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

TODO: {
    local $TODO = "vtable overrides aren't properly cloned TT # 1248";

    pir_output_is( <<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_CLASSES; superclass not built-in" );
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

.sub get_string :vtable :method
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
    $P0 = new ['Bar']
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
    thread = new ['ParrotThread']
    .local pmc _thread_func
    _thread_func = get_hll_global ['main'], 'thread_test_func'
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
}

pir_output_is( <<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_CLASSES; superclass built-in", todo => 'likely incorrect test TT 1248');
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

.sub get_string :vtable :method
    .return ("A Bar")
.end

.namespace [ 'main' ]

.sub init
    $P0 = get_class 'Integer'
    $P1 = subclass $P0, 'Foo'
    addattribute $P1, 'foo1'
    addattribute $P1, 'foo2'
    $P2 = subclass $P1, 'Bar'
    addattribute $P2, 'bar1'
.end

.sub thread_test_func
    $P0 = new ['Bar']
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
    thread = new ['ParrotThread']
    .local pmc _thread_func
    _thread_func = get_global 'thread_test_func'
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

pir_output_is( <<'CODE', <<'OUTPUT', "CLONE_CODE | CLONE_GLOBALS| CLONE_HLL" );
.HLL 'Test'
.sub setup
    $P0 = new ['Integer']
    $P0 = 42
    set_global 'x', $P0
.end

.include 'interpinfo.pasm'
.sub test
    $P0 = get_global 'x'
    if $P0 == 42 goto okay1
    print "not "
okay1:
    print "ok 1\n"
    $P1 = get_root_namespace
    $P1 = $P1['test']
    $P1 = $P1['x']
    $P1 = 43
    if $P0 == 43 goto okay2
    print "not "
okay2:
    print "ok 2\n"
.end

.HLL ''

.include 'cloneflags.pasm'

.sub main :main
    .local pmc setup
    .local pmc test
    setup = get_root_namespace
    setup = setup['test']
    test = setup['test']
    setup = setup['setup']
    setup()

    .local pmc thread
    .local int flags
    thread = new ['ParrotThread']
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

# Direct constant access to sub objects commented out, see TT #1120.
pir_output_unlike( <<'CODE', qr/not/, "globals + constant table subs issue");
.namespace [ 'Foo' ]

.include 'interpinfo.pasm'
.sub 'is'
    .param pmc    what
    .param pmc    expect
    .param string desc      :optional
    .param int    have_desc :opt_flag

    unless have_desc goto diagnose
    desc = ' - ' . desc

  diagnose:
    .local pmc number
    number = get_global 'test_num'
    if what == expect goto okay
    print "# got:      "
    say what
    print "# expected: "
    say expect
    print "not ok "
    print number
    say desc
    inc number
    $P0 = interpinfo .INTERPINFO_CURRENT_CONT
loop:
    $I0 = defined $P0
    if $I0 == 0 goto done
    print "    "
    say $P0
    $P0 = $P0.'continuation'()
    branch loop
done:
    .return ()
okay:
    print "ok "
    print number
    inc number
    say desc
.end

.sub setup
    $P0 = new ['Integer']
    $P0 = 1
    set_global 'foo', $P0
.end

.sub _check_sanity
    .param string desc
    $P0 = get_global 'foo'
    $P1 = get_hll_global [ 'Foo' ], 'foo'
    is($P0, $P1, desc)
.end

.sub mutate
    $P0 = new ['Integer']
    $P0 = 2
    set_global 'foo', $P0
.end

.sub check_sanity
#    _check_sanity( 'direct call' )
    $P0 = get_global '_check_sanity'
    $P0( 'call from get_global' )
    $P0 = get_hll_global [ 'Foo' ], '_check_sanity'
    $P0( 'call from get_hll_global' )
.end

.sub _check_value
    .param int value
    $P0 = get_global 'foo'
    is($P0, value)
.end

.sub check_value
    .param int value
#    _check_value(value)
    $P0 = get_global '_check_value'
    $P0(value)
    $P0 = get_hll_global [ 'Foo' ], '_check_value'
    $P0(value)
.end

.sub full_check
#    .const 'Sub' c_setup = 'setup'
#    .const 'Sub' c_sanity = 'check_sanity'
#    .const 'Sub' c_mutate = 'mutate'
#    .const 'Sub' c_value = 'check_value'

    .local pmc c_setup
    c_setup = get_global  'setup'
    .local pmc c_sanity
    c_sanity = get_global 'check_sanity'
    .local pmc c_mutate
    c_mutate = get_global 'mutate'
    .local pmc c_value
    c_value = get_global  'check_value'

    .local pmc g_setup
    g_setup = get_hll_global [ 'Foo' ], 'setup'
    .local pmc g_sanity
    g_sanity = get_hll_global [ 'Foo' ], 'check_sanity'
    .local pmc g_mutate
    g_mutate = get_hll_global [ 'Foo' ], 'mutate'
    .local pmc g_value
    g_value = get_hll_global [  'Foo' ], 'check_value'

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
    $P0 = new ['Integer']
    $P0 = 1
    set_global 'test_num', $P0

    .const 'Sub' _check = 'full_check'
    _check()

    $P0 = new ['ParrotThread']
    $P0.'run_clone'(_check)
    $P0.'join'()
.end
CODE

pir_output_is(
    <<'CODE', <<'OUTPUT', 'CLONE_CODE|CLONE_GLOBALS|CLONE_HLL|CLONE_LIBRARIES - TT # 1250' );
.HLL 'Perl'

.include 'interpinfo.pasm'

.loadlib 'foo_group'

.sub test
    .param pmc passed_value
    .local pmc the_value
    the_value = new ['Integer']
    the_value = 42
    set_hll_global ['Foo'], 'x', the_value
    $S0 = typeof passed_value
    $S1 = typeof the_value
    $I0 = iseq $S0, $S1
    say $I0

    .local pmc ns
    ns = get_namespace ['Foo']
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    ns = $P0.'get_namespace'()
    ns = ns['Foo']
    $P0 = ns['x']
    if $P0 == the_value goto okay
    print "not "
okay:
    say "ok (equal)"

    $I0 = the_value
    say $I0
.end

.include 'cloneflags.pasm'

.sub main :main
    .local pmc thread
    .local int flags
    thread = new ['ParrotThread']
    flags = .PARROT_CLONE_CODE
    bor flags, flags, .PARROT_CLONE_GLOBALS
    bor flags, flags, .PARROT_CLONE_HLL
    bor flags, flags, .PARROT_CLONE_LIBRARIES

    .local pmc passed
    passed = new ['Foo']
    passed = 15

    .local pmc thread_func
    thread_func = get_global 'test'
    say "in thread:"
    thread.'run'(flags, thread_func, passed)
    thread.'join'()
    say "in main:"
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
