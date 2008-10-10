=head1 TITLE

lolcode.pir - A lolcode compiler.

=head2 Description

This is the base file for the lolcode compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'lolcode'.

=head2 Functions

=over 4

=item onload()

Creates the lolcode compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'lolcode';'Compiler' ]

.loadlib 'lolcode_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = new 'ResizablePMCArray'
    set_hll_global ['lolcode';'Grammar';'Actions'], '@?BLOCK', $P0

    $P0 = new ['PAST';'Stmts']
    set_hll_global ['lolcode';'Grammar';'Actions'], '$?BLOCK_SIGNATURE', $P0

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('lolcode')
    $P1.'parsegrammar'('lolcode::Grammar')
    $P1.'parseactions'('lolcode::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the lolcode compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'lolcode'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/parser/yarn_literal.pir'
.include 'src/gen_actions.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

