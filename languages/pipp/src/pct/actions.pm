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
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method code_tp2($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method block($/) {
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
                    $( $<var> )
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
                    $( $<block> ),
                    :pasttype('if'),
                    :node($/)
                );
    for $<else_clause> {
        $past.push( $( $_ ) );
    }

    make $past;
}

method var_assign($/) {
    make PAST::Op.new(
             $( $<var> ),
             $( $<expression> ),
             :pasttype('bind'),
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

method var($/,$key) {
    make $( $/{$key} );
}

method VAR_NAME($/) {
    make PAST::Var.new(
             :scope('package'),
             :name(~$/),
             :viviself('Undef'),
             :lvalue(1)
         );
}

method this($/) {
    make PAST::Op.new(
             :inline( "%r = self" )
         );
}

method else_clause($/) {
    make $( $<block> );
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

method literal($/,$key) {
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

method function_definition($/) {

    # note that $<param_list> creates a new PAST::Block.
    my $past := $( $<param_list> );

    $past.name( ~$<FUNCTION_NAME> );
    $past.control('return_pir');
    $past.push( $( $<block> ) );

    make $past;
}

method member_definition($/) {
    make PAST::Op.new(
             $( $<var> ),
             $( $<literal> ),
             :pasttype('bind'),
         );
}

method method_definition($/) {

    # note that $<param_list> creates a new PAST::Block.
    my $past := $( $<param_list> );

    $past.name( ~$<METHOD_NAME> );
    $past.blocktype( 'method' );
    $past.control('return_pir');
    $past.push( $( $<block> ) );

    make $past;
}

method param_list($/) {

    my $past := PAST::Block.new(
                    :blocktype('declaration'),
                    :node($/)
                );
    for $<VAR_NAME> {
        my $param := $( $_ );
        $param.scope('parameter');
        $past.push($param);

        # enter the parameter as a lexical into the block's symbol table
        $past.symbol(
             :scope('lexical'),
             $param.name()
        );
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
                            :inline(   "$P0 = get_hll_global 'P6metaclass'\n $P1 = split '::', '"
                                     ~ $<CLASS_NAME>
                                     ~ "'\n push_eh subclass_done\n $P2 = $P0.'new_class'($P1)\n pop_eh\n subclass_done:\n" ),
                            :pasttype( 'inline' )
                        )
                    )
                );
    for $<method_definition> {
        $past.push( $($_) );
    }

    make $past;
}


method quote($/) {
    make $( $<quote_expression> );
}

method quote_expression($/, $key) {
    my $past;
    if $key eq 'quote_regex' {
        our $?NS;
        $past := PAST::Block.new(
            $<quote_regex>,
            :compiler('PGE::Perl6Regex'),
            :namespace($?NS),
            :blocktype('declaration'),
            :node( $/ )
        );
    }
    elsif $key eq 'quote_concat' {
        if +$<quote_concat> == 1 {
            $past := $( $<quote_concat>[0] );
        }
        else {
            $past := PAST::Op.new(
                :name('list'),
                :pasttype('call'),
                :node( $/ )
            );
            for $<quote_concat> {
                $past.push( $($_) );
            }
        }
    }
    make $past;
}

method quote_concat($/) {
    my $terms := +$<quote_term>;
    my $count := 1;
    my $past := $( $<quote_term>[0] );
    while ($count != $terms) {
        $past := PAST::Op.new(
            $past,
            $( $<quote_term>[$count] ),
            :pirop('n_concat'),
            :pasttype('pirop')
        );
        $count := $count + 1;
    }
    make $past;
}

method quote_term($/, $key) {
    my $past;
    if ($key eq 'literal') {
        $past := PAST::Val.new(
            :value( ~$<quote_literal> ),
            :returns('PhpString'), :node($/)
        );
    }
    elsif ($key eq 'var') {
        $past := $( $<var> );
    }
    elsif ($key eq 'circumfix') {
        $past := $( $<circumfix> );
        $past.blocktype('immediate');
    }
    make $past;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
