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
    my $block := $( $<block> );
    my $it := PAST::Var.new( :name( 'IT' ), :scope('lexical'), :viviself('Undef'), :isdecl(1));
    $block.unshift($it);
    make $block;
}


method statement ($/, $key) {
    if (($key eq 'expression')&&($<expression><tokens>[0]<identifier> ne 'VISIBLE')) {
        my $it := PAST::Var.new( :name( 'IT' ), :scope('lexical'), :viviself('Undef'));
        my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
        $past.push( $it );
        $past.push( $( $<expression> ) );
        make $past;
    }
    else {
        make $( $/{$key} ); # For now
    }
}


method declare($/) {
    $($<variable>).isdecl(1);
    if ($<expression>) {
        # XXX Someone clever needs to refactor this into C<assign>
        my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
        $past.push( $( $<variable> ) );
        $past.push( $( $<expression>[0] ) );
        make $past;
    }
    else {
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

    my $arglist;
    if $<arglist> {
        $arglist := PAST::Stmts.new( :node($<arglist>) );
        # if there are any parameters, get the PAST for each of them and
        # adjust the scope to parameter.
        $block.arity(0);
        for $<parameters> {
            #my $param := $($_);
            #$param.scope('parameter');
            my $param := PAST::Var.new(:name(~$_<identifier>), :scope('parameter'), :node($($_)));
            $param.isdecl(1);
            $arglist.push($param);
            $block.arity($block.arity() + 1);
        }
    }


    my $it := PAST::Var.new( :name( 'IT' ), :scope('lexical'), :viviself('Undef'), :isdecl(1));
    $block[0].unshift($it);

    $it := PAST::Var.new( :name( 'IT' ), :scope('lexical'));
    $block[0].push($it);

    if $<arglist> { $block.unshift($arglist); }

    $block.name(~$<variable><identifier>);
    make $block;
    #my $past := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
    #$($<variable>).isdecl(1);
    #$past.push( $( $<variable> ) );
    #$past.push( $block );
    #make $past;
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
    $expr := $past.shift();
    my $it := PAST::Var.new( :name( 'IT' ), :scope('lexical'), :viviself('Undef'));
    my $bind := PAST::Op.new( :pasttype('bind'), :node( $/ ) );
    $bind.push( $it );
    $bind.push( $expr );
    $past.unshift( $it );
    my $past := PAST::Stmts.new( $bind, $past, :node( $/ ) );
    make $past;
}

method block($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    my $stmts := PAST::Stmts.new( :node( $/ ) );
    for $<statement> {
        $stmts.push( $( $_ ) );
    }
    $past.push($stmts);
    make $past;
}

method value($/, $key) {
    make $( $/{$key} );
}

method bang($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('String'), :node($/) );
}

method expression($/) {
    my $past := PAST::Op.new( :name('expr_parse'), :pasttype('call'), :node( $/ ) );
    for $<tokens> {
        if($_<identifier>) {
            my $inline := '%r = find_name "' ~ $_<identifier> ~ '"';
            $past.push(PAST::Op.new( :inline($inline) ));
        }
        elsif($_ eq "MKAY"){
            my $inline := '%r = find_name "MKAY"';
            $past.push(PAST::Op.new( :inline($inline) ));
        }
        else {
            $past.push( $( $_ ) );
        }
    }
    make $past;
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method float($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method boolean($/) {
    if (~$/ eq 'FAIL' ) {
        make PAST::Val.new( :value( 0 ), :returns('Boolean'), :node($/) );
    }
    else {
        make PAST::Val.new( :value( 1 ), :returns('Boolean'), :node($/) );
    }
}

method quote($/) {
    make PAST::Val.new( :value( $($<yarn_literal>) ), :node($/) );
}


method variable ($/) {
    if ($<identifier> eq 'IT') {
        make PAST::Var.new( :name( 'IT' ), :scope('lexical'), :viviself('Undef'));
    }
    else {
        make PAST::Var.new( :name( $<identifier> ),
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

