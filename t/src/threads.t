#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .local pmc task, sayer, name, starter, ender, number
    .local int i
    sayer = get_global 'sayer'
    starter = new ['Integer']
    ender   = new ['Integer']
    set_global 'starter', starter
    set_global 'ender',   ender
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
    ender = get_global 'ender'
    if ender == 1 goto win
    say "not ok"
    goto done
win:
    say "ok 11"
done:
.end

.sub sayer
    .param pmc name
    .local pmc starter, ender
    .local int i
    starter = get_global 'starter'
    ender = get_global 'starter'
start:
    if starter > 0 goto end
    sleep 0.1
    goto start
end:
    ender = 1
    set_global 'ender', ender
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
