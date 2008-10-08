## $Id$

=head1 TITLE

GC - Cardinal GC class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the GC class

=cut

.namespace ['GC']

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('GC', 'parent'=>'', 'attr'=>'$!disabled')
    #$P2 = cardinalmeta.'HOW'()
    #$P1 = new 'CardinalInteger'
    #$P1 = 0
    #setattribute $P2, '$!disabled', $P1
    #set_hll_global ['GC'], '!CARDINALMETA', cardinalmeta
.end

.sub 'get_bool' :vtable
    .return (1)
.end

#.sub 'get_string' :vtable
#   $S0 = 'GC'
#   .return ($S0)
#.end

.sub 'init' :vtable('init')
    $P1 = new 'CardinalInteger'
    $P1 = 0
    setattribute self, '$!disabled', $P1
.end

.sub 'disable' :method
   $P0 = getattribute self, "$!disabled"
   #could have been null, need to make this class a singleton with these a class methods, not instance methods
   if $P0 == 1 goto already_disabled
   goto disable
   disable:
        $P1 = new 'CardinalInteger'
        $P1 = 1
        setattribute self, '$!disabled', $P1
        collectoff
        $P0 = 'CardinalString'
        $P0 = 'false'
        .return ($P0)
   already_disabled:
        $P0 = 'CardinalString'
        $P0 = 'true'
        .return ($P0)
.end

.sub 'enable' :method
   $P0 = getattribute self, "$!disabled"
   if $P0 == 1 goto enable
   goto already_enabled
   already_enabled:
        $P0 = 'CardinalString'
        $P0 = 'false'
        .return ($P0)
   enable:
        $P1 = new 'CardinalInteger'
        $P1 = 0
        setattribute self, '$!disabled', $P1
        collecton
        $P0 = 'CardinalString'
        $P0 = 'true'
        .return ($P0)
.end

.sub 'start' :method
    collect
    $P0 = get_hll_global 'nil'
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
