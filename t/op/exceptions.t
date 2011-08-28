#! perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 31;

=head1 NAME

t/op/exceptions.t - Exception Handling

=head1 SYNOPSIS

    % prove t/op/exceptions.t

=head1 DESCRIPTION

Tests C<Exception> and C<ExceptionHandler> PMCs.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh label - pop_eh" );
.pcc_sub :main main:
    push_eh _handler
    print "ok 1\n"
    pop_eh
    print "ok 2\n"
    end
_handler:
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh eh - pop_eh" );
.pcc_sub :main main:
    new P29, 'ExceptionHandler'
    push_eh P29
    print "ok 1\n"
    pop_eh
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh - throw" );
.pcc_sub :main main:
    print "main\n"
    push_eh _handler
    new P30, 'Exception'
    throw P30
    print "not reached\n"
    end
_handler:
    print "caught it\n"
    end
CODE
main
caught it
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh eh - throw" );
.pcc_sub :main main:
    print "main\n"
    new P29, 'ExceptionHandler'
    set_label P29, _handler
    push_eh P29
    new P30, 'Exception'
    throw P30
    print "not reached\n"
    end
_handler:
    print "caught it\n"
    end
CODE
main
caught it
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get_results" );
.pcc_sub :main main:
    print "main\n"
    push_eh handler
    new P1, 'Exception'
    set P1, "just pining"
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

pasm_output_is( <<'CODE', <<'OUTPUT', "get_results - be sure registers are ok" );
.pcc_sub :main main:
# see also #38459
    print "main\n"
    new P0, 'Integer'
    push_eh handler
    new P1, 'Exception'
    set P1, "just pining"
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
    new $P1, 'Exception'
    set $P1, "just pining"
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
.pcc_sub :main main:
    print "main\n"
    push_eh _handler

    new P30, 'Exception'
    set P30, "something happened"
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
.pcc_sub :main main:
    new P0, 'Exception'
    set P0, "something happened"
    throw P0
    print "not reached\n"
    end
CODE
/something happened/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "throw - no handler, no message" );
.pcc_sub :main main:
    push_eh _handler
    new P0, 'Exception'
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
.pcc_sub :main main:
    new P0, 'Exception'
    throw P0
    print "not reached\n"
    end
CODE
/No exception handler and no message/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "2 exception handlers" );
.pcc_sub :main main:
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, 'Exception'
    set P30, "something happened"
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
    get_results "0", P0
    set S0, P0
    print "caught it in 2\n"
    print S0
    print "\n"
    end
CODE
main
caught it in 2
something happened
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "2 exception handlers, throw next" );
.pcc_sub :main main:
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, 'Exception'
    set P30, "something happened"
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

pasm_output_is( <<'CODE', <<OUT, "die" );
.pcc_sub :main main:
    push_eh _handler
    die 3, 100
    print "not reached\n"
    end
_handler:
    print "caught it\n"
    end
CODE
caught it
OUT

pasm_output_is( <<'CODE', <<OUT, "die, error, severity" );
.pcc_sub :main main:
    push_eh _handler
    die 3, 100
    print "not reached\n"
    end
_handler:
    get_results "0", P5
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
.pcc_sub :main main:
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
.pcc_sub :main main:
    noop
    exit 0
    print "not reached\n"
    end
CODE

pasm_output_is( <<'CODE', <<'OUTPUT', "push_eh - throw" );
.pcc_sub :main main:
    print "main\n"
    push_eh handler
    print "ok\n"
    new P30, 'Exception'
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

pir_error_output_like( <<'CODE', <<'OUTPUT', 'pop_eh with no handler' );
.sub main :main
    pop_eh
    print "no exceptions.\n"
.end
CODE
/No handler to delete./
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'pop_eh out of context (2)');
.sub main :main
    .local pmc outer, cont
    push_eh handler
    test1()
    print "skipped.\n"
    goto done
handler:
    .local pmc exception
    .get_results (exception)
    $S0 = exception
    print "Error: "
    print $S0
    print "\n"
done:
    print "done.\n"
.end
.sub test1
    .local pmc exit
    print "[in test1]\n"
    ## pop_eh is illegal here, and signals an exception.
    pop_eh
    print "[cleared]\n"
.end
CODE
[in test1]
Error: No handler to delete.
done.
OUTPUT

# stringification is handled by a vtable, which runs in a second
# runloop. when an error in the method tries to go to a Error_Handler defined
# outside it, it winds up going to the inner runloop, giving strange results.
pir_output_is( <<'CODE', <<'OUTPUT', 'pop_eh out of context (2)' );
.sub main :main
        $P0 = get_hll_global ['Foo'], 'load'
        $P0()
        $P0 = new 'Foo'
        push_eh catch
        $S0 = $P0
        pop_eh
        say "huh?"
        .return()

catch:
        .get_results ($P1)
        finalize $P1
        say "caught"
        .return()
.end

.namespace ['Foo']

.sub load
    $P0 = newclass 'Foo'
.end

.sub get_string :vtable :method
    $P0 = new 'Exception'
    throw $P0
.end
CODE
caught
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "throw in main, no handler" );
.sub main :main
    print "main\n"
    $P0 = new 'Exception'
    throw $P0
    .return()
.end
CODE
/^main
No exception handler/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "exit_handler via exit exception" );
.sub main :main
    .local pmc a
    .lex 'a', a
    a = new 'Integer'
    a = 42
    push_eh handler
    exit 0
handler:
    .const 'Sub' $P0 = 'exit_handler'
    capture_lex $P0
    .tailcall $P0()
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

## Regression test for r14697.  This probably won't be needed when PDD23 is
## fully implemented.
pir_error_output_like( <<'CODE', <<'OUTPUT', "invoke handler in calling sub" );
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
    rethrow exception
.end

.sub broken
    $P0 = new 'Exception'
    $P0 = "something broke"
    throw $P0
.end
CODE
/\Ain handler.
something broke
something broke
current inst/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'die_s' );
.sub main :main
    die 'We are dying str!'
.end
CODE
/We are dying str!/
OUTPUT
pir_error_output_like( <<'CODE', <<'OUTPUT', 'die_p' );
.sub main :main
    .local pmc msg
    msg = new 'String'
    msg = 'We are dying pmc!'
    die msg
.end
CODE
/We are dying pmc!/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "resuming after exception handled - goto label" );
.sub main :main
    print "before calling setup_foo\n"
    setup_foo()
    print "after calling setup_foo\n"
    end
.end

.sub setup_foo
    print "in setup_foo\n"
    newclass $P0, "Foo"
    push_eh handler
    newclass $P0, "Foo"
    pop_eh
resume:
    print "running more code\n"
    .return()
handler:
    print "in handler\n"
    goto resume
.end

CODE
before calling setup_foo
in setup_foo
in handler
running more code
after calling setup_foo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "resuming after exception handled - return from cont" );
.sub main :main
    print "before calling setup_foo\n"
    setup_foo()
    print "after calling setup_foo\n"
    end
.end

.sub setup_foo
    print "in setup_foo\n"
    newclass $P0, "Foo"
    push_eh handler
    newclass $P0, "Foo"
    pop_eh
resume:
    print "never reached\n"
handler:
    print "in handler\n"
    .return()
.end
CODE
before calling setup_foo
in setup_foo
in handler
after calling setup_foo
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "resuming after exception handled - return from cont" );
# This test is a simplified version of PGE's grammar creation code.

.sub main :main
    $P1 = newclass 'FirstClass'
    $P1 = newclass 'MakerClass'

    $P0 = new 'String'
    $P0 = 'Foo'
    $P1 = newclass $P0

    print "before compile\n"
    compile($P0)
    print "after compile\n"
    end
.end

.sub compile
    .param string classname
    print "in compile subroutine\n"
    $P0 = new 'FirstClass'
    $P1 = $P0.'compile'(classname)
    print "returned from handler\nException message: "
    print $P1
.end

.namespace [ "FirstClass" ]
.sub 'compile' :method
    .param pmc name
    print "in compile method\n"
    $P1 = new 'String'
    $P1 = "no exception\n"
  make_grammar:
    push_eh handler
    $P0 = new 'MakerClass'
    $P0.'make'(name)
    pop_eh
    .return($P1)
  handler:
    get_results "0", $P2
    print "in handler\n"
  .return ($P2)
.end

.namespace [ "MakerClass" ]
.sub 'make' :method
    .param pmc name
    print "in make method\n"
    $P0 = newclass name
    print "after newclass, never reached\n"
.end

CODE
before compile
in compile subroutine
in compile method
in make method
in handler
returned from handler
Exception message: Class Foo already registered!
after compile
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Resumable exceptions" );
.sub main :main
    push_eh _handler
    new $P1, 'Exception'
    say 'Before throwing'
    throw $P1
    say 'After throwing'
    end
_handler:
    .local pmc e
    .local string s
    .local pmc c
    .get_results (e)
    s = e
    say 'In the exception handler'
    c = e['resume']
    c()
.end
CODE
Before throwing
In the exception handler
After throwing
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Resumable exceptions from a different context");
.sub main :main
    push_eh catcher
    'foo'()
    pop_eh
    say 'ok 4'
    .return ()
  catcher:
    .get_results ($P0)
    $P1 = $P0['resume']
    say 'in the handler'
    $P1()
.end

.sub 'foo'
    say 'ok 1'
    $P0 = new 'Exception'
    throw $P0
    say 'ok 2'
    $P0 = new 'Exception'
    throw $P0
    say 'ok 3'
.end
CODE
ok 1
in the handler
ok 2
in the handler
ok 3
ok 4
OUTPUT
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
