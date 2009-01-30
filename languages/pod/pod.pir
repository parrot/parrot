=head1 TITLE

pod.pir - A Pod compiler.

=head2 Description

This is the base file for the Pod compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Pod'.

=head2 Functions

=over 4

=item onload()

Creates the Pod compiler using a C<PCT::HLLCompiler>
object.

=cut

.sub 'print'
    .param string arg
    print arg
.end

.HLL 'pod'

.namespace [ 'Pod';'Compiler' ]


.sub 'doctree' :method
    .param pmc match
    .param pmc namedargs :named :slurpy
    print "doctree"
.end

.loadlib 'pod_group'

.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'
    .local pmc parrotns, hllns, exports
    parrotns = get_root_namespace ['parrot']
    hllns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(hllns, exports)
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'
    $P0 = get_class ['PCT';'HLLCompiler']
    $P2 = subclass $P0, ['Pod';'Compiler']
    $P1 = $P2.'new'()
    $P1.'language'('pod')
    $P0 = get_hll_namespace ['Pod';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['Pod';'Grammar';'Actions']
    $P1.'parseactions'($P0)


    ##  set the compilation stages in the @stages attribute
    $P0 = split ' ', 'parse doctree'
    setattribute $P1, '@stages', $P0
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Pod compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'pod'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/Pod/DocTree/Node.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

