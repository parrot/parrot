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

class Pod::Grammar::Actions;



method TOP($/) {
    my $file := Pod::DocTree::File.new();

    for $<pod_section> {
        $file.push( $( $_ ) );
    }
    make $file;
}


method pod_section($/) {
    #for $<pod_sequence> {
    #    ## XXX store it where? A block?
    #    $( $_ );
    #}
    #make $( $<pod_sequence>[0] );
    make Pod::DocTree::Text.new( :name("pod-section"));
}

method pod_sequence($/, $key) {
    make $( $/{$key} );
}

method pod_directive($/) {
    make Pod::DocTree::Text.new( :name("pod-directive") );
}

method cut_directive($/) {
    make Pod::DocTree::Text.new( :name("cut-directive") );
}



sub title($/, $block) {
    if $<block_title> {
        my $title := $( $<block_title>[0] );
        $block.title( $title.name() );
    }
}

method heading($/) {
    say("heading");
    my $heading := Pod::DocTree::Heading.new();
    ## set the level of the heading
    $heading.level($<digit>);

    title($/, $heading);

    make $heading;
}


method begin_directive($/) {
    my $block := Pod::DocTree::Block.new();
    my $name  := $( $<block_name> );
    $block.name( $name.name() );

    title($/, $block);

    make $block;
}


method end_directive($/) {
    make Pod::DocTree::Text.new( :name("end-directive") );
}

method for_directive($/) {
    # use same code as in begin-directive.
    make Pod::DocTree::Text.new( :name("for-directive") );
}

method over_directive($/) {
    make Pod::DocTree::Text.new( :name("over-directive") );
}

method back_directive($/) {
    make Pod::DocTree::Text.new( :name("back-directive") );
}

method item_directive($/) {
    my $item := Pod::DocTree::Item.new();

    make $item;
}

method encoding_directive($/) {
    make Pod::DocTree::Text.new( :name("encoding-directive") );
}

method paragraph($/) {
    make Pod::DocTree::Text.new( :name("paragraph") );
}

method literal_paragraph($/) {
    make Pod::DocTree::Text.new( :name("literal-paragraph") );
}

method block_name($/) {
    ## XXX fix: only match the non-whitespace text
    make Pod::DocTree::Text.new( :name( $/ ) );
}

method block_title($/) {
    make Pod::DocTree::Text.new( :name( $<formatted_text> ) );
}

method format_code($/) {
    make Pod::DocTree::Text.new( :name("format-code") );
}



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

