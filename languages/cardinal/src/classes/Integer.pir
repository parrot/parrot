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
    intproto = cardinalmeta.'new_class'('CardinalInteger', 'parent'=>'parrot;Integer CardinalObject')
    cardinalmeta.'register'('Float', 'parent'=>'CardinalObject', 'protoobject'=>intproto)
.end

=item ACCEPTS()

=cut

.sub 'ACCEPTS' :method
    .param num topic
    .tailcall 'infix:=='(topic, self)
.end

=item perl()

Returns a Perl representation of the CardinalInteger.

=cut

.sub 'perl' :method
    $S0 = self
    .return($S0)
.end

.sub 'integer?' :method
  $P0 = get_hll_global['Bool'], 'True'
  .return($P0)
.end

=item to_s()

Returns a CardinalString representation of the CardinalInteger.

=cut

.sub 'to_s' :method
    $P0 = new 'CardinalString'
    $S0 = self
    $P0 = $S0
    .return($P0)
.end

=item
to_i()
to_int()
floor()
ceil()
round()
truncate()

All return C<self>

=cut

.sub 'to_i' :method
    .return(self)
.end

.sub 'to_int' :method
    .return(self)
.end

.sub 'floor' :method
    .return(self)
.end

.sub 'ceil' :method
    .return(self)
.end

.sub 'round' :method
    .return(self)
.end

.sub 'truncate' :method
    .return(self)
.end

.sub 'numerator' :method
    .return(self)
.end

=item

Returns 1

=cut

.sub 'denominator' :method
   $P0 = new 'CardinalInteger'
   $P0 = 1
   .return($P0)
.end


=item gcd(num)

Return the greatest common divisor of C<self> and num

=cut

.sub 'gcd' :method
   .param num other
   $N0 = self
   gcd $I0, $N0, other
   .return($I0)
.end

=item downto(n, block)

Runs C<block> for each integer from the current value of the Integer down to n.

=cut

.sub 'downto' :method
    .param int n
    .param pmc block :named('!BLOCK')
    $I1 = self
  downto_loop:
    $I0 = $I1 < n
    if $I0, downto_done
    block($I1)
    dec $I1
    goto downto_loop
  downto_done:
.end


=item upto(n, block)

Runs C<block> for each integer from the current value of the Integer up to n.

=cut

.sub 'upto' :method
    .param int n
    .param pmc block :named('!BLOCK')
    $I1 = self
  upto_loop:
    $I0 = $I1 > n
    if $I0, upto_done
    block($I1)
    inc $I1
    goto upto_loop
  upto_done:
.end

=item

Runs C<block> for integer from 0 to value of C<self>

=cut

.include "hllmacros.pir"
.sub 'times' :method
   .param pmc block
   $I0 = 0
   $I1 = self
   .While($I0 < $I1, {
        block($I0)
        inc $I0
   })
.end

=item succ()

Return C<self> plus 1

=cut

.sub 'succ' :method
  $P0 = new 'CardinalInteger'
  $P0 = 1
  $P1 = 'infix:+'($P0, self)
  .return ($P1)
.end

=item next()

Return C<self> plus 1

=cut

.sub 'next' :method
  $P0 = new 'CardinalInteger'
  $P0 = 1
  $P1 = 'infix:+'($P0, self)
  .return ($P1)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
