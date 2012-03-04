# Copyright (C) 2007-2009, Parrot Foundation.

=head1 Range

Based on the Range object described in S03:
L<http://perlcabal.org/syn/S03.html#Range_semantics>

=cut

.HLL 'parrot'
.namespace [ 'Range' ]

=head1 macros

=cut

.macro exhausted_check()
  .local pmc exhausted_check
  exhausted_check = getattribute self, 'exhausted'
  unless exhausted_check goto .$more
  .local pmc exception
  exception = new 'Exception'
  exception[0] = 'Exhausted Range'
  throw exception
.label $more:
.endm

.macro exhausted()
  .local pmc exhausted
  exhausted = new 'Boolean'
  exhausted = 1
  setattribute self, 'exhausted', exhausted
.endm

=head1 :tag('load')

Create the class, with attributes, when this PBC is loaded.

=cut

.sub class_init :anon :tag('load')

  $P1 = newclass 'Range'

  addattribute $P1, 'from'
  addattribute $P1, 'to'
  addattribute $P1, 'by'
  addattribute $P1, 'exhausted'
.end

=head1 :vtable

=head2 init

Set some defaults for our attributes.

=cut

.sub 'init' :vtable :method
  $P1 = new 'Integer'
  $P1 = 1
  setattribute self, 'by', $P1
  $P1 = new 'Boolean'
  $P1 = 0
  setattribute self, 'exhausted', $P1
.end

=head1 :method

=head2 get_from

Return the from attribute

=cut

.sub get_from :method
  .local pmc from
  from = getattribute self, 'from'
  .return (from)
.end

=head2 get_to

Return the to attribute

=cut

.sub get_to :method
  .local pmc to
  to = getattribute self, 'to'
  .return (to)
.end

=head2 get_min

Return the min attribute

=cut

.sub get_min :method
  .local pmc from, to
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  if from < to goto use_from
  .return (to)
use_from:
  .return (from)
.end

=head2 get_max

Return the max attribute

=cut

.sub get_max :method
  .local pmc from, to
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  if from > to goto use_from
  .return (to)
use_from:
  .return (from)
.end

=head2 get_minmax

Return the min and max attributes as a 2 element list.

=cut

.sub get_minmax :method
  $P1 = new 'ResizablePMCArray'
  $P1 = 2
  .local pmc min, max
  min = self.'get_min'()
  max = self.'get_max'()
  $P1[0] = min
  $P1[1] = max
  .return ($P1)
.end

=head2 shift

shift a value off the "front" of the range.

Throw an exception if we're out of values.

=cut

.sub 'shift' :vtable('shift_pmc') :method
  .exhausted_check()

  .local pmc from, to, by
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  by   = getattribute self, 'by'

  $P0 = clone from
  $P0 += by
  setattribute self, 'from', $P0

  if by < 0 goto neg
  if $P0 <= to goto done
  goto exhaust
neg:
  if $P0 >= to goto done
exhaust:
  .exhausted()
done:
  .return (from)
.end

# Wrappers for the shift_pmc vtable - rely on autoboxing.
.sub 'shift_integer' :vtable :method
  $P0 = shift self
  .return ($P0)
.end

.sub 'shift_float' :vtable :method
  $P0 = shift self
  .return ($P0)
.end

.sub 'shift_string' :vtable :method
  $P0 = shift self
  .return ($P0)
.end

=head2 pop

pop a value off the "end" of the range.

Throw an exception if we're out of values.

=cut

.sub 'pop' :vtable('pop_pmc') :method
  .exhausted_check()
  # can we pull a number off the end?
  # return it.

  .local pmc from, to, by
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  by   = getattribute self, 'by'
  $P0 = clone to
  $P0 -= by
  setattribute self, 'to', $P0

  if by < 0 goto neg
  if $P0 >= from goto done
  goto exhaust
neg:
  if $P0 <= from goto done
exhaust:
  .exhausted()
done:
  .return (to)
.end

# Wrappers for the shift_pmc vtable - rely on autoboxing.
.sub 'pop_integer' :vtable :method
  $P0 = pop self
  .return ($P0)
.end

.sub 'pop_float' :vtable :method
  $P0 = pop self
  .return ($P0)
.end

.sub 'pop_string' :vtable :method
  $P0 = pop self
  .return ($P0)
.end


=head2

Reverse the direction of the range.

=cut

.sub reverse :method
  .local pmc from, to, by
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  setattribute self, 'from', to
  setattribute self, 'to',   from

  by = getattribute self, 'by'
  by = neg by
  setattribute self, 'by', by
  .return(self)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
