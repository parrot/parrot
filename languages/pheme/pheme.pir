# $Id$

=head1 TITLE

pheme.pir - A Pheme compiler.

=head2 Description

This is the base file for the Pheme compiler.

This file includes the parsing and grammar rules from
the lib/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Pheme'.

=head2 Functions

=over 4

=item __onload()

Loads the PGE libraries needed for running the parser,
and registers the Pheme compiler using a C<HLLCompiler>
object.

=cut

.namespace [ 'Pheme';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'PGE/Text.pbc'

    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'

    $P0 = p6meta.'new_class'('Match','parent'=>'PGE::Match')
    $P0 = p6meta.'new_class'('Grammar','parent'=>'Match')
    $P0 = p6meta.'new_class'('Pheme::PGE::Grammar','parent'=>'Grammar')

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()

    $P1.'language'('Pheme')
    $P1.'parsegrammar'( 'Pheme::Grammar' )
    $P1.'astgrammar'(   'Pheme::AST::Grammar' )
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args> to the Pheme compiler.

=cut

.sub 'main' :anon :main
    .param pmc args

    $P0 = compreg 'Pheme'

    .include 'except_severity.pasm'
    .local pmc eh
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPT_EXIT)
    set_addr eh, exit_handler
    push_eh eh
      $P1 = $P0.'command_line'(args)
    pop_eh
    goto done

  exit_handler:
    .get_results($P0)

  done:
    end
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
# vim: expandtab shiftwidth=4 ft=pir:
