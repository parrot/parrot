# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/primes2.pasm - Calculate prime numbers < 10000

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/primes2.pasm

=head1 DESCRIPTION

Calculates all the prime numbers up to 10000 and prints out the number
of primes and the last one found.

=cut

set I1, 0
set I3, 0
set I4, 10000

LOOP:
  save I1
  bsr PRIMECHECK
  restore I9
  unless I9, NOTPRIME
#ISPRIME:
  inc I6
  set I7, I1
NOTPRIME:
  inc I1
  ne I1,I4, LOOP

DONE:
  print"N primes calculated to "
  print I1
  print " is "
  print I6
  print "\n"
  print "last is: "
  print I7
  print "\n"
  end

PRIMECHECK:
 saveall
 restore I5
 lt I5,1,ret0
 set I6,I5
 dec I6
NLOOP:
  le I6, 1, ret1
  cmod I7, I5, I6
  eq I7, 0, ret0
  dec I6
  branch NLOOP
  # is prime
ret1:
  set I0, 1
  save I0
  restoreall
  ret
ret0:
  set I0, 0
  save I0
  restoreall
  ret

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.py>.

=cut

