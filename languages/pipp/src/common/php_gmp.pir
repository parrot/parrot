# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_gmp.pir - PHP gmp  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<resource gmp_abs(resource a)>

Calculates absolute value

NOT IMPLEMENTED.

=cut

.sub 'gmp_abs'
    not_implemented()
.end

=item C<resource gmp_add(resource a, resource b)>

Add a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_add'
    not_implemented()
.end

=item C<resource gmp_and(resource a, resource b)>

Calculates logical AND of a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_and'
    not_implemented()
.end

=item C<void gmp_clrbit(resource &a, int index)>

Clears bit in a

NOT IMPLEMENTED.

=cut

.sub 'gmp_clrbit'
    not_implemented()
.end

=item C<int gmp_cmp(resource a, resource b)>

Compares two numbers

NOT IMPLEMENTED.

=cut

.sub 'gmp_cmp'
    not_implemented()
.end

=item C<resource gmp_com(resource a)>

Calculates one's complement of a

NOT IMPLEMENTED.

=cut

.sub 'gmp_com'
    not_implemented()
.end

=item C<resource gmp_div_q(resource a, resource b [, int round])>

Divide a by b, returns quotient only

NOT IMPLEMENTED.

=cut

.sub 'gmp_div_q'
    not_implemented()
.end

=item C<array gmp_div_qr(resource a, resource b [, int round])>

Divide a by b, returns quotient and reminder

NOT IMPLEMENTED.

=cut

.sub 'gmp_div_qr'
    not_implemented()
.end

=item C<resource gmp_div_r(resource a, resource b [, int round])>

Divide a by b, returns reminder only

NOT IMPLEMENTED.

=cut

.sub 'gmp_div_r'
    not_implemented()
.end

=item C<resource gmp_divexact(resource a, resource b)>

Divide a by b using exact division algorithm

NOT IMPLEMENTED.

=cut

.sub 'gmp_divexact'
    not_implemented()
.end

=item C<resource gmp_fact(int a)>

Calculates factorial function

NOT IMPLEMENTED.

=cut

.sub 'gmp_fact'
    not_implemented()
.end

=item C<resource gmp_gcd(resource a, resource b)>

Computes greatest common denominator (gcd) of a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_gcd'
    not_implemented()
.end

=item C<array gmp_gcdext(resource a, resource b)>

Computes G, S, and T, such that AS + BT = G = `gcd' (A, B)

NOT IMPLEMENTED.

=cut

.sub 'gmp_gcdext'
    not_implemented()
.end

=item C<int gmp_hamdist(resource a, resource b)>

Calculates hamming distance between a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_hamdist'
    not_implemented()
.end

=item C<resource gmp_init(mixed number [, int base])>

Initializes GMP number

NOT IMPLEMENTED.

=cut

.sub 'gmp_init'
    not_implemented()
.end

=item C<int gmp_intval(resource gmpnumber)>

Gets signed long value of GMP number

NOT IMPLEMENTED.

=cut

.sub 'gmp_intval'
    not_implemented()
.end

=item C<resource gmp_invert(resource a, resource b)>

Computes the inverse of a modulo b

NOT IMPLEMENTED.

=cut

.sub 'gmp_invert'
    not_implemented()
.end

=item C<int gmp_jacobi(resource a, resource b)>

Computes Jacobi symbol

NOT IMPLEMENTED.

=cut

.sub 'gmp_jacobi'
    not_implemented()
.end

=item C<int gmp_legendre(resource a, resource b)>

Computes Legendre symbol

NOT IMPLEMENTED.

=cut

.sub 'gmp_legendre'
    not_implemented()
.end

=item C<resource gmp_mod(resource a, resource b)>

Computes a modulo b

NOT IMPLEMENTED.

=cut

.sub 'gmp_mod'
    not_implemented()
.end

=item C<resource gmp_mul(resource a, resource b)>

Multiply a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_mul'
    not_implemented()
.end

=item C<resource gmp_neg(resource a)>

Negates a number

NOT IMPLEMENTED.

=cut

.sub 'gmp_neg'
    not_implemented()
.end

=item C<resource gmp_nextprime(resource a)>

Finds next prime of a

NOT IMPLEMENTED.

=cut

.sub 'gmp_nextprime'
    not_implemented()
.end

=item C<resource gmp_or(resource a, resource b)>

Calculates logical OR of a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_or'
    not_implemented()
.end

=item C<bool gmp_perfect_square(resource a)>

Checks if a is an exact square

NOT IMPLEMENTED.

=cut

.sub 'gmp_perfect_square'
    not_implemented()
.end

=item C<int gmp_popcount(resource a)>

Calculates the population count of a

NOT IMPLEMENTED.

=cut

.sub 'gmp_popcount'
    not_implemented()
.end

=item C<resource gmp_pow(resource base, int exp)>

Raise base to power exp

NOT IMPLEMENTED.

=cut

.sub 'gmp_pow'
    not_implemented()
.end

=item C<resource gmp_powm(resource base, resource exp, resource mod)>

Raise base to power exp and take result modulo mod

NOT IMPLEMENTED.

=cut

.sub 'gmp_powm'
    not_implemented()
.end

=item C<int gmp_prob_prime(resource a[, int reps])>

Checks if a is "probably prime"

NOT IMPLEMENTED.

=cut

.sub 'gmp_prob_prime'
    not_implemented()
.end

=item C<resource gmp_random([int limiter])>

Gets random number

NOT IMPLEMENTED.

=cut

.sub 'gmp_random'
    not_implemented()
.end

=item C<int gmp_scan0(resource a, int start)>

Finds first zero bit

NOT IMPLEMENTED.

=cut

.sub 'gmp_scan0'
    not_implemented()
.end

=item C<int gmp_scan1(resource a, int start)>

Finds first non-zero bit

NOT IMPLEMENTED.

=cut

.sub 'gmp_scan1'
    not_implemented()
.end

=item C<void gmp_setbit(resource &a, int index[, bool set_clear])>

Sets or clear bit in a

NOT IMPLEMENTED.

=cut

.sub 'gmp_setbit'
    not_implemented()
.end

=item C<int gmp_sign(resource a)>

Gets the sign of the number

NOT IMPLEMENTED.

=cut

.sub 'gmp_sign'
    not_implemented()
.end

=item C<resource gmp_sqrt(resource a)>

Takes integer part of square root of a

NOT IMPLEMENTED.

=cut

.sub 'gmp_sqrt'
    not_implemented()
.end

=item C<array gmp_sqrtrem(resource a)>

Square root with remainder

NOT IMPLEMENTED.

=cut

.sub 'gmp_sqrtrem'
    not_implemented()
.end

=item C<string gmp_strval(resource gmpnumber [, int base])>

Gets string representation of GMP number

NOT IMPLEMENTED.

=cut

.sub 'gmp_strval'
    not_implemented()
.end

=item C<resource gmp_sub(resource a, resource b)>

Subtract b from a

NOT IMPLEMENTED.

=cut

.sub 'gmp_sub'
    not_implemented()
.end

=item C<resource gmp_xor(resource a, resource b)>

Calculates logical exclusive OR of a and b

NOT IMPLEMENTED.

=cut

.sub 'gmp_xor'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
