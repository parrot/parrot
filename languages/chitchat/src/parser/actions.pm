# $Id$

# Copyright (C) 2008, Parrot Foundation.

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

method method($/) {
    my $past := $( $<message> );
    ## todo: pragma

    if $<temps> {
        $past.push( $( $<temps>[0] ) );
    }
    $past.push( $( $<exprs> ) );
    make $past;
}

method message($/, $key) {
    if $key eq 'id' {
        my $name := $( $<id> );
        make PAST::Block.new( :name($name), :node($/) );
    }
    elsif $key eq 'binsel' {
        ## create a new block for a binary operator; stick to
        ## naming habit in other languages ('infix:...').
        make PAST::Block.new( :name('infix:' ~ ~$<binsel>), :node($/) );
    }
    elsif $key eq 'keysel' {
        my $name := "";
        for $<keysel> {
            $name := $name ~ ~$_;
        }
        my $past := PAST::Block.new( :name($name), :node($/) );

        for $<id> {
            my $param := $( $_ );
            $param.scope('parameter');
            $past.push($param);
        }
        make $past;
    }
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
    # for $<id> {
    #     $( $_ );
    # }
    make $( $<expr2> );
}

method expr2($/,$key) {
    my $past := $( $/{$key} );
    if $key eq 'msgexpr' {
        #my $statlist := PAST::Stmts.new();
        #for $<cascade> {
        #    my $stat := $( $_ );
        #    $stat.unshift($past);
        #    $statlist.push($stat);
        #}
        #make $statlist;
        make $past;
    }
    else {
        make $past;
    }
}


method cascade($/,$key) {
    make $( $/{$key} );
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

method keyexpr2($/, $key) {
    make $( $/{$key} );
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

method binexpr($/) {
    my $past := $( $<primary> );
    for $<binmsg> {
        my $call := $( $_ );
        $call.unshift($past);
        $past := $call;
    }
    make $past;
}

method binmsg($/) {
    my $past := PAST::Op.new( :name('infix:' ~ ~$<binsel>), :pasttype('call') );
    $past.push( $( $<primary> ) );
    make $past;
}

method unaryexpr($/) {
    make $( $<unit> );
}

method primary($/,$key) {
    make $( $<unit> );
}

method unit($/,$key) {
    make $( $/{$key} );
}

method literal($/,$key) {
    make $( $/{$key} );
}

method arrayelem($/,$key) {
    make $( $/{$key} );
}

method number($/) {
    make PAST::Val.new( :value(~$/), :returns('Float') );
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

