# $Id$

=head1 SYNOPSIS

Register PMC::Emitter::PMC::default as child of PMC::Emitter::PMC

=cut

.namespace ['PMC';'Emitter';'PMC';'default']

.sub '' :load :init :anon
    ##   create the classes
    .local pmc p6meta
    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::Emitter::PMC::default', 'parent'=>'PMC::Emitter::PMC')

    .return ()
.end

=head1 COPYRIGHT

Copyright (C) 2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
