# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

Markdown::HTML::Compiler - MAST Compiler

=head1 DESCRIPTION

Markdown::HTML::Compiler implements a compiler for MAST nodes.

=head1 METHODS

=over

=cut

.namespace [ 'Markdown';'HTML';'Compiler' ]

.sub '__onload' :anon :load :init
    $P0 = get_hll_global 'P6metaclass'
    $P0 = $P0.'new_class'('Markdown::HTML::Compiler')
.end

.sub 'to_html' :method
    .param pmc past
    .param pmc adverbs         :slurpy :named

    .tailcall self.'html'(past)
.end

.sub 'xml_escape' :anon
    .param string str
    $P0 = split '&', str
    str = join '&amp;', $P0
    $P0 = split '<', str
    str = join '&lt;', $P0
    $P0 = split '>', str
    str = join '&gt;', $P0
    .return (str)
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
    .tailcall self.'html_children'(node)
.end


=item html(Markdown::Document node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Document'])
    .param pmc node
    .tailcall self.'html_children'(node)
.end


=item html(Markdown::HorizontalRule node)

=cut

.sub 'html' :method :multi(_,['Markdown';'HorizontalRule'])
    .param pmc node
    .local pmc code
    new code, 'CodeString'
    set code, "<hr />\n\n"
    .return (code)
.end


=item html(Markdown::Title node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Title'])
    .param pmc node
    $S1 = self.'html_children'(node)
    $S2 = node.'level'()
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

.sub 'html' :method :multi(_,['Markdown';'Para'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<p>"
    $S0 .= $S1
    $S0 .= "</p>\n\n"
    set code, $S0
    .return (code)
.end

=item html(Markdown::BlockQuote node)

=cut

.sub 'html' :method :multi(_,['Markdown';'BlockQuote'])
    .param pmc node
    .local pmc code
    new code, 'CodeString'
    $S0 = "<blockquote>\n"
    set code, $S0
    .local pmc iter
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpast
    cpast = shift iter
    $P0 = self.'html'(cpast)
    code .= "  <p>"
    code .= $P0
    code .= "</p>\n"
    goto iter_loop
  iter_end:
    code .= "</blockquote>\n\n"
    .return (code)
.end

=item html(Markdown::ItemizedList node)

=cut

.sub 'html' :method :multi(_,['Markdown';'ItemizedList'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<ul>\n"
    $S0 .= $S1
    $S0 .= "</ul>\n\n"
    set code, $S0
    .return (code)
.end

=item html(Markdown::OrderedList node)

=cut

.sub 'html' :method :multi(_,['Markdown';'OrderedList'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<ol>\n"
    $S0 .= $S1
    $S0 .= "</ol>\n\n"
    set code, $S0
    .return (code)
.end

=item html(Markdown::ListItem node)

=cut

.sub 'html' :method :multi(_,['Markdown';'ListItem'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<li>"
    $S0 .= $S1
    $S0 .= "</li>\n"
    set code, $S0
    .return (code)
.end

=item html(Markdown::Emphasis node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Emphasis'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<em>"
    $S0 .= $S1
    $S0 .= "</em>"
    set code, $S0
    .return (code)
.end

=item html(Markdown::Strong node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Strong'])
    .param pmc node
    $S1 = self.'html_children'(node)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<strong>"
    $S0 .= $S1
    $S0 .= "</strong>"
    set code, $S0
    .return (code)
.end

=item html(Markdown::Code node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Code'])
    .param pmc node
    $S1 = node.'text'()
    $S1 = xml_escape($S1)
    .local pmc code
    new code, 'CodeString'
    $S0 = "<code>"
    $S0 .= $S1
    $S0 .= "</code>"
    set code, $S0
    .return (code)
.end

=item html(Markdown::Entity node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Entity'])
    .param pmc node
    $S1 = node.'text'()
    .local pmc code
    new code, 'CodeString'
    set code, $S1
    .return (code)
.end

=item html(Markdown::Line node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Line'])
    .param pmc node
    $S1 = node.'text'()
    $S1 = xml_escape($S1)
    .local pmc code
    new code, 'CodeString'
    set code, $S1
    .return (code)
.end

=item html(Markdown::Word node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Word'])
    .param pmc node
    $S1 = node.'text'()
    $S1 = xml_escape($S1)
    .local pmc code
    new code, 'CodeString'
    set code, $S1
    .return (code)
.end

=item html(Markdown::Space node)

=cut

.sub 'html' :method :multi(_,['Markdown';'Space'])
    .param pmc node
    .local pmc code
    new code, 'CodeString'
    set code, ' '
    .return (code)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

