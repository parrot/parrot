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
    make PAST::Block.new( $( $<program> ),              # there is exactly one program
                          :name('TCFKAP'),
                          :node($/), );
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
             :name('echo')
         );
}

# loop over the statements in the PHP section
method code($/) {
    my $past  := PAST::Stmts.new( :node($/), :name('code') );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method statement($/,$key) {
    if $key eq 'ECHO' {
        make PAST::Op.new(
                 $( $/[0]<expression> ),
                 :pasttype('call'),
                 :name('echo')
             );
    }
    elsif $key eq 'inline_sea' {
        make PAST::Op.new(
                 PAST::Val.new(
                     :value(~$<inline_sea><SEA_empty_allowed>),
                     :returns('String')
                 ),
                 :pasttype('call'),
                 :name('echo')
             );
    }
}


method SINGLEQUOTE_STRING($/) {
    make PAST::Val.new(
             :value( $($<string_literal>) ),
             :returns('String'),
             :node($/)
         );
}


method INTEGER($/) {
    make PAST::Val.new(
        :value( +$/ ),
        :returns('Integer'),
        :node($/)
    );
}
method expression($/,$key) {
    make $( $/{$key} );
}

method bitwise_expression($/) {
    make $( $<adding_expression> );
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
           my $pir_op := $_<MUL_OP> eq '*' ?? 'n_mul' !! 'n_div';
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
                 :pirop('n_neg')
             );
    }
    else {
        make $( $<postfix_expression> );
    }
}

method concat_expression($/) {
    make $( $<string> );
}

method postfix_expression($/,$key) {
    make $( $/{$key} );
}

method string($/,$key) {
    make $( $/{$key} );
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
