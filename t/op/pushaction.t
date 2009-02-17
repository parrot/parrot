#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 7;

=head1 NAME

t/op/pushaction.t - Test the C<pushaction> Instruction

=head1 SYNOPSIS

        % prove t/pmc/pushaction.t

=head1 DESCRIPTION

Tests the C<pushaction> instruction.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "pushmark" );
    pushmark 10
    print "ok 1\n"
    popmark 10
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "pushmark nested" );
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

pasm_error_output_like( <<'CODE', <<'OUTPUT', "pushmark - pop wrong one" );
    pushmark 10
    print "ok 1\n"
    popmark 500
    print "never\n"
    end
CODE
/Mark 500 not found/
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "pushaction" );
    pushmark 10
    print "ok 1\n"
    .const 'Sub' P10 = "action"
    pushaction P10
    print "ok 2\n"
    popmark 10
    print "ok 3\n"
    end
.pcc_sub action:
    get_params "0", I5
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

pir_output_is( <<'CODE', <<'OUTPUT', "pushaction - end in main" );
.sub main :main
    print "main\n"
    .const 'Sub' at_exit = "exit_handler"
    pushaction at_exit
    # IMCC inserts end here, because it is :main
.end

.sub exit_handler
    .param int flag
    print "at_exit, flag = "
    say flag
.end
CODE
main
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "pushaction as closure" );
.sub main :main
    .local pmc a
    .lex 'a', a
    pushmark 10
    a = new 'Integer'
    a = 42
    print "main\n"
    .const 'Sub' at_exit = "exit_handler"
    pushaction at_exit

    popmark 10
    .return()
.end

.sub exit_handler :outer(main)
    .param int flag
    print "at popmark, flag = "
    say flag
    .local pmc a
    a = find_lex 'a'
    print 'a = '
    say a
.end
CODE
main
at popmark, flag = 0
a = 42
OUTPUT

# This test is entirely irrelevant under the new implementation of
# continuations free from the stack. Leave it for now, to see whether there
# is some other aspect of the stack, runloops, and exceptions that can be
# tested.
# exception handlers are still run in an inferior runloop, which messes up
# nonlocal exit from within handlers.
pir_output_like(
    <<'CODE', <<'OUTPUT', "pushaction: error while handling error", todo => 'runloop shenanigans' );
.sub main :main
    push_eh h
    print "main\n"
    .const 'Sub' at_exit = "exit_handler"
    pushaction at_exit
    $P1 = new 'Exception'
    throw $P1
    print "never 1\n"
h:
    ## this is never actually reached, because exit_handler throws an unhandled
    ## exception before the handler is entered.
    print "in outer handler\n"
.end

.sub exit_handler :outer(main)
    .param int flag
    print "at_exit, flag = "
    say flag
    $P2 = new 'Exception'
    throw $P2
    print "never 2\n"
.end
CODE
/^main
at_exit, flag = 1
No exception handler/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
