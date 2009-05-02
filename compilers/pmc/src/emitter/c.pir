# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 C emitter.

Generates C from PAST.

=cut

.namespace ['PMC';'Emitter';'C']

.sub '' :load :init
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PMC::Emitter::C')
.end

=item C<emit>

Generate C function body from PAST.

=cut

.sub 'emit'
    .param pmc entry
    
    .local pmc res
    res = new 'ResizableStringArray'
    $P0 = entry.'iterator'()
  loop:
    unless $P0 goto done
    $P1 = shift $P0
    #print 'P1 '
    #say $P1
    $S0 = '!generate_body_part'($P1)
    push res, $S0
    goto loop
  done:

    $S0 = join '', res
    .return ($S0)
.end

=item C<!generate_body_part>

Multi-methods for generating C body.

TODO: Parse c_body properly and implement all other functions.

=cut

.sub '!generate_body_part' :multi(['PAST';'Op'])
    .param pmc past
    $S0 = past['inline']
    .return ($S0)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
