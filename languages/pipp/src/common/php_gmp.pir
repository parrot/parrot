# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_gmp.pir - PHP gmp  Library

=head1 DESCRIPTION

Note:
Using BigInt is not the good way.
The good way is by a full NCI wrapper over the GMP library.

=head2 Functions

=over 4

=cut

.HLL 'pipp'

.include 'languages/pipp/src/common/php_MACRO.pir'

.const string GMP_PMC          = 'BigInt'

.const int GMP_ROUND_ZERO      = 0
.const int GMP_ROUND_PLUSINF   = 1
.const int GMP_ROUND_MINUSINF  = 2

.sub '__init' :anon :load :init
    .REGISTER_LONG_CONSTANT('GMP_ROUND_ZERO', GMP_ROUND_ZERO)
    .REGISTER_LONG_CONSTANT('GMP_ROUND_PLUSINF', GMP_ROUND_PLUSINF)
    .REGISTER_LONG_CONSTANT('GMP_ROUND_MINUSINF', GMP_ROUND_MINUSINF)
#    $S0 =
#    .REGISTER_STRING_CONSTANT('GMP_VERSION', $S0)
.end

.macro UNARY_OP(args, op)
    .local int argc
    argc = .args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    .local pmc gmpnum_a
    gmpnum_a = fetch_resource($P1, GMP_PMC)
    unless null gmpnum_a goto L2
    .RETURN_FALSE()
  L2:
    new $P0, GMP_PMC
    $P0 = .op gmpnum_a
    .RETURN_RESOURCE($P0)
.endm

.macro BINARY_OP(args, op, allow_ui_return, check_b_zero)
    $P1 = shift args
    $P2 = shift args
    .local pmc gmpnum_a
    gmpnum_a = fetch_resource($P1, GMP_PMC)
    unless null gmpnum_a goto L2
    .RETURN_FALSE()
  L2:
    .local int use_ui
    use_ui = 0
    $I0 = isa $P2, 'PhpInteger'
    unless $I0 goto L3
    use_ui = 1
    goto L4
  L3:
    .local pmc gmpnum_b
    gmpnum_b = fetch_resource($P2, GMP_PMC)
    unless null gmpnum_b goto L4
    .RETURN_FALSE()
  L4:
    unless .check_b_zero goto L5
    .local int b_is_zero
    b_is_zero = 0
    unless use_ui goto L6
    $I2 = $P2
    b_is_zero = iseq $I2, 0
    goto L7
  L6:
    $I2 = gmpnum_b
    b_is_zero = iseq $I2, 0
  L7:
    unless b_is_zero goto L5
    error(E_WARNING, "Zero operand not allowed")
    .RETURN_FALSE()
  L5:
    new $P0, GMP_PMC
    unless use_ui goto L8
    $I2 = $P2
    $P0 = .op gmpnum_a, $I2
    goto L9
  L8:
    $P0 = .op gmpnum_a, gmpnum_b
  L9:
    .RETURN_RESOURCE($P0)
.endm


=item C<resource gmp_abs(resource a)>

Calculates absolute value

=cut

.sub 'gmp_abs'
    .param pmc args :slurpy
    .UNARY_OP(args, neg)
.end

=item C<resource gmp_add(resource a, resource b)>

Add a and b

=cut

.sub 'gmp_add'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, add, 0, 0)
.end

=item C<resource gmp_and(resource a, resource b)>

Calculates logical AND of a and b

=cut

.sub 'gmp_and'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, band, 0, 0) # not working
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

=cut

.sub 'gmp_cmp'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $P2 = shift args
    .local pmc gmpnum_a
    gmpnum_a = fetch_resource($P1, GMP_PMC)
    unless null gmpnum_a goto L2
    .RETURN_FALSE()
  L2:
    .local int use_ui
    use_ui = 0
    $I0 = isa $P2, 'PhpInteger'
    unless $I0 goto L3
    use_ui = 1
    goto L4
  L3:
    .local pmc gmpnum_b
    gmpnum_b = fetch_resource($P2, GMP_PMC)
    unless null gmpnum_b goto L4
    .RETURN_FALSE()
  L4:
    unless use_ui goto L5
    $I2 = $P2
    $I0 = cmp gmpnum_a, $I2
    goto L6
  L5:
    $I0 = cmp gmpnum_a, gmpnum_b
  L6:
    .RETURN_LONG($I0)
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

STILL INCOMPLETE.

=cut

.sub 'gmp_init'
    .param pmc args :slurpy
    .local int argc
    argc = args
    if argc < 1 goto L1
    if argc > 2 goto L1
    goto L2
  L1:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $P1 = shift args
    $I1 = $P1
    new $P0, GMP_PMC
    set $P0, $I1
    .RETURN_RESOURCE($P0)
.end

=item C<int gmp_intval(resource gmpnumber)>

Gets signed long value of GMP number

=cut

.sub 'gmp_intval'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = isa $P1, 'PhpResource'
    unless $I0 goto L2
    .local pmc gmpnum
    gmpnum = fetch_resource($P1, GMP_PMC)
    unless null gmpnum goto L3
    .RETURN_FALSE()
  L3:
    $I0 = gmpnum
    .RETURN_LONG($I0)
  L2:
    $I0 = $P1
    .RETURN_LONG($I0)
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

=cut

.sub 'gmp_mod'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, mod, 1, 1)
.end

=item C<resource gmp_mul(resource a, resource b)>

Multiply a and b

=cut

.sub 'gmp_mul'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, mul, 0, 0)
.end

=item C<resource gmp_neg(resource a)>

Negates a number

=cut

.sub 'gmp_neg'
    .param pmc args :slurpy
    .UNARY_OP(args, neg)
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

=cut

.sub 'gmp_or'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, bor, 0, 0) # not working
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

=cut

.sub 'gmp_sub'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .BINARY_OP(args, sub, 0, 0)
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
