=head1 TITLE

pynie.pir - A Python compiler.

=head2 Description

This is the base file for the Pynie compiler.

=head2 Functions

=over 4

=item __onload()

Loads the PGE libraries needed for running the parser,
and registers the Pynie compiler using a C<HLLCompiler>
object.

=cut

.HLL 'pynie'

.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'

    .local pmc parrotns, pyns, exports
    parrotns = get_root_namespace ['parrot']
    pyns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(pyns, exports)
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'
.include 'src/parser/indent.pir'

.include 'src/builtins/funcs.pir'
.include 'src/builtins/io.pir'
.include 'src/builtins/lists.pir'
.include 'src/builtins/oper.pir'


.sub '__onload' :load :init
    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P0 = $P0.'new'()
    $P0.'language'('Pynie')
    $P1 = get_hll_namespace ['Pynie';'Grammar']
    $P0.'parsegrammar'($P1)
    $P1 = get_hll_namespace ['Pynie';'Grammar';'Actions']
    $P0.'parseactions'($P1)

    $P0.'commandline_banner'("Pynie: a Python compiler for Parrot.\n")
    $P0.'commandline_prompt'('>>> ')

.end


=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Pynie compiler.

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'PGE/Dumper.pbc'
    $P0 = compreg 'Pynie'
    .tailcall $P0.'command_line'(args)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
