=head1 TITLE

abc.pir - A basic calculator.

=head2 Description

This is the base file for the basic calculator.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'abc'.

=head2 Functions

=over 4

=item onload()

Creates the abc compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'abc::Compiler' ]

.loadlib 'abc_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('abc')
    $P1.'parsegrammar'('abc::Grammar')
    $P1.'parseactions'('abc::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the abc compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'abc'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

