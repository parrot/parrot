# class ABC::Grammar::Actions;

# Copyright (C) 2007, The Perl Foundation.
# $Id$

method TOP($/) {
    return $($<program>);
}

method term($/, $key) {
    return $($/{$key});
}

method float($/) {
    return PAST::Val.new( :value( +$/ ), :node($/) );
}

method integer($/) {
    return PAST::Val.new( :value( +$/ ), :node($/) );
}

method variable($/, $key) {
    my $var;
    if ($key eq 'call') {
        $var := PAST::Op.new( $($<EXPR>),
                              :name( ~$<ident> ),
                              :pasttype('call'),
                              :node($/) );
    }
    else {
        $var := PAST::Var.new( :name(~$<ident>), :node($<ident>) );
        if ($key eq 'array') {
            $var := PAST::Var.new( $var, $($<EXPR>),
                                   :scope('keyed'),
                                   :node($/) );
        }
    }
    return $var;
}

method compound_statement($/) {
    return $($<statement_list>);
}

method if_statement($/) {
    my $past := PAST::Op.new( $($<EXPR>),
                              $($<statement>[0]),
                              :pasttype('if'),
                              :node($/) );
    if ($<statement>[1]) {
        $past.push( $($<statement>[1]) );
    }
    return $past;
}

method while_statement($/) {
    return PAST::Op.new( $($<EXPR>),
                         $($<statement>),
                         :pasttype('while'),
                         :node($/) );
}

# method for_statement($/) { ... }

method statement($/, $key) {
    my $past := $( $/{$key} );
    if ($key eq 'EXPR' && $past.pasttype() ne 'assign') {
        $past := PAST::Op.new( PAST::Var.new( :name('last') ),
                               $past,
                               :pasttype('assign'),
                               :lvalue(1) );
        $past := PAST::Op.new( $past,
                               :name('saynum'),
                               :pasttype('call') );
    }
    return $past;
}

method statement_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for @($<statement_list>) {
        $past.push( $($<statement_list>) );
    }
    return $past;
}

method program($/) {
    return $($<statement_list>);
}


method EXPR($/, $key) {
    if ($key eq 'end') { return $($<expr>); }

    ##  $key eq 'reduce'
    my $past := PAST::Op.new( :node($/),
                              :name($<type>),
                              :pasttype($<top><pasttype>),
                              :pirop($<top><pirop>),
                              :islvalue($<top><lvalue>) );
    for @($/) {
        $past.push( $($_) );
    }
    return $past;
}

