# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

examples/benchmarks/primes2.pir - Calculate prime numbers < 10000

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/primes2.pir

=head1 DESCRIPTION

Calculates all the prime numbers up to 10000 and prints out the number
of primes and the last one found. Use integer registers.

=cut

.sub main :main

  .local int i, max, i6, i7

  i   = 0
  max = 10000
  i6  = 0
  i7  = 0

LOOP:
  $I0 = isprime(i)
  unless $I0 goto NOTPRIME
  i7 = i
  inc i6
NOTPRIME:
  inc i
  if i == max goto DONE
  goto LOOP

DONE:
  print "N primes calculated to "
  print i
  print " is "
  say   i6
  print "last is: "
  say   i7
.end

.sub isprime
  .param int input
  .local int n

  if input < 1 goto FALSE

  n = input - 1

LOOP:
  if n <= 1 goto DONE

  $I1 = input % n
  unless $I1 goto FALSE
  dec n
  goto LOOP

DONE:
  .return(1)
FALSE:
  .return(0)
.end

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2.pir>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.py>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
