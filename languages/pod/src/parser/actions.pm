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

    our @?BLOCK;
    @?BLOCK.unshift($head);

    make $head;
}

method begin_directive($/) {
    my $block := Pod::DocTree::Block.new();
    our @?BLOCK;
    @?BLOCK.unshift($block);
    make $block;
}

method for_directive($/) {
    my $block := Pod::DocTree::Block.new();

    make $block;
}

method over_directive($/) {
    my $list := Pod::DocTree::List.new();
    our @?LIST;
    @?LIST.unshift($list);
    make $list;
}

method back_directive($/) {
    our @?LIST;
    my $count := @?LIST;
    if $count > 0 {
        my $list := @?LIST.shift();
        make $list;
    }
    else {
        $/.panic("unexpected '=back': no list to close");
    }
}

method item_directive($/) {
    ## get a reference to the current list object
    our @?LIST;
    my $count := @?LIST;
    if $count > 0 {
        my $currentlist := @?LIST[0];
        ## store the new item in that list
        my $item := Pod::DocTree::Item.new();
        $currentlist.push($item);
        make $item;
    }
    else {
        $/.panic("unexpected '=item': no '=over' directive seen to start a list");
    }


}

method block_title($/) {
    make Pod::DocTree::Text.new( :name('text') );
}

method paragraph($/) {
    my $par := Pod::DocTree::Paragraph.new();
    for $<formatted_text> {
        $par.push( $( $_ ) );
    }
    make $par;
}

method encoding_directive($/) {
    ## probably a block, not sure. XXX check this.
    my $block := Pod::DocTree::Block.new();

    my $name := $( $<block_name> );
    make $block;
}

method block_name($/) {
    ## is this the right node type? or should be literal?
    ## XXX check spec.
    make Pod::DocTree::Text.new( :name(~$/) );
}

method format_code($/) {
    my $fcode := Pod::DocTree::FormatCode.new();
    $fcode.code($<code>);
    my $text  := $( $<formatted_text> );
    my $name;
    if $<code> eq 'B' {
        $name := 'bold';
    }
    elsif $<code> eq 'C' {
        $name := 'code';
    }
    elsif $<code> eq 'E' {
        $name := 'escape';
    }
    elsif $<code> eq 'F' {
        $name := 'filename';
    }
    elsif $<code> eq 'I' {
        $name := 'italic';
    }
    elsif $<code> eq 'L' {
        $name := 'link';
    }
    elsif $<code> eq 'S' {

    }
    elsif $<code> eq 'X' {

    }
    elsif $<code> eq 'Z' {

    }
    $fcode.name($name);
    $fcode.push($text);
    make $fcode;
}

method literal_paragraph($/) {
    my $paragraph := Pod::DocTree::Literal.new();
    for $<formatted_text> {
        $paragraph.push( $( $_ ) );
    }
    make $paragraph;
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
