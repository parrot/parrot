# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

Proc - Cardinal Proc class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Proc class

=cut

.namespace ['Proc']

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('Proc', 'parent'=>'CardinalObject', 'attr'=>'!block')
.end

.sub 'get_bool' :vtable
    .return (1)
.end

.sub 'get_string' :vtable
   $S0 = 'Proc'
   .return ($S0)
.end

.sub 'initialize' :method
        .param pmc block :named('!BLOCK')
        setattribute self, '!block', block
        #setprop self, '!block', block
.end

.sub 'call' :method
    .param pmc args :slurpy
    .local pmc block
    getattribute block, self, '!block'
    #getprop block, '!block', self
    $P0 = block(args :flat)
    .return ($P0)
.end

.sub 'arity' :method
    .param pmc args :slurpy
    .local pmc block
    getattribute block, self, '!block'
    #getprop block, '!block', self
    $I0 = block.'arity'()
    #$P2 = block.'inspect'()
    #say $P2
    $P0 = new 'CardinalInteger'
    dec $I0
    $P0 = $I0
    .return ($P0)
.end

.sub 'to_proc' :method
        .return (self)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
