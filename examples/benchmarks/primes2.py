"""
Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
$Id$

=head1 NAME

examples/benchmarks/primes.py - Calculate prime numbers < 5000

=head1 SYNOPSIS

    % time python examples/benchmarks/primes.py

=head1 DESCRIPTION

Calculates all the prime numbers up to 50000 and prints out the number
of primes and the last one found.

=cut

"""

# import os,sys
def isprime1(input):
    if input < 1:
	return 0

    n = input-1

    while n > 1:
	if input%n == 0:
	    return 0
	n = n - 1

    return 1

def main():
    i = 0
    l = 0
    i6 = 0
    i7 = 0
    max = 5000

    while 1:

	if isprime1(i):
	    i6 = i6 + 1
            i7 = i
	i = i + 1
	if i == max:
	    break

    print "N primes calculated to ",max, i6
    print "last is:", i7

if __name__ == "__main__":
    main()

"""

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.pasm>,
F<examples/benchmarks/primes2.py>.

=cut

"""
