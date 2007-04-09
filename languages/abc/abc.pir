=head1 TITLE

abc.pir - A basic calculator.

=head2 Description

This is the base file for the basic calculator.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'ABC'.

=head2 Functions

=over 4

=item C<__onload()>

Loads the PGE libraries needed for running the parser,
and registers the "compile" subroutine as the "ABC" compiler.

=cut

.namespace [ 'ABC' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'

    # import PGE::Util::die into ABC::Grammar
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['ABC::Grammar'], 'die', $P0

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('ABC')
    $P0.'parsegrammar'('ABC::Grammar')
    $P0.'astgrammar'('ABC::PAST::Grammar')

.end


=item main([arg1, ...]) :main

Start the compiler from the command line.  We simply pass any
command line argument's to the ABC compiler's <command_line>
method (inherited from C<HLLCompiler>).

=cut

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'ABC'
    .return $P0.'command_line'(args)
.end


.include 'src/builtins.pir'

.namespace [ 'ABC::Grammar' ]
.include 'src/abc_gen.pir'

.include 'src/PASTGrammar_gen.pir'

=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
