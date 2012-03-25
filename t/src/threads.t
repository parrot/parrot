#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .local pmc task, tasks, sayer, starter, ender, number, interp, end_sub
    .local int i
    interp = getinterp
    sayer = get_global 'sayer'
    starter = new 'Integer', 0
    ender   = new 'Integer', 0
    tasks   = new 'ResizablePMCArray'
    end_sub = get_global 'end_this'
    i = 1
    say "1..21"
start:
    number = new ['String']
    number = i
    task = new ['Task']
    push task, starter
    push task, ender
    push task, end_sub
    setattribute task, 'code', sayer
    setattribute task, 'data', number
    print "ok "
    say number
    push tasks, task
    schedule task
    inc i
    if i > 10 goto end
    goto start
end:
    starter = 1
wait_for_tasks:
    task = shift tasks
    wait task
    print "ok "
    say i
    inc i
    if i > 20 goto check
    goto wait_for_tasks
check:
    if ender == 1 goto win
    say "not ok"
    goto done
win:
    say "ok 21"
done:
.end

.sub sayer
    .param pmc name
    .local pmc interp, task, starter, ender, end_sub, end_task, tmp
    .local int i
    interp = getinterp
    task = interp.'current_task'()
    end_sub = pop task
    ender = pop task
    starter = pop task
start:
    if starter > 0 goto end
    sleep 0.1
    goto start
end:
    end_task = new ['Task']
    setattribute end_task, 'code', end_sub
    setattribute end_task, 'data', ender
    interp.'schedule_proxied'(end_task, ender)
    returncc
.end

.sub end_this
    .param pmc ender
    ender = 1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
