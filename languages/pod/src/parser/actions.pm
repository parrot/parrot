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
    make $head;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
