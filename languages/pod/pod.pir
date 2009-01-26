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

.HLL 'pod'

.namespace [ 'Pod';'Compiler' ]

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
    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('pod')
    $P0 = get_hll_namespace ['Pod';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['Pod';'Grammar';'Actions']
    $P1.'parseactions'($P0)
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

.include 'src/gen_builtins.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

