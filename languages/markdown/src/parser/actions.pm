# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

Markdown::Grammar::Actions - ast transformations for Markdown

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Markdown program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

=cut

class Markdown::Grammar::Actions;

method TOP($/) {
    my $mast := Markdown::Document.new();
    for $<Block> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method Block($/, $key) {
    make $( $/{$key} );
}

method Para($/) {
    my $mast := Markdown::Para.new();
    for $<Inlines><Inline> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method Heading($/, $key) {
    make $( $/{$key} );
}

method AtxHeading($/) {
    my $mast := Markdown::Title.new( :level( ~$<AtxStart>.length() ) );
    for $<AtxInline> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method AtxInline($/) {
    make $( $<Inline> );
}

method Inline($/, $key) {
    make $( $/{$key} );
}

method SetextHeading($/, $key) {
    make $( $/{$key} );
}

method SetextHeading1($/) {
    my $mast := Markdown::Title.new( :level( 1 ) );
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method SetextHeading2($/) {
    my $mast := Markdown::Title.new( :level( 2 ) );
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method BlockQuote($/) {
    make $( $<BlockQuoteRaw> );
}

method BlockQuoteRaw($/) {
    my $mast := Markdown::BlockQuote.new();
    for $<Line> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method Line($/) {
    make $( $<RawLine> );
}

method RawLine($/) {
    make Markdown::Line.new( :text( $/[0] ) );
}

method HorizontalRule($/) {
    make Markdown::HorizontalRule.new();
}

method Str($/) {
    make Markdown::Word.new( :text( $/.text() ) );
}

method Space($/) {
    make Markdown::Space.new( :text( $/.text() ) );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
