/*
Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
$Id$

=head1 NAME

examples/benchmarks/primes2.c - Calculate prime numbers < 10000

=head1 SYNOPSIS

    % cc examples/benchmarks/primes2.c -o primes2
    % time ./primes2

=head1 DESCRIPTION

Calculates all the prime numbers up to 10000 and prints out the number
of primes and the last one found.

=cut

*/

int main(){
	int i=0, max=10000;
	int i6 = 0;
	int i7;

	while (1) {
		if (isprime1(i)) {
			i7 = i;
			i6++;
		}
		i++;
		if (i==max){
			break;
		}
	}

	printf("N primes calculated to %d is %d\nlast is: %d\n",max,i6,i7);

}

int isprime1(int input)
{
	int n;

	if (input < 1) {
		return 0;
	}
	n = input - 1;

	while (n > 1){
		if (input%n == 0) return 0;
		n--;
	}
	return 1;
}

/*

=head1 SEE ALSO

F<examples/benchmarks/primes.c>, 
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>, 
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.pasm>,
F<examples/benchmarks/primes2.py>.

=cut

*/
