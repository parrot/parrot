#!./parrot

.sub main :main
    .local pmc task, a, b
    task = get_global 'task'
    a = new ['String']
    a = "a"
    b = new ['String']
    b = "b"
    $P0 = new ['Task']
    setattribute $P0, 'code', task
    setattribute $P0, 'data', a
    $P1 = new ['Task']
    setattribute $P1, 'code', task
    setattribute $P1, 'data', b
    schedule $P0
    schedule $P1
    sleep 10
    exit 0
.end

.sub task
    .param pmc name
    .local int i
start:
    print name
    i = 0
loop:
    inc i
    if i >= 100000 goto start
    goto loop
.end
