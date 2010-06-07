# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

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

.HLL 'abc'

.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'P6Regex.pbc'
    load_bytecode 'nqp-rx.pbc'
    .local pmc parrotns, hllns, exports
    parrotns = get_root_namespace ['parrot']
    hllns = get_hll_namespace
    exports = split ' ', 'PAST PCT HLL NQP'
    parrotns.'export_to'(hllns, exports)
    .local pmc regexns
    regexns = hllns.'make_namespace'('Regex')
    $P0 = get_root_namespace ['parrot';'Regex';'Cursor']
    regexns.'add_namespace'('Cursor', $P0)
    $P0 = get_root_global ['parrot';'Regex'], 'Cursor'
    regexns['Cursor'] = $P0
    $P0 = get_root_namespace ['parrot';'Regex';'Match']
    regexns.'add_namespace'('Match', $P0)
    $P0 = get_root_global ['parrot';'Regex'], 'Match'
    regexns['Match'] = $P0
    $P0 = get_root_namespace ['parrot';'Regex';'P6Regex']
    regexns.'add_namespace'('P6Regex', $P0)
    $P0 = get_root_global ['parrot';'Regex'], 'P6Regex'
    regexns['P6Regex'] = $P0
.end

.include 'src/gen_actions.pir'
.include 'src/gen_grammar.pir'

.namespace [ 'abc'; 'Compiler' ]

.sub '' :anon :load :init
    .local pmc abc
    $P0 = get_root_global ['parrot'], 'P6metaclass'
    abc = $P0.'new_class'('abc::Compiler', 'parent'=>'HLL::Compiler')
    abc.'language'('abc')
    $P0 = get_hll_global ['abc'], 'Grammar'
    abc.'parsegrammar'($P0)
    $P0 = get_hll_global ['abc';'Grammar'], 'Actions'
    abc.'parseactions'($P0)
.end

.namespace []
.include 'src/builtins/all.pir'

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the abc compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'abc'
    $P1 = $P0.'command_line'(args)
.end


=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

