# $Id$

# Copyright (C) 2008, The Perl Foundation.

=begin comments

ChitChat::Grammar::Actions - ast transformations for ChitChat

This file contains the methods that are used by the parse grammar
to build the PAST representation of an ChitChat program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class ChitChat::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    for $<exprs> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method block($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    for $<id> {
        my $param := $( $_ );
        $param.isdecl(1);
        $param.scope('parameter');
        $past.push($param);
    }
    if $<temps> {
        my $temps := $( $<temps>[0] );
        $past.push($temps);
    }

    $past.push( $( $<exprs> ) );

    make $past;
}

method temps($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<id> {
        my $temp := $( $_ );
        $temp.scope('lexical');
        $temp.isdecl(1);
        $past.push( $temp );
    }
    make $past;
}

method exprs($/) {
    my $past := PAST::Stmts.new();
    for $<expr> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method expr($/) {
    make $( $<expr2> );
}

method expr2($/) {
    make $( $<msgexpr> );
}

method msgexpr($/,$key) {
    make $( $/{$key} );
}

method keyexpr($/) {
    my $past := PAST::Op.new( :pasttype('callmethod') );
    $past.push( PAST::Var.new( :name( $( $<keyexpr2>).name() ), :scope('package') ) );
    my @args := $( $<keymsg> );
    my $name := '';
    while +@args {
        $name := $name ~ ~@args.shift();
        $past.push( @args.shift() );
    }
    $past.name($name);
    make $past;
}

method keyexpr2($/) {
    make $( $<primary> );
}

method keymsg($/) {
    my @past;
    my $num := +$<keysel>;
    my $i := 0;
    while $i < $num {
        @past.push( ~$<keysel>[$i] );
        @past.push( $($<keyexpr2>[$i]) );
        $i++;
    }
    make @past;
}

method binaryexpr($/) {
    $/.panic('binary expressions not yet implemented');
}

method unaryexpr($/) {
    $/.panic('unary expressions not yet implemented');
}

method primary($/) {
    make $( $<unit> );
}

method unit($/,$key) {
    make $( $/{$key} );
}

method literal($/,$key) {
    make $( $/{$key} );
}

method string($/) {
    make PAST::Val.new( :value(~$<text>), :returns('String') );
}

method id($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

