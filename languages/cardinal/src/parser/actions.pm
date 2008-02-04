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
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    $past.push( $( $<comp_stmt> ) );
    make $past;
}

method comp_stmt($/) {
    make $( $<stmts> );
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

## not entirely sure what alias does, but this is a guess...
method alias($/) {
    my $fname := $( $<fname>[0] );
    my $alias := $( $<fname>[1] );
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

method mlhs($/) {
    make $( $<mlhs_item> );
}

method mlhs_item($/, $key) {
    make $( $/{$key} );
}

method lhs($/) {
    make $( $<variable> );
}

method variable($/) {
    make $( $<varname> );
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
    make PAST::Var.new( :name(~$/), :scope('lexical'), :node($/) );
}


method if_stmt($/) {
    my $cond := +$<expr> - 1;
    my $past := PAST::Op.new( $( $<expr>[$cond] ),
                              $( $<comp_stmt>[$cond] ),
                              :pasttype('if'),
                              :node( $/ )
                            );
    if ( $<else> ) {
        $past.push( $( $<else>[0] ) );
    }
    while ($cond != 0) {
        $cond := $cond - 1;
        $past := PAST::Op.new( $( $<expr>[$cond] ),
                               $( $<comp_stmt>[$cond] ),
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
    my $past := PAST::Op.new( $cond, $body, :pasttype('unless'), :node($/) );
    if $<else> {
        $past.push( $( $<else>[0] ) );
    }
    make $past;
}

method while_stmt($/) {
    my $cond := $( $<expr> );
    my $body := $( $<comp_stmt> );
    make PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );
}

method module($/) {
    my $past := PAST::Block.new( $( $<comp_stmt> ), :node($/) );
    my $name := $( $<module_identifier> );
    $past.namespace( $name.name() );
    $past.blocktype('declaration');
    make $past;
}

method functiondef($/) {
    my $name := $( $<fname> );
    my $past := PAST::Block.new( :name($name.name()), :blocktype('declaration'), :node($/) );
    my $body := $( $<comp_stmt> );
    $past.push($body);
    make $past;
}

method fname($/, $key) {
    make $( $/{$key} );
}

method identifier($/) {
    make PAST::Var.new( :name(~$<ident>), :scope('package'), :node($/) );
}

method module_identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

method mrhs($/) {
    make $( $<args> );
}

method command($/) {
    my $op := $( $<operation> );
    my $past := $( $<call_args> );
    $past.unshift($op);
    make $past;
}

method operation($/) {
    make $( $<identifier> );
}

method call_args($/) {
    make $( $<args> );
}

method args($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    for $<arg> {
        $past.push( $($_) );
    }
    make $past;
}

method primary($/, $key) {
    make $( $/{$key} );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method array($/) {
    my $past;
    ## XXX the "new" method should be invoked on the "Array" class (use get_class)
    ## but that doesn't work yet.
    my $getclass := PAST::Op.new( :inline('    %r = new "Array"'), :node($/) );
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

method float($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method string($/) {
    make PAST::Val.new( :value( $($<string_literal>) ), :node($/) );
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

