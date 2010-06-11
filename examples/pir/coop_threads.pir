# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 Cooperative threads in pure PIR

This file demonstrates cooperative concurrency using continuations
on Parrot.

See also
http://www.parrot.org/content/threads-are-continuations

=cut

=head1 th_init

First, we create an array to store unscheduled threads in. For simplicity,
this is stored in a global.

=cut

.include 'interpinfo.pasm'

.sub th_init
    $P0 = new 'ResizablePMCArray'
    set_global 'threads', $P0
.end

=head1 th_create

This is the 'spawn' call. It takes a sub and schedules it to run as a
thread.

=cut

.sub th_create
    .param pmc in_sub
    $P0 = get_global 'threads'
    push $P0, in_sub
.end

=head1 th_resched

This is the 'yield' call. When called from a running thread, it saves the
current point in the computation as a continuation and runs the next thread.

=cut

.sub th_resched
    .local pmc cur_th, next_th, ths
    ths = get_global 'threads'

    # This gets the return continuation for the currently running sub.
    # When this continuation is invoked, it will be as if this call
    # to th_resched just returned.
    cur_th = interpinfo .INTERPINFO_CURRENT_CONT
    push ths, cur_th

again:  
    next_th = shift ths
    invokecc next_th

    $I0 = ths
    if $I0 > 0 goto again
.end

=head1 th_main

This starts up the thread system (after some threads have been scheduled) and makes
sure the program doesn't exit before all the threads have run to completion.

=cut

.sub th_main
    .local pmc ths

again1: 
    ths = get_global 'threads'

    $I0 = ths
    if $I0 <= 0 goto done

    th_resched()
    
    goto again1
done:   
.end

=head1

That's it. All we need now is some test threads and a main function to run them.

=cut

.sub sub1
    say "sub1: Hallo"
    th_resched()

    say "sub1: Dance! <(\"< >\")> <(\"<"
    th_resched()

    say "sub1: Bye"
.end

.sub sub2
    say "sub2: Hallo"
    th_resched()

    say "sub2: Dance! >\")> <(\"< >\")>"
    th_resched()

    say "sub2: Bye"
.end

.sub sub3
    say "sub3: Good morning"

    th_resched()
    
    $I0 = 5
    $I1 = $I0 + 3

    th_resched()
    
    print "sub3: 5 + 3 = "
    say $I1

    th_resched()

    say "sub3: Is leaving."
.end

.sub main :main
    th_init()

    $P0 = get_global 'sub1'
    th_create($P0)

    $P0 = get_global 'sub3'
    th_create($P0)
    
    $P0 = get_global 'sub2'
    th_create($P0)

    th_main()

    say "All done"
.end

=head1 Expected Output

The program should (and does) produce this output:

sub1: Hallo
sub3: Good morning
sub2: Hallo
sub1: Dance! <("< >")> <("<
sub2: Dance! >")> <("< >")>
sub1: Bye
sub3: 5 + 3 = 8
sub2: Bye
sub3: Is leaving.
All done

=cut
                         
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
