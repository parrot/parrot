# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_rand.pir - PHP rand Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'

.sub '__onload' :anon :load
    load_bytecode 'Math/Random/mt19937ar.pbc'
    $P0 = new [ 'Math'; 'Random'; 'MT' ]
    set_hll_global 'mt19937', $P0
.end

.sub 'generate_seed' :anon
    time $I0    # less than enough entropy
    .return ($I0)
.end

.macro RAND_RANGE(ret, n, min, max)
    .ret = .max - .min
    inc .ret
    .n *= .ret
    .n += .min
    .ret = floor .n
.endm

=item C<int getrandmax(void)>

Returns the maximum value a random number can have

=cut

.sub 'getrandmax'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .RETURN_LONG(0x7fffffff)
.end

=item C<int mt_getrandmax(void)>

Returns the maximum value a random number from Mersenne Twister can have

=cut

.sub 'mt_getrandmax'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .RETURN_LONG(0x7fffffff)
.end

=item C<int mt_rand([int min, int max])>

Returns a random number from Mersenne Twister

=cut

.sub 'mt_rand'
    .param pmc args :slurpy
    $P0 = get_hll_global 'mt19937'
    .local int argc
    argc = args
    if argc goto L1
    $I0 = $P0.'genrand_int31'()
    .RETURN_LONG($I0)
  L1:
    .local int min
    .local int max
    ($I0, min, max) = parse_parameters('ll', args :flat)
    if $I0 goto L2
    .RETURN_NULL()
  L2:
    $N0 = $P0.'genrand_real2'()
    .RAND_RANGE($I0, $N0, min, max)
    .RETURN_LONG($I0)
.end

=item C<void mt_srand([int seed])>

Seeds Mersenne Twister random number generator

=cut

.sub 'mt_srand'
    .param pmc args :slurpy
    .local int seed
    ($I0, seed) = parse_parameters('|l', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local int argc
    argc = args
    if argc goto L2
    seed = generate_seed()
  L2:
    $P0 = get_hll_global 'mt19937'
    $P0.'init_genrand'(seed)
    .return ()
.end

=item C<int rand([int min, int max])>

Returns a random number

=cut

.sub 'rand'
    .param pmc args :slurpy
    new $P0, 'Random'
    .local int argc
    argc = args
    if argc goto L1
    $I0 = $P0
    .RETURN_LONG($I0)
  L1:
    .local int min
    .local int max
    ($I0, min, max) = parse_parameters('ll', args :flat)
    if $I0 goto L2
    .RETURN_NULL()
  L2:
    $N0 = $P0
    .RAND_RANGE($I0, $N0, min, max)
    .RETURN_LONG($I0)
.end

=item C<void srand([int seed])>

Seeds random number generator

=cut

.sub 'srand'
    .param pmc args :slurpy
    .local int seed
    ($I0, seed) = parse_parameters('|l', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local int argc
    argc = args
    if argc goto L2
    seed = generate_seed()
  L2:
    new $P0, 'Random'
    set $P0, seed
    .return ()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
