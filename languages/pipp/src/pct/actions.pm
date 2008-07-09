# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

Pipp::Grammar::Actions - AST transformations for Pipp

This file contains the methods that are used by the parse grammar
to build the PAST representation of a Pipp program.
Each method below corresponds to a rule in F<src/pct/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class Pipp::Grammar::Actions;

method TOP($/) {
    my $past  := PAST::Stmts.new( :node($/) );
    for $<sea_or_code> {
        $past.push( $($_) );
    }

    make $past;
}

method sea_or_code($/,$key) {
    make $( $/{$key} );
}

# The sea, HTML, surrounding the island, code, is printed out
method SEA($/) {
    make PAST::Op.new(
             PAST::Val.new(
                 :value(~$/),
                 :returns('PhpString')
             ),
             :name('echo'),
             :node($/)
         );
}

method code_tp1($/) {
    make $( $<statements> );
}

method code_tp2($/) {
    make $( $<statements> );
}

method statements($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method statement($/,$key) {
    make $( $/{$key} );
}

method inline_sea_tp1($/) {
   make PAST::Op.new(
            PAST::Val.new(
                :value(~$<SEA_empty_allowed>),
                :returns('PhpString')
            ),
            :name('echo'),
            :node($/)
        );
}

method echo_statement($/) {
    my $past := $( $<arguments> );
    $past.name( 'echo' );

    make $past;
}

method expression_statement($/) {
    make $( $<expression> );
}

method function_call($/) {
    my $past := $( $<arguments> );
    $past.name( ~$<FUNCTION_NAME> );

    make $past;
}

method method_call($/) {
    my $past := PAST::Op.new(
                    :name( ~$<METHOD_NAME> ),
                    :pasttype( 'callmethod' ),
                    :name( ~$<METHOD_NAME> ),
                    $( $<VAR_NAME> )
                );

    make $past;
}

method constructor_call($/) {
    my $past := PAST::Op.new(
                    :name( 'new' ),
                    :pasttype( 'callmethod' ),
                    PAST::Var.new(
                        :name( ~$<CLASS_NAME> ),
                        :scope( 'package' ),
                    )
                );

    make $past;
}

method constant($/) {
    make PAST::Op.new(
             :name('constant'),
             PAST::Val.new(
                 :returns('PhpString'),
                 :value( ~$<CONSTANT_NAME> ),
             )
         );
}

method arguments($/) {
    my $past := PAST::Op.new(
                    :pasttype('call'),
                    :node($/)
                );
    for $<expression> {
        $past.push($($_));
    }

    make $past;
}

method if_statement($/) {
    my $past := PAST::Op.new(
                    $( $<expression> ),
                    $( $<statements> ),
                    :pasttype('if'),
                    :node($/)
                );
    for $<else_clause> {
        $past.push( $( $_ ) );
    }

    make $past;
}

method scalar_assign($/) {
    make PAST::Op.new(
             $( $<var> ),
             $( $<expression> ),
             :pasttype('bind'),
         );
}

method array_assign($/) {
    make PAST::Op.new(
             $( $<array_elem> ),
             $( $<expression> ),
             :pasttype('copy'),
         );
}

method array_elem($/) {
    my $past_var_name := $( $<VAR_NAME> );
    $past_var_name.scope('package');
    $past_var_name.viviself('PhpArray');

    make PAST::Var.new(
             $past_var_name,
             $( $<expression> ),
             :scope('keyed'),
             :viviself('Undef'),
             :lvalue(1)
        );
}

method var($/) {
    make $( $<VAR_NAME> );
}

method VAR_NAME($/) {
    make PAST::Var.new(
             :scope('package'),
             :name(~$/),
             :viviself('Undef'),
             :lvalue(1)
         );
}

method else_clause($/) {
    make $( $<statements> );
}

# Handle the operator precedence table.
method expression($/, $key) {
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


method term($/,$key) {
    make $( $/{$key} );
}

method string($/,$key) {
    make $( $/{$key} );
}

method TRUE($/) {
    make PAST::Val.new(
             :value( 1 ),
             :returns('PhpBoolean'),
             :node($/)
         );
}

method FALSE($/) {
    make PAST::Val.new(
             :value( 0 ),
             :returns('PhpBoolean'),
             :node($/)
         );
}

method NULL($/) {
    make PAST::Val.new(
             :value( 0 ),
             :returns('PhpUndef'),
             :node($/)
         );
}

method INTEGER($/) {
    make PAST::Val.new(
             :value( ~$/ ),
             :returns('PhpInteger'),
             :node($/)
         );
}

method NUMBER($/) {
    make PAST::Val.new(
             :value( +$/ ),
             :returns('PhpFloat'),
             :node($/)
         );
}

method SINGLEQUOTE_STRING($/) {
    make PAST::Val.new(
             :value( $( $<string_literal> ) ),
             :returns('PhpString'),
             :node($/)
         );
}

method DOUBLEQUOTE_STRING($/) {
    make PAST::Val.new(
             :value( $( $<string_literal> ) ),
             :returns('PhpString'),
             :node($/)
         );
}

method function_definition($/) {

    ## note that $<parameters> creates a new PAST::Block.
    my $past := $( $<parameters> );

    ## set the function name
    $past.name( ~$<FUNCTION_NAME> );
    for $<statement> {
        $past.push($($_));
    }

    $past.control('return_pir');

    make $past;
}

method method_definition($/) {

    ## note that $<parameters> creates a new PAST::Block.
    my $past := $( $<parameters> );

    ## set the function name
    $past.name( ~$<METHOD_NAME> );
    $past.blocktype( 'method' );
    $past.control('return_pir');
    $past.push( PAST::Stmts.new() );

    my $stmts := PAST::Stmts.new();
    for $<statement> {
        $stmts.push($($_));
    }
    $past.push( $stmts );


    make PAST::Stmts.new( $past );
}

method parameters($/) {

    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    for $<VAR_NAME> {
        my $param := $( $_ );
        $param.scope('parameter');
        $past.push($param);

        ## enter the parameter as a lexical into the block's symbol table
        $past.symbol($param.name(), :scope('lexical'));
    }

    make $past;
}

method class_definition($/) {
    my $past := PAST::Block.new(
                    :node($/),
                    :blocktype('declaration'),
                    :namespace( $<CLASS_NAME><ident> ),
                    :pirflags( ':init :load' ),
                    :lexical( 0 ),
                    PAST::Stmts.new(
                        PAST::Op.new(
                            :inline( "$P0 = get_hll_global 'P6metaclass'\n $P1 = split '::', 'Dings'\n push_eh subclass_done\n $P2 = $P0.'new_class'($P1)\n pop_eh\n subclass_done:\n" ),
                            :pasttype( 'inline' )
                        )
                    )
                );
    for $<method_definition> {
        $past.push( $($_) );
    }

    make $past;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
