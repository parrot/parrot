# Copyright (C) 2012, Parrot Foundation.

.sub 'main' :main
    .local pmc colors, start_colors, at_most_two, mutex, sem_priv, first_call, a_color, b_color, chameneos, chameneo, code, data, number, color, dummy, count
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
    at_most_two = new ['Integer']
    at_most_two = 2
    mutex       = new ['Integer']
    mutex       = 1
    sem_priv    = new ['Integer']
    sem_priv    = 0
    first_call  = new ['Integer']
    first_call  = 1
    a_color     = new ['Integer']
    b_color     = new ['Integer']

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
    push chameneo, mutex
    push chameneo, sem_priv
    push chameneo, colors
    schedule chameneo

    inc i
    if i < 4 goto init_chameneos

    say "going to sleep"
    sleep 10
    say "woke up just in time for exit"
    exit 0
.end

.sub chameneos_code
    .param pmc data
    .local pmc interp, task, number, color, colors, at_most_two, mutex, sem_priv, cooperation, first_call, a_color, b_color, other_color
    .local int old_color, other_color_int, color_int
    .local string color_name

    interp      = getinterp
    task        = interp.'current_task'()
    colors      = pop task
    sem_priv    = pop task
    mutex       = pop task
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
    print 'This is '
    print number
    print " and I'm "
    say color_name

    other_color = cooperation(number, color, sem_priv, mutex, at_most_two, first_call, a_color, b_color)
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
    .param pmc first_call
    .param pmc a_color
    .param pmc b_color
    .local pmc interp, sem_wait, sem_unlock, call_core, call_task, other_color

    interp      = getinterp
    sem_wait    = get_global 'sem_wait'
    sem_unlock  = get_global 'sem_unlock'

    sem_wait(at_most_two)
    sem_wait(mutex)

    if first_call == 1 goto first
        call_core = get_global 'second_call_core'
        call_task = new ['Task']
        push call_task, first_call
        push call_task, b_color
        setattribute call_task, 'code', call_core
        setattribute call_task, 'data', color
        interp.'schedule_proxied'(call_task, b_color)
        wait call_task

        other_color = a_color
        sem_unlock(sem_priv)
        goto done
    first:
        call_core = get_global 'first_call_core'
        call_task = new ['Task']
        push call_task, first_call
        push call_task, a_color
        setattribute call_task, 'code', call_core
        setattribute call_task, 'data', color
        interp.'schedule_proxied'(call_task, a_color)
        wait call_task

        sem_unlock(mutex)
        sem_wait(sem_priv)
        other_color = b_color
        sem_unlock(mutex)
        sem_unlock(at_most_two)
        sem_unlock(at_most_two)
done:
    .return(other_color)
.end

.sub first_call_core
    .param pmc data
    .local pmc interp, task, a_color, first_call
    .local int a_color_int
    interp = getinterp
    task = interp.'current_task'()

    a_color    = pop task
    first_call = pop task

    a_color_int = data
    a_color     = a_color_int
    first_call  = 0
.end

.sub second_call_core
    .param pmc data
    .local pmc interp, task, b_color, first_call, count
    .local int b_color_int
    interp = getinterp
    task = interp.'current_task'()

    b_color    = pop task
    first_call = pop task

    first_call = 1
    b_color_int = data
    b_color     = b_color_int
    count = get_global 'count'
    inc count
    say count
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
