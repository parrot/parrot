#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/exception.t - Exception Handling

=head1 SYNOPSIS

	% perl -Ilib t/pmc/exception.t

=head1 DESCRIPTION

Tests C<Exception> and C<Exception_Handler> PMCs.

=cut

use Parrot::Test tests => 24;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "push_eh - clear_eh");
    push_eh _handler
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

output_is(<<'CODE', <<'OUTPUT', "push_eh - throw");
    print "main\n"
    push_eh _handler
    new P30, .Exception
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

output_is(<<'CODE', <<'OUTPUT', "get_results");
    print "main\n"
    push_eh handler
    new P1, .Exception
    set P1[0], "just pining"
    throw P1
    print "not reached\n"
    end
handler:
    get_results "(0,0)", P0, S0
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

pir_output_is(<<'CODE', <<'OUTPUT', ".get_results() - PIR");
.sub main :main
    print "main\n"
    push_eh _handler
    new P1, .Exception
    set P1[0], "just pining"
    throw P1
    print "not reached\n"
    end
_handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    print "caught it\n"
    typeof S1, e
    print S1
    print "\n"
    print s
    print "\n"
    null P5
.end
CODE
main
caught it
Exception
just pining
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "push_eh - throw - message");
    print "main\n"
    push_eh _handler

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler:
    get_results "(0,0)", P5, S0
    print "caught it\n"
    print S0
    print "\n"
    end
CODE
main
caught it
something happend
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "throw - no handler");
    new P0, .Exception
    set P0["_message"], "something happend"
    throw P0
    print "not reached\n"
    end
CODE
/something happend/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "throw - no handler, no message");
    push_eh _handler
    new P0, .Exception
    clear_eh
    throw P0
    print "not reached\n"
    end
_handler:
    end
CODE
/No exception handler and no message/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "throw - no handler, no message");
    new P0, .Exception
    throw P0
    print "not reached\n"
    end
CODE
/No exception handler and no message/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 exception handlers");
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler1:
    get_results "(0,0)", P5, S0
    print "caught it in 1\n"
    print S0
    print "\n"
    end
_handler2:
    get_results "(0,0)", P0, S0
    print "caught it in 2\n"
    print S0
    print "\n"
    end
CODE
main
caught it in 2
something happend
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 exception handlers, throw next");
    print "main\n"
    push_eh _handler1
    push_eh _handler2

    new P30, .Exception
    set P30["_message"], "something happend"
    throw P30
    print "not reached\n"
    end
_handler1:
    get_results "(0,0)", P5, S0
    print "caught it in 1\n"
    print S0
    print "\n"
    end
_handler2:
    get_results "(0,0)", P5, S0
    print "caught it in 2\n"
    print S0
    print "\n"
    throw P5	# XXX rethrow?
    end
CODE
main
caught it in 2
something happend
caught it in 1
something happend
OUTPUT

output_is(<<'CODE', <<OUT, "die");
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

output_is(<<'CODE', <<OUT, "die, error, severity");
    push_eh _handler
    die 3, 100
    print "not reached\n"
    end
_handler:
    get_results "(0,0)", P5, S0
    print "caught it\n"
    set I0, P5["_type"]
    print "error "
    print I0
    print "\n"
    set I0, P5["_severity"]
    print "severity "
    print I0
    print "\n"
    end
CODE
caught it
error 100
severity 3
OUT

output_like(<<'CODE', <<OUT, "die - no handler");
    die 3, 100
    print "not reached\n"
    end
_handler:
    print "caught it\n"
    end
CODE
/No exception handler and no message/
OUT


output_is(<<'CODE', '', "exit exception");
    noop
    exit 0
    print "not reached\n"
    end
CODE

output_is(<<'CODE', <<'OUTPUT', "push_eh - throw");
    print "main\n"
    push_eh handler
    print "ok\n"
    new P30, .Exception
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

output_is(<<'CODE', <<'OUTPUT', "pushmark");
    pushmark 10
    print "ok 1\n"
    popmark 10
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pushmark nested");
    pushmark 10
    pushmark 11
    print "ok 1\n"
    popmark 11
    popmark 10
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "pushmark - pop wrong one");
    pushmark 10
    print "ok 1\n"
    popmark 500
    print "never\n"
    end
CODE
/mark not found/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pushaction");
    pushmark 10
    print "ok 1\n"
    .const .Sub P10 = "action"
    pushaction P10
    print "ok 2\n"
    popmark 10
    print "ok 3\n"
    end
.pcc_sub action:
    get_params "(0)", I5
    print "in action I5 = "
    print I5
    print "\n"
    returncc
CODE
ok 1
ok 2
in action I5 = 0
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pushaction, throw");
    push_eh handler
    print "ok 1\n"
    .const .Sub P10 = "action"
    pushaction P10
    print "ok 2\n"
    new P10, .Exception
    throw P10
    print "never\n"
handler:
    print "ok 3\n"
    end
.pcc_sub action:
    get_params "(0)", I5
    print "in action I5 = "
    print I5
    print "\n"
    returncc
CODE
ok 1
ok 2
in action I5 = 1
ok 3
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction, sub exit");
.sub main
    print "main\n"
    foo()
    print "back\n"
.end

.sub foo
   .const .Sub ac = "action"
    pushaction ac
    print "foo\n"
.end

.sub action
    .param int i
    print "in action I5 = "
    print i
    print "\n"
.end
CODE
main
foo
in action I5 = 0
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction, sub exit - capture CC");
.sub main
    print "main\n"
    foo()
    print "back\n"
.end

.sub foo
   .const .Sub ac = "action"
    pushaction ac
    .include "interpinfo.pasm"
    .local pmc cc
    cc = interpinfo .INTERPINFO_CURRENT_CONT
    print "foo\n"
.end

.sub action
    print "never\n"
.end
CODE
main
foo
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction, sub exit - capture CC, ret");
.sub main
    print "main\n"
    foo()
    print "back\n"
.end

.sub foo
   .const .Sub ac = "action"
    pushaction ac
    .include "interpinfo.pasm"
    .local pmc cc
    cc = interpinfo .INTERPINFO_CURRENT_CONT
    print "foo\n"
    invokecc cc
.end

.sub action
    print "never\n"
.end
CODE
main
foo
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "register corruption - implicit P5");
.sub main :main
    null P0
    null P1
    null P2
    null P3
    I0 = 1
    I1 = 2
    push_eh coke
    $P0 = global 'no coke'
coke:
    print_item I0
    print_item I1
    print_newline
.end
CODE
1 2
OUTPUT
