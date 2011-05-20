# Copyright (C) 2008-2011, Parrot Foundation.

=head1 NAME

uuid.pir - minimalist uuid library

=head1 DESCRIPTION

See e2fsprogs/libuuid (ISO-C), UUID (Perl/XS)
L<http://e2fsprogs.sourceforge.net/>

For discussion about the source of entropy, see TT #64.

=head2 Methods

=over 4

=cut


.namespace ['uuid']

.loadlib 'math_ops'

.sub '__onload' :anon :load :init
    $P0 = subclass 'FixedIntegerArray', 'uuid'
.end

.const int N = 16

=item C<get_string>

=cut

.sub 'get_string' :vtable :method
    $S0 = sprintf '%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x', self
    .return ($S0)
.end

=item C<time>

=cut

.sub 'time' :method
    .return (-1)
.end

=item C<type>

=cut

.sub 'type' :method
    $I0 = self[6]
    $I0 >>= 4
    .return ($I0)
.end

=item C<variant>

=cut

.const int UUID_VARIANT_NCS = 0
.const int UUID_VARIANT_DCE = 1
.const int UUID_VARIANT_MICROSOFT = 2
.const int UUID_VARIANT_OTHER = 3

.sub 'variant' :method
    $I0 = self[8]
    $I1 = $I0 & 0x80
    unless $I1 == 0 goto L1
    .return (UUID_VARIANT_NCS)
  L1:
    $I1 = $I0 & 0x40
    unless $I1 == 0 goto L2
    .return (UUID_VARIANT_DCE)
  L2:
    $I1 = $I0 & 0x20
    unless $I1 == 0 goto L3
    .return (UUID_VARIANT_MICROSOFT)
  L3:
    .return (UUID_VARIANT_OTHER)
.end

=back

=head2 Functions

=over 4

=item C<generate_random>

=cut

.sub 'generate_random'
    .local pmc res
    new res, 'uuid'
    set res, N
    .local int i
    i = 0
  L1:
    unless i < N goto L2
    $I0 = rand 255
    res[i] = $I0
    inc i
    goto L1
  L2:
    # variant
    $I0 = res[8]
    $I0 &= 0x3f
    $I0 |= 0x80
    res[8] = $I0
    # version
    $I0 = res[6]
    $I0 &= 0x0f
    $I0 |= 0x40
    res[6] = $I0
    .return (res)
.end

=item C<generate_time>

=cut

.sub 'generate_time'
    .local pmc res
    new res, 'uuid'
    set res, N
    .local int i
    i = 10
  L1:
    unless i < N goto L2
    $I0 = rand 255
    res[i] = $I0
    inc i
    goto L1
  L2:
    $I0 = res[10]
    $I0 |= 0x01
    res[10] = $I0
    .return (res)
.end

=item C<generate>

=cut

.sub 'generate'
    .tailcall 'generate_random'()
.end


=item C<parse>

=cut

.include 'cclass.pasm'

.sub 'parse'
    .param string target
    .local int pos, lastpos
    lastpos = length target
    unless lastpos == 36 goto L1
    pos = 0
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    unless pos == 8 goto L1
    pos = index target, '-', pos
    unless pos == 8 goto L1
    inc pos
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    unless pos == 13 goto L1
    pos = index target, '-', pos
    unless pos == 13 goto L1
    inc pos
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    unless pos == 18 goto L1
    pos = index target, '-', pos
    unless pos == 18 goto L1
    inc pos
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    unless pos == 23 goto L1
    pos = index target, '-', pos
    unless pos == 23 goto L1
    inc pos
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    unless pos == 36 goto L1
    .local pmc res
    new res, 'uuid'
    set res, N
    .local int i
    i = 0
    $S0 = substr target, 0, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 2, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 4, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 6, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 9, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 11, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 14, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 16, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 19, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 21, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 24, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 26, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 28, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 30, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 32, 2
    $I0 = hex($S0)
    res[i] = $I0
    inc i
    $S0 = substr target, 34, 2
    $I0 = hex($S0)
    res[i] = $I0
    .return (0, res)
  L1:
    .return (-1)
.end

.sub 'hex' :anon
    .param string in
    .const string xdigits = '0123456789ABCDEF'
    in  = upcase in
    $S1 = substr in, 0, 1
    $I1 = index xdigits, $S1
    $I1 *= 16
    $S2 = substr in, 1, 1
    $I2 = index xdigits, $S2
    $I1 += $I2
    .return ($I1)
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
