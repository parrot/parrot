#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .local pmc task, sayer, starter, ender, number, interp
    .local int i
    sayer = get_global 'sayer'
    starter = new ['Integer']
    ender   = new ['Integer']
    i = 1
    starter = 0
    ender   = 0
    say "1..11"
start:
    number = new ['String']
    number = i
    task = new ['Task']
    push task, starter
    push task, ender
    setattribute task, 'code', sayer
    interp = getinterp
    setattribute task, 'data', interp
    print "ok "
    say number
    schedule task
    inc i
    if i > 10 goto end
    goto start
end:
    starter = 1
    sleep 1 # give threads time to run. Replace by join once that's implemented
    if ender == 1 goto win
    say "not ok"
    goto done
win:
    say "ok 11"
done:
.end

.sub sayer
    .param pmc parent
    .local pmc interp, task, starter, ender, end_sub, end_task
    .local int i
    interp = getinterp
    task = interp.'current_task'()
    ender = pop task
    starter = pop task
start:
    if starter > 0 goto end
    sleep 0.1
    goto start
end:
    end_sub = get_global 'end_this'
    end_task = new ['Task']
    setattribute end_task, 'code', end_sub
    setattribute end_task, 'data', ender
    parent.'schedule'(end_task)
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
