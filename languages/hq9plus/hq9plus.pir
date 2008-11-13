=head1 TITLE

hq9plus.pir - A HQ9plus compiler.

=head2 Description

This is the driver for the HQ9plus compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'HQ9plus'.

=head2 Functions

=over 4

=item onload()

Creates the HQ9plus compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'HQ9plus';'Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P1 = new ['PCT';'HLLCompiler']

    $P1.'language'('HQ9plus')
    $P1.'parsegrammar'('HQ9plus::Grammar')
    $P1.'parseactions'('HQ9plus::Grammar::Actions')

    .return()
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the HQ9plus compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'HQ9plus'
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
