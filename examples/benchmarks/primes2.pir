# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

examples/benchmarks/primes2.pir - Calculate prime numbers < 5000

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/primes2.pir

=head1 DESCRIPTION

Calculates all the prime numbers up to 5000 and prints out the number
of primes and the last one found. Use PMCs, not ints.

=cut

.sub main :main

  .local pmc i, max, i6, i7

  i   = new 'Integer'
  i   = 0
  max = new 'Integer'
  max = 500
  i6  = new 'Integer'
  i6  = 0
  i7  = new 'Integer'
  i7  = 0

LOOP:
  $I0 = isprime(i)
  unless $I0 goto NOTPRIME
  assign i7, i
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
  .param pmc input
  .local pmc n

  if input < 1 goto FALSE

  n = new 'Integer'
  n = input - 1

LOOP:
  if n <= 1 goto DONE

  $P0 = new 'Integer'
  $P0 = input % n
  unless $P0 goto FALSE
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
F<examples/benchmarks/primes2_i.pir>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.py>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
