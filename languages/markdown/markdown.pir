# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

markdown.pir - A Markdown compiler.

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

This is the base file for the Markdown compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Markdown'.

=head2 Functions

=over 4

=item onload()

Creates the Markdown compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'Markdown';'Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('Markdown::Compiler', 'parent'=>'PCT::HLLCompiler')
    $P1 = $P0.'new'()
    $P1.'language'('markdown')
    $P1.'parsegrammar'('Markdown::Grammar')
    $P1.'parseactions'('Markdown::Grammar::Actions')
    $P1.'removestage'('post')
    $P1.'addstage'('html', 'before' => 'pir')
.end

=item html(source [, adverbs :slurpy :named])

Transform MAST C<source> into a String containing HTML.

=cut

.sub 'html' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = new ['Markdown';'HTML';'Compiler']
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
to the Markdown compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    $P0 = compreg 'markdown'

    .local pmc opts
    opts = $P0.'process_args'(args)

    $P1 = $P0.'evalfiles'(args, opts :flat :named)
    print $P1
.end


.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'
.include 'src/gen_builtins.pir'
.include 'src/Compiler.pir'
.include 'src/Node.pir'


=back

=head1 SEE ALSO

L<http://daringfireball.net/projects/markdown/>

L<http://en.wikipedia.org/wiki/Markdown>

L<http://en.wikipedia.org/wiki/Lightweight_markup_language>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

