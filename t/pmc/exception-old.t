#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 22;

=head1 NAME

t/pmc/exception.t - Exception Handling

=head1 SYNOPSIS

    % prove t/pmc/exception-old.t

=head1 DESCRIPTION

Tests C<Exception> and C<ExceptionHandler> PMCs.

=cut


pasm_output_is( <<'CODE', <<'OUTPUT', "get_results" );
    print "main\n"
    push_eh handler
    new P1, ['Exception']
    new P2, ['String']
    set P2, "just pining"
    setattribute P1, 'message', P2
    throw P1
    print "not reached\n"
    end
handler:
    get_results "0", P0
    set S0, P0
    print "caught it\n"
    typeof S1, P0
    print S1
    print "\n"
    print S0
    print "\n"
    null P5
    end

CODE
main
caught it
Exception
just pining
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'Exception initialized with String' );
.sub main :main
  .local pmc ex, exr
  .local pmc msg, msgr
  msg = new ['String']
  msg = 'Message'
  ex = new ['Exception'], msg
  push_eh handler
  throw ex
  say 'Never here'
handler:
  .get_results(exr)
  msgr = exr['message']
  say msgr
.end
CODE
Message
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'Exception initialized with Hash' );
.sub main :main
  .local pmc ex, exr
  .local pmc h, msgr
  h = new ['Hash']
  h['message'] = 'Message'
  ex = new ['Exception'], h
  push_eh handler
  throw ex
  say 'Never here'
handler:
  .get_results(exr)
  msgr = exr['message']
  say msgr
.end
CODE
Message
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get_results - be sure registers are ok" );
# see also #38459
    print "main\n"
    new P0, ['Integer']
    push_eh handler
    new P1, ['Exception']
    new P2, ['String']
    set P2, "just pining"
    setattribute P1, 'message', P2
    throw P1
    print "not reached\n"
    end
handler:
    get_results "0", P1
    inc P0
    print "ok\n"
    end

CODE
main
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', ".get_results() - PIR" );
.sub main :main
    print "main\n"
    push_eh _handler
    $P1 = new ['Exception']
    $P2 = new ['String']
    set $P2, "just pining"
    setattribute $P1, 'message', $P2
    throw $P1
    print "not reached\n"
    end
_handler:
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    print "caught it\n"
    typeof $S1, e
    print $S1
    print "\n"
    print s
    print "\n"
    null $P5
.end
CODE
main
caught it
Exception
just pining
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh - throw - message" );
    print "main\n"
    push_eh _handler

    new P30, ['Exception']
    new P20, ['String']
    set P20, "something happened"
    setattribute P30, "message", P20
    throw P30
    print "not reached\n"
    end
_handler:
    get_results "0", P5
    set S0, P5
    print "caught it\n"
    print S0
    print "\n"
    end
CODE
main
caught it
something happened
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "throw - no handler" );
    new P0, ['Exception']
    new P20, ['String']
    set P20, "something happened"
    setattribute P0, "message", P20
    throw P0
    print "not reached\n"
    end
CODE
/something happened/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "throw - no handler, no message" );
    push_eh _handler
    new P0, ['Exception']
    pop_eh
    throw P0
    print "not reached\n"
    end
_handler:
    end
CODE
/No exception handler and no message/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "throw - no handler, no message" );
    new P0, ['Exception']
    throw P0
    print "not reached\n"
    end
CODE
/No exception handler and no message/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "2 exception handlers" );
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, ['Exception']
    new P20, ['String']
    set P20, "something happened"
    setattribute P30, "message", P20
    throw P30
    print "not reached\n"
    end
_handler1:
    get_results "0", P5
    getattribute P2, P5, "message"
    print "caught it in 1\n"
    print P2
    print "\n"
    end
_handler2:
    get_results "0", P0
    getattribute P2, P0, "message"
    print "caught it in 2\n"
    print P2
    print "\n"
    end
CODE
main
caught it in 2
something happened
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "2 exception handlers, throw next" );
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, ['Exception']
    new P20, ['String']
    set P20, "something happened"
    setattribute P30, "message", P20
    throw P30
    print "not reached\n"
    end
_handler1:
    get_results "0", P5
    set S0, P5
    print "caught it in 1\n"
    print S0
    print "\n"
    end
_handler2:
    get_results "0", P5
    set S0, P5
    print "caught it in 2\n"
    print S0
    print "\n"
    rethrow P5
    end
CODE
main
caught it in 2
something happened
caught it in 1
something happened
OUTPUT


pasm_output_is( <<'CODE', <<OUT, "die, error, severity" );
    push_eh _handler
    die 3, 100
    print "not reached\n"
    end
_handler:
    get_results "0", P5
    set S0, P5
    print "caught it\n"
    set I0, P5['severity']
    print "severity "
    print I0
    print "\n"
    end
CODE
caught it
severity 3
OUT

pasm_error_output_like( <<'CODE', <<OUT, "die - no handler" );
    die 3, 100
    print "not reached\n"
    end
_handler:
    print "caught it\n"
    end
CODE
/No exception handler and no message/
OUT

pasm_output_is( <<'CODE', '', "exit exception" );
    noop
    exit 0
    print "not reached\n"
    end
CODE

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh - throw" );
    print "main\n"
    push_eh handler
    print "ok\n"
    new P30, ['Exception']
    throw P30
    print "not reached\n"
    end
handler:
    print "caught it\n"
    end
CODE
main
ok
caught it
OUTPUT
1;

# stringification is handled by a vtable, which runs in a second
# runloop. when an error in the method tries to go to a Error_Handler defined
# outside it, it winds up going to the inner runloop, giving strange results.
pir_output_is( <<'CODE', <<'OUTPUT', 'pop_eh out of context (2)' );
.sub main :main
        $P0 = get_hll_global ['Foo'], 'load'
        $P0()
        $P0 = new ['Foo']
        push_eh catch
        $S0 = $P0
        pop_eh
        say "huh?"
        .return()

catch:
        .get_results($P1)
        say "caught"
	finalize $P1
        .return()
.end

.namespace ['Foo']

.sub load
    $P0 = newclass 'Foo'
.end

.sub get_string :vtable :method
    $P0 = new ['Exception']
    throw $P0
.end
CODE
caught
OUTPUT

$ENV{TEST_PROG_ARGS} ||= '';
my @todo = $ENV{TEST_PROG_ARGS} =~ /--run-pbc/
    ? ( todo => '.tailcall and lexical maps not thawed from PBC, TT #1172' )
    : ();
#
# this test is hanging in testr since pcc_hackathon_6Mar10 branch merge at r45108
# converting to skip at the moment
#

SKIP: {
    skip ".tailcall and lexical maps not thawed from PBC - hangs", 1 if @todo;

pir_output_is( <<'CODE', <<'OUTPUT', "exit_handler via exit exception", @todo );
.sub main :main
    .local pmc a
    .lex 'a', a
    a = new ['Integer']
    a = 42
    push_eh handler
    exit 0
handler:
    .tailcall exit_handler()
.end

.sub exit_handler :outer(main)
    say "at_exit"
    .local pmc a
    a = find_lex 'a'
    print 'a = '
    say a
.end
CODE
at_exit
a = 42
OUTPUT

}

## Regression test for r14697.  This probably won't be needed when PDD23 is
## fully implemented.
pir_error_output_like( <<'CODE', <<'OUTPUT', "invoke handler in calling sub", todo => "deprecate rethrow" );
## This tests that error handlers are out of scope when invoked (necessary for
## rethrow) when the error is signalled in another sub.
.sub main :main
    push_eh handler
    broken()
    print "not reached.\n"
handler:
    .local pmc exception
    .get_results (exception)
    $S0 = exception
    print "in handler.\n"
    print $S0
    print "\n"
    #rethrow exception
.end

.sub broken
    $P0 = new ['Exception']
    new $P2, ['String']
    set $P2, "something broke"
    setattribute $P0, "message", $P2
    throw $P0
.end
CODE
/\Ain handler.
something broke
something broke
current inst/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "taking a continuation promotes RetCs");
## This test creates a continuation in a inner sub and re-invokes it later.  The
## re-invocation signals an error, which is caught by an intermediate sub.
## Returning from the "test" sub the second time failed in r28794; invoking
## parrot with "-D80" shows clearly that the "test" context was being recycled
## prematurely.  For some reason, it is necessary to signal the error in order
## to expose the bug.
.sub main :main
    .local int redux
    .local pmc cont
    ## debug 0x80
    redux = 0
    print "calling test\n"
    cont = test()
    print "back from test\n"
    if redux goto done
    redux = 1
    print "calling cont\n"
    cont()
    print "never.\n"
done:
    print "done.\n"
.end
.sub test
    ## Push a handler around the foo() call.
    push_eh handle_errs
    print "  calling foo\n"
    .local pmc cont
    cont = foo()
    print "  returning from test.\n"
    .return (cont)
handle_errs:
    pop_eh
    print "  test:  caught error\n"
    .return (cont)
.end
.sub foo
    ## Take a continuation.
    .local pmc cont
    cont = new ['Continuation']
    set_addr cont, over_there
    print "    returning from foo\n"
    .return (cont)
over_there:
    print "    got over there.\n"
    .local pmc ex
    ex = new ['Exception']
    throw ex
.end
CODE
calling test
  calling foo
    returning from foo
  returning from test.
back from test
calling cont
    got over there.
  test:  caught error
back from test
done.
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "throw - no handler" );
.sub main :main
    push_eh try
    failure()
    pop_eh
    exit 0
  try:
    .get_results($P0)
    pop_eh
    $S1 = $P0['backtrace']
    $S1 .= "\n"
    say $S1
.end

.sub failure
    die 'what'
.end
CODE
/No such string attribute/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "catch ex from C-level MULTI function" );
.sub main :main

.local pmc p, q

    p = new ['Integer']
    set p, "0"

    push_eh handler
    #throw an exception from a C-level MULTI function
    q = p / p
    goto end
    pop_eh
    goto end

handler:
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    say_something(message)
end:
.end

.sub say_something
    .param string message
    #Calling this sub is enough to trigger the bug.  If execution reached this
    #point, the bug is fixed.
    say "no segfault"
end:
.end
CODE
no segfault
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "count_eh" );
.sub main :main
    $I0 = count_eh
    if $I0 == 0 goto right_number1
        print "not "
    right_number1:
    print "ok 1\n"
    push_eh _handler1
    push_eh _handler2
    print "ok 2\n"
    $I1 = count_eh
    if $I1 == 2 goto right_number2
        print "not "
    right_number2:
    print "ok 3\n"
    pop_eh
    pop_eh
    print "ok 4\n"
    $I2 = count_eh
    if $I2 == 0 goto right_number3
        print "not "
    right_number3:
    print "ok 5\n"
    end
_handler1:
    print "first handler\n"
    end
_handler2:
    print "second handler\n"
    end
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
