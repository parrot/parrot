## $Id$

=head1 TITLE

CardinalInteger - Cardinal integers

=cut

.namespace [ 'CardinalInteger' ]


=head1 SUBROUTINES

=over 4

=item onload

=cut

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta, intproto
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    intproto = cardinalmeta.'new_class'('CardinalInteger', 'parent'=>'Integer CardinalObject')
    cardinalmeta.'register'('Float', 'parent'=>'CardinalObject', 'protoobject'=>intproto)
.end


=item ACCEPTS()

=cut

.sub 'ACCEPTS' :method
    .param num topic
    .return 'infix:=='(topic, self)
.end


=item perl()

Returns a Perl representation of the CardinalInteger.

=cut

.sub 'perl' :method
    $S0 = self
    .return($S0)
.end


=item to_s()

Returns a CardinalString representation of the CardinalInteger.

=cut

.sub 'to_s' :method
    $P0 = new 'CardinalString'
    $P0 = self
    .return($P0)
.end


=item downto(n, block)

Runs C<block> for each integer from the current value of the Integer down to n.

=cut

.sub 'downto' :method
    .param int n
    .param pmc block
    $I1 = self
  downto_loop:
    $I0 = $I1 < n
    if $I0, downto_done
    block($I1)
    dec $I1
    goto downto_loop
  downto_done:
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
