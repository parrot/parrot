# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

Math/Random/mt19937ar.pir - the Mersenne Twisted pseudorandom number generator

=head1 DESCRIPTION

This is a PIR version of the C-program for MT19937.

The MT19937 algorithm was created by Makoto Matsumoto and Takuji Nishimura.

See L<http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html> and
L<http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MT2002/emt19937ar.html>.

=cut

.namespace [ 'Math'; 'Random'; 'MT' ]

.sub '__onload' :anon :load
#    print "__onload Math::Random::MT\n"
    $P0 = newclass ['Math'; 'Random'; 'MT']
    addattribute $P0, '@mt'
    addattribute $P0, '$mti'
    addattribute $P0, '@mag01'
.end

.const int N = 624
.const int M = 397
.const int MATRIX_A = 0x9908b0df
.const int UPPER_MASK = 0x80000000
.const int LOWER_MASK = 0x7fffffff

.sub 'init' :vtable :method
    new $P0, 'Integer'
    set $P0, N
    inc $P0             # $mti == N+1 means @mt is not initialized
    setattribute self, '$mti', $P0
    new $P0, 'FixedIntegerArray'
    set $P0, N
    setattribute self, '@mt', $P0
    new $P0, 'FixedIntegerArray'
    set $P0, 2
    $P0[0] = 0
    $P0[1] = MATRIX_A
    setattribute self, '@mag01', $P0
.end


.sub 'clone' :vtable :method
    .local pmc res
    res = new [ 'Math'; 'Random'; 'MT' ]
    $P0 = getattribute self, '$mti'
    $P1 = clone $P0
    setattribute res, '$mti', $P1
    $P0 = getattribute self, '@mt'
    $P1 = clone $P0
    setattribute res, '@mt', $P1
    .return (res)
.end


=head2 Initialization

=over 4

=item C<init_genrand (seed)>

initializes the state vector by using one "seed", which may be zero.

=cut

.sub 'init_genrand' :method
    .param int seed
    .local pmc mt
    .local int i
    mt = getattribute self, '@mt'
    seed &= 0xffffffff
    mt[0] = seed
    $I1 = seed
    i = 1
  L1:
    unless i < N goto L2
    $I0 = $I1 >>> 30
    bxor $I0, $I1
    $I0 *= 1812433253
    $I0 += i
    $I0 &= 0xffffffff
    mt[i] = $I0
    $I1 = $I0
    inc i
    goto L1
  L2:
    .local pmc mti
    mti = getattribute self, '$mti'
    set mti, i
.end


=item C<init_by_array (init_key)>

initializes the state vector by using an array.

=cut

.sub 'init_by_array' :method
    .param pmc init_key
    .local pmc mt
    mt = getattribute self, '@mt'
    .local int i, j, k, key_length
    self.'init_genrand'(19650218)
    i = 1
    j = 0
    key_length = elements init_key
    k = key_length
    unless N > k goto L0
    k = N
  L0:
  L1:
    unless k goto L2
    $I0 = i - 1
    $I1 = mt[$I0]
    $I2 = $I1 >>> 30
    bxor $I2, $I1
    $I2 *= 1664525
    $I1 = mt[i]
    bxor $I1, $I2
    $I2 = init_key[j]
    $I1 += $I2
    $I1 += j
    $I1 &= 0xffffffff
    mt[i] = $I1
    inc i
    inc j
    unless i >= N goto L3
    $I0 = N - 1
    $I1 = mt[$I0]
    mt[0] = $I1
    i = 1
  L3:
    unless j >= key_length goto L4
    j = 0
  L4:
    dec k
    goto L1
  L2:
    k = N - 1
  L5:
    unless k goto L6
    $I0 = i - 1
    $I1 = mt[$I0]
    $I2 = $I1 >>> 30
    bxor $I2, $I1
    $I2 *= 1566083941
    $I1 = mt[i]
    bxor $I1, $I2
    $I1 -= i
    $I1 &= 0xffffffff
    mt[i] = $I1
    inc i
    unless i >= N goto L7
    $I0 = N - 1
    $I1 = mt[$I0]
    mt[0] = $I1
    i = 1
  L7:
    dec k
    goto L5
  L6:
    mt[0] = 0x80000000
    $I1 = mt[0]
.end

=back

=head2 Generation

After initialization, the following type of pseudorandom numbers are available.

=over 4

=item C<genrand_int32 ()>

generates a random number on [0,0xffffffff]-interval

=cut

.sub 'genrand_int32' :method
    .local int y
    .local pmc mt
    mt = getattribute self, '@mt'
    .local pmc mti
    mti = getattribute self, '$mti'
    .local pmc mag01
    mag01 = getattribute self, '@mag01'
    unless mti >= N goto L1     # generate N words at one time
    $I0 = N + 1
    unless mti == $I0 goto L2   # if init_genrand() has not been called
    self.'init_genrand'(5489)   # a default seed is used
  L2:
    .local int kk
    kk = 0
  L3:
    $I0 = N - M
    unless kk < $I0 goto L4
    $I0 = kk
    $I1 = mt[$I0]
    $I1 &= UPPER_MASK
    $I0 = kk + 1
    $I2 = mt[$I0]
    $I2 &= LOWER_MASK
    y = $I1 | $I2
    $I0 = kk + M
    $I1 = mt[$I0]
    $I2 = y >>> 1
    bxor $I1, $I2
    $I0 = y & 1
    $I2 = mag01[$I0]
    bxor $I1, $I2
    mt[kk] = $I1
    inc kk
    goto L3
  L4:
    $I0 = N - 1
    unless kk < $I0 goto L5
    $I0 = kk
    $I1 = mt[$I0]
    $I1 &= UPPER_MASK
    $I0 = kk + 1
    $I2 = mt[$I0]
    $I2 &= LOWER_MASK
    y = $I1 | $I2
    $I0 = M - N
    $I0 += kk
    $I1 = mt[$I0]
    $I2 = y >>> 1
    bxor $I1, $I2
    $I0 = y & 1
    $I2 = mag01[$I0]
    bxor $I1, $I2
    mt[kk] = $I1
    inc kk
    goto L4
  L5:
    $I0 = N - 1
    $I1 = mt[$I0]
    $I1 &= UPPER_MASK
    $I0 = 0
    $I2 = mt[$I0]
    $I2 &= LOWER_MASK
    y = $I1 | $I2
    $I0 = M - 1
    $I1 = mt[$I0]
    $I2 = y >>> 1
    bxor $I1, $I2
    $I0 = y & 1
    $I2 = mag01[$I0]
    bxor $I1, $I2
    $I0 = N - 1
    mt[$I0] = $I1
    set mti, 0
  L1:
    y = mt[mti]
    inc mti
    # Tempering
    $I0 = y >>> 11
    bxor y, $I0
    $I0 = y << 7
    $I0 &= 0x9d2c5680
    bxor y, $I0
    $I0 = y << 15
    $I0 &= 0xefc60000
    bxor y, $I0
    $I0 = y >>> 18
    bxor y, $I0
    .return (y)
.end


=item C<genrand_int31 ()>

generates a random number on [0,0x7fffffff]-interval

=cut

.sub 'genrand_int31' :method
    $I0 = self.'genrand_int32'()
    $I0 >>>= 1
    .return ($I0)
.end


=item C<genrand_real1 ()>

generates a random number on [0,1]-real-interval

=cut

.sub 'genrand_real1' :method
    $I0 = self.'genrand_int32'()
    $N0 = $I0
    unless $I0 < 0 goto L1
    $N0 += 4294967296.0
  L1:
    $N0 /= 4294967295.0   # divided by 2^32-1
    .return ($N0)
.end


=item C<genrand_real2 ()>

generates a random number on [0,1)-real-interval

=cut

.sub 'genrand_real2' :method
    $I0 = self.'genrand_int32'()
    $N0 = $I0
    unless $I0 < 0 goto L1
    $N0 += 4294967296.0
  L1:
    $N0 /= 4294967296.0   # divided by 2^32
    .return ($N0)
.end


=item C<genrand_real3 ()>

generates a random number on (0,1)-real-interval

=cut

.sub 'genrand_real3' :method
    $I0 = self.'genrand_int32'()
    $N0 = $I0
    unless $I0 < 0 goto L1
    $N0 += 4294967296.0
  L1:
    $N0 += 0.5
    $N0 /= 4294967296.0   # divided by 2^32
    .return ($N0)
.end


=item C<genrand_res53 ()>

generates a random number on [0,1) with 53-bit resolution

=cut

.sub 'genrand_res53' :method
    $I1 = self.'genrand_int32'()
    $I1 >>>= 5
    $N1 = $I1
    $I2 = self.'genrand_int32'()
    $I2 >>>= 6
    $N2 = $I2
    $N0 = $N1 * 67108864.0
    $N0 += $N2
    $N0 /= 9007199254740992.0
    .return ($N0)
.end


=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
