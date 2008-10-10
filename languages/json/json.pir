# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

json.pir - A json compiler.

=head2 Description

This is the base file for the json compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'json'.

=head2 Functions

=over 4

=item onload()

Creates the json compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'json';'Compiler' ]

.loadlib 'json_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('json')
    $P1.'parsegrammar'('json::Grammar')
    $P1.'parseactions'('json::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the json compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_bytecode 'dumper.pbc'

    $P0 = compreg 'json'
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
