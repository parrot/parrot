# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

Queue - Cardinal Queue class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Queue class

=cut

.namespace ['Queue']

.sub 'onload' :anon :init :load
    .local pmc meta, qproto
    meta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    qproto = meta.'new_class'('Queue', 'parent'=>'parrot;TQueue CardinalObject', 'attr'=>'')
    meta.'register'('TQueue', 'parent'=>'TQueue', 'protoobject'=>qproto)
.end

.sub 'get_bool' :vtable
    .return (1)
.end

.sub 'get_string' :vtable
   $S0 = 'Queue'
   .return ($S0)
.end

.sub 'length' :method
        $I0 = self
        .return ($I0)
.end

.sub 'size' :method
        $I0 = self
        .return ($I0)
.end

.sub 'empty?' :method
       $I0 = self.'size'()
       if $I0 == 0 goto yes
       goto no
       yes:
           $P0 = get_hll_global ['Bool'], 'True'
           .return ($P0)
       no:
           $P0 = get_hll_global ['Bool'], 'False'
           .return ($P0)
.end

.sub 'push' :method
        .param pmc obj
        push self, obj
.end

.sub 'infix:<<' :method
        .param pmc obj
        self.'push'(obj)
.end

.sub 'enq' :method
        self.'push'(obj)
.end

.sub 'shift' :method
        .param pmc blockt       :optional
        .param int has_blockt   :opt_flag
        .local pmc obj
        if has_blockt goto shiftem
        blockt = get_hll_global ['Bool'], 'False'
        shiftem:
            shift obj, self
            .return (obj)
.end

.sub 'deq' :method
        .param pmc blockt
        $P0 = self.'shift'(blockt)
        .return ($P0)
.end

.sub 'pop' :method
        .param pmc blockt
        $P0 = self.'shift'(blockt)
        .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
