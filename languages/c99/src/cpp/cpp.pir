# $Id$
# Copyright (C) 2008, Parrot Foundation.

=head1 TITLE

cpp.pir - A C pre processor.

=head2 Description

This is the base file for the C99 C pre processor.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'C99::CPP'.

=head2 Functions

=over 4

=item onload()

Creates the C compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'C99';'CPP';'Compiler' ]

.loadlib 'c99_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('C99::CPP')
    $P1.'parsegrammar'('C99::CPP::Grammar')
    $P1.'parseactions'('C99::CPP::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the C compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'C99::CPP'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'


.namespace [ 'C99';'CPP';'Grammar' ]

.sub 'debug'
    .param pmc match
    .param pmc arg
    .param pmc attrs :slurpy
    printerr arg
    printerr "\n"
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

