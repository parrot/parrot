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

.sub 'emit' :method
    .param pmc pmclass
    .param pmc entry
    .tailcall self.'!generate_children_body_part'(pmclass, entry)
.end

=item C<!generate_body_part>

Multi-methods for generating C body.

TODO: Parse c_body properly and implement all other functions.

=cut

.sub '!generate_body_part' :method :multi(_, _, ['PAST';'Op'])
    .param pmc pmclass
    .param pmc past
    .tailcall self.'rewrite_op'(pmclass, past)
.end

.sub '!generate_body_part' :method :multi(_, _, ['PAST';'Stmts'])
    .param pmc pmclass
    .param pmc past
    .local string res
    $S0 = self.'!generate_children_body_part'(pmclass, past)
    concat res, $S0
    .return (res)
.end

.sub '!generate_children_body_part' :method
    .param pmc pmclass
    .param pmc entry

    .local pmc res
    res = new 'ResizableStringArray'
    $P0 = entry.'iterator'()
  loop:
    unless $P0 goto done
    $P1 = shift $P0
    $S0 = self.'!generate_body_part'(pmclass, $P1)
    push res, $S0
    goto loop
  done:

    $S0 = join '', res
    .return ($S0)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
