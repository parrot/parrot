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
    .local pmc Res

    $P0 = get_global 'test_results'
    Res = new 'Task', $P0
    schedule Res
    set_global 'Res', Res

    got_prime(2)
    $P0 = make_prime_checker(2)

    $I0 = 1

next_num:
    $I0 = $I0 + 1

    $P0.'send'($I0)
    $P1 = recv

    if $I0 < 20 goto next_num
    wait Res
.end

.sub test_results
    plan(8)

    $P0 = recv
    is($P0, 2, "2 is prime")

    $P0 = recv
    is($P0, 3, "3 is prime")

    $P0 = recv
    is($P0, 5, "5 is prime")

    $P0 = recv
    is($P0, 7, "7 is prime")

    $P0 = recv
    is($P0, 11, "11 is prime")

    $P0 = recv
    is($P0, 13, "13 is prime")

    $P0 = recv
    is($P0, 17, "17 is prime")

    $P0 = recv
    is($P0, 19, "19 is prime")
.end

.sub got_prime
    .param int p
    $P0 = new 'Integer'
    $P0 = p
    $P1 = get_global 'Res'
    $P1.'send'($P0)
.end

.sub make_prime_checker
    .param int n
    .local pmc cur_task, new_task, check_prime, args

    check_prime = get_global 'check_prime'
    cur_task    = interpinfo .INTERPINFO_CURRENT_TASK

    args = new 'FixedPMCArray', 2
    args[0] = n
    args[1] = cur_task
    
    $P0 = new 'Hash'
    $P0['code'] = check_prime
    $P0['data'] = args

    new_task = new 'Task', $P0
    schedule new_task
    .return(new_task)
.end

.sub check_prime
    .param pmc args
    .local pmc pt, nt
    .local int N, Nsq

    N  = args[0]
    pt = args[1]
    
    Nsq = N * N
    
next_x:
    $P0 = recv
    $I0 = $P0

    $I1 = $I0 % N
    if $I1 == 0 goto done

    if $I0 >= Nsq goto check_next
    got_prime($I0)

    unless null nt goto done
    nt = make_prime_checker($I0)
    goto done
    
check_next:
    nt.'send'($P0)
    $P0 = recv

done:
    pt.'send'($P0)
    goto next_x
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
