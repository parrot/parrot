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
	new P1, .PerlInt
	set     P1, 1
	# I2 holds the highest number we want to check for primality
	new P2, .PerlInt
	set     P2, 10000
	new P6, .PerlInt
	set	P6, 0
	print   "N primes up to "
	print   P2
	print   " is: "
	time	N10
	# I1 counts up to I2
REDO:   # I3 counts from 2 up to I4 (I1/2)
        new P3, .PerlInt
	set     P3, 2
        new P4, .PerlInt
	div     P4, P1, 2
LOOP:   # Check if I3 is a factor of I1
        new P5, .PerlInt
	cmod    P5, P1, P3
	if      P5, OK
	# We've found a factor, so it can't be a prime and
	# we can skip right out of this loop and to the next
	# number
	branch  NEXT
OK:     inc     P3
	le      P3, P4, LOOP
	# We haven't found a factor so it must be a prime
	inc	P6
	set 	P7, P1
	# print I1
	# print "\n"	# to get them all
NEXT:   # Move on to the next number
	inc     P1
	le      P1, P2, REDO
	time	N11
	print	P6
	print	"\nlast is: "
	print   P7
	print   "\n"
	sub 	N11, N10
	print 	"Elapsed time: "
	print	N11
	print	"\n"
	end

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes_i.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes.rb>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.pasm>,
F<examples/benchmarks/primes2.py>.

=cut

