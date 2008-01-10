# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

lolcode::Grammar::Actions - ast transformations for lolcode

This file contains the methods that are used by the parse grammar
to build the PAST representation of an lolcode program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class lolcode::Grammar::Actions;

method TOP($/) {
    make $( $<block> );
}


method statement ($/, $key) {
    if ($key eq 'bare_expression') {
        my $it := PAST::Var.new( :name( 'IT' ), :scope('package'), :viviself('Undef'));
        my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
        $past.push( $it );
        $past.push( $( $<expression> ) );
        make $past;
    } else {
        make $( $/{$key} ); # For now
    }
}


method visible($/) {
    my $past := PAST::Op.new( :name('VISIBLE'), :pasttype('call'), :node( $/ ) );
    if ( $<no_newline> ) {
        $past.push( PAST::Val.new( :value( 1 ), :named( PAST::Val.new( :value('no_newline') ) ) ) );
    }
    for $<expression> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method declare($/) {
    if ($<expression>) {
        $($<variable>).isdecl(1);
        # XXX Someone clever needs to refactor this into C<assign>
        my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
        $past.push( $( $<variable> ) );
        $past.push( $( $<expression>[0] ) );
        make $past;
    } else {
        make $( $<variable> );
    }
}

method assign($/) {
    my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
    $past.push( $( $<variable> ) );
    $past.push( $( $<expression> ) );
    make $past;
}

method function($/) {
    my $block := $( $<block> );
    $block.blocktype('declaration');

    # if there are any parameters, get the PAST for each of them and
    # adjust the scope to parameter.
    if $<parameters> {
        my @params := $<parameters>[0]<identifier>;
        for @params {
            my $param := $($_);
            $param.scope('parameter');
            $block.push($param);
        }
    }

    my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
    $($<variable>).isdecl(1);
    $past.push( $( $<variable> ) );
    $past.push( $block );
    make $past;
}

method ifthen($/) {
    my $count := +$<expression> - 1;
    my $expr  := $( $<expression>[$count] );
    my $then  := $( $<block>[$count] );
    $then.blocktype('immediate');
    my $past := PAST::Op.new( $expr, $then,
                              :pasttype('if'),
                              :node( $/ )
                            );
    if ( $<else> ) {
        my $else := $( $<else>[0] );
        $else.blocktype('immediate');
        $past.push( $else );
    }
    while ($count != 0) {
        $count := $count - 1;
        $expr  := $( $<expression>[$count] );
        $then  := $( $<block>[$count] );
        $then.blocktype('immediate');
        $past  := PAST::Op.new( $expr, $then, $past,
                               :pasttype('if'),
                               :node( $/ )
                             );
    }
    make $past;
}

method block($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method value($/, $key) {
    make $( $/{$key} );
}

method expression($/, $key) {
    if ($key eq 'var_or_function') {
        my $past := PAST::Op.new( :name('var_or_function'), :pasttype('call'), :node( $/ ) );
        $past.push( $( $<variable> ) );
        make $past;
    } else {
        make $( $/{$key} );
    }
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}


method boolean($/) {
    if (~$/ eq 'FAIL' ) {
        make PAST::Val.new( :value( 0 ), :returns('Boolean'), :node($/) );
    } else {
        make PAST::Val.new( :value( 1 ), :returns('Boolean'), :node($/) );
    }
}

method quote($/) {
    make PAST::Val.new( :value( $($<string_literal>) ), :node($/) );
}


method identifier($/) {
    make PAST::Val.new( :value( ~$/ ), :node($/) );
}

method variable ($/) {
    if ($<identifier><name> eq 'IT') {
        make PAST::Var.new( :name( 'IT' ), :scope('package'), :viviself('Undef'));
    } else {
        make PAST::Var.new( :name( ~$<identifier><name> ),
                            :scope('lexical'),
                            :viviself('Undef'),
                            :node( $/ )
                          );
    }
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

