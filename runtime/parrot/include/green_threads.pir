# Copyright (C) 2010, Parrot Foundation.
# $Id$

#=head1 green_threads.pir
#
#Provides an implementation of preempting green threads in pure PIR.#
#
#=head1 Summary
#
# include 'green_threads.pir'
# gt_init()
# gt_spawn(sub1, arg1)
# gt_spawn(sub2, arg1, arg2)
#
#=head2 gt_init ()
#
# Initialize green threads so they'll actually work.
#
#=head2 gt_spawn (my_sub, ...)
#
# Asyncronously run my_sub(...)
#
#=head2 gt_exit ()
#
# Exit the current green thread.
# 
#=cut 
#

.include 'interpinfo.pasm'
.include 'timer.pasm'

.macro_const GT_QUANTUM 0.5

.sub gt_init
    $P0 = new 'ResizablePMCArray'
    set_global 'gt_threads', $P0

    .tailcall gt_set_timer()
.end

.sub gt_set_timer
    $P0 = new 'FixedPMCArray', 8
    $P0[0] = .PARROT_TIMER_NSEC
    $P0[1] = 1.0
    $P0[2] = .PARROT_TIMER_HANDLER
    $P1 = get_global 'gt_resched'
    $P0[3] = $P1
    $P0[4] = .PARROT_TIMER_REPEAT
    $P0[5] = 0
    $P0[6] = .PARROT_TIMER_RUNNING
    $P0[7] = 1
    
    $P2 = new 'Timer', $P0
    set_global 'gt_resched_timer', $P2
.end

.sub gt_resched
    .local pmc threads
    threads = get_global 'gt_threads'

    $I0 = threads
    print "In gt_resched; t = "
    say $I0
    
    if $I0 <= 0 goto done
    
    $P0 = interpinfo .INTERPINFO_CURRENT_CONT
    push threads, $P0

again:
    $P0 = shift threads
    invokecc $P0

    $I0 = threads
    if $I0 > 0 goto again

done:
    .return()
.end

.sub gt_spawn
    .param pmc my_sub
    .param pmc args :slurpy
    
    $P0 = new 'Continuation'
    set_addr $P0, run_sub

    .local pmc threads
    threads = get_global 'gt_threads'
    push threads, $P0

    .return()

run_sub:
    my_sub(args :flat)
    .tailcall gt_resched()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
