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
    make $( $/ );
    # for $<pod_section> {
    #     $( $_  );
    # }
}

method skipped($/) {

}

method pod_section($/) {
    for $<pod_sequence> {
        ## XXX store it where? A block?
        $( $_ );
    }
}

method pod_sequence($/, $key) {
    make $( $/{$key} );
}

method pod_directive($/) {

}

method cut_directive($/) {

}

## XXX refactor the block_title stuff for heading and begin_directive.

method heading($/) {
    my $heading := Pod::DocTree::Heading.new();
    ## set the level of the heading
    $heading.level($<digit>);

    if $<block_title> {
        my $title := $( $<block_title>[0] );
        $heading.title( $title.name() );
    }
    make $heading;
}


method begin_directive($/) {
    my $block := Pod::DocTree::Block.new();
    my $name  := $( $<block_name> );
    $block.name( $name.name() );

    if $<block_title> {
        my $title := $( $<block_title>[0] );
        $heading.title( $title.name() );
    }
    make $block;
}

method end_directive($/) {

}
method for_directive($/) {
    # use same code as in begin-directive.
}

method over_directive($/) {

}

method back_directive($/) {

}

method item_directive($/) {
    my $item := Pod::DocTree::Item.new();

    make $item;
}

method encoding_directive($/) {

}

method paragraph($/) {

}

method literal_paragraph($/) {

}

method block_name($/) {
    ## XXX fix: only match the non-whitespace text
    make Pod::DocTree::Text.new( :name( $/ ) );
}

method block_title($/) {
    make Pod::DocTree::Text.new( :name( $<formatted_text> ) );
}

method format_code($/) {

}

## XXX not sure if this needs action method is needed.
method pod_ws($/) {

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

