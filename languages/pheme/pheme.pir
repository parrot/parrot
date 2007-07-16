=head1 TITLE

pheme.pir - A Pheme compiler.

=head2 Description

This is the base file for the Pheme compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Pheme'.

=head2 Functions

=over 4

=item __onload()

Loads the PGE libraries needed for running the parser,
and registers the Pheme compiler using a C<HLLCompiler>
object.

=cut

.namespace [ 'Pheme::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'Parrot/HLLCompiler.pir'
    load_bytecode 'PAST-pm.pbc'

    $P0 = subclass 'PGE::Match', 'Match'
    $P0 = subclass 'Match',      'Grammar'
    $P0 = subclass 'Grammar',    'Pheme::PGE::Grammar'

    $P0 = new [ 'HLLCompiler' ]

    $P0.'language'('Pheme')
    $P0.'parsegrammar'( 'Pheme::Grammar' )
    $P0.'astgrammar'(   'Pheme::AST::Grammar' )
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args> to the Pheme compiler.

=cut

.const int SEVERITY_SLOT = 2 # _severity

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'Pheme'

    push_eh exit_handler
      $P1 = $P0.'command_line'(args)
    clear_eh
    goto done

  exit_handler:
    .get_results($P0, $S0)
    .include 'except_severity.pasm'
    $I0 = $P0[SEVERITY_SLOT]
    if $I0 != .EXCEPT_EXIT goto rethrow_error

  done:
    end

  rethrow_error:
    rethrow $P0
.end

.include 'languages/pheme/lib/PhemeObjects.pir'
.include 'languages/pheme/lib/PhemeSymbols.pir'
.include 'languages/pheme/lib/pheme_grammar_gen.pir'
.include 'languages/pheme/lib/ASTGrammar.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
