# $Id$
# Copyright (C) 2008, The Perl Foundation.

=begin comments

HQ9plus::Grammar::Actions - ast transformations for HQ9plus

This file contains the methods that are used by the parse grammar
to build the PAST representation of an HQ9plus program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class HQ9plus::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method statement($/,$key) {
    my $past := PAST::Op.new( :name($key), :pasttype('call'), :node( $/ ) );
    make $past;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

