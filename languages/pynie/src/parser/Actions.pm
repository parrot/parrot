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

method parameter_list($/) {
    ## the only place for parameters to live is in a function block;
    ## create that here already.
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );

    ## handle normal parameters
    for $<defparameter> {
        $past.push( $($_) );
    }

    ## handle '*' <identifier>
    if $<excess_positional_parameter> {
        my $slurpparam := $( $<excess_positional_parameter> );
        $past.push( $slurpparam );
    }
    ## handle '**' <identifier>
    if $<excess_keyword_parameter> {
        my $dictparam := $( $<excess_keyword_parameter> );
        $past.push( $dictparam );
    }
    make $past;
}

method defparameter($/) {
    my $past := $( $<parameter> );
    $past.scope('parameter');

    ## add the default value for this parameter, if any
    if $<expression> {
        my $defaultvalue := $( $<expression>[0] );
        $past.viviself( $defaultvalue );
    }
    make $past;
}

method parameter($/, $key) {
    make $( $/{$key} )
}

method sublist($/) {
    ## XXX
}

method excess_positional_parameter($/) {
    ## a :slurpy argument
    my $past := $( $<identifier> );
    $past.scope('parameter');
    $past.slurpy(1);
    make $past;
}

method excess_keyword_parameter($/) {
    ## a :named, :slurpy argument
    my $past := $( $<identifier> );
    $past.scope('parameter');
    $past.slurpy(1);
    $past.named(1);
    make $past;
}

method lambda_form($/) {
    my $past;
    if $<parameter_list> {
        $past := $( $<parameter_list>[0] );
    }
    else { # if no parameters, create a block here:
        $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    }
    ## handle the function body XXX must this be a /return/ <expr> statement?
    my $expr := $( $<expression> );
    $past.push($expr);
    make $past;
}

method funcdef($/) {
    my $past;

    if $<parameter_list> {
        $past := $( $<parameter_list>[0] );
    }
    else {
        $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    }
    my $name := $( $<funcname> );
    $past.name( $name.name() );
    my $suite := $( $<suite> );
    $past.push($suite);
    make $past;
}

method funcname($/) {
    make $( $<identifier> );
}

method argument_list($/) {
    my $past;

    if $<positional_arguments> {
        $past := $( $<positional_arguments> );
    }
    else {
        $past := PAST::Op.new( :pasttype('call'), :node($/) );
    }

    if $<keyword_arguments> {
        for $( $<keyword_arguments> ) {
        ## XXX should this be: for @( $<keyword_arguments> )??
            $past.push( $_ );
        }
    }

    make $past;
}

method positional_arguments($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    for $<expression> {
        $past.push($($_));
    }
    make $past;
}

method keyword_arguments($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    for $<keyword_item> {
        $past.push($($_));
    }
    make $past;
}

method keyword_item($/) {
    my $past := $( $<expression> );
    my $name := $( $<identifier> );

    ## XXX why doesn't this work??
    #$past.named( $name.name() );
    #make PAST::Val.new( :value('100'), :named('x'), :node($/) );
    make $past;
}

method classname($/) {
    make $( $<identifier> );
}

method classdef($/) {
    ## a class definition is a set of statements
    my $past := PAST::Stmts.new( :node($/) );

    ## create an anonymous sub that generates the class
    my $cdef  := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my $cname := $( $<classname> );
    my $pir   := '    $P0 = newclass "' ~ $cname.name() ~ '"';
    $cdef.push( PAST::Op.new( :inline($pir) ) );
    $cdef.pirflags(':init :anon');

    ## handle parents, if available
    if $<inheritance> {
        my $parent    := $( $<inheritance>[0] );
        my $pir       := '    addparent $P0, %0';
        my $addparent := PAST::Op.new( $parent, :inline($pir), :node($/) );
        $cdef.push($addparent);
    }
    $past.push($cdef);

    ## handle class contents
    my $suite := $( $<suite> );

    make $past;
}

method pass_stmt($/) {
    ## pass statement doesn't do anything, but do create a PAST
    ## node to prevent special case code.
    make PAST::Op.new( :inline('    # pass'), :node($/) );
}

method raise_stmt($/) {
    ## XXX finish this
    my $numexpr := +$<expression>;

    ## think of better structure to handle this:
    if $numexpr == 0 {

    }
    elsif $numexpr == 1 {

    }
    elsif $numexpr == 2 {
        #my $exctype  := $( $<expression> );
        #my $excvalue := $( $<expression> );
    }
    elsif $numexpr == 3 {

    } # else will never happen.

    ## XXX for now this'll do:
    my $exc  := PAST::Op.new( :inline('    %r = new "Exception"'), :node($/) );
    my $pir  := '    throw %0';
    my $past := PAST::Op.new( $exc, :inline($pir), :node($/) );

    make $past;
}

method simple_stmt($/, $key) {
    make $( $/{$key} );
}

method expression_stmt($/) {
    make $( $<expression_list> );
}

method expression_list($/) {
    my $past;
    if (+$<expression> == 1) {
        $past := $( $<expression>[0] );
    }
    else {
        $past := PAST::Op.new( :name('listmaker'), :node($/) );
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

method test($/, $key) {
    make $( $/{$key} );
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


method not_test($/) {
    my $past := $( $<in_test> );
    for $<nots> {
        $past := PAST::Op.new( $past, :pirop('not'), :node($/) );
    }
    make $past;
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

method list_iter($/, $key) {
    make $( $/{$key} );
}

method list_for($/) {
    ## XXX
}

method list_if($/) {
    ## XXX
}

method primary($/) {
    my $past := $( $<atom> );
    ## $past is the first child of each <postop>, so unshift it
    ## so it ends up at the front of the list.
    for $<postop> {
        my $postop := $($_);
        $postop.unshift($past);
        $past := $postop;
    }
    make $past;
}

method postop($/, $key) {
    make $( $/{$key} );
}

method call($/, $key) {
    # XXX fix this.
    #make $( $/{$key} );
    if $<argument_list> {
        make $( $<argument_list>[0] );
    }
    else {
        make PAST::Op.new( :pasttype('call'), :node($/) );
    }
}

method subscription($/) {
    make PAST::Var.new( $( $<tuple_or_scalar> ), :scope('keyed'));
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
    if +$<tuple_or_scalar> {
	make $( $<tuple_or_scalar>[0] );
    }
    else {
	make PAST::Op.new( :name('tuplemaker'),
			   :pasttype('call'));
    }
}

method assignment_stmt($/) {
    my $lhs := $($<target_list>);
    my $rhs := $($<expression_list>);
    make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :node($/) );
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

method list_literal($/) {
    my $past := PAST::Op.new( :name('listmaker'),
                              :pasttype('call'));
    for $<expression> {
	$past.push( $($_) );
    }
    make $past;
}

method list_display($/, $key) {
    make $( $/{$key} );
}

method tuple_or_scalar($/, $key) {
    make $( $/{$key} );
}

method tuple_constructor($/) {
    my $past := PAST::Op.new( :name('tuplemaker'),
                              :pasttype('call'));
    for $<expression> {
	$past.push( $($_) );
    }
    make $past;
}
