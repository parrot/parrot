# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

examples/benchmarks/primes.pasm - Calculate prime numbers < 5000

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/primes.pasm

=head1 DESCRIPTION

Calculates all the prime numbers up to 5000 and prints out the number
of primes, the last one found, and the time taken.

=cut

    # P1 holds the number we're currently checking for primality
    new     P1, 'Integer'
    set     P1, 1

    # P2 holds the highest number we want to check for primality
    new     P2, 'Integer'
    set     P2, 5000

    new     P6, 'Integer'
    set     P6, 0
    new     P7, 'Integer'

    print   "N primes up to "
    print   P2
    print   " is: "
    time    N10

    # P1 counts up to P2
    # P3 counts from 2 up to P4 (P1/2)
    new     P3, 'Integer'

REDO:
    set     P3, 2
    div     P4, P1, 2
    # Check if P3 is a factor of P1
LOOP:
.loadlib 'math_ops' # cmod is a dynop
    cmod    P5, P1, P3
    if      P5, OK

    # We've found a factor, so it can't be a prime and
    # we can skip right out of this loop and to the next number
    branch  NEXT
OK:
    inc     P3
    le      P3, P4, LOOP
    # We haven't found a factor so it must be a prime
    inc     P6
    assign  P7, P1
    # print I1
    # print "\n"    # to get them all

    # Move on to the next number
NEXT:
    inc     P1
    le      P1, P2, REDO
    time    N11
    say     P6
    print   "last is: "
    say     P7
    sub     N11, N10
    print   "Elapsed time: "
    say     N11
    end

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes_i.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes.rb>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.pir>,
F<examples/benchmarks/primes2.py>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
