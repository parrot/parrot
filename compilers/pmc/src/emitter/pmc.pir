# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 Generic PMC emitter

This is PIR part of PMC emitter.

TODO figure out how to implement it in NQP.

=cut

.namespace ['PMC';'Emitter';'PMC']

.sub '' :load :init
    .local pmc p6meta

    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::Emitter::PMC', 'parent'=>'Capture')

.end

.sub 'new' :method
    .param pmc past

    .local pmc res
    $P0 = self.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    res = new $P0

    res['past'] = past
    $S0 = past.'name'()
    res['name'] = $S0
    $S0 = 'uc'($S0)
    res['ucname'] = $S0

    .return (res)
.end

.sub 'past' :method
    $P0 = self['past']
    .return ($P0)
.end

.sub 'name' :method
    $S0 = self['name']
    .return ($S0)
.end

.sub 'ucname' :method
    $S0 = self['ucname']
    .return ($S0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
