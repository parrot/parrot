# $Id$
# Copyright (C) 2008, The Perl Foundation.

=head1 TITLE

ncigen.pir - A NCI stub compiler.

=head2 Description

This is the base file for the NCI stub compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'NCIGEN'.

=head2 Functions

=over 4

=item onload()

Creates the C compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'NCIGEN';'Compiler' ]

.loadlib 'ncigen_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('NCIGEN::Compiler', 'parent'=>'PCT::HLLCompiler')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the C compiler.

=cut

.sub 'init' :vtable :method
    self.'language'('NCIGEN')
    self.'parsegrammar'('C99::Grammar')
    self.'parseactions'('NCIGEN::Grammar::Actions')
    $P0 = split ' ', 'parse nci_ast gen_nci_pir'
    setattribute self, '@stages', $P0
    $P0 = split ' ', 'e=s help|h target=s trace|t=s encoding=s output|o=s combine version|v libname|l=s nsname|n=s raw|r'
    setattribute self, '@cmdoptions', $P0

    ##  set the $usage attribute
    $P0 = new 'String'
    $P0 = <<'USAGE'
Usage: ncigen [switches] [--] [preprocessedfile] [arguments]
  -l, --libname        library to load symbols from
  -n  --nsname         pir namepsace to place symbols into
  -r  --raw            dump dlfunc pir statements only

Standard HLLCompiler Options:
  -e program           one line of program
  -h, --help           display this help text
  --target=[stage]     specify compilation stage to emit
  -t, --trace=[flags]  enable trace flags
  --encoding=[mode]    specify string encoding mode
  -o, --output=[name]  specify name of output file
  -v, --version        display version information
USAGE
    setattribute self, '$usage', $P0
.end

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'NCIGEN'
    $P2 = $P0.'command_line'(args)
.end

.namespace [ 'PCT';'HLLCompiler' ]

.sub 'nci_ast' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

  compile_match:
    push_eh err_past
    .local pmc ast
    ast = source.'item'()
    pop_eh
    $I0 = isa ast, ['NCIGENAST';'Decls']
    unless $I0 goto err_past
    .return (ast)

  err_past:
    $S0 = typeof source
    .tailcall self.'panic'('Unable to obtain NCIGENAST from ', $S0)
.end

.sub 'gen_nci_pir' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'NCIPIR'
    $P1 = $P0.'to_pir'(source, adverbs :flat :named)
    say $P1
    .return ($P1)
.end


.include 'src/NCIGENAST.pir'
.include 'src/NCIPIR.pir'
.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'


.namespace [ 'C99';'Grammar' ]

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

