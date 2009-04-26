# $Id$

=head1 NAME

Compiler for PMC

=head1 DESCRIPTION

Extends PCT::HLLCompiler with emit_something functions

=cut

.namespace [ 'PMC';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PCT.pbc'
    load_bytecode 'compilers/nqp/nqp.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::Compiler', 'parent'=>'PCT::HLLCompiler')


    $P0 = new [ 'PMC';'Compiler' ]
    $P0.'language'('PMC')
    $P0.'parsegrammar'('PMC::Grammar')
    $P0.'parseactions'('PMC::Grammar::Actions')

.end


=head1 COPYRIGHT

Copyright (C) 2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
