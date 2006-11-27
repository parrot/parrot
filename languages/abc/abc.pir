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

.include 'src/builtins.pir'

.namespace [ 'ABC::Grammar' ]
.include 'src/abc_gen.pir'

.include 'src/PASTGrammar_gen.pir'

=back

=cut

