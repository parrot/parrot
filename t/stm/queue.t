#! perl
# Copyright (C) 2006 The Perl Foundation.
# $Id$
use warnings;
use strict;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 3;

=head1 NAME

t/stm/queue.t -- STM tests using a fixed-sized shared queue implementation

=head1 SYNOPSIS

    % prove t/stm/queue.t

=head1 DESCRIPTION

Uses a queue implemented using STM and a fixed-sized array to test the STM
implementation.

=cut

my $library = <<'CODE';

# STM fixed-sized, array-based queue.
# attributes:
#   head: index of next element to read
#   tail: index of next element to add
#   used: index of number of items used
#   array: fixed-sized array of STMVars.

.namespace ['STMQueue']

.sub __onload 
    .local pmc class
    $I0 = find_type 'STMQueue'
    if $I0 goto done
    class = newclass 'STMQueue'
    addattribute class, 'head'
    addattribute class, 'tail'
    addattribute class, 'used'
    addattribute class, 'array'
    .return()
done:
.end

.sub __init :method
    .param int length

    .local pmc tmpint
    .local pmc stmv

    tmpint = new Integer
    tmpint = 0
    stmv = new STMVar, tmpint
    setattribute self, 'head', stmv
    stmv = new STMVar, tmpint
    setattribute self, 'used', stmv
    stmv = new STMVar, tmpint
    setattribute self, 'tail', stmv
    
    # create array
    .local pmc array
    array = new Array
    array = length
    .local int i
    i = 0
loop:
    stmv = new STMVar
    array[i] = stmv
    inc i
    if i < length goto loop
    setattribute self, 'array', array
.end

.sub fetchHead :method
    .param int removep
    .param int blockp
    .local pmc i
    .local pmc tmp
    .local pmc used
    .local pmc ret
    .local int length
tx:
    stm_start
    used = getattribute self, 'used'
    used = used.'get_read'()
    if used != 0 goto have_items
    
    unless blockp goto no_block
    # FIXME: probably should throw exception instead
    # of going to no_block
    stm_wait no_block 
    branch tx
have_items:
    tmp = getattribute self, 'head'
    i = tmp.'get_read'()
    tmp = getattribute self, 'array'
    tmp = tmp[i]
    ret = tmp.'get_read'()
    
    unless removep goto skip_remove
    tmp = getattribute self, 'head'
    $P0 = getattribute self, 'array'
    length = $P0
    i = clone i
    inc i
    i = i % length
    tmp.'set'(i)
    tmp = getattribute self, 'used'
    used = clone used
    used = used - 1
    tmp.'set'(used)
skip_remove:

    stm_commit tx
    branch normal_return

no_block:
    ret = new Undef
    stm_abort
normal_return:
    .return (ret) 
.end

.sub addTail :method
    .param pmc what
    .param int blockp

    .local pmc i
    .local pmc used
    .local int length
    .local int ret

    .local pmc tmp

    ret = 1
tx:
    stm_start

    i = getattribute self, 'tail'
    i = i.'get_read'()
    used = getattribute self, 'used'
    used = used.'get_update'()
    $P0 = getattribute self, 'array'
    length = $P0

    if used == length goto is_full

    inc used

    tmp = getattribute self, 'array'
    tmp = tmp[i]
    tmp.'set'(what)
    i = clone i
    inc i
    i = i % length

    tmp = getattribute self, 'tail'
    tmp.'set'(i)

    stm_commit tx
    branch do_ret

is_full:
    unless blockp goto no_block
    stm_wait error
    branch tx

no_block:
    stm_abort
error:
    ret = 0
do_ret:
    .return (ret)
.end

.sub __clone :method
    .local pmc result
    .local pmc length

    $P0 = getattribute self, 'array'
    $I0 = $P0
    length = new Integer
    length = $I0
    $I1 = find_type 'STMQueue'
    result = new $I1, length
    
    $P0 = getattribute self, 'array'
    $P1 = clone $P0
    setattribute result, 'array', $P1
    $P0 = getattribute self, 'head'
    setattribute result, 'head', $P0
    $P0 = getattribute self, 'tail'
    setattribute result, 'tail', $P0
    $P0 = getattribute self, 'used'
    setattribute result, 'used', $P0
    .return (result)
.end

CODE

pir_output_is($library . <<'CODE', <<'OUTPUT', "Single-threaded case");
.sub main :main
    .local pmc queue

    $P0 = get_hll_global ['STMQueue'], '__onload'
    $P0()

    $I0 = find_type 'STMQueue'
    $P0 = new Integer
    $P0 = 10
    queue = new $I0, $P0


    queue.'addTail'(0, 0)
    queue.'addTail'(1, 0)
    queue.'addTail'(2, 0)
    queue.'addTail'(3, 0)
    $I0 = queue.'fetchHead'(1, 1)
    $I1 = queue.'fetchHead'(1, 1)
    $I2 = queue.'fetchHead'(1, 1)
    $I3 = queue.'fetchHead'(1, 1)

    print $I0
    print $I1
    print $I2
    print $I3
    print "\n"
.end

CODE
0123
OUTPUT


pir_output_is($library . <<'CODE', <<'OUTPUT', "Add in one thread, remove in the other");
.const int MAX = 1000
.const int SIZE = 10

.sub adder
    .param pmc queue
    .local int i

    i = 0
loop:
    queue.'addTail'(i, 1)
    inc i
    if i < MAX goto loop
.end

.sub remover
    .param pmc queue
    .local int i
    .local int failed
    .local pmc got

    failed = 0 
    i = 0
loop:
    got = queue.'fetchHead'(1, 1)
    if got != i goto not_okay
    inc i
    if i < MAX goto loop
    print "ok\n"
    .return ()
not_okay:
    print "not ok\n"
.end

.sub main :main
    .local pmc addThread
    .local pmc removeThread
    .local pmc queue
    .local pmc me

    .local pmc _add
    .local pmc _remove

    .local pmc copy
     
    .local int addThreadId
    .local int removeThreadId

    $P0 = get_hll_global ['STMQueue'], '__onload'
    $P0()

    _add = global "adder"
    _remove = global "remover"

    addThread = new ParrotThread
    removeThread = new ParrotThread
    $I0 = find_type 'STMQueue'
    $P0 = new Integer
    $P0 = SIZE 
    queue = new $I0, $P0

    addThreadId = addThread
    removeThreadId = removeThread

    addThread.'run_clone'(_add, queue)
    removeThread.'run_clone'(_remove, queue)
    removeThread.'join'()
    addThread.'join'()
.end

CODE
ok
OUTPUT

pir_output_is($library . <<'CODE', <<'OUTPUT', "Test 2 + attempt to trigger thread death bugs");

.sub adder
    .param pmc queue
    .local int i
    i = 0
loop:
    queue.'addTail'(i, 1)
    inc i
    if i < 10 goto loop
.end

.sub remover
    .param pmc queue
    .local int i
    .local int failed
    .local pmc got

    failed = 0 
    i = 0
loop:
    got = queue.'fetchHead'(1, 1)
    if i < 9 goto no_sleep
    sleep 1 # sleep so other thread will die to trigger bug
no_sleep:
    print "got "
    print got
    print "\n"
    inc i
    if i < 10 goto loop
.end

.sub main :main
    .local pmc addThread
    .local pmc removeThread
    .local pmc queue
    .local pmc me

    .local pmc _add
    .local pmc _remove

    .local pmc copy
     
    .local int addThreadId
    .local int removeThreadId

    $P0 = get_hll_global ['STMQueue'], '__onload'
    $P0()

    _add = global "adder"
    _remove = global "remover"

    addThread = new ParrotThread
    removeThread = new ParrotThread
    $I0 = find_type 'STMQueue'
    $P0 = new Integer
    $P0 = 2 
    queue = new $I0, $P0

    addThreadId = addThread
    removeThreadId = removeThread

    addThread.'run_clone'(_add, queue)
    removeThread.'run_clone'(_remove, queue)
    # This order is different.
    addThread.'join'()
    removeThread.'join'()
.end

CODE
got 0
got 1
got 2
got 3
got 4
got 5
got 6
got 7
got 8
got 9
OUTPUT

=pod
pir_output_is($library . <<'CODE', <<'OUTPUT', "Test 2 + detach + attempt to trigger thread death bugs");

.sub adder
    .param pmc queue
    .local int i
    i = 0
loop:
    queue.'addTail'(i, 1)
    inc i
    if i < 10 goto loop
.end

.sub remover
    .param pmc queue
    .local int i
    .local int failed
    .local pmc got

    failed = 0 
    i = 0
loop:
    got = queue.'fetchHead'(1, 1)
    if i < 9 goto no_sleep
    sleep 1 # sleep so other thread will die to trigger bug
no_sleep:
    print "got "
    print got
    print "\n"
    inc i
    if i < 10 goto loop
.end

.sub main :main
    .local pmc addThread
    .local pmc removeThread
    .local pmc queue
    .local pmc me

    .local pmc _add
    .local pmc _remove

    .local pmc copy
     
    .local int addThreadId
    .local int removeThreadId

    $P0 = get_hll_global ['STMQueue'], '__onload'
    $P0()

    _add = global "adder"
    _remove = global "remover"

    addThread = new ParrotThread
    removeThread = new ParrotThread
    $I0 = find_type 'STMQueue'
    $P0 = new Integer
    $P0 = 2 
    queue = new $I0, $P0

    addThreadId = addThread
    removeThreadId = removeThread

    addThread.'run_clone'(_add, queue)
    removeThread.'run_clone'(_remove, queue)
    # Detach here, as of this writing preventing cleanup of
    # the thread's shared PMCs.
    addThread.'detach'()
    removeThread.'join'()
.end

CODE
got 0
got 1
got 2
got 3
got 4
got 5
got 6
got 7
got 8
got 9
OUTPUT
=cut
