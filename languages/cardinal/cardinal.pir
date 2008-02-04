=head1 TITLE

cardinal.pir - A cardinal compiler.

=head2 Description

This is the base file for the cardinal compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'cardinal'.

=head2 Functions

=over 4

=item onload()

Creates the cardinal compiler using a C<PCT::HLLCompiler>
object.

=cut


.namespace

.sub 'onload' :anon :load :init
    $P0 = subclass 'ResizablePMCArray', 'List'
.end

.namespace [ 'List' ]




.namespace [ 'cardinal::Compiler' ]

.loadlib 'cardinal_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('cardinal')
    $P1.'parsegrammar'('cardinal::Grammar')
    $P1.'parseactions'('cardinal::Grammar::Actions')

     ##  create a list of END blocks to be run
    $P0 = new 'List'
    set_hll_global ['cardinal'], '@?END_BLOCKS', $P0
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the cardinal compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'cardinal'
    $P1 = $P0.'command_line'(args)

    .include 'iterator.pasm'
    .local pmc iter
    $P0 = get_hll_global ['cardinal'], '@?END_BLOCKS'
    iter = new 'Iterator', $P0
    iter = .ITERATE_FROM_END
  iter_loop:
    unless iter goto iter_end
    $P0 = pop iter
    $P0()
    goto iter_loop
  iter_end:
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
# vim: expandtab shiftwidth=4:

