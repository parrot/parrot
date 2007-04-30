=head1 Range

http://perlcabal.org/syn/S03.html#Range_semantics

=cut

.HLL 'parrot', ''
.namespace [ 'Range' ]

.macro exhausted_check()
  .sym pmc exhausted
  exhausted = getattribute self, 'exhausted'
  unless exhausted goto .$more
  .sym pmc exception
  exception = new 'Exception'
  exception[0] = 'Exhausted Range'
  throw exception
.local $more:
.endm

.macro exhausted()
  .sym pmc exhausted
  exhausted = new 'Boolean'
  exhausted = 1
  setattribute self, 'exhausted', exhausted
.endm


.sub __class_init :anon :load

  $P1 = newclass 'Range'

  addattribute $P1, 'from'
  addattribute $P1, 'to'
  addattribute $P1, 'by'
  addattribute $P1, 'reversed'
  addattribute $P1, 'exhausted'
.end

# XXX :method is only specified here so we can get 'self'
.sub 'init' :vtable :method
  $P1 = new 'Integer'
  $P1 = 1
  setattribute self, 'by', $P1
  $P1 = new 'Boolean'
  $P1 = 0
  setattribute self, 'reversed', $P1
  $P1 = new 'Boolean'
  $P1 = 0
  setattribute self, 'exhausted', $P1
.end


# XXX handle reversed.
.sub get_from :method
  .local pmc from
  from = getattribute self, 'from'
  .return (from)
.end

# XXX handle reversed.
.sub get_to :method
  .local pmc to
  to = getattribute self, 'to'
  .return (to)
.end

# XXX handle reversed.
.sub get_min :method
  .local pmc from
  from = getattribute self, 'from'
  .return (from)
.end

# XXX handle reversed.
.sub get_max :method
  .local pmc to
  to = getattribute self, 'to'
  .return (to)
.end

.sub get_minmax :method
  $P1 = new .Array
  $P1 = 2
  .local pmc min, max
  min = self.'get_min'()
  max = self.'get_max'()
  $P1[0] = min
  $P1[1] = max
  .return ($P1) 
.end

.sub shift :method
  .exhausted_check()

  .local pmc exhausted, from, to, by
  from = getattribute self, 'from'
  to   = getattribute self, 'to'
  by   = getattribute self, 'by'
  $P0 = clone from
  $P0 += by
  setattribute self, 'from', $P0
  if $P0 <= to goto done
  .exhausted()
done:
  .return (from)
.end

.sub pop :method
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
  if $P0 >= from goto done
  .exhausted()
done:
  .return (to)
.end

.sub reverse :method
  .local pmc reversed
  reversed = getattribute self, 'reversed'
  reversed = not reversed
  setattribute self, 'reversed', reversed
  .return(self)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
