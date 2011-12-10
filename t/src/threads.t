#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .local pmc task, sayer, starter, ender, number, interp, end_sub
    .local int i
    interp = getinterp
    sayer = get_global 'sayer'
    starter = new ['Integer']
    ender   = new ['Integer']
    end_sub = get_global 'end_this'
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
    push task, end_sub
    setattribute task, 'code', sayer
    setattribute task, 'data', number
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
