# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 TITLE

squaak.pir - A Squaak compiler.

=head2 Description

This is the base file for the Squaak compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Squaak'.

=head2 Functions

=over 4

=item onload()

Creates the Squaak compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'Squaak';'Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('Squaak')
    $P1.'parsegrammar'('Squaak::Grammar')
    $P1.'parseactions'('Squaak::Grammar::Actions')

    $P1.'commandline_banner'("Squaak for Parrot VM\n")
    $P1.'commandline_prompt'('> ')

.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Squaak compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'Squaak'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/builtins/say.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'


.namespace []

.sub 'initlist' :anon :load :init
    $P0 = new 'ResizablePMCArray'
    set_hll_global ['Squaak';'Grammar';'Actions'], '@?BLOCK', $P0
.end

.namespace []

.sub '!array'
    .param pmc fields :slurpy
    .return (fields)
.end

.sub '!hash'
    .param pmc fields :slurpy :named
    .return (fields)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

