# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/primes.pasm - Calculate prime numbers < 50000

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/primes.pasm

=head1 DESCRIPTION

Calculates all the prime numbers up to 50000 and prints out the number
of primes, the last one found, and the time taken.

=cut

# I1 holds the number we're currently checking for primality
	set     I1, 1
	# I2 holds the highest number we want to check for primality
	set     I2, 50000
	set	I6, 0
	print   "N primes up to "
	print   I2
	print   " is: "
	time	N10
	# I1 counts up to I2
REDO:   # I3 counts from 2 up to I4 (I1/2)
	set     I3, 2
	div     I4, I1, 2
LOOP:   # Check if I3 is a factor of I1
	cmod    I5, I1, I3
	if      I5, OK
	# We've found a factor, so it can't be a prime and
	# we can skip right out of this loop and to the next
	# number
	branch  NEXT
OK:     inc     I3
	le      I3, I4, LOOP
	# We haven't found a factor so it must be a prime
	inc	I6
	set 	I7, I1
	# print I1
	# print "\n"	# to get them all
NEXT:   # Move on to the next number
	inc     I1
	le      I1, I2, REDO
	time	N11
	print	I6
	print	"\nlast is: "
	print   I7
	print   "\n"
	sub 	N11, N10
	print 	"Elapsed time: "
	print	N11
	print	"\n"
	end

=head1 SEE ALSO

F<examples/benchmarks/primes.c>, 
F<examples/benchmarks/primes.pl>, 
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>, 
F<examples/benchmarks/primes2.pasm>,
F<examples/benchmarks/primes2.py>.

=cut

