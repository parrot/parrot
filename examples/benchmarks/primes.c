/*
Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

examples/benchmarks/primes.c - Calculate prime numbers < 50000

=head1 SYNOPSIS

    % make examples/benchmarks/primes
    % time examples/benchmarks/primes

=head1 DESCRIPTION

Calculates all the prime numbers up to 50000 and prints out the number
of primes and the last one found.

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>

/*

=item C<int main(int argc, char *argv[])>

Main function to run the example.

=cut

*/

int
main(int argc, char *argv[])
{
    int I1 = 1;
    int I2 = 50000;
    int I3;
    int I4;
    int I5;
    int I6 = 0;
    int I7;
    printf("N primes up to ");
    printf("%d", I2);
    printf(" is: ");

  REDO:
    I3 = 2;
    I4 = I1 / 2;
  LOOP:
    I5 = I1 % I3;
    if (I5) {goto OK;}
    goto NEXT;
  OK:
    I3++;
    if (I3 <= I4) {goto LOOP;}
    I6++;
    I7 = I1;
  NEXT:
    I1++;
    if (I1 <= I2) {goto REDO;}
    printf("%d\n", I6);
    printf("last is: %d\n", I7);

    return 0;
}

/*

=back

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2_p.pasm>,
F<examples/benchmarks/primes2.c>,
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
