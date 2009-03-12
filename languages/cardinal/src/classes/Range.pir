## $Id$

=head1 NAME

src/classes/CardinalRange.pir - methods for the CardinalRange class

=head1 DESCRIPTION

=head2 Methods

=over 4

=cut

.namespace ['CardinalRange']

.sub 'onload' :anon :load :init
    .local pmc meta, proto
    meta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    proto = meta.'new_class'('CardinalRange', 'parent'=>'CardinalAny CardinalObject', 'attr'=>'$!from $!to $!from_exclusive $!to_exclusive')
    #meta.'register'('CardinalRange', 'CardinalObject', 'protoobject'=>proto)
.end

=item VTABLE_get integer (vtable method)

=item VTABLE_get_number (vtable method)

=item VTABLE_get_string (vtable method)

=cut

.sub 'VTABLE_get_integer' :method :vtable('get_integer')
    $P0 = self.'list'()
    $I0 = $P0
    .return ($I0)
.end

.sub 'VTABLE_get_number' :method :vtable('get_number')
    $P0 = self.'list'()
    $N0 = $P0
    .return ($N0)
.end

.sub 'VTABLE_get_string' :method :vtable('get_string')
    $P0 = self.'list'()
    $S0 = $P0
    .return ($S0)
.end


=item ACCEPTS(topic)

Determines if topic is within the range or equal to the range.

=cut

.sub 'ACCEPTS' :method
    .param pmc topic

    $I0 = isa topic, 'CardinalRange'
    unless $I0 goto value_in_range_check
    $I0 = self.'from'()
    $I1 = topic.'from'()
    if $I0 != $I1 goto false
    $I0 = self.'to'()
    $I1 = topic.'to'()
    if $I0 != $I1 goto false
    $P0 = getattribute self, "$!from_exclusive"
    $P1 = getattribute topic, "$!from_exclusive"
    if $P0 != $P1 goto false
    $P0 = getattribute self, "$!to_exclusive"
    $P1 = getattribute topic, "$!to_exclusive"
    if $P0 != $P1 goto false
    goto true

  value_in_range_check:
    $I0 = self.'!from_test'(topic)
    unless $I0 goto false
    $I0 = self.'!to_test'(topic)
    unless $I0 goto false

  true:
    $P0 = get_hll_global ['Bool'], 'True'
    .return ($P0)
  false:
    $P0 = get_hll_global ['Bool'], 'False'
    .return ($P0)
.end


=item clone()   (vtable method)

Create a clone of the CardinalRange.

=cut

.sub 'clone' :method :vtable
     $P0 = self.'!cloneattr'('$!from $!to $!from_exclusive $!to_exclusive')
     .return ($P0)
.end


=item from()

=item to()

Gets the beginning or end of the range.

=cut

.sub 'from' :method
    $P0 = getattribute self, '$!from'
    .return ($P0)
.end

=item

=cut

.sub 'to' :method
    $P0 = getattribute self, '$!to'
    .return ($P0)
.end

=item to_a

 Generates and returns this range as an array. This will eventually be refactored w/ the other Enumerable methods This will eventually be refactored w/ the other Enumerable methods.

=cut

.sub 'to_a' :method
    $P0 = self.'list'()
    .return ($P0)
.end

.sub 'to_s' :method
   $P0 = getattribute self, '$!from_exclusive'
   $P1 = getattribute self, '$!to_exclusive'
   $P2 = $P0 && $P1
   if $P2 goto build_exclusive
   goto build_inclusive
   build_inclusive:
      $S0 = '..'
      goto build_return
   build_exclusive:
      $S0 = '...'
      goto build_return
   build_return:
      $P0 = getattribute self, '$!from'
      $P1 = getattribute self, '$!to'
      $P3 = new 'CardinalString'
      $P3.'concat'($P0)
      $P3.'concat'($S0)
      $P3.'concat'($P1)
      .return ($P3)
.end

=item iterator()  (vtable method)

Return an iterator for the CardinalRange.  Since CardinalRanges are already
iterators, we can just return a clone.

=cut

.sub 'iterator' :method :vtable('get_iter')
    $P0 = clone self
    .return ($P0)
.end


=item list()

Generate the CardinalRange in list context.  Currently we generate all
of the elements in the range; when we have lazy lists we can
just return a clone of the CardinalRange.

=cut

.sub 'list' :method
    .local pmc range_it, result
    range_it = self.'iterator'()
    result = new 'CardinalArray'
  range_loop:
    unless range_it goto range_end
    $P0 = shift range_it
    push result, $P0
    goto range_loop
  range_end:
    .return (result)
.end


=item min()

=item minmax()

=item max()

=cut

.namespace ['CardinalRange']

=item
 Return first element in CardinalRange. Will later be refactored as part of the Enumerable module.
=cut
.sub 'min' :method
    .tailcall self.'from'()
.end

=item
 Return first element in CardinalRange.
=cut
.sub 'begin' :method
    .tailcall self.'from'()
.end

=item
 Return first element in CardinalRange.
=cut
.sub 'first' :method
    .tailcall self.'from'()
.end

.sub 'minmax' :method
    $P0 = self.'from'()
    $P1 = self.'to'()
    $P2 = get_hll_global 'list'
    .tailcall $P2($P0, $P1)
.end

=item
 Return last element in CardinalRange. Will later be refactored as part of the Enumerable module.
=cut
.sub 'max' :method
    .tailcall self.'to'()
.end

=item
 Return last element in CardinalRange.
=cut
.sub 'last' :method
    .tailcall self.'to'()
.end

=item
 Return last element in CardinalRange.
=cut
.sub 'end' :method
    .tailcall self.'to'()
.end

=item
Return true if the parameter is located with this CardinalRange
=cut
.sub 'covers?' :method
   .param pmc test
   $P0 = self.'include?'(test)
   .return ($P0)
.end

=item
Return true if the parameter is located with this CardinalRange
1.9 does a succ on the last element if it isnt a integer, so this doesnt work
=cut
.sub 'include?' :method
  .param pmc test
  $P0 = self.'from'()
  $P1 = self.'to'()

  $I0 = self.'!from_test'(test)
  if $I0 == 0 goto out_of_bounds
  $I0 = self.'!to_test'(test)
  if $I0 == 0 goto out_of_bounds
  #if test <= $P0 goto out_of_bounds
  #if test >= $P1 goto out_of_bounds
  $P3 = get_hll_global ['Bool'], 'True'
  .return ($P3)
  out_of_bounds:
      $P3 = get_hll_global ['Bool'], 'False'
      say 'out of bounds'
      #throw 'out of bounds!'
      .return ($P3)
.end

=item

Return C<True> if the parameter is a member of this CardinalRange

=cut

.sub 'member?' :method
   .param pmc test
   $P0 = self.'include?'(test)
   .return ($P0)
.end


=item pop()  (vtable_method)

Generate the next element at the end of the CardinalRange.

=cut

.sub 'pop' :method :vtable('pop_pmc')
    .local pmc to, toexc, value
    to = getattribute self, '$!to'
    toexc = getattribute self, '$!to_exclusive'
    value = 'postfix:--'(to)
    unless toexc goto have_value
    value = clone to
  have_value:
    $I0 = self.'!from_test'(value)
    if $I0 goto success
    #value = '!FAIL'('Undefined value popped from empty range')
    value = new 'Undef'
  success:
    .return (value)
.end


=item shift()   (vtable_method)

Generate the next element at the front of the CardinalRange.

=cut

.sub 'shift' :method :vtable('shift_pmc')
    .local pmc from, fromexc, value
    from = getattribute self, '$!from'
    fromexc = getattribute self, '$!from_exclusive'
    value = 'postfix:++'(from)
    unless fromexc goto have_value
    value = clone from
  have_value:
    $I0 = self.'!to_test'(value)
    if $I0 goto success
    #value = '!FAIL'('Undefined value shifted from empty range')
    value = new 'Undef'
  success:
    .return (value)
.end


=item true()

Return true if there are any more values to iterate over.

=cut

.sub 'true' :method :vtable('get_bool')
    .local pmc from, fromexc
    from = getattribute self, '$!from'
    fromexc = getattribute self, '$!from_exclusive'
    unless fromexc goto have_value
    from = clone from
    'postfix:++'(from)
  have_value:
    $I0 = self.'!to_test'(from)
    .return ($I0)
.end


.sub 'initialize' :method :multi(_)
    .param pmc hash :named :slurpy
    $P1 = hash["$!from_exclusive"]
    defined $I0, $P1
    $I0 = !$I0
    if $I0 goto default
    setattribute self, '$!from_exclusive', $P1
    $P2 = hash["$!to_exclusive"]
    setattribute self, '$!to_exclusive', $P2
    goto finish
    default:
        $P0 = new 'CardinalInteger'
        $P0 = 0
        setattribute self, '$!from_exclusive', $P0
        setattribute self, '$!to_exclusive', $P0
        goto finish
    finish:
        $P3 = hash["$!from"]
        setattribute self, '$!from', $P3
        $P4 = hash["$!to"]
        setattribute self, '$!to', $P4
.end

.sub 'initialize' :method :multi(_,_,_)
    .param pmc from
    .param pmc to
    $P0 = new 'CardinalInteger'
    $P0 = 0
    setattribute self, '$!from_exclusive', $P0
    setattribute self, '$!to_exclusive', $P0
    setattribute self, '$!from', from
    setattribute self, '$!to', to
.end

=item each(block)

Run C<block> once for each item in C<self>, with the item passed as an arg.

=cut

.sub 'each' :method
    .param pmc block    :named ("!BLOCK")
    $P0 = self.'first'()
    $P1 = $P0.'HOW'()
    $I0 = $P1.'can'(self,'succ')
    if $I0 != 0 goto continuous_range
    $P0 = self.'iterator'()
    goto each_loop
  continuous_range:
    $P1 = new 'CardinalString'
    $P1 = "Cant iterate from "
    $P2 = $P0.'class'()
    $P1.'concat'($P2)
#say "continuous_range..."
#say $P2
    .return ($P2)
    #throw $P2
  each_loop:
    unless $P0 goto each_loop_end
    $P1 = shift $P0
    block($P1)
    goto each_loop
  each_loop_end:
.end

=back

=head2 Operators

=over 4

=item infix:<..>

=item infix:<...>

Construct a range from the endpoints.

=cut

.namespace []
.sub 'infix:..'
    .param pmc from
    .param pmc to
    .local pmc proto
    proto = get_hll_global 'CardinalRange'
    $P1 = proto.'new'('$!from'=>from, '$!to'=>to)
    .return ($P1)
.end

.sub 'infix:...'
    .param pmc from
    .param pmc to
    .local pmc proto, true, false
    proto = get_hll_global 'CardinalRange'
    true = get_hll_global ['Bool'], 'True'
    false = get_hll_global ['Bool'], 'False'
    $P0 = proto.'new'('$!from'=>from, '$!to'=>to, '$!from_exclusive'=>false, '$!to_exclusive'=>true)
    .return ($P0)
.end

=back

=head2 Private methods

=over 4

=item !from_test(topic)

=item !to_test(topic)

Returns true if C<topic> is greater than C<.from> / less than C<.to>,
honoring exclusive flags.

=cut

.namespace ['CardinalRange']
.sub '!from_test' :method
    .param pmc topic
    .local pmc from, fromexc
    from = getattribute self, '$!from'
    fromexc = getattribute self, '$!from_exclusive'
    if fromexc goto exclusive_test
    $I0 = isge topic, from
    .return ($I0)
  exclusive_test:
    $I0 = isgt topic, from
    .return ($I0)
.end

.sub '!to_test' :method
    .param pmc topic
    .local pmc to, toexc
    to = getattribute self, '$!to'
    $I0 = isa to, 'String'
    unless $I0 goto test_value
    $S0 = topic
    $I0 = length $S0
    $S1 = to
    $I1 = length $S1
    eq $I0, $I1, test_value
    $I0 = islt $I0, $I1
    .return ($I0)
  test_value:
    toexc = getattribute self, '$!to_exclusive'
    if toexc goto exclusive_test
    $I0 = isle topic, to
    .return ($I0)
  exclusive_test:
    $I0 = islt topic, to
    .return ($I0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

