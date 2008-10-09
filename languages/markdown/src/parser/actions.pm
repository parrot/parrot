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
    for $<Inlines><_Inline> {
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

method _Inline($/, $key) {
    make $( $/{$key} );
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

method BulletList($/, $key) {
    make $( $/{$key} );
}

method BulletListTight($/) {
    my $mast := Markdown::ItemizedList.new();
    for $<BulletListItem> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method BulletListLoose($/) {
    my $mast := Markdown::ItemizedList.new();
    for $<BulletListItem> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method BulletListItem($/) {
    make $( $<ListItem> );
}

method ListItem($/) {
    my $mast := Markdown::ListItem.new();
    $mast.push( $( $<ListBlock> ) );
    for $<ListContinuationBlock> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method ListBlock($/) {
    make $( $<Line> );
}

method OrderedList($/, $key) {
    make $( $/{$key} );
}

method OrderedListTight($/) {
    my $mast := Markdown::OrderedList.new();
    for $<OrderedListItem> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method OrderedListLoose($/) {
    my $mast := Markdown::OrderedList.new();
    for $<OrderedListItem> {
        $mast.push( $( $_ ) );
    }
    make $mast;
}

method OrderedListItem($/) {
    make $( $<ListItem> );
}

method Emph($/, $key) {
    make $( $/{$key} );
}

method EmphStar($/) {
    my $mast := Markdown::Emphasis.new();
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    $mast.push( $( $<OneStarClose><Inline> ) );
    make $mast;
}

method EmphUI($/) {
    my $mast := Markdown::Emphasis.new();
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    $mast.push( $( $<OneUIClose><Inline> ) );
    make $mast;
}

method Strong($/, $key) {
    make $( $/{$key} );
}

method StrongStar($/) {
    my $mast := Markdown::Strong.new();
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    $mast.push( $( $<TwoStarClose><Inline> ) );
    make $mast;
}

method StrongUI($/) {
    my $mast := Markdown::Strong.new();
    for $<Inline> {
        $mast.push( $( $_ ) );
    }
    $mast.push( $( $<TwoUIClose><Inline> ) );
    make $mast;
}

method Code($/) {
    make Markdown::Code.new( :text( $/[0].text() ) );
}

method EscapedChar($/) {
    make Markdown::Word.new( :text( $/[0].text() ) );
}

method Entity($/) {
    make Markdown::Entity.new( :text( $/.text() ) );
}

method Symbol($/) {
    make Markdown::Word.new( :text( $/.text() ) );
}

method Endline($/) {
    make Markdown::Word.new( :text( $/.text() ) );
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
