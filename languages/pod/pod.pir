=head1 TITLE

pod.pir - A Pod compiler.

=head2 Description

This is the base file for the Pod compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Pod'.

=head2 Functions

=over 4

=item onload()

Creates the Pod compiler using a C<PCT::HLLCompiler>
object.

=cut



.HLL 'pod'

.loadlib 'pod_group'

.include 'src/Pod/DocTree/Node.pir'

.namespace [ 'Pod';'DocTree';'Compiler' ]

.sub 'to_html' :method
    .param pmc node
    .param pmc adverbs :slurpy :named
.end

.sub 'as_html' :method :multi(_,['Pod';'DocTree';'File'])
    .param pmc node
    .local string html
    html = "<html>"


    html .= "</html>"

    .return (html)
.end


.sub 'as_html' :method :multi(_,['Pod';'DocTree';'Heading'])
    .param pmc node
    .local string html
    .local string level
    # create opening heading tag, e.g. <h1>
    html = "<h"
    $I0  = node."level"()
    level = $I0
    html .= level
    html .= ">"

    # create closin heading tag, e.g. </h1>
    html .= "</h"
    html .= level
    html .= ">"

.end



.namespace [ 'Pod';'Compiler' ]

.sub 'doctree' :method
    .param pmc node
    .param pmc adverbs :slurpy :named
.end

.sub 'html' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = new ['Pod';'HTML';'Compiler']
    .tailcall $P0.'to_html'(source, adverbs :flat :named)
.end



.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'
    .local pmc parrotns, hllns, exports
    parrotns = get_root_namespace ['parrot']
    hllns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(hllns, exports)
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'
    $P0 = get_class ['PCT';'HLLCompiler']
    $P2 = subclass $P0, ['Pod';'Compiler']
    $P1 = $P2.'new'()
    $P1.'language'('pod')
    $P0 = get_hll_namespace ['Pod';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['Pod';'Grammar';'Actions']
    $P1.'parseactions'($P0)


    ##  set the compilation stages in the @stages attribute
    $P0 = split ' ', 'parse doctree html'
    setattribute $P1, '@stages', $P0
.end



=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Pod compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'pod'
    $P1 = $P0.'command_line'(args)
.end



=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

