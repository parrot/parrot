# $Id$
# Copyright (C) 2008, The Perl Foundation.

=begin comments

C::Grammar::Actions - ast transformations for C

This file contains the methods that are used by the parse grammar
to build the PAST representation of an C program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class C99::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    for $<external_declaration> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method external_declaration($/, $key) {
    make $( $/{$key} );
}

method function_definition($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my $decl := $( $<declarator> );
    $past.name( $decl.name() );
    make $past;
}

method declaration($/) {

}

method declarator($/) {
    make $( $<direct_declarator> );
}

method direct_declarator($/) {
    make $( $<declarator_prefix> );
}

method declarator_prefix($/, $key) {
    make $( $/{$key} );
}

method statement($/, $key) {
    make $( $/{$key} );
}

method expression($/) {
    make $( $<assignment_expression>[0] );
}

method expression_statement($/) {
    if $<expression> {
        make $( $<expression>[0] );
    }
    else {
        make PAST::Op.new( :inline('    # empty statement'), :node($/) );
    }
}

method compound_statement($/) {
    my $past := PAST::Block.new( :blocktype('immediate'), :node($/) );
    for $<block_item> {
        $past.push( $($_) );
    }
    make $past;
}

method block_item($/, $key) {
    make $( $/{$key} );
}

method constant_expression($/) {
    make $( $<conditional_expression> );
}

method assignment_expression($/) {
    make $( $<conditional_expression> );
}

method conditional_expression($/) {
    make $( $<logical_expression> );
}

method postfix_expression_prefix($/, $key) {
    make $( $/{$key} );
}

method postfix_expression_suffix($/, $key) {
    make $( $/{$key} );
}

method arguments($/) {
    if $<argument_expression_list> {
        make $( $<argument_expression_list>[0] );
    }
    else {
        make PAST::Op.new( :pasttype('call'), :node($/) );
    }
}

method argument_expression_list($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );

    make $past;
}

method postfix_expression($/) {
    my $past := $( $<postfix_expression_prefix> );
    for $<postfix_expression_suffix> {
        ## XXX
        my $args := $( $_ );
        $past := PAST::Op.new( $past, $args, :pasttype('call'), :node($/)  );
    }
    make $past;
}

method primary_expression($/, $key) {
    make $( $/{$key} );
}

method unary_expression($/, $key) {
    make $( $/{$key} );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method c_string_literal($/) {
    make PAST::Val.new( :value( ~$/ ), :node($/) );
}

method identifier($/) {
    make PAST::Var.new( :name( ~$/ ), :scope('package'), :node($/) );
}

method cast_expression($/) {
    make $( $<unary_expression> );
}

method logical_expression($/, $key) {
    if ($key eq 'end') {
        make $($<expr>);
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $($_) );
        }
        make $past;
    }

}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

