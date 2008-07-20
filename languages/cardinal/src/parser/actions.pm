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

    our $?INIT;
        if defined( $?INIT ) {
        $?INIT.unshift(
            PAST::Var.new(
                :name('$def'),
                :scope('lexical'),
                :isdecl(1)
            )
        );
        $?INIT.blocktype('declaration');
        $?INIT.pirflags(':init :load');
        $past.unshift( $?INIT );
        $?INIT := PAST::Block.new(); # For the next eval.
    }

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
    my $past := $( $<arg> );
    if +$<not> {
        $past := PAST::Op.new( $past, :pirop('not'), :node($/) );
    }
    if $<expr> {
        my $op;
        if ~$<op>[0] eq 'and' { $op := 'if'; }
        else { $op := 'unless'; }
        $past := PAST::Op.new( $past, $( $<expr>[0] ), :pasttype($op), :node($/) );
    }
    make $past;
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

method indexed_assignment($/) {
    my $key := $( $<key> );
    my $rhs := $( $<rhs> );
    my $primary := $( $<basic_primary> );

    my $past := PAST::Op.new( :name('[]='), :pasttype('callmethod'), :node($/) );

    $past.push( $primary );
    $past.push( $key );
    $past.push( $rhs );

    make $past;
}
method member_assignment($/) {
    my $rhs := $( $<rhs> );
    my $primary := $( $<basic_primary> );

    my $past := PAST::Op.new( :name(~$<key><ident> ~ '='), :pasttype('callmethod'), :node($/) );

    $past.push( $primary );
    $past.push( $rhs );

    make $past;
}
method assignment($/) {
    my $lhs := $( $<mlhs> );
    our $?BLOCK;
    my $name := $lhs.name();
    unless $?BLOCK.symbol(~$name) {
        our @?BLOCK;
        my $exists := 0;
        my $scope;
        for @?BLOCK {
            if $_ {
                my $sym_table := $_.symbol(~$name);
                if $sym_table {
                    $exists := 1;
                    $scope := '' ~ $sym_table<scope>;
                }
            }
        }
        our $?CLASS;
        if $exists == 0 && defined($?CLASS) {
            my $block := $?CLASS[0];
            my $sym_table := $block.symbol(~$name);
            if $sym_table {
                $exists := 1;
                $scope := '' ~ $sym_table<scope>;
            }
        }
        if $exists == 0 {
            $lhs.isdecl(1);
            $scope := 'lexical';
        }
        $?BLOCK.symbol(~$name, :scope($scope));
        $lhs.scope($scope);
    }

    my $rhs := $( $<mrhs> );
    make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :lvalue(1), :node($/) );
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

method indexed($/) {
    my $args;
    if $<args> {
        $args := $( $<args>[0] );
    }

    my $past := PAST::Op.new( :name('[]'), :pasttype('callmethod'), :node($/) );
    while $args[0] {
        $past.push( $args.shift() );
    }

    make $past;
}

method variable($/, $key) {
    my $past;
    if $key eq 'varname' {
        $past := $( $/<varname> );
    }
    elsif $key eq 'self' {
        $past := PAST::Op.new(:inline('%r = self'));
    }
    elsif $key eq 'nil' {
        $/.panic('nil is not yet implemented');
    }
    make $past;
}

method varname($/, $key) {
    make $( $/{$key} );
}

method global($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :viviself('Undef'), :node($/) );
}

method instance_variable($/) {
    our $?CLASS;
    our $?BLOCK;
    my $name := ~$/;
    my $past := PAST::Var.new(  :name($name), :scope('attribute'), :viviself('Undef'), :node($/) );
    my $block := $?CLASS[0];
    unless $block.symbol(~$/) {
        $?CLASS.push(
            PAST::Op.new(
                :pasttype('call'),
                :name('!keyword_has'),
                PAST::Var.new(
                    :name('$def'),
                    :scope('lexical')
                ),
                PAST::Val.new( :value($name) )
            )
        );

        $block.symbol(~$name, :scope('attribute'));
        $?BLOCK.symbol(~$name, :scope('attribute'));
    }
    make $past;
}

method local_variable($/) {
    our $?BLOCK;
    my $past := PAST::Var.new( :name(~$/), :node($/), :viviself('Undef') );
    if $?BLOCK.symbol($<ident>) {
        my $scope := '' ~ $?BLOCK.symbol($<ident>)<scope>;
        $past.scope(~$scope);
    }
    else {
        our @?BLOCK;
        my $exists := 0;
        my $scope;
        for @?BLOCK {
            if $_ {
                my $sym_table := $_.symbol(~$<ident>);
                if $sym_table {
                    $exists := 1;
                    $scope := '' ~ $sym_table<scope>;
                }
            }
        }
        if $exists == 0 {
            $past.scope('package');
            my @a;
            $past.namespace(@a);
        }
        else {
            $past.scope($scope);
        }
    }
    make $past;
}


method constant_variable($/) {
    my @a;
    my $past := PAST::Var.new( :name(~$/), :scope('package'), :node($/), :viviself('Undef'), :namespace( @a ) );
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
    $body.blocktype('immediate');
    make PAST::Op.new( $cond, $body, :pasttype(~$<sym>), :node($/) );
}

method for_stmt($/) {
    my $list := $( $<expr> );
    my $body := $( $<comp_stmt> );
    my $var := $( $<variable> );
    $body.blocktype('declaration');
    $var.scope('parameter');
    $var.isdecl(0);
    $body[0].push($var);
    make PAST::Op.new( $list, $body, :pasttype('for'), :node($/) );
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

method classdef($/,$key) {
    our $?CLASS;
    our @?CLASS;
    our $?INIT;

    my $name := ~$<module_identifier><ident>;
    if $key eq 'open' {
        my $decl := PAST::Stmts.new();
        $decl.push(
            PAST::Op.new(
                :pasttype('bind'),
                PAST::Var.new(
                    :name('$def'),
                    :scope('lexical')
                ),
                PAST::Op.new(
                    :pasttype('call'),
                    :name('!keyword_class'),
                    PAST::Val.new( :value($name) )
                )
            )
        );
        @?CLASS.unshift( $?CLASS );
        $?CLASS := $decl;
        $?CLASS.unshift( PAST::Block.new() );
    }
    else {
        my $block := $( $<comp_stmt> );
        $block.namespace($name);
        $block.blocktype('declaration');
        $block.pirflags(':init :load');

        $?CLASS.push(
            PAST::Op.new(
                :pasttype('callmethod'),
                :name('register'),
                PAST::Var.new(
                    :scope('package'),
                    :name('!CARDINALMETA'),
                    :namespace('CardinalObject')
                ),
                PAST::Var.new(
                    :scope('lexical'),
                    :name('$def')
                ),
                PAST::Val.new(
                    :value('CardinalObject'),
                    :named( PAST::Val.new( :value('parent') ) )
                )
            )
        );

        unless defined( $?INIT ) {
            $?INIT := PAST::Block.new();
        }
        for @( $?CLASS ) {
            if $_.WHAT() eq 'Block' {
                $block.push( $_ );
            }
            else {
                $?INIT.push( $_ );
            }
        }

        # Restore outer class.
        if +@?CLASS {
            $?CLASS := @?CLASS.shift();
        }
        else {
            $?CLASS := @?CLASS[0];
        }


        make $block;
    }
}

method functiondef($/) {
    my $past := $( $<comp_stmt> );
    my $name := $<fname>;
    #my $args := $( $<argdecl> );
    #$past.push($args);
    $past.name(~$name);
    our $?BLOCK;
    our $?CLASS;
    $?BLOCK.symbol(~$name, :scope('package'));
    if defined($?CLASS) {
        $past.pirflags(':method');
    }
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

method methodcall($/) {
    my $op := $<operation>;
    my $past;
    if $<call_args> {
        $past := $( $<call_args>[0] );
    }
    else {
        $past := PAST::Op.new();
    }

    $past.pasttype('callmethod');

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
    my $list;
    if $<args> {
        $list := $( $<args>[0] );
        $list.name('list');
    }
    else {
        $list := PAST::Op.new( :name('list'), :node($/) );
    }

    make $list;
}

method ahash($/) {
    my $hash;
    if $<args> {
        $hash := $( $<args>[0] );
        $hash.name('hash');
    }
    else {
        $hash := PAST::Op.new( :name('hash'), :node($/) );
    }

    make $hash;
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

