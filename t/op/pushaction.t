#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
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

Tests the C<pushaction> instruction.  Note that there are also uses of
C<pushaction> in C<t/pmc/exception.t> and C<t/pmc/continuation.t>.  If
you want to add a test that requires a continuation or throws an
error, you probably want to put it in one of those files instead.

=cut

pasm_output_is(<<'CODE', <<'OUTPUT', "pushaction");
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
    print "unwind\n"
.end
CODE
main
foo
unwind
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
    print "unwind\n"
.end
CODE
main
foo
unwind
back
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction - return from main");
.sub main :main
    print "main\n"
    .const .Sub at_exit = "exit_handler"
    pushaction at_exit
    .return()
.end

.sub exit_handler
    .param int flag
    print_item "at_exit, flag ="
    print_item flag
    print_newline
.end
CODE
main
at_exit, flag = 0
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction - end in main");
.sub main :main
    print "main\n"
    .const .Sub at_exit = "exit_handler"
    pushaction at_exit
    # IMCC inserts end here, because it is :main
.end

.sub exit_handler
    .param int flag
    print_item "at_exit, flag ="
    print_item flag
    print_newline
.end
CODE
main
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pushaction as closure");
.sub main :main
    .local pmc a
    .lex 'a', a
    a = new .Integer
    a = 42
    print "main\n"
    .const .Sub at_exit = "exit_handler"
    pushaction at_exit
    .return()
.end

.sub exit_handler :outer(main)
    .param int flag
    print_item "at_exit, flag ="
    print_item flag
    print_newline
    .local pmc a
    a = find_lex 'a'
    print_item 'a ='
    print_item a
    print_newline
.end
CODE
main
at_exit, flag = 0
a = 42
OUTPUT
