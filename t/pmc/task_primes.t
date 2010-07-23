#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 task_primes.t

The classic threads/message passing prime checker
is now a Parrot test.

=cut

.include 'interpinfo.pasm'

.sub main
    .include 'test_more.pir'
    .local pmc nt, tt

    $P0 = get_global 'test_sub'
    tt  = new 'Task', $P0
    schedule tt
    set_global 'test_task', tt

    plan(1)
    
    nt = make_checker()

    $I0 = 2
loop:
    send_int(nt, $I0)
    $P0 = recv
    $I0 = $I0 + 1
    if $I0 < 100 goto loop

    send_int(tt, 0)
    wait tt
.end

.sub test_sub
    .local int sum
    sum = 0

loop:
    $P0 = recv
    $I0 = $P0
    if $I0 == 0 goto done
    sum = sum + $I0
    goto loop
    
done:
    is(sum, 1060, "found first 25 primes")
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
    .local pmc nt, M, tt
    .local int N, x

    tt = get_global 'test_task'
    N = 0

next_msg:
    M = recv
    x = M
    
    if N >= 2 goto check_x
    N = x
    send_int(tt, x)
    goto send_reply

check_x:
    $I0 = x % N
    if $I0 != 0 goto maybe_prime
    goto send_reply
    
maybe_prime:
    unless null nt goto ship_it
    nt = make_checker()
    
ship_it:
    nt.'send'(M)
    M = recv

send_reply:
    pt.'send'(M)
    goto next_msg
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
