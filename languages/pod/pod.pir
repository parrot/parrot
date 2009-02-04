# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 TITLE

pod.pir - A Pod compiler.

=head1 SYNOPSIS

as a command line (without interactive mode) :

    $ parrot markdown.pbc document.text
    $ parrot markdown.pbc --target=parse document.text
                                   PAST
                                   HTML

or as a library :

     load_bytecode 'markdown.pbc'
     $P0 = compreg 'markdown'
     $S0 = <<'MARKDOWN'
 Title
 =====
 Some text.
 MARKDOWN
     $P1 = $P0.'compile'($S0)
     $S0 = $P1()
     print $S0

=head1 DESCRIPTION

This is the base file for the Pod compiler.

=head2 Functions

=over 4

=item onload()

Creates the Pod compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'Pod';'Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('Pod::Compiler', 'parent'=>'PCT::HLLCompiler')
    $P1 = $P0.'new'()
    $P1.'language'('pod')
    $P1.'parsegrammar'('Pod::Grammar')
    $P1.'parseactions'('Pod::Grammar::Actions')
    $P1.'removestage'('post')
    $P1.'addstage'('html', 'before' => 'pir')
.end

=item html(source [, adverbs :slurpy :named])

Transform Pod AST C<source> into a String containing HTML.

=cut

.sub 'html' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = new ['Pod';'HTML';'Compiler']
    .tailcall $P0.'to_html'(source, adverbs :flat :named)
.end


.sub 'pir' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    new $P0, 'CodeString'
    $P0 = <<'PIRCODE'
.sub 'main' :anon
    $S0 = <<'PIR'
PIRCODE
    $P0 .= source
    $P0 .= <<'PIRCODE'
PIR
    .return ($S0)
.end
PIRCODE
    .return ($P0)
.end


=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Pod compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    $P0 = compreg 'pod'

    .local pmc opts
    opts = $P0.'process_args'(args)

    $P1 = $P0.'evalfiles'(args, opts :flat :named)
    print $P1
.end


.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'
#.include 'src/gen_builtins.pir'
.include 'src/Pod/DocTree/node.pir'


=back


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

