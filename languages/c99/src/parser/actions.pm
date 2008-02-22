# $Id$
# Copyright (C) 2008, The Perl Foundation.

=begin comments

C99::Grammar::Actions - ast transformations for C99

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
    for $<external_declaration> {
        my $fun := $( $_ );

        ## Look for the "main" function, and set that as the result
        ## object.
        if $fun.name() eq 'main' {
             make $fun;
        }
    }
}

method external_declaration($/, $key) {
    make $( $/{$key} );
}

method function_definition($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my $decl := $( $<declarator> );
    $past.name( $decl.name() );

    my $body := $( $<compound_statement> );
    $past.push($body);
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
    #my $past := PAST::Stmts.new( :node($/) );
    for $<block_item> {
        $past.push( $($_) );
    }
    make $past;
}

method if_statement($/) {
    my $cond := $( $<expression> );
    my $then := $( $<statement> );
    my $past := PAST::Op.new( $cond, $then, :pasttype('if'), :node($/) );
    if $<else> {
        $past.push( $( $<else>[0] ) );
    }
    make $past;
}

method do_while_statement($/) {
    my $cond := $( $<expression> );
    my $body := $( $<statement> );
    make PAST::Op.new( $cond, $body, :pasttype('repeat_while'), :node($/) );
}

method while_statement($/) {
    my $cond := $( $<expression> );
    my $body := $( $<statement> );
    make PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );
}

method block_item($/, $key) {
    make $( $/{$key} );
}

method constant($/, $key) {
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
    for $<assignment_expression> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method postfix_expression($/) {
    my $past := $( $<postfix_expression_prefix> );
    for $<postfix_expression_suffix> {
        ## XXX
        my $args := $( $_ );
        $args.unshift($past);
        $past := $args;
    }
    make $past;
}

method primary_expression($/, $key) {
    make $( $/{$key} );
}

method unary_expression($/, $key) {
    make $( $/{$key} );
}

method integer_constant($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method floating_constant($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}


method c_string_literal($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
    #make PAST::Val.new( :value( ~$/ ), :node($/) );
}

method identifier($/) {
    ## XXX fix scopes
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

