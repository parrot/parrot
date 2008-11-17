## $Id$

=head1 TITLE

Time - Cardinal Time class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Time class

=cut


.namespace ['Time']

.include "tm.pasm"

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('Time', 'parent'=>'CardinalObject', 'attr'=>'$!time_in_millis $!gmt')
    cardinalmeta = $P0.'HOW'()
    set_hll_global ['Time'], '!CARDINALMETA', cardinalmeta
.end


=item WHENCE()

Return the invocant's auto-vivification closure.

=cut

.sub 'WHENCE' :method
    $P0 = self.'WHAT'()
    $P1 = $P0.'WHENCE'()
    .return ($P1)
.end

=item get_bool(vtable)

Returns true if he object is defined, false otherwise

=cut

.sub '' :vtable('get_bool')
   $I0 = 'defined'(self)
   .return ($I0)
.end

.sub 'initialize' :method :multi(_,_)
    .param pmc t
    $P0 = new 'CardinalInteger'
    $P0 = t
    setattribute self, '$!time_in_millis', $P0
    $P1 = get_hll_global['Bool'], 'False'
    # TODO fix this, check gmt then set to appropriate value
    setattribute self, '$!gmt', $P1
.end

.sub 'initialize' :method :multi(_)
    time $I0
    $P0 = new 'CardinalInteger'
    $P0 = $I0
    setattribute self, '$!time_in_millis', $P0
    $P1 = get_hll_global['Bool'], 'False'
    # TODO fix this, check gmt then set to appropriate value
    setattribute self, '$!gmt', $P1
.end

#.sub 'now'
    #call CardinalObject super .new
    #return the object returned by super
#.end

.sub 'to_s' :method :vtable('get_string')
    .local pmc is_gmt, to_s
    to_s = new 'CardinalString'
    $P0 = getattribute self, '$!time_in_millis'
    $I0 = $P0
    is_gmt = getattribute self, '$!gmt'
    if is_gmt goto g_time
    goto l_time
    g_time:
        $S0 = gmtime $I0
        to_s = $S0
        goto done
    l_time:
        $S0 = localtime $I0
        to_s = $S0
        goto done
    done:
        .return (to_s)
.end

.sub 'to_i' :method
  .local int epoch_sec
  $P0 = getattribute self, '$!time_in_millis'
  epoch_sec = $P0
  .return (epoch_sec)
.end

.sub 'to_f' :method
  .local pmc epoch_sec
  $P0 = getattribute self, '$!time_in_millis'
  epoch_sec = new 'Float'
  epoch_sec = $P0
  .return (epoch_sec)
.end

.sub 'gmt?' :method
   $P0 = getattribute self, '$!gmt'
   .return ($P0)
.end

.sub 'gmtime' :method
    .local pmc is_gmt

    is_gmt = getattribute self, '$!gmt'
    if is_gmt goto done

    $P1 = get_hll_global['Bool'], 'True'
    setattribute self, '$!gmt', $P1
    goto done

    done:
       .return (self)
.end

.sub '#!parse_time_array' :method
   .param int offset
   .local pmc is_gmt
   .local pmc return_value
   return_value = new 'CardinalInteger'
   $P0 = getattribute self, '$!time_in_millis'
   $I0 = $P0
   is_gmt = getattribute self, '$!gmt'

   if is_gmt goto decodegmt
   goto decodelocal

   decodegmt:
       decodetime $P1, $I0
       $I0 = $P1[offset]
       return_value = $I0
       goto done
   decodelocal:
       decodelocaltime $P1, $I0
       $I0 = $P1[offset]
       return_value = $I0
       goto done
   done:
       .return (return_value)

  #print out all values in the time array
  #$P2 = new 'Iterator', $P0
  #each_loop:
  #  unless $P2 goto done
  #  $P3 = shift $P2
  #  say $P3
  #  goto each_loop
.end

.sub 'sec' :method
    $P0 = self.'#!parse_time_array'(.TM_SEC)
    .return ($P0)
.end

.sub 'min' :method
    $I0 = self.'#!parse_time_array'(.TM_MIN)
    .return ($I0)
.end

.sub 'hour' :method
    $I0 = self.'#!parse_time_array'(.TM_HOUR)
    .return ($I0)
.end

.sub 'day' :method
   .tailcall self.'mday'()
.end

.sub 'mday' :method
    $I0 = self.'#!parse_time_array'(.TM_MDAY)
    .return ($I0)
.end

.sub 'yday' :method
    $I0 = self.'#!parse_time_array'(.TM_YDAY)
    .return ($I0)
.end

.sub 'wday' :method
    $I0 = self.'#!parse_time_array'(.TM_WDAY)
    .return ($I0)
.end

.sub 'month' :method
    $I0 = self.'#!parse_time_array'(.TM_MON)
    .return ($I0)
.end

.sub 'year' :method
    $I0 = self.'#!parse_time_array'(.TM_YEAR)
    .return ($I0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
