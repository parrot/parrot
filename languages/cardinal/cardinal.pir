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


.HLL 'cardinal'
.namespace []

.include 'src/gen_builtins.pir'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'
    .local pmc parrotns, cardinalns, exports
    parrotns = get_root_namespace ['parrot']
    cardinalns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE P6metaclass'
    parrotns.'export_to'(cardinalns, exports)
.end

.include 'src/gen_grammar.pir'
.include 'src/parser/quote_expression.pir'
.include 'src/gen_actions.pir'
.namespace [ 'cardinal';'Compiler' ]

#no caridinal_group found on my machine
#.loadlib 'cardinal_group'

.sub 'onload' :anon :load :init
    .local pmc cardinalmeta
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta.'new_class'('cardinal::Compiler', 'parent'=>'PCT::HLLCompiler')

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('cardinal')
    $P0 = get_hll_namespace ['cardinal';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['cardinal';'Grammar';'Actions']
    $P1.'parseactions'($P0)

    $P1.'commandline_banner'("Cardinal - Ruby for the Parrot VM\n\n")
    $P1.'commandline_prompt'('crb(main):001:0>')

     ##  create a list of END blocks to be run
    $P0 = new 'CardinalArray'
    set_hll_global ['cardinal'], '@?END_BLOCKS', $P0

    $P0 = new 'CardinalArray'
    set_hll_global ['cardinal';'Grammar';'Actions'], '@?BLOCK', $P0

    $P1 = get_hll_global ['PAST';'Compiler'], '%valflags'
    $P1['CardinalString'] = 'e'
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the cardinal compiler.

=cut

.sub 'main' :main
    .param pmc args_str

    ##  create ARGS global.
    .local pmc args, iter
    args = new 'CardinalArray'
    iter = new 'Iterator', args_str
    $P0 = shift iter
  args_loop:
    unless iter goto args_end
    $P0 = shift iter
    push args, $P0
    goto args_loop
  args_end:
    set_hll_global 'ARGS', args

    $P0 = compreg 'cardinal'
    $P1 = $P0.'command_line'(args_str)

    .include 'iterator.pasm'
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

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

