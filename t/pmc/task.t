#!./parrot
# Copyright (C) 2010-2011, Parrot Foundation.

.include 'sysinfo.pasm'
.loadlib 'sys_ops'

.sub main
    .include 'test_more.pir'

    plan(6)

    ok(1, "initialized")

    tasks_run()
    task_send_recv()
#    task_kill()      # kill NYI
#    preempt_and_exit()
.end

.sub tasks_run
    $P0 = new 'Integer', 0
    set_global 'N', $P0

    $P0 = get_global 'task1'
    $P1 = new 'Task', $P0
    schedule $P1
    wait $P1

    $P0 = get_global 'task2'
    $P1 = new 'Task', $P0
    schedule $P1
    wait $P1

    $P0 = get_global 'sub1'
    schedule $P0
.end

.sub task1
    say "ok 2 task1 ran"
.end

.sub task2
    say "ok 3 task2 ran"
.end

.sub sub1
    say "ok 4 sub1 ran"
.end

.sub task_send_recv
    $P0 = get_global 'recv_msg1'
    $P1 = new 'Task', $P0
    schedule $P1
    sleep 0.1

    $P2 = new 'String'
    $P2 = "Hai 1"

    $P1.'send'($P2)

    wait $P1

    $P0 = get_global 'recv_msg2'
    $P1 = new 'Task', $P0

    $P2 = new 'String'
    $P2 = "Hai 2"
    $P1.'send'($P2)

    schedule $P1

    wait $P1
.end

.sub recv_msg1
    $P0 = receive
    $P1 = new 'String'
    $P1 = "Hai 1"
    if $P0 == $P1 goto ok
    returncc
ok:
    say "ok 5 Got message after block"
.end

.sub recv_msg2
    $P0 = receive
    $P1 = new 'String'
    $P1 = "Hai 2"
    if $P0 == $P1 goto ok
    returncc
ok:
    say "ok 6 Got existing message"
.end

.sub task_kill
    $P0 = get_global 'task_to_kill'
    $P1 = new 'Task', $P0
    schedule $P1
    pass
    $P1.'kill'()
    wait $P1
    ok(1, "task_to_kill killed")
.end

.sub task_to_kill
    ok(1, "task_to_kill running")
    sleep 0.2
    ok(0, "task_to_kill wasn't killed")
.end

.sub preempt_and_exit
    $P0 = get_global 'exit0'
    $P1 = new 'Task', $P0
    schedule $P1

again:
    goto again
.end

.sub exit0
    say "ok 7 Pre-empt and exit"
    exit 0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

