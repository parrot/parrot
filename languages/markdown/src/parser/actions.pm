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
    my $past := Markdown::Document.new( :node( $/ ) );
    for $<Block> {
        $past.push( $( $_ ) );
    }
    make $past;
}


method Block($/, $key) {
    make $( $/{$key} );
}

method AtxHeading($/) {
#    my $level := length ~$<AtxStart>;
    my $level := ~$<AtxStart>;
    make Markdown::Header.new( :level( $level ), :text( ~$<AtxInline> ) );
}

method Para($/) {
    make Markdown::Para.new( :text( ~$<Inline> ) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
