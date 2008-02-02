# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

cardinal::Grammar::Actions - ast transformations for cardinal

This file contains the methods that are used by the parse grammar
to build the PAST representation of an cardinal program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class cardinal::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    $past.push( $( $<compound_stmt> ) );
    make $past;
}

method compound_stmt($/) {
    make $( $<stmt> );
}

method stmt($/, $key) {
    make $( $/{$key} );
}

method expr($/) {
    my $lhs := $( $<mlhs> );
    my $rhs := $( $<mrhs> );
    make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :node($/) );
}

method mlhs($/) {
    make $( $<mlhs_item> );
}

method mlhs_item($/, $key) {
    make $( $/{$key} );
}

method lhs($/) {
    make $( $<variable> );
}

method variable($/) {
    make $( $<varname> );
}

method varname($/) {
    make PAST::Var.new( :name(~$<ident>), :scope('package'), :node($/) );
}

method mrhs($/) {
    make $( $<args> );
}

method args($/) {
    make $( $<arg>[0] );
}

method arg($/) {
    make $( $<primary> );
}

method primary($/, $key) {
    make $( $/{$key} );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method numeric($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method string($/) {
    make PAST::Val.new( :value( $($<string_literal>) ), :node($/) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

