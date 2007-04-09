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

.namespace [ 'Pynie::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'

    $P0 = subclass 'PGE::Match', 'Match'
    $P0 = subclass 'Match', 'Grammar'
    $P0 = subclass 'Grammar', 'Pynie::Grammar'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('Pynie')
    $P0.'parsegrammar'('Pynie::Grammar')
    $P0.'astgrammar'('Pynie::PAST::Grammar')

    $P0.'commandline_banner'("Pynie: a Python compiler for Parrot.\n")
    $P0.'commandline_prompt'('>>> ')

    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['Pynie::Grammar'], 'die', $P0
.end


=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Pynie compiler.

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'PGE/Dumper.pbc'
    $P0 = compreg 'Pynie'
    .return $P0.'command_line'(args)
.end

.namespace [ 'Pynie::Grammar' ]

.include 'src/parser/Grammar_gen.pir'
.include 'src/parser/indent.pir'

.include 'src/PAST/Grammar_gen.pir'

.namespace [ 'Pynie' ]

.include 'src/builtins/io.pir'
.include 'src/builtins/lists.pir'
.include 'src/builtins/oper.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
