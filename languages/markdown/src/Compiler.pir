# Copyright (C) 2008, The Perl Foundation.
# $Id $

=head1 NAME

Markdown::HTML::Compiler - MAST Compiler

=head1 DESCRIPTION

Markdown::HTML::Compiler implements a compiler for MAST nodes.

=cut

.namespace [ 'Markdown::HTML::Compiler' ]

.sub '__onload' :anon :load :init
    $P0 = newclass 'Markdown::HTML::Compiler'
.end

.sub 'to_html' :method
    .param pmc past
    .param pmc adverbs         :slurpy :named

    .return self.'html'(past)
.end

=item html_children(node)

Return generated HTML for all of its children.

=cut

.sub 'html_children' :method
    .param pmc node
    .local pmc code, iter
    code = new 'CodeString'
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpast
    cpast = shift iter
    $P0 = self.'html'(cpast)
    code .= $P0
    goto iter_loop
  iter_end:
    .return (code)
.end


=item html(Any node)

=cut

.sub 'html' :method :multi(_,_)
    .param pmc node
    .return self.'html_children'(node)
.end


=item html(Markdown::Document node)

=cut

.sub 'html' :method :multi(_,['Markdown::Document'])
    .param pmc node
    .return self.'html_children'(node)
.end


=item html(Markdown::Header node)

=cut

.sub 'html' :method :multi(_,['Markdown::Header'])
    .param pmc node
    $S1 = node.'text'()
    $S2 = node.'level'()
    $I2 = length $S2
    $S2 = $I2
    .local pmc code
    new code, 'CodeString'
    $S0 = "<h"
    $S0 .= $S2
    $S0 .= ">"
    $S0 .= $S1
    $S0 .= "</h"
    $S0 .= $S2
    $S0 .= ">\n\n"
    set code, $S0
    .return (code)
.end


=item html(Markdown::Para node)

=cut

.sub 'html' :method :multi(_,['Markdown::Para'])
    .param pmc node
    $S1 = node.'text'()
    .local pmc code
    new code, 'CodeString'
    $S0 = "<p>"
    $S0 .= $S1
    $S0 .= "</p>\n\n"
    set code, $S0
    .return (code)
.end


=back

=head1 AUTHORS

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

