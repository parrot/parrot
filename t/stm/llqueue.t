#! perl
# Copyright (C) 2006 The Perl Foundation.
# $Id$
use warnings;
use strict;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test;

plan $^O =~ /MSWin32/ ? (skip_all => 'Broken on Win32') : (tests => 2);

=head1 NAME

t/stm/llqueue.t -- Linked-List Queue STM tests

=head1 SYNOPSIS

    % prove t/stm/llqueue.t 

=head1 DESCRIPTION

Uses a linked-list based queue implemented using STM to test the STM
implementation.

=cut

die "Cowardly refusing to overwrite existing file.\n" if -e 'STMLLQueue.pir';
open my $llqueuelib, '>', 'STMLLQueue.pir' 
    or die "opening to write STMLLQueue.pir: $!\n";
print $llqueuelib $_ while <DATA>;
close $llqueuelib or warn "close: $!\n";
END {
    unlink 'STMLLQueue.pir';
}

pir_output_is(<<'CODE', <<'OUTPUT', "single-threaded case");
.sub main :main
    load_bytecode 'STMLLQueue.pir'

    .local pmc queue
    queue = new 'STMLLQueue'
    queue.'add_head'(0)
    queue.'add_head'(1)
    queue.'add_head'(2)
    queue.'add_head'(3)
    .local int i 
    i = 0
loop:
    $I0 = queue.'remove_tail'()
    print $I0
    inc i
    if i < 4 goto loop
    print "\n"
.end
CODE
0123
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Add, remove, several threads");
.sub add_thread
    .param pmc queue
    .param int start
    .param int end

    .local int i
    i = start
loop:
    queue.'add_head'(i)
    inc i
    if i <= end goto loop
    .return (0)
.end

.sub remove_thread
    .param pmc queue
    .param int count
    .local int cur
    .local int i
    .local int sum
    sum = 0
    i = 0
loop:
    cur = queue.'remove_tail'()
    sum = sum + cur
    inc i
    if i < count goto loop
    .return (sum)
.end

.const int ADD_BLOCK = 10
.const int REMOVE_BLOCK = 5
.const int ADD_THREADS = 10
.const int REMOVE_THREADS = 20

.sub main :main
    .local pmc threads

    .const .Sub add_thread = 'add_thread'
    .const .Sub remove_thread = 'remove_thread'

    .local pmc queue

    load_bytecode 'STMLLQueue.pir'
    queue = new 'STMLLQueue'

    threads = new ResizablePMCArray

    .local int i
    .local int max
    max = ADD_THREADS 
    i = 0
adders_loop:
    $P0 = new ParrotThread
    $I0 = i * ADD_BLOCK
    $I1 = i + 1
    $I1 = $I1 * ADD_BLOCK
    $I1 = $I1 - 1
    $P0.'run_clone'(add_thread, queue, $I0, $I1)
    push threads, $P0
    inc i
    if i < max goto adders_loop

    max = REMOVE_THREADS
    i = 0
removers_loop:
    $P0 = new ParrotThread
    $P0.'run_clone'(remove_thread, queue, REMOVE_BLOCK)
    push threads, $P0
    inc i
    if i < max goto removers_loop
   
    .local int sum
    sum = 0
    max = threads
    i = 0
join_loop:
    $P0 = threads[i]
    $I0 = $P0.'join'()
    sum = sum + $I0
    inc i
    if i < max goto join_loop
    print "sum is "
    print sum
    print "\n"
.end
CODE
sum is 4950
OUTPUT

__DATA__

.namespace [ 'STMLLQueue::Node'  ]

.sub __onload :load
    .local pmc class
    class = newclass 'STMLLQueue::Node'
    addattribute class, 'value'
    addattribute class, 'prev'
    addattribute class, 'next'
.end

.sub __init :method
    $P1 = new Undef
    
    setattribute self, 'value', $P1
    
    $P1 = new Undef
    $P2 = new STMVar, $P1

    setattribute self, 'prev', $P2

    $P1 = new Undef
    $P2 = new STMVar, $P1

    setattribute self, 'next', $P2
.end

.sub _do_get
    .param pmc self
    .param string attr
    $P1 = getattribute self, attr
    $P1 = $P1.'get_read'()
    .return ($P1)
.end

.sub get_next :method
    .return _do_get(self, 'next')
.end

.sub get_prev :method
    .return _do_get(self, 'prev')
.end

.sub get_value :method
    $P1 = getattribute self, 'value'
    .return ($P1)
.end

.sub set_value :method
    .param pmc new_value
    setattribute self, 'value', new_value
.end

.sub _do_set
    .param pmc self
    .param string attr
    .param pmc value
    $P1 = getattribute self, attr
    $P1.'set'(value)
.end

.sub set_next :method
    .param pmc new_next
    .return _do_set(self, 'next', new_next)
.end

.sub set_prev :method
    .param pmc new_prev
    .return _do_set(self, 'prev', new_prev)
.end

.namespace [ 'STMLLQueue' ]

.sub __onload :load
    .local pmc class
    load_bytecode 'STM.pbc'
    class = newclass 'STMLLQueue' 
    addattribute class, 'head'
    addattribute class, 'tail'
.end

.sub __init :method
    $P1 = new Undef
    $P2 = new STMVar, $P1
    setattribute self, 'head', $P2

    $P1 = new Undef
    $P2 = new STMVar, $P1
    setattribute self, 'tail', $P2
.end

.sub _add_head :method
    .param pmc value
    .local pmc head_node
    .local pmc new_node

    $P1 = getattribute self, 'head'
    head_node = $P1.'get_read'()
    new_node = new 'STMLLQueue::Node'
    new_node.'set_value'(value)
    new_node.'set_next'(head_node)
    $P1.'set'(new_node)
    $I0 = defined head_node
    if $I0 == 1 goto got_head
    $P2 = getattribute self, 'tail'
    $P2.'set'(new_node)
    $P3 = new Undef
    new_node.'set_prev'($P3)
    .return ()
got_head:
    head_node.'set_prev'(new_node)
    .return ()
.end

.sub add_head :method
    .param pmc value
    .const .Sub _add_head = '_add_head'
    $P1 = get_hll_global ['STM'], 'transaction'
    $P1(_add_head, self, value)
.end

.sub _remove_tail :method
    .local pmc tail_node
    .local pmc tail_tail_node
    
    $P1 = getattribute self, 'tail'
    tail_node = $P1.'get_read'()

    $I0 = defined tail_node
    if $I0 == 0 goto no_tail

    tail_tail_node = tail_node.'get_prev'()
    
    $P1.'set'(tail_tail_node)
    $I0 = defined tail_tail_node
    if $I0 == 1 goto skip_head
    $P2 = getattribute self, 'head'
    $P2.'set'(tail_tail_node) # which is Undef
    branch do_return
skip_head:
    $P3 = new Undef
    tail_tail_node.'set_next'($P3)
do_return:
    .return tail_node.'get_value'()
no_tail:
    $P0 = get_hll_global ['STM'], 'retry'
    $P0()
.end

.sub remove_tail :method
    .const .Sub _remove_tail = '_remove_tail'
    $P1 = get_hll_global ['STM'], 'transaction'
    $P2 = $P1(_remove_tail, self)
    .return ($P2)
.end
