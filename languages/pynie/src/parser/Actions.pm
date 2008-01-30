# $Id$
# Copyright (C) 2007, The Perl Foundation.

class Pynie::Grammar::Actions;

method TOP($/) {
    make $( $<file_input> );
}

method file_input($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method suite($/, $key) {
    make $( $/{$key} );
}

method suite1($/) {
    make $( $<stmt_list> );
}

method suite2($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push($($_));
    }
    make $past;
}

method statement($/, $key) {
    make $($/{$key});
}

method stmt_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<simple_stmt> {
        $past.push( $($_) );
    }
    make $past;
}

method compound_stmt($/, $key) {
    make $($/{$key});
}

method if_stmt($/) {
    my $cond := +$<expression> - 1;
    my $past := PAST::Op.new( $( $<expression>[$cond] ),
                              $( $<suite>[$cond] ),
                              :pasttype('if'),
                              :node( $/ )
                            );
    if ( $<else> ) {
        $past.push( $( $<else>[0] ) );
    }
    while ($cond != 0) {
        $cond := $cond - 1;
        $past := PAST::Op.new( $( $<expression>[$cond] ),
                               $( $<suite>[$cond] ),
                               $past,
                               :pasttype('if'),
                               :node( $/ )
                             );
    }
    make $past;
}

method while_stmt($/) {
    my $past := PAST::Op.new( $( $<expression> ),
                              $( $<suite> ),
                              :pasttype('while'),
                              :node( $/ )
                            );
    if $<else> {
        ##  handle 'else' clause
        $past := PAST::Stmts.new( $past,
                                  $( $<else>[0] ),
                                  :node( $/ )
                                );
    }
    make $past;
}

method funcdef($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my $name := $( $<funcname> );
    $past.name( $name.name() );
    my $suite := $( $<suite> );
    $past.push($suite);
    make $past;
}

method funcname($/) {
    make $( $<identifier> );
}

method pass_stmt($/) {
    ## pass statement doesn't do anything, but do create a PAST
    ## node to prevent special case code.
    make PAST::Op.new( :inline('    # pass'), :node($/) );
}

method simple_stmt($/, $key) {
    make $( $/{$key} );
}

method expression_list($/) {
    my $past;
    if (+$<expression> == 1) {
        $past := $( $<expression>[0] );
    }
    else {
        my $past := PAST::Op.new( :name('listmaker'), :node($/) );
        for $<expression> {
            $past.push( $($_) );
        }
    }
    make $past;
}


method identifier($/) {
    make PAST::Var.new( :name( ~$/ ),
                        :scope('package'),
                        :node($/)
                      );
}


method print_stmt($/) {
    my $past := PAST::Op.new( :name('printnl'), :node($/) );
    for $<expression> {
        $past.push( $($_) );
    }
    if $/[0] {
        $past.name('print');
    }
    make $past;
}


method expression($/, $key) {
    make $( $<or_test>[0] );
}

method or_test($/) {
    my $count := +$<and_test> - 1;
    my $past := $( $<and_test>[$count] );
    while $count != 0 {
        $count := $count - 1;
        my $past := PAST::Op.new( $($<and_test>[$count]),
                                  $past,
                                  :pasttype('if')
                                );
    }
    make $past;
}

method and_test($/) {
    my $count := +$<not_test> - 1;
    my $past := $( $<not_test>[$count] );
    while $count != 0 {
        $count := $count - 1;
        my $past := PAST::Op.new( $($<not_test>[$count]),
                                  $past,
                                  :pasttype('unless')
                                );
    }
    make $past;
}


method not_test($/, $key) {
    make $( $<in_test> );
}


method in_test($/) {
    make $($<is_test>[0]);
}


method is_test($/) {
    make $($<comparison>[0]);
}

method comparison($/, $key) {
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

method primary($/) {
    make $( $<atom> );
}

method atom($/, $key) {
    make $( $/{$key} );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method floatnumber($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method stringliteral($/, $key) {
    make $( $/{$key} );
}

method shortstring($/) {
    make PAST::Val.new( :value( ~$/[0] ), :node($/) );
}

method parenth_form($/) {
    make $( $<expression_list>[0] );
}

method assignment_stmt($/) {
    make PAST::Op.new( $($<target_list>),
                       $($<expression_list>),
                       :pasttype('bind'),
                       :node($/)
                     );
}

method target_list($/) {
    my $past := $( $<target>[0] );
    make $( $<target>[0] );
}

method target($/, $key) {
    my $past := $( $/{$key} );
    $past.lvalue(1);
    make $past;
}

