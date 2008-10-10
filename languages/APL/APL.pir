=head1 TITLE

apl.pir - A APL compiler.

=head2 Description

This is the base file for the APL compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'APL'.

=head2 Functions

=over 4

=item onload()

Creates the APL compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'APL::Compiler' ]

.loadlib 'apl_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('APL')
    $P1.'parsegrammar'('APL::Grammar')
    $P1.'parseactions'('APL::Grammar::Actions')

    ##  tell PCT to always generate pmcs for Float constants
    $P0 = get_hll_global ['PAST';'Compiler'], '%valflags'
    $P0['Float'] = ''
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the APL compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'APL'
    $P1 = $P0.'command_line'(args, 'encoding'=>'utf8')
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

