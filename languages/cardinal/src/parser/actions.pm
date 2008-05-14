# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

cardinal::Grammar::Actions - ast transformations for cardinal

This file contains the methods that are used by the parse grammar
to build the PAST representation of an cardinal program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class cardinal::Grammar::Actions;

method TOP($/) {
    my $past := $( $<comp_stmt> );
    $past.blocktype('declaration');
    make $past;
}

method comp_stmt($/,$key) {
    our $?BLOCK;
    our @?BLOCK;
    our $?BLOCK_SIGNATURED;
    if $key eq 'open' {
        if $?BLOCK_SIGNATURED {
            $?BLOCK := $?BLOCK_SIGNATURED;
            $?BLOCK_SIGNATURED := 0;
        }
        else {
            $?BLOCK := PAST::Block.new( PAST::Stmts.new(), :node($/));
        }
        @?BLOCK.unshift($?BLOCK);
    }
    if $key eq 'close' {
        my $past := @?BLOCK.shift();
        $?BLOCK := @?BLOCK[0];
        $past.push( $( $<stmts> ) );
        make $past;
    }
}

method stmts($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<stmt> {
        $past.push($($_));
    }
    make $past;
}

method basic_stmt($/, $key) {
    make $( $/{$key} );
}

method stmt($/) {
    my $past := $( $<basic_stmt> );
    for $<stmt_mod> {
        my $modifier := $( $_ );
        $modifier.push($past);
        $past := $modifier;
    }
    make $past;
}

method stmt_mod($/) {
    my $op;
    if $<sym> eq 'until' {
        ## there is no :pasttype('until'); this is called repeat_until
        $op := 'repeat_until';
    }
    else {
        ## if, while and unless are valid :pasttypes.
        $op := ~$<sym>;
    }
    make PAST::Op.new( $( $<expr> ), :pasttype($op), :node($/) );

}

method expr($/) {
    my $past := $( $<basic_expr> );
    if $<expr> {
        my $op;
        if ~$<op>[0] eq 'and' { $op := 'if'; }
        else { $op := 'unless'; }
        make PAST::Op.new( $past, $( $<expr>[0] ), :pasttype($op), :node($/) );
    }
    else {
        make $past;
    }
}

method basic_expr($/, $key) {
    make $( $/{$key} );
}

method not_expr($/) {
    make PAST::Op.new( $( $<expr> ), :pirop('not'), :node($/) );
}

method return_stmt($/) {
    my $past := $($<call_args>);
    $past.pasttype('inline');
    $past.inline('    .return(%0)');
    make $past;
}

## not entirely sure what alias does, but this is a guess...
method alias($/) {
    my $fname := $<fname>[0];
    my $alias := $<fname>[1];
    make PAST::Op.new( $alias, $fname, :pasttype('bind'), :node($/) );
}

method begin($/) {
    my $past := $( $<comp_stmt> );
    my $sub := PAST::Compiler.compile( $past );
    $sub();
    ## XXX what to do here? empty block? stolen from rakudo.
    make PAST::Block.new( :node($/) );
}

method end($/) {
    my $past := PAST::Block.new( $( $<comp_stmt> ), :node($/) );
    $past.blocktype('declaration');
    my $sub := PAST::Compiler.compile( $past );
    PIR q<  $P0 = get_hll_global ['cardinal'], '@?END_BLOCKS' >;
    PIR q<  $P1 = find_lex '$sub' >;
    PIR q<  push $P0, $P1 >;
    make $past;
}

method assignment($/) {
    my $lhs := $( $<mlhs> );
    my $rhs := $( $<mrhs> );
    make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :node($/) );
}

method mlhs($/, $key) {
    make $( $/{$key} );
}

method lhs($/, $key) {
    make $( $/{$key} );
}

method member_variable($/) {
    make $( $<primary> );
    # XXX fix field.
}

method indexed_variable($/) {
    my $var := $( $<primary> );
    my $args;
    if $<args> {
        $args := $( $<args>[0] );
    }

    my $past := PAST::Var.new( :scope('keyed'), :node($/) );
    $past.push($var);
    while $args[0] {
        $past.push( $args.shift() );
    }

    make $past;
}

method variable($/, $key) {
    make $( $/{$key} );
}

method varname($/, $key) {
    make $( $/{$key} );
}

method global($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :viviself('Undef'), :node($/) );
}

method instance_variable($/) {
    make PAST::Var.new(  :name(~$/), :scope('attribute'), :viviself('Undef'), :node($/) );
}

method local_variable($/) {
    our $?BLOCK;
    my $past := PAST::Var.new( :name(~$/), :scope('lexical'), :node($/), :viviself('Undef') );
    unless $?BLOCK.symbol($<ident>) {
        our @?BLOCK;
        my $exists := 0;
        for @?BLOCK {
            if $_ {
                my $sym_table := $_.symbol(~$<ident>);
                if $sym_table {
                    $exists := 1;
                }
            }
        }
        if $exists == 0 {
            $past.isdecl(1);
        }
        my $scope := 'lexical';
        $?BLOCK.symbol(~$<ident>, :scope($scope));
    }
    make $past;
}


method if_stmt($/) {
    my $cond := +$<expr> - 1;
    my $comp := $( $<comp_stmt>[$cond] );
    $comp.blocktype('immediate');
    my $past := PAST::Op.new( $( $<expr>[$cond] ),
                              $comp,
                              :pasttype('if'),
                              :node( $/ )
                            );
    if ( $<else> ) {
        my $else := $( $<else>[0] ) ;
        $else.blocktype('immediate');
        $past.push( $else );
    }
    while ($cond != 0) {
        $cond := $cond - 1;
        $comp := $( $<comp_stmt>[$cond] );
        $comp.blocktype('immediate');
        $past := PAST::Op.new( $( $<expr>[$cond] ),
                               $comp,
                               $past,
                               :pasttype('if'),
                               :node( $/ )
                             );
    }
    make $past;
}

method unless_stmt($/) {
    my $cond := $( $<expr> );
    my $body := $( $<comp_stmt> );
    $body.blocktype('immediate');
    my $past := PAST::Op.new( $cond, $body, :pasttype('unless'), :node($/) );
    if $<else> {
        $past.push( $( $<else>[0] ) );
    }
    make $past;
}

method else($/) {
    make $( $<comp_stmt> );
}

method ensure($/) {
    make $( $<comp_stmt> );
}

method while_stmt($/) {
    my $cond := $( $<expr> );
    my $body := $( $<comp_stmt> );
    make PAST::Op.new( $cond, $body, :pasttype(~$<sym>), :node($/) );
}

method module($/) {
    my $past := $( $<comp_stmt> );
    my $name := $( $<module_identifier> );
    $past.namespace( $name.name() );
    $past.blocktype('declaration');
    make $past;
}

method begin_end($/) {
    my $past := $( $<comp_stmt> );
    # XXX handle resque and ensure clauses
    make $past;
}

method functiondef($/) {
    my $past := $( $<comp_stmt> );
    my $name := $<fname>;
    #my $args := $( $<argdecl> );
    #$past.push($args);
    $past.name(~$name);
    our $?BLOCK;
    $?BLOCK.symbol(~$name, :scope('package'));
    make $past;
}

method argdecl($/) {
    my $params := PAST::Stmts.new( :node($/) );
    my $past := PAST::Block.new($params, :blocktype('declaration'));
    for $<identifier> {
        my $parameter := $( $_ );
        $past.symbol($parameter.name(), :scope('lexical'));
        $parameter.scope('parameter');
        $params.push($parameter);
    }
    if $<slurpy_param> {
        $params.push( $( $<slurpy_param>[0] ) );
    }

    if $<block_param> {

    }
    $params.arity( +$<identifier> );
    our $?BLOCK_SIGNATURED := $past;
    make $past;
}

method slurpy_param($/) {
    my $past := $( $<identifier> );
    $past.slurpy(1);
    $past.scope('parameter');
    make $past;
}

method block_param($/) {
    my $past := $( $<identifier> );
    # XXX
    make $past;
}

method identifier($/) {
    make PAST::Var.new( :name(~$<ident>), :node($/) );
}

method module_identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

method mrhs($/) {
    make $( $<args> );
}

method command($/, $key) {
    make $( $/{$key} );
}

method call($/) {
    my $op := $<operation>;
    my $past;
    if $<call_args> {
        $past := $( $<call_args> );
    }
    else {
        $past := PAST::Op.new();
    }

    if $<primary> {
        my $invocant := $( $<primary>[0] );
        # XXX what's the diff. between "." and "::", in $<op>[0] ?
        $past.unshift($invocant);
        $past.pasttype('callmethod');
    }

    if $<do_block> {
        $past.push( $( $<do_block>[0] ) );
    }

    $past.name(~$op);
    make $past;
}

method do_block($/) {
    my $past := $( $<comp_stmt> );
    make $past;
}

method super_call($/) {
    my $past := $( $<call_args> );
    ## how to invoke super.xxx ?
    make $past;
}

method not_command($/) {
    make PAST::Op.new( $( $<command> ), :pirop('not'), :node($/) );
}

method operation($/) {
    make $( $<identifier> );
}

method call_args($/) {
    if ~$/ ne '()' {
        make $( $<args> );
    }
    else {
        make PAST::Op.new( :pasttype('call'), :node($/) );
    }
}

method do_args($/) {
    my $params := PAST::Stmts.new( :node($/) );
    my $past := PAST::Block.new($params, :blocktype('declaration'));
    for $<identifier> {
        my $parameter := $( $_ );
        $past.symbol($parameter.name(), :scope('lexical'));
        $parameter.scope('parameter');
        $params.push($parameter);
    }
    $params.arity( +$<identifier> );
    our $?BLOCK_SIGNATURED := $past;
    make $past;
}

method args($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    for $<arg> {
        $past.push( $($_) );
    }
    make $past;
}

method basic_primary($/, $key) {
    make $( $/{$key} );
}

method primary($/) {
    my $past := $( $<basic_primary> );

    # XXX check this out:
    for $<post_primary_expr> {
        my $postexpr := $( $_ );
        $postexpr.unshift($past);
        $past := $postexpr;
    }
    make $past;
}

method post_primary_expr($/, $key) {
    make $( $/{$key} );
}

method scope_identifier($/) {
    make $( $<identifier> );
    # XXX handle :: operator.
}

method literal($/, $key) {
    my $past := $( $/{$key} );
    make $past;
}

method pcomp_stmt($/) {
    make $( $<comp_stmt> );
}

method array($/) {
    my $past;
    ## XXX the "new" method should be invoked on the "Array" class (use get_class)
    ## but that doesn't work yet.
    my $getclass := PAST::Op.new( :inline('    %r = new "CardinalArray"'), :node($/) );
    if $<args> {
        $past := $( $<args>[0] );
        $past.unshift( $getclass );
        $past.name('new');
        $past.pasttype('callmethod');
    }
    else {
        $past := PAST::Op.new( $getclass, :name('new'), :pasttype('callmethod'), :node($/) );
    }
    make $past;
}

method ahash($/) {
    # XXX handle class stuff
    my $past;
    my $getclass := PAST::Op.new( :inline('    %r = new "Hash"'), :node($/) );
    $past := PAST::Op.new( $getclass, :name('new'), :pasttype('callmethod'), :node($/) );
    make $past;
}

method assocs($/) {
    for $<assoc> {

    }
    # XXX
}

method assoc($/) {
    # XXX
}

method float($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('CardinalInteger'), :node($/) );
}

method string($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :returns('CardinalString'), :node($/) );
}


method arg($/, $key) {
    ## Handle the operator table
    ##
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

