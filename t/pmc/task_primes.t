#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 task_primes.t

The classic threads/message passing prime checker
is now a Parrot test.

=cut

.include 'interpinfo.pasm'
.include 'sysinfo.pasm'
.loadlib 'sys_ops'

.sub main
    .include 'test_more.pir'
    .local pmc nt, tt
    
    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto run_win32_tests
    goto run_unix_tests
  run_win32_tests:
    say "1..1"
    say "ok 1 - All tests skipped on Win32"
    exit 0
  run_unix_tests:

    $P0 = get_global 'test_sub'
    tt  = new 'Task', $P0
    schedule tt
    set_global 'test_task', tt

    plan(8)

    nt = make_checker()

    $I0 = 2
loop:
    send_int(nt, $I0)
    $P0 = receive
    $I0 = $I0 + 1
    if $I0 < 100 goto loop

    nt.'send'($I0)
    $P1 = receive

    if $I0 < 20 goto loop
    wait tt
.end

.sub test_sub
    .local int sum
    sum = 0

    $P0 = receive
    is($P0, 2, "2 is prime")

    $P0 = receive
    is($P0, 3, "3 is prime")

    $P0 = receive
    is($P0, 5, "5 is prime")

    $P0 = receive
    is($P0, 7, "7 is prime")

    $P0 = receive
    is($P0, 11, "11 is prime")

    $P0 = receive
    is($P0, 13, "13 is prime")

    $P0 = receive
    is($P0, 17, "17 is prime")

    $P0 = receive
    is($P0, 19, "19 is prime")
.end

.sub send_int
    .param pmc t
    .param pmc i
    $P0 = new 'Integer'
    $P0 = i
    t.'send'($P0)
.end

.sub make_checker
    .local pmc cp, ct

    cp = get_global 'check_prime'
    ct = interpinfo .INTERPINFO_CURRENT_TASK

    $P0 = new 'Hash'
    $P0['code'] = cp
    $P0['data'] = ct

    $P1 = new 'Task', $P0
    schedule $P1
    .return($P1)
.end

.sub check_prime
    .param pmc pt
    .local pmc nt, tt, M
    .local int N, x

    tt = get_global 'test_task'

    N = 0

next_msg:
    M = receive
    x = M

    # The first number we get is the prime
    # that this task will be checking.
    if N >= 2 goto check_x
    N = x
    send_int(tt, x)
    goto send_reply

check_x:
    $I0 = x % N
    if $I0 != 0 goto maybe_prime
    goto send_reply

maybe_prime:
    # Make sure there's a next task in the
    # chain to send to.
    unless null nt goto ship_it
    nt = make_checker()

ship_it:
    # More syncrhonous message passing to the
    # next task.
    nt.'send'(M)
    M = receive

send_reply:
    # And the reply for the previous task
    # that's waiting on us.
    pt.'send'(M)
    goto next_msg
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
