#!./parrot
# Copyright (C) 2010-2013, Parrot Foundation.

.include 'sysinfo.pasm'
.loadlib 'sys_ops'

.sub main
    # TODO not yet thread-safe (schedule counter updates)
    # Use say instead inside tasks
    .include 'test_more.pir'

    plan(8)

    ok(1, "initialized")

    tasks_run()
    task_send_recv()

    print "ok 7 #SKIP task.kill - no reliable test yet [GH #907]\n"
    goto post_kill

    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto skip_kill
    if $S0 == 'cygwin' goto skip_kill
    task_kill()
    goto post_kill
  skip_kill:
    print "ok 7 #SKIP task.kill - no signals on Windows yet\n"
  post_kill:
    preempt_and_exit()
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
    .local pmc task, code
    code = get_global 'task_to_kill'
    task = new 'Task', code
    schedule task
    pass
    task.'kill'()
    wait task

    # busy wait for signal to arrive at the other thread
    $I0 = 0
    loop:
        $I0 = $I0 + 1
    if $I0 < 5000 goto loop
.end

.sub task_to_kill
    print "ok 7 task_to_kill running\n"
    sleep 0.2
    say "not ok 8 task_to_kill wasn't killed"
.end

.sub preempt_and_exit
    $P0 = get_global 'exit0'
    $P1 = new 'Task', $P0
    schedule $P1
again:
    goto again
.end

.sub exit0
    say "ok 8 pre-empt and exit"
    exit 0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

