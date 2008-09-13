# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

markdown.pir - A Markdown compiler.

=head2 Description

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

.namespace [ 'Markdown::Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('Markdown::Compiler', 'parent'=>'PCT::HLLCompiler')
    $P1 = $P0.'new'()
    $P1.'language'('Markdown')
    $P1.'parsegrammar'('Markdown::Grammar')
    $P1.'parseactions'('Markdown::Grammar::Actions')
    $P1.'removestage'('post')
    $P1.'removestage'('pir')
    $P1.'removestage'('evalpmc')
    $P1.'addstage'('html')
.end

=item html(source [, adverbs :slurpy :named])

Transform PAST C<source> into a String containing HTML.

=cut

.sub 'html' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    new $P0, 'Markdown::HTML::Compiler'
    .return $P0.'to_html'(source, adverbs :flat :named)
.end


=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Markdown compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    $P0 = compreg 'Markdown'

    .local pmc opts
    opts = $P0.'process_args'(args)

    $P1 = $P0.'evalfiles'(args, opts :flat :named)
    print $P1
.end


.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'
.include 'src/Compiler.pir'
.include 'src/Node.pir'


=back

=head1 SEE ALSO

L<http://daringfireball.net/projects/markdown/>

L<http://en.wikipedia.org/wiki/Markdown>

L<http://en.wikipedia.org/wiki/Lightweight_markup_language>

=head1 AUTHORS

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

