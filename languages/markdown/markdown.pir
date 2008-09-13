=head1 TITLE

markdown.pir - A Markdown compiler.

=head2 Description

This is the base file for the Markdown compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Markdown'.

=head2 Functions

=over 4

=item onload()

Creates the Markdown compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'Markdown::Compiler' ]

.loadlib 'markdown_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('Markdown')
    $P1.'parsegrammar'('Markdown::Grammar')
    $P1.'parseactions'('Markdown::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Markdown compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'Markdown'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

