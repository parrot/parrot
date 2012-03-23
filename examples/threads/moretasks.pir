#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .local pmc task, sayer, starter, number, interp, tasks, results
    .local int i, num_results
    interp = getinterp
    sayer = get_global 'sayer'
init:
    starter = new ['Integer']
    i = 1
    starter = 0
    say "1..100"
    tasks = new ['ResizablePMCArray']
    results = new ['ResizablePMCArray']
start:
    number = new ['String']
    number = i
    task = new ['Task']
    push task, results
    push task, starter
    setattribute task, 'code', sayer
    setattribute task, 'data', number
    print "ok "
    say number
    push tasks, task
    schedule task
    inc i
    if i > 5000 goto run
    goto start
run:
    starter = 1
check_results:
    pass
    num_results = results
    say num_results
    if num_results >= 5000 goto end
    goto check_results
end:
    goto init
.end

.sub sayer
    .param pmc name
    .local pmc interp, task, starter, results, result_sub, result_task
    .local int i
    interp = getinterp
    task = interp.'current_task'()
    starter    = pop task
    results    = pop task
    result_sub = get_global 'push_result'
start:
    if starter > 0 goto run
    sleep 0.1
    goto start
run:
    result_task = new ['Task']
    setattribute result_task, 'code', result_sub
    setattribute result_task, 'data', results
    push result_task, name
    interp.'schedule_proxied'(result_task, results)
    #say name
.end

.sub push_result
    .param pmc results
    .local pmc interp, task, number
    interp = getinterp
    task = interp.'current_task'()
    number = pop task
    push results, number
.end

.sub passing_sayer
    .param pmc name
    .local pmc interp, task, starter
    interp = getinterp
    task = interp.'current_task'()
    starter = pop task
start:
    if starter > 0 goto run
    pass
    goto start
run:
    say name
.end

.sub busy_waiting_sayer
    .param pmc name
    .local pmc interp, task, starter
    .local int i
    interp = getinterp
    task = interp.'current_task'()
    starter = pop task
start:
    if starter > 0 goto run
    i = 0
loop:
    inc i
    if i >= 10000 goto start
    goto loop
run:
    say name
.end

.sub sleeping_sayer
    .param pmc name
start:
    say name
    sleep 0.1
    goto start
.end

.sub busy_sayer
    .param pmc name
    .local pmc starter
    .local int i
start:
    i = 0
    say name
loop:
    inc i
    if i >= 1000000 goto start
    goto loop
.end
