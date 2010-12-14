/*
Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

examples/benchmarks/primes2.c - Calculate prime numbers < 10000

=head1 SYNOPSIS

    % make examples/benchmarks/primes2
    % time examples/benchmarks/primes2

=head1 DESCRIPTION

Calculates all the prime numbers up to 10000 and prints out the number
of primes and the last one found.

=head2 Functions

=over 4

=cut

*/

/*

=item C<int main(int argc, char *argv[])>

Main function to run the example.

=cut

*/

int
main(int argc, char *argv[])
{
    int i=0, max=500;
    int i6 = 0;
    int i7;

    while (1) {
        if (isprime1(i)) {
            i7 = i;
            i6++;
        }
        i++;
        if (i==max) {
             break;
        }
    }

    printf("N primes calculated to %d is %d\nlast is: %d\n", max, i6, i7);

    return 0;
}

/*

=item C<int isprime1(int input)>

Determines if the input number is a prime.

=cut

*/

int isprime1(int input)
{
    int n;

    if (input < 1) {
        return 0;
    }
    n = input - 1;

    while (n > 1) {
        if (input%n == 0) return 0;
        n--;
    }
    return 1;
}

/*

=back

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.pir>,
F<examples/benchmarks/primes2.py>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
