# Copyright (C) 2012-2013, Parrot Foundation.

=head1 NAME

examples/threads/chameneos.pir - Example peer-to-peer multi-core cooperation algorithm

=head1 SYNOPSIS

    % ./parrot examples/threads/chameneos.pir

=head1 DESCRIPTION

This is a Parrot example implementation of a P2P (peer-to-peer) cooperation
algorithm.

It uses Task PMCs to implement an algorithm that can utilize multiple cores in
achieving the agreed-upon cooperative goal.

=head1 REFERENCES

[0] "Chameneos, a Concurrency Game for Java, Ada and Others" L<http://cedric.cnam.fr/PUBLIS/RC474.pdf>

=cut


=head1 NAME

examples/threads/chameneos.pir - thread benchmark example

=head1 SYNOPSIS

    % time ./parrot examples/threads/chameneos.pir

=head1 DESCRIPTION

Threaded PIR Implementation for the alioth shootout
L<http://benchmarksgame.alioth.debian.org/u32/performance.php?test=chameneosredux>
using parrot "hyper-threads", native threads with custom pre-emptive scheduler,
non-blocking GC and threaded updater functions (proxies).

This is also a good example how to use semaphores with parrot threads.

=cut

.sub 'main' :main
    .local pmc colors, start_colors, at_most_two, at_most_two_waiters, mutex, sem_priv, first_call, a_color, b_color, chameneos, chameneo, code, data, number, color, dummy, count
    .local int i

    dummy = new ['Continuation'] # workaround, see TODO in Proxy instantiate

    count = new 'Integer'
    count = 0
    set_global 'count', count

    colors = new ['ResizableStringArray']
    colors = 3
    colors[0] = 'Blue'
    colors[1] = 'Red'
    colors[2] = 'Yellow'

    start_colors = new ['ResizableIntegerArray']
    start_colors = 4
    start_colors[0] = 2
    start_colors[1] = 0
    start_colors[2] = 1
    start_colors[3] = 0

    # init cooperation
    at_most_two_waiters = new ['ResizablePMCArray']
    at_most_two = new ['Integer']
    at_most_two = 2
    mutex       = new ['Integer']
    mutex       = 1
    sem_priv    = new ['Integer']
    sem_priv    = 0
    first_call  = new ['Integer']
    first_call  = 1
    a_color     = new ['Integer']
    a_color     = -1
    b_color     = new ['Integer']
    b_color     = -1

    code = get_global 'chameneos_code'
    chameneos = new ['ResizablePMCArray']
    chameneos = 4
    i = 0
init_chameneos:
    chameneo = new ['Task']
    chameneos[i] = chameneo
    data = new ['FixedPMCArray']
    data = 2
    number = new ['Integer']
    number = i
    data[0] = number
    color = new ['Integer']
    color = start_colors[i]
    data[1] = color
    setattribute chameneo, 'code', code
    setattribute chameneo, 'data', data
    push chameneo, b_color
    push chameneo, a_color
    push chameneo, first_call
    push chameneo, at_most_two
    push chameneo, at_most_two_waiters
    push chameneo, mutex
    push chameneo, sem_priv
    push chameneo, colors
    schedule chameneo

    inc i
    if i < 4 goto init_chameneos

    say "going to sleep"
    sleep 10
    say "woke up just in time for exit"
    say count
    exit 0
.end

.sub chameneos_code
    .param pmc data
    .local pmc interp, task, number, color, colors, at_most_two, at_most_two_waiters, mutex, sem_priv, cooperation, first_call, a_color, b_color, other_color
    .local int old_color, other_color_int, color_int
    .local string color_name

    interp      = getinterp
    task        = interp.'current_task'()
    colors      = pop task
    sem_priv    = pop task
    mutex       = pop task
    at_most_two_waiters = pop task
    at_most_two = pop task
    first_call  = pop task
    a_color     = pop task
    b_color     = pop task

    number      = data[0]
    color       = data[1]
    color_int   = color
    color       = new ['Integer']
    color       = color_int
    cooperation = get_global 'cooperation'

start:
    color_name  = colors[color]
    #print 'This is '
    #print number
    #print " and I'm "
    #say color_name

    other_color = cooperation(number, color, sem_priv, mutex, at_most_two, at_most_two_waiters, first_call, a_color, b_color)
    other_color_int = other_color

    color_int = color

    if color_int == other_color_int goto start

    color_int = 3 - color_int
    color_int = color_int - other_color_int

    color = color_int

    goto start
.end

.sub cooperation
    .param pmc id
    .param pmc color
    .param pmc sem_priv
    .param pmc mutex
    .param pmc at_most_two
    .param pmc at_most_two_waiters
    .param pmc first_call
    .param pmc a_color
    .param pmc b_color
    .local pmc interp, sem_wait, sem_unlock, call_core, call_task
    .local int other_color

    interp      = getinterp
    sem_wait    = get_global 'sem_wait'
    sem_unlock  = get_global 'sem_unlock'

    call_task = new ['Task']
    setattribute call_task, 'data', color
    push call_task, b_color
    push call_task, a_color

    sem_wait(mutex)
    if a_color > -1 goto second
        call_core = get_global 'first_call_core'
        setattribute call_task, 'code', call_core
        interp.'schedule_proxied'(call_task, a_color)
        wait call_task

        sem_unlock(mutex)
        sem_wait(sem_priv)
        other_color = b_color
        sem_unlock(mutex)
        goto done
    second:
        other_color = a_color

        call_core = get_global 'second_call_core'
        setattribute call_task, 'code', call_core
        interp.'schedule_proxied'(call_task, b_color)
        wait call_task

        sem_unlock(sem_priv)
done:
    .return(other_color)
.end

.sub first_call_core
    .param pmc data
    .local pmc interp, task, a_color, b_color
    .local int a_color_int
    interp = getinterp
    task = interp.'current_task'()

    a_color = pop task
    b_color = pop task

    a_color_int = data
    a_color     = a_color_int
    b_color     = -1
.end

.sub second_call_core
    .param pmc data
    .local pmc interp, task, b_color, a_color, count
    .local int b_color_int
    interp = getinterp
    task = interp.'current_task'()

    a_color = pop task
    b_color = pop task

    b_color_int = data
    b_color     = b_color_int
    a_color     = -1
    count = get_global 'count'
    inc count
    #say count
.end

.sub sem_unlock
    .param pmc sem
    .local pmc interp, sem_unlock_task, sem_unlock_core

    interp = getinterp
    sem_unlock_core = get_global 'sem_unlock_core'
    sem_unlock_task = new ['Task']
    setattribute sem_unlock_task, 'code', sem_unlock_core
    setattribute sem_unlock_task, 'data', sem

    interp.'schedule_proxied'(sem_unlock_task, sem)
.end

.sub sem_wait
    .param pmc sem
    .local pmc interp, waiter, sem_wait_task, sem_wait_core

    interp = getinterp
    sem_wait_core = get_global 'sem_wait_core'

    sem_wait_task = new ['Task']
    setattribute sem_wait_task, 'code', sem_wait_core
    setattribute sem_wait_task, 'data', sem
    interp.'schedule_proxied'(sem_wait_task, sem)
    wait sem_wait_task
    returncc
.end

.sub sem_wait_core
    .param pmc data
    .local pmc sem
    sem = data
test:
    disable_preemption
    if sem > 0 goto lock
    enable_preemption
    pass
    goto test
lock:
    dec sem
    enable_preemption
.end

.sub sem_unlock_core
    .param pmc data
    .local pmc sem
    sem = data
    inc sem
.end

.sub sem_ackquire
    .param pmc sem
    .param pmc sem_waiters
    .local pmc interp, waiter, sem_wait_task, sem_ackquire_core

    interp = getinterp
    sem_ackquire_core = get_global 'sem_ackquire_core'

    sem_wait_task = new ['Task']
    setattribute sem_wait_task, 'code', sem_ackquire_core
    setattribute sem_wait_task, 'data', sem
    push sem_wait_task, sem_waiters
    interp.'schedule_proxied'(sem_wait_task, sem)
    wait sem_wait_task
    returncc
.end

.sub sem_ackquire_core
    .param pmc data
    .local pmc sem, sem_waiters, interp, task, cont

    interp = getinterp
    task = interp.'current_task'()
    sem_waiters = pop task

    disable_preemption
    sem = data

    if sem > 0 goto lock
    cont = new ['Continuation']
    set_label cont, lock
    setattribute task, 'code', cont
    push sem_waiters, task
    enable_preemption
    terminate
lock:
    dec sem
    enable_preemption
.end

.sub sem_release
    .param pmc sem
    .param pmc sem_waiters
    .local pmc interp, sem_release_task, sem_release_core

    interp = getinterp
    sem_release_core = get_global 'sem_release_core'
    sem_release_task = new ['Task']
    setattribute sem_release_task, 'code', sem_release_core
    setattribute sem_release_task, 'data', sem
    push sem_release_task, sem_waiters

    interp.'schedule_proxied'(sem_release_task, sem)
.end

.sub sem_release_core
    .param pmc data
    .local pmc sem, sem_waiters, interp, task, waiter
    .local int waiters_count

    interp = getinterp
    task = interp.'current_task'()
    sem_waiters = pop task

    disable_preemption
    sem = data
    inc sem
    waiters_count = sem_waiters
    if waiters_count <= 0 goto done
    waiter = pop sem_waiters
    schedule_local waiter
done:
    enable_preemption
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
