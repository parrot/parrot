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
    $past.name( ~$<ECHO> );

    make $past;
}

method function_call($/) {
    my $past := $( $<arguments> );
    $past.name( ~$<FUNCTION_NAME> );

    make $past;
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
                    $( $<relational_expression> ),
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

method array_key($/) {
    make $( $<expression> );
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
             $( $<array_key> ),
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

method relational_expression($/) {
    if $<rel_op_clause> {
        my %name;
        %name{'=='} := 'infix:eq';
        %name{'!='} := 'infix:ne';
        my $rel_op_clause := $/{'rel_op_clause'}{'REL_OP'};
        my $op := ~$rel_op_clause{'REL_OP'};
        my $name := %name{ $op } || "infix:" ~ $op;
        make PAST::Op.new(
                 $( $<expression> ),
                 $( $rel_op_clause{'expression'} ),
                 :node($/),
                 :name($name)
             );
    }
    else {
        make $( $<expression> );
    }
}

method expression($/,$key) {
    make $( $/{$key} );
}

method bitwise_expression($/) {
    my $past := $( $<adding_expression> );
    if $<bitwise_tail> {
       my %name;
       %name{'&'} := 'infix:+&';
       %name{'|'} := 'infix:+|';
       %name{'^'} := 'infix:+^';

       for $<bitwise_tail> {
           my $past_prev := $past;
           my $name := %name{ $_<BITWISE_OP> };
           $past := PAST::Op.new(
                        $past_prev,
                        $( $_<adding_expression> ),
                        :name($name)
                    );
       }
    }

    make $past;
}

method adding_expression($/) {
    my $past := $( $<multiplying_expression> );
    if $<adding_tail> {
       for $<adding_tail> {
           my $past_prev := $past;
           my $pir_op := $_<ADD_OP> eq '+' ?? 'n_add' !! 'n_sub';
           $past := PAST::Op.new(
                        $past_prev,
                        $( $_<multiplying_expression> ),
                        :pirop($pir_op)
                    );
       }
    }

    make $past;
}

method multiplying_expression($/) {
    my $past := $( $<unary_expression> );
    if $<multiplicand> {
       my %pirop;
       %pirop{'*'} := 'n_mul';
       %pirop{'/'} := 'n_div';
       %pirop{'%'} := 'n_mod';

       for $<multiplicand> {
           my $past_prev := $past;
           my $pir_op := %pirop{ $_<MUL_OP> };
           $past := PAST::Op.new(
                        $past_prev,
                        $( $_<multiplying_expression> ),
                        :pirop($pir_op)
                    );
       }
    }

    make $past;
}

method unary_expression($/) {
    if $<UNARY_MINUS> {
        make PAST::Op.new(
                 $( $<postfix_expression> ),
                 :name('prefix:-'),
                 :pirop('n_neg'),
                 :node($/)
             );
    }
    else {
        make $( $<postfix_expression> );
    }
}

method concat_expression($/) {
    my $past := $( $<string> );
    if $<concat_tail> {
       for $<concat_tail> {
           my $past_prev := $past;
           my $op := $_<CONCAT_OP> eq '.' ?? '~' !! ~$_<CONCAT_OP>;
           $past := PAST::Op.new(
                        $past_prev,
                        $( $_<string> ),
                        :name( "infix:" ~ $op )
                    );
       }
    }

    make $past;
}


method postfix_expression($/,$key) {
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


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
