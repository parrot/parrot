# $Id$
# Copyright (C) 2007, Parrot Foundation.

class Pynie::Grammar::Actions;

method TOP($/) {
    my $block := PAST::Block.new( $( $<file_input> ) );
    $block.hll('pynie');
    make $block;
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

method assert_stmt($/) {
    ## assert exp1
    ##
    ## translates to:
    ##
    ## if __debug__:
    ##   if not exp1
    ##

    ## XXX handle exp2.

    my $exp1 := $( $<exp1> );

    ## XXX change into "AssertionError"
    my $exception := PAST::Op.new( :inline('    %r = new "Exception"') );

    my $throwcode := PAST::Op.new( $exception, :pirop('throw'), :node($/) );

    my $debugcode := PAST::Op.new( $exp1, $throwcode,
                                   :pasttype('unless'),
                                   :node($/) );

    my $debugflag := PAST::Var.new( :name('__debug__'),
                                    :scope('package'),
                                    :viviself('Undef'),
                                    :node($/) );

    my $past := PAST::Op.new( $debugflag,
                              $debugcode,
                              :pasttype('if'),
                              :node($/) );

    make $past;
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

method for_stmt($/) {
    # translates to:
    # $P0 = new 'Iterator', <expression_list>
    # while $P0:
    #   i = shift $P0
    #   ...

    # XXX implement complex for syntax

    # XXX right now this uses a Block rather than Stmts so that $iter's scope
    # XXX is confined to this 'for'. Better to use Stmts and make $iter an anonymous register.
    #my $past := PAST::Stmts.new( :node($/) );
    my $past := PAST::Block.new( :blocktype('immediate'), :node($/) );

    # create iterator
    my $list := $( $<expression_list> );
    my $iter := PAST::Var.new(     :name('iter'), :scope('register'), :node($/) );
    my $iterdecl := PAST::Var.new( :name('iter'), :scope('register'), :node($/), :isdecl(1) );
    $past.push( $iterdecl );
    $past.push( PAST::Op.new( $iter, $list,
                              :inline('    %0 = new "Iterator", %1'),
                              :node($/) ) );

    # make loop body
    my $tgt := $( $<target> );
    my $loop := PAST::Stmts.new( :node($/) );
    my $shifted := PAST::Op.new( $iter,
                                 :inline('    %r = shift %0'),
                                 :node($/) );
    $loop.push( PAST::Op.new( $tgt, $shifted, :pasttype('bind'), :node($/) ) );
    $loop.push( $( $<suite> ) );

    $past.push( PAST::Op.new( $iter, $loop,
                              :pasttype('while'),
                              :node($/) ) );
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

    my $expr := $( $<expression> );

    ## add a return statement to this block
    $past.push( PAST::Op.new( $expr, :pasttype('return'), :node($/) ) );
    $past.control('return_pir');
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
    $past.push( $($<suite>) );

    $past.control('return_pir');
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

method del_stmt($/) {
    our $?BLOCK;

    my $targets := $( $<target_list> );

    my $past := PAST::Stmts.new( :node($/) );

    my $pir := "    .local pmc ns\n"
             ~ '    ns = get_hll_namespace';

    $past.push( PAST::Op.new( :inline($pir), :node($/) ) );
    for @($targets) {
        $pir := '    delete ns["' ~ $_.name() ~ '"]';
        $past.push( PAST::Op.new( :inline($pir), :node($/) ) );
    }

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

method try_stmt($/, $key) {
    make $( $/{$key} );
}

method try1_stmt($/) {
    # XXX implement except params, else, finally
    my $try := $($<try>);
    my $handler := $($<except>);
    my $past := PAST::Op.new( $try,
                              $handler,
                              :pasttype('try'),
                              :node($/) );
    make $past;
}

method simple_stmt($/, $key) {
    make $( $/{$key} );
}

method expression_stmt($/) {
    make $( $<expression_list> );
}

method return_stmt($/) {
    my $past := PAST::Op.new( :pasttype('return'), :node($/) );
    if $<expression_list> {
        my $retvals := $( $<expression_list>[0] );
        $past.push($retvals);
    }
    make $past;
}

method global_stmt($/) {
    our $?BLOCK;
    for $<identifier> {
        $?BLOCK.symbol( $( $_ ).name(), :scope('package') );
    }
    ## make a no-op
    make PAST::Op.new( :inline('    # global declaration'), :node($/) );
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
                        :node($/) );
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
    ## XXX incomplete.
    if $key eq 'lambda_form' {
        make $( $<lambda_form> );
    }
    else {
        make $( $<or_test>[0] );
    }
}

method test($/, $key) {
    make $( $/{$key} );
}

method or_test($/) {
    my $count := +$<and_test> - 1;
    my $past := $( $<and_test>[$count] );
    while $count != 0 {
        $count := $count - 1;
        $past := PAST::Op.new( $($<and_test>[$count]),
                                  $past,
                                  :pasttype('unless') );
    }
    make $past;
}

method and_test($/) {
    my $count := +$<not_test> - 1;
    my $past := $( $<not_test>[$count] );
    while $count != 0 {
        $count := $count - 1;
        $past := PAST::Op.new( $($<not_test>[$count]),
                                  $past,
                                  :pasttype('if') );
    }
    make $past;
}


method not_test($/) {
    my $past := $( $<in_test> );
    for $<nots> {
        $past := PAST::Op.new( $past, :pirop('not II'), :node($/) );
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

method attributeref($/) {
    my $attr := $($<identifier>);
    $attr.scope('attribute');
    make $attr;
}

method methodcall($/) {
    my $attrname := $($<identifier>).name();
    my $call := $($<call>);
    $call.pasttype('callmethod');
    $call.name($attrname);
    make $call;
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
    my $lhs     := $( $<target_list> );
    my $explist := $( $<expression_list> );
    my $past    := PAST::Stmts.new( :node($/) );

# XXX For now, we'll only support single assignment.
#    for @($lhs) {
#        my $rhs := $explist.shift();
#        $past.push( PAST::Op.new( $_, $rhs, :pasttype('bind'), :node($/) ) );
#    }
    $past := PAST::Op.new( $lhs.shift(), $explist, :pasttype('bind'), :node($/) );

    make $past;
}

method augop($/, $key) {
    make PAST::Op.new( :pirop($key), :node($/) );
}

method augmented_assignment_stmt($/) {
    my $past := $($<augop>);
    $past.push( $($<target>) );
    $past.push( $($<expression>) );
    make $past;
}

method target_list($/) {
    my $past := PAST::VarList.new( :node($/) );
    for $<target> {
        $past.push( $($_) );
    }
    make $past;
}

method target($/, $key) {
    my $past := $( $/{$key} );
    $past.lvalue(1);
    make $past;
}

method list_literal($/) {
    my $past := PAST::Op.new( :name('listmaker'), :pasttype('call'), :node($/) );
    for $<expression> {
        $past.push( $($_) );
    }
    make $past;
}

method list_display($/, $key) {
    make $( $/{$key} );
}

method dict_display($/) {
    if $<key_datum_list> {
        make $( $<key_datum_list>[0] );
    }
    else {
        ## if there's no list of key_datum items, have 'dictmaker' return an empty
        ## dictionary.
        make PAST::Op.new( :name('dictmaker'), :pasttype('call'), :node($/) );
    }
}

method key_datum_list($/) {
    my $past := PAST::Op.new( :name('dictmaker'), :pasttype('call'), :node($/) );
    for $<key_datum> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method key_datum($/) {
    my $key   := $( $<key> );
    my $value := $( $<value> );
    ## this only works if $key /has/ a name() method
    ## XXX need for some generic solution for all PAST node types.
    my $hashedkey := PAST::Val.new( :value($key.name()) );
    $value.named($hashedkey);
    make $value;
}

method tuple_or_scalar($/, $key) {
    make $( $/{$key} );
}

method tuple_constructor($/) {
    my $past := PAST::Op.new( :name('tuplemaker'), :pasttype('call'), :node($/) );
    for $<expression> {
        $past.push( $($_) );
    }
    make $past;
}
