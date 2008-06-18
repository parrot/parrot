# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

Plumhead::Grammar::Actions - ast transformations for Plumhead

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Plumhead program.
Each method below corresponds to a rule in F<src/pct/Plumhead.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class Plumhead::Grammar::Actions;

# The method TOP is invoked per default by the HLLCompiler
method TOP($/) {
    make PAST::Block.new(
             $( $<program> ),
             :name('Plum-Headed Parakeet'),
             :node($/)
         );
}

method program($/) {
    my $past  := PAST::Stmts.new( :node($/) );
    for $<sea_or_code> {
        $past.push( $($_) );
    }
    make $past;
}

method sea_or_code($/,$key) {
    make $( $/{$key} );
}

# The surrounding HTML is printed out
method SEA($/) {
    make PAST::Op.new(
             PAST::Val.new(
                 :value(~$/),
                 :returns('String')
             ),
             :pasttype('call'),
             :name('echo'),
             :node($/)
         );
}

# loop over the statements in the PHP section
method code($/) {
    my $past  := PAST::Stmts.new(
                     :node($/),
                     :name('code')
                 );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method statement($/,$key) {
    if $key eq 'ECHO' {
        make PAST::Op.new(
                 $( $/[0]<expression> ),
                 :pasttype('call'),
                 :name('echo'),
                 :node($/)
             );
    }
    elsif $key eq 'VAR_DUMP' {
        make PAST::Op.new(
                 $( $<expression> ),
                 :pasttype('call'),
                 :name('var_dump'),
                 :node($/)
             );
    }
    elsif $key eq 'IF' {
        my $past_if_block := PAST::Stmts.new( );
        for $<statement> {
            $past_if_block.push( $($_) );
        }
        my $past := PAST::Op.new(
                        $( $<relational_expression> ),
                        $past_if_block,
                        :pasttype('if'),
                        :node($/)
                    );
        for $<else_clause> {
            $past.push( $( $_ ) );
        }
        make $past;
    }
    elsif $key eq 'inline_sea' {
        make PAST::Op.new(
                 PAST::Val.new(
                     :value(~$<inline_sea><SEA_empty_allowed>),
                     :returns('String')
                 ),
                 :pasttype('call'),
                 :name('echo'),
                 :node($/)
             );
    }
    elsif $key eq 'scalar_assign' {
        make $( $/{$key} );
    }
    elsif $key eq 'array_assign' {
        make $( $/{$key} );
    }
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
    $past_var_name.viviself('Hash');
    make PAST::Var.new(
             $past_var_name,
             $( $<array_key> ),
             :scope('keyed'),
             :viviself("Undef"),
             :lvalue(1)
        );
}

method var($/) {
    make $( $<VAR_NAME> );
}

method VAR_NAME($/) {
    make PAST::Var.new(
             :scope("package"),
             :name(~$/),
             :viviself("Undef"),
             :lvalue(1)
        );
}

# loop over the statements in the else block
method else_clause($/) {
    my $past  := PAST::Stmts.new(
                     :node($/),
                     :name('else block')
                 );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
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
       for $<bitwise_tail> {
           my $past_prev := $past;
           my %name;
           %name{'&'} := 'infix:+&';
           %name{'|'} := 'infix:+|';
           %name{'^'} := 'infix:+^';
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
    # make PAST::Val( :name('kkkk'), :value($/) );
    my $past := $( $<unary_expression> );
    if $<multiplicand> {
       for $<multiplicand> {
           my $past_prev := $past;
           my %pirop;
           %pirop{'*'} := 'n_mul';
           %pirop{'/'} := 'n_div';
           %pirop{'%'} := 'n_mod';
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

method INTEGER($/) {
    make PAST::Val.new(
             :value( ~$/ ),
             :returns('Integer'),
             :node($/)
         );
}

method NUMBER($/) {
    make PAST::Val.new(
             :value( +$/ ),
             :returns('Float'),
             :node($/)
         );
}

method SINGLEQUOTE_STRING($/) {
    make PAST::Val.new(
             :value( $($<string_literal>) ),
             :returns('String'),
             :node($/)
         );
}

method DOUBLEQUOTE_STRING($/) {
    make PAST::Val.new(
             :value( $($<string_literal>) ),
             :returns('String'),
             :node($/)
         );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
