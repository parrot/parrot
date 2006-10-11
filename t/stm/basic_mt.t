#! perl
# Copyright (C) 2006 The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ /MSWin32/ ? (skip_all => 'broken on Win32') : tests => 4;

=head1 NAME

t/stm/basic_mt.t -- Multithreaded tests of STM ops and PMCs.

=head1 SYNOPSIS
    
    % prove t/stm/basic_mt.t

=head1 DESCRIPTION

This file contains tests of the STM opcodes that require running
multiple threads at once.

=cut

pir_output_is(<<'CODE', <<'OUTPUT', "wait (simple)");
.const int N = 1000
.sub waiter
    .param pmc a

tx:
    stm_start
    if a < N goto retry
    a = -1
    stm_commit tx
    print "okay\n"
    .return ()
retry:
    stm_wait invalid
    goto tx
invalid:
    print "invalid (not okay)\n"
.end

.sub incr
    .param pmc a
    .local int i
    
    i = 0
loop:
    stm_start
    inc a
    stm_commit loop
    inc i
    if i < N goto loop
.end

.sub main :main
    .local pmc _incr
    .local pmc _waiter

    .local pmc iThr
    .local pmc wThr

    .local pmc a

    a = new Integer
    a = 0
    a = new STMRef, a

    _incr = global "incr"
    _waiter = global "waiter"

    wThr = new ParrotThread
    wThr.'run_clone'(_waiter, a)

    sleep 1 # let it really wait
    iThr = new ParrotThread
    iThr.'run_clone'(_incr, a)

    wThr.'join'()
    iThr.'join'()
.end
CODE
okay
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "wait (simple, strings)");
.const int N = 1000
.sub waiter
    .param pmc a

tx:
    stm_start
    $I0 = elements a
    if $I0 < N goto retry
    a = "done" 
    stm_commit tx
    print "okay\n"
    .return ()
retry:
    stm_wait invalid
    goto tx
invalid:
    print "invalid (not okay)\n"
.end

.sub incr
    .param pmc a
    .local int i
    
    i = 0
loop:
    stm_start
    concat a, a, "x"
    stm_commit loop
    inc i
    if i < N goto loop
.end

.sub main :main
    .local pmc _incr
    .local pmc _waiter

    .local pmc iThr
    .local pmc wThr

    .local pmc a

    a = new String 
    a = ""
    a = new STMRef, a

    _incr = global "incr"
    _waiter = global "waiter"

    wThr = new ParrotThread
    wThr.'run_clone'(_waiter, a)

    sleep 1 # let it really wait
    iThr = new ParrotThread
    iThr.'run_clone'(_incr, a)

    iThr.'join'()
    wThr.'join'()
.end
CODE
okay
OUTPUT

# This test is designed to trigger the internal deadlock detection.
# Occassionally both thread 1 and thread 2 should grab 
# main's 'a' and main's 'b', respectively, and then try to acquire
# the other. Because of deadlock detection, exactly one of the two
# threads should quickly be aborted and the other should succeed.
# Without deadlock detection, the test will not complete quickly.
pir_output_like(<<'CODE', <<'OUTPUT', "get deadlock");
.const int N = 10000
.sub thread_task
    .param pmc a
    .param pmc b
    .local int i

    i = 0
    
loop:
    stm_start
    a = i
    b = i
    stm_commit loop
    # print "loop iteration "
    # print i
    # print "\n"
    inc i
    if i < N goto loop
.end

.sub main :main
    .local pmc a
    .local pmc b
    .local pmc _task
    .local pmc t1
    .local pmc t2

    a = new Integer
    a = new STMRef, a
    b = new Integer
    b = new STMRef, b

    _task = global "thread_task"
    
    t1 = new ParrotThread
    t2 = new ParrotThread
    t1.'run_clone'(_task, a, b)
    t2.'run_clone'(_task, b, a)

    t1.'join'()
    t2.'join'()

    print "okay\n"
.end
CODE
/okay/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "wait + invalidate outer transcation");
.const int N = 50
.sub waiter
    .param pmc a

tx:
    stm_start
    if a < N goto retry
    a = -1
    stm_commit tx
    print "okay\n"
    .return ()
retry:
    # we start a nested transcation here;
    # the only we we ill get out of this loop
    # is if stm_wait jumps to 'invalid'.
    stm_start
    stm_wait invalid
    goto retry 
invalid:
    stm_abort
    goto tx
.end

.sub incr
    .param pmc a
    .local int i
    
    i = 0
loop:
    stm_start
    inc a
    stm_commit loop
    inc i
    if i < N goto loop
.end

.sub main :main
    .local pmc _incr
    .local pmc _waiter

    .local pmc iThr
    .local pmc wThr

    .local pmc a

    a = new Integer
    a = 0
    a = new STMRef, a

    _incr = global "incr"
    _waiter = global "waiter"

    wThr = new ParrotThread
    wThr.'run_clone'(_waiter, a)

    sleep 1 # let it really wait
    iThr = new ParrotThread
    iThr.'run_clone'(_incr, a)

    wThr.'join'()
    iThr.'join'()
.end
CODE
okay
OUTPUT
