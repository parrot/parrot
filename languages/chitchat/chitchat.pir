=head1 TITLE

chitchat.pir - A ChitChat compiler.

=head2 Description

This is the base file for the ChitChat compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'ChitChat'.

=head2 Functions

=over 4

=item onload()

Creates the ChitChat compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'Transcript' ]

.sub 'show:' :method
    .param pmc arg
    say arg
.end

.namespace []

.sub 'onload' :anon :load :init
    $P0 = newclass 'Transcript'
    $P0 = new 'Transcript'
    set_hll_global 'Transcript', $P0
.end

.namespace [ 'ChitChat::Compiler' ]

.loadlib 'chitchat_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('ChitChat')
    $P1.'parsegrammar'('ChitChat::Grammar')
    $P1.'parseactions'('ChitChat::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the ChitChat compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'ChitChat'
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

