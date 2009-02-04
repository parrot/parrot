# Copyright (C) 2009, The Perl Foundation.
# $Id$

=begin comments

Pod::Grammar::Actions - ast transformations for Pod

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Pod program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

=cut

class Pod::Grammar::Actions;

method TOP($/) {
    my $past := Pod::DocTree::File.new();
    for $<pod_section> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method pod_section($/) {
    my $pod := Pod::DocTree::Block.new();
    for $<pod_sequence> {
        $pod.push( $( $_ ) );
    }
    make $pod
}

method pod_sequence($/, $key) {
    make $( $/{$key} );
}


method heading($/) {
    my $head := Pod::DocTree::Heading.new();
    $head.level(~$<digit>);

    if $<block_title> {
        my $title := $( $<block_title>[0] );
        $head.title( $title );
    }
    make $head;
}

method begin_directive($/) {
    my $block := Pod::DocTree::Block.new();

    make $block;
}

method for_directive($/) {
    my $block := Pod::DocTree::Block.new();

    make $block;
}

method over_directive($/) {
    my $list := Pod::DocTree::List.new();
    make $list;
}

method back_directive($/) {
    ## XXX thsi should probably be the List object
    ## that's created in =over..
    make Pod::DocTree::List.new();
}

method item_directive($/) {
    make Pod::DocTree::Item.new();
}

method block_title($/) {
    make Pod::DocTree::Text.new( :name("text") );
}

method paragraph($/) {
    my $par := Pod::DocTree::Paragraph.new();
    for $<formatted_text> {
        $par.push( $( $_ ) );
    }
    make $par;
}

method formatted_text($/) {
    make Pod::DocTree::Text.new( :name(~$/) );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
