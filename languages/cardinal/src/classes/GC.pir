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
        $P0 = new 'CardinalString'
        $P0 = 'false'
        .return ($P0)
   already_disabled:
        $P0 = new 'CardinalString'
        $P0 = 'true'
        .return ($P0)
.end

.sub 'enable' :method
   $P0 = getattribute self, "$!disabled"
   if $P0 == 1 goto enable
   goto already_enabled
   already_enabled:
        $P0 = new 'CardinalString'
        $P0 = 'false'
        .return ($P0)
   enable:
        $P1 = new 'CardinalInteger'
        $P1 = 0
        setattribute self, '$!disabled', $P1
        collecton
        $P0 = new 'CardinalString'
        $P0 = 'true'
        .return ($P0)
.end

.sub 'start' :method
    collect
    $P0 = get_hll_global 'nil'
    .return ($P0)
.end

.sub 'each_object' :method
    .param pmc block :named('!BLOCK')
    .local pmc addr_space, itr
    .local pmc test
    .return(1)
    test = new 'CardinalString'
    test = "yo"
    # Nope AddrResgistry is not what I expected, we cant use it.
    # We need to create Hash to store all the objects, Use WeakRefs to store the pmcs?
    addr_space = new 'AddrRegistry'
    $I0 = get_addr test
    addr_space[$I0] = test
    #$P0 = addr_space.'methods'()
    #say $P0
    itr = new 'Iterator', addr_space
    print "created iterator: "
    say itr
    $S0 = typeof itr
    print "itr type="
    say $S0
    itr_loop:
        unless itr goto itr_end
        $P0 = shift itr
        $I0 = defined $P0
        unless $I0 goto itr_loop
        print "found: "
        say $P0
        goto itr_loop
    itr_end:
        say "done looping thru addr_space"
        .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
