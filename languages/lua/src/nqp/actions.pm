# Copyright (C) 2008, The Perl Foundation.
# $Id$


=begin comments

Lua::Grammar::Actions - ast transformations for Lua

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Lua program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments


class Lua::Grammar::Actions;

method TOP($/) {
    my $past := $( $<block> );
    $past.blocktype('declaration');
    make $past;
}

method block($/, $key) {
    our @?BLOCK;
    our $?BLOCK;

    ## A chunk is a sequence of statements, and a chunk is also a block.
    ## See section 2.4.1 of Lua reference manual.

    if $key eq 'open' {
        $?BLOCK := PAST::Block.new( :blocktype('immediate'), :node($/) );
        @?BLOCK.unshift($?BLOCK);
    }
    elsif $key eq 'close' {

        for $<statement> {
            $?BLOCK.push( $($_) );
        }
        ## handle break or return
        if $<end_statement> {
            $?BLOCK.push( $($<last_statement>[0]) );
        }
        make $?BLOCK;

        ## remove this block from scope stack and restore 'current'.
        @?BLOCK.shift();
        $?BLOCK := @?BLOCK[0];
    }

}

method last_statement($/, $key) {
    make $( $/{$key} );
}

method statement($/,$key) {
    make $( $/{$key} );
}

method expression_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<expression> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method do_block($/) {
    make $( $<block> );
}

method if_stat($/) {
    my $cond := +$<expression> - 1;
    my $past := PAST::Op.new( $( $<expression>[$cond] ),
                              $( $<block>[$cond] ),
                              :pasttype('if'),
                              :node( $/ )
                            );
    if ( $<else> ) {
        $past.push( $( $<else>[0] ) );
    }
    while ($cond != 0) {
        $cond := $cond - 1;
        $past := PAST::Op.new( $( $<expression>[$cond] ),
                               $( $<block>[$cond] ),
                               $past,
                               :pasttype('if'),
                               :node( $/ )
                             );
    }
    make $past;
}

method while_stat($/) {
    my $cond  := $( $<expression> );
    my $block := $( $<block> );
    make PAST::Op.new( $cond, $block, :pasttype('while'), :node($/) );
}

method repeat_stat($/) {
    my $cond  := $( $<expression> );
    my $block := $( $<block> );
    make PAST::Op.new( $cond, $block, :pasttype('repeat_until'), :node($/) );
}

method for_stat($/, $key) {
    make $( $/{$key} );
}

method fornum($/) {
    my $past     := PAST::Block.new( :blocktype('immediate'), :node($/) );

    my $var      := $( $<Name> );
    my $initval  := $( $<var> );
    my $limitval := $( $<limit> );
    my $stepval;

    ## if there's a step value, get it, otherwise make it default to 1.
    if $<step> {
        $stepval := $( $<step>[0] );
    }
    else {
        $stepval := PAST::Val.new( :value('1'), :returns('Integer'), :scope($/) );
    }

    ## create the var, limit and step internal variables. Note their names which
    ## are not valid Lua identifiers; this prevents accidental reference to them.
    my $itervar  := PAST::Var.new( :name('(var)'),
                                   :isdecl(1),
                                   :scope('lexical'),
                                   :viviself($initval),
                                   :node($/) );

    my $limitvar := PAST::Var.new( :name('(limit)'),
                                   :isdecl(1),
                                   :scope('lexical'),
                                   :viviself($limitval),
                                   :node($/) );

    my $stepvar  := PAST::Var.new( :name('(step)'),
                                   :isdecl(1),
                                   :scope('lexical'),
                                   :viviself($stepval),
                                   :node($/) );

    $past.push($itervar);
    $past.push($limitvar);
    $past.push($stepvar);


    ## XXX finish this, or, maybe add special functions for doing this for loop.
    ##
    my $body := $( $<block> );

    ## XXX cond1
    my $cond1 := PAST::Op.new( $var, $var, :pasttype('if'), :node($/) );
    ## XXX cond2
    my $cond2 := PAST::Op.new( $var, $var, :pasttype('if'), :node($/) );

    my $cond  := PAST::Op.new( $cond1, $cond2, :pasttype('unless'), :node($/) );
    my $loop  := PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );
    ## XXX increment step here and init $var.
    $past.push($loop);

    make $past;
}

method forlist($/) {
    # XXX todo
    make PAST::Op.new( :inline('    # for-list not implemented'), :node($/) );
}

method break_stat($/) {
    # XXX wait for PCT support.
    make PAST::Op.new( :inline('    # break not implemented'), :node($/) );
}

method return_stat($/) {
    my $past := PAST::Op.new( :node($/) ); # XXX return? wait for PCT support
    if $<expression_list> {
        my $retvals := $( $<expression_list> );
        for @($retvals) {
            $past.push( $_ );
        }
    }
    make $past;
}

method local_stat($/, $key) {
    make $( $/{$key} );
}

method local_function($/) {
    our $?BLOCK;
    ## local function foo() ... end translates to 2 statements:
    ## local foo; foo = function() ... end.
    ##
    my $past := PAST::Stmts.new( :node($/) );
    my $name := $( $<Name> );
    $name.isdecl(1);
    $name.scope('lexical');

    my $func := $( $<function_body> );

    ## assign the function object to the specified name. It's only a binding;
    ## it's not the name of the function object, which remains anonymous.
    my $bind := PAST::Op.new( $name, $func, :pasttype('bind'), :node($/) );
    $past.push($bind);

    ## register the name as a local in the current block's symbol table.
    $?BLOCK.symbol( $name.name(), :scope('lexical') );
    make $past;
}

method local_declaration($/) {
    our $?BLOCK;
    my $past := PAST::Stmts.new( :node($/) );

    ## get number of names and experssions
    my $numnames := +$<Name>;

    my $expressions;
    my $numexprs;
    if $<expression_list> {
        $expressions := $($<expression_list>[0]);
        $numexprs    := +@($expressions); ##+$<expression_list>[0]<expression>;
    }
    else {
        $numexprs    := 0;
    }

    ## while there are enough names and expressions, use the expressions
    ## to initialize the names.
    my $index := 0;
    while (($index != $numnames) && ($index != $numexprs)) {

        my $name := $( $<Name>[$index] );
        ## XXX why doesn't @($expressions)[$index] work?
        my $expr := $( $<expression_list>[0]<expression>[$index] );
        #my $expr := $expressions[$index];


        $name.isdecl(1);
        $name.scope('lexical');
        $name.viviself($expr);
        $past.push($name);
        $?BLOCK.symbol( $name.name(), :scope('lexical') );
        $index := $index + 1;
    }

    ## we may have run out of expressions, initialize rest of names
    ## to 'nil' and declare them.
    while ($index != $numnames)  {
        my $name := $( $<Name>[$index] );
        $name.isdecl(1);
        $name.scope('lexical');
        $past.push($name);
        $?BLOCK.symbol( $name.name(), :scope('lexical') );
        $index := $index + 1;
    }

    make $past;
}

method function_stat($/) {
    my $name := $( $<function_name> );
    my $body := $( $<function_body> );
    make PAST::Op.new( $name, $body, :pasttype('bind'), :node($/) );
}

method function_name($/) {
    ## XXX improve this
    ## how to handle method name (the part after ":")?
    ## how to implement Lua's "object model"? Lua doesn't have really an object model,
    ## but maybe it's nice to cheat and use OO-like model anyhow.

    my $count := +$<Name>;
    my $past := $( $<Name>[0] );
    my $idx  := 1;

    while ($idx != $count) {

        my $name := $( $<Name>[$idx] );
        $name.scope('keyed');
        my $field := PAST::Val.new( :value($name.name()), :returns('String') );

        ## XXX viviself should not be here; you have to create the tables yourself
        ## but for now this is nice.
        $past.viviself('Hash');

        $past := PAST::Var.new( $past, $field, :scope('keyed'), :node($/) );

        $idx := $idx + 1;
    }

    make $past;
}

method function_body($/) {
    my $past := $( $<parameter_list> );
    $past.push( $( $<block> ) );
    make $past;
}

method name_list($/) {
    my $past := PAST::VarList.new( :node($/) );
    for $<Name> {
        $past.push( $($_) );
    }
    make $past;
}

method parameter_list($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    if $<name_list> {
        my $params := $( $<name_list> );
        for @($params) {
            $_.scope('parameter');
            $past.push( $_ );

            ## enter the symbol into this function block's symbol table.
            $past.symbol( $_.name(), :scope('lexical') );
        }
    }
    if $<vararg> {
        $past.push( PAST::Var.new( :name('arg'),
                                   :scope('parameter'),
                                   :slurpy(1),
                                   :node($/) ) );
                                   ## XXX check out this name "arg";
                                   ## otherwise, how to refer to it?
                                   ## Maybe munge it a bit, so it becomes
                                   ## an illegal Lua identifer, such as "(arg)".
    }
    make $past;
}

method expression_stat($/) {
    ## if there's an expression list,this is an assignment, otherwise it should
    ## be a function call.
    if $<expression_list> {
        ## XXX just handle 1 rhs value now
        my $lhs := $( $<primary_expression>[0] );
        my $rhs := $( $<expression_list>[0] );
        $rhs := $rhs[0];
        make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :node($/) );

    }
    else {
        ## primary expression must be a function call
        my $past   := $( $<primary_expression>[0] );
        my $iscall := $past['iscall'];

        ## Check here whether it's a call. If it's not, that's an error.
        ## This is the same way that Lua checks this (see lparser.c).
        unless $iscall {
            # XXX use $/.panic + emit line no where error occurred.
            print("Syntax error: '=' or function arguments expected\n");
        }

        make $past;
    }
}

method primary_expression($/) {
    my $past := $( $<prefix_expression> );

    for $<slice_expression> {
        my $slice := $( $_ );
        $slice.unshift($past);
        $past := $slice;
    }

    ## get a reference to the last slice, this will later be
    ## checked for being a function call.
    my $numslices := +$<slice_expression>;
    if $numslices {
        my $lastslice := $($<slice_expression>[$numslices - 1]);

        ## copy the 'iscall' flag from this last slice to the
        ## primary_expression past op.
        ## XXX Not all slice expressions set a flag yet. Fix that.
        $past['iscall'] := $lastslice['iscall'];
    }

    make $past;
}

method function_args($/, $key) {
    my $past := $( $/{$key} );
    ## set a flag on this past that it's a function call.
    $past['iscall'] := 1;
    make $past;
}

method string_argument($/) {
    ## this rule is there to create a :pasttype('call') node;
    ## something that is otherwise done by method arguments(),
    ## but not by <quote>. This is a wrapper rule to solve that.
    my $arg  := $( $<quote> );
    make PAST::Op.new( $arg, :pasttype('call'), :node($/) );
}

method arguments($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    if $<expression_list> {
        ## get the PAST node of expression_list, which is just a
        ## Stmts node.
        my $args := $( $<expression_list>[0] );
        ## interpret this object as an array, and stuff all elements
        ## into the :pasttype('call') $past object.
        for @($args) {
            $past.push( $_ );
        }
    }
    make $past;
}

method slice_expression($/, $key) {
    make $( $/{$key} );
}

method field($/, $key) {
    make $( $/{$key} );
}


method field_name($/) {
    my $field := $( $<Name> );
    $field := PAST::Val.new( :returns('String'), :value($field.name()), :node($/) );
    ## XXX __index meta-method should be invoked from the "mt" table...
    ## Read more lua reference stuff.
    make PAST::Op.new( $field, :name('__index'), :pasttype('callmethod'), :node($/) );
}

method method_call($/) {
    ## XXX handle the 'self' parameter, this is the 'table' on which
    ## this method is invoked. This is the 'previous slice_expression.
    ## Possibly need to rewrite grammar in order to make this easier.
    my $past := $( $<function_args> );
    ## set the name of the method on the PAST::Op( :pasttype('call')) object.
    my $method := $( $<Name> );
    $past.name( $method.name() );
    make $past;
}

method constructor($/) {
    if $<tablefieldlist> {
        make $( $<tablefieldlist>[0] );
    }
    else {
        make PAST::Op.new( :inline('    %r = new "Hash"'), :node($/) );
    }
}

method tablefieldlist($/) {
    my $past := PAST::Stmts.new( :node($/) );
    my $ctor := PAST::Op.new( :inline('    %r = new "Hash"'), :node($/) );
    $past.push($ctor);


    ## XXX think a bit more about how to initialize tables and the indexing
    ## mechanism; use __index meta-method?
    ## Currently it doesn't work correctly.
    ##
    for $<tablefield> {
        my $field := $($_);

        ## how to reuse this %r generated in $ctor?
        $field.unshift($ctor);
        $past.push( $field );
    }
    make $past;
}

method tablefield($/, $key) {
    make $( $/{$key} );
}

method expr_field($/) {
    # XXX get index somehwere; keep track.
    my $index := PAST::Val.new( :returns('Integer'),
                                :value('0'),
                                :node($/) );

    my $expr := $( $<expression> );
    make PAST::Op.new( $index,
                       $expr,
                       :pasttype('callmethod'),
                       :name('__index'),
                       :node($/) );
}

method record_field($/) {
    my $field := $( $<field> );
    my $expr  := $( $<expression> );
    ## should this be "rawset"? See Lua ref.man.
    ## <field> already creates a call to '__index', add the 2nd operand to it here:
    $field.push($expr);
    make $field;
}

method index($/) {
    my $expr := $( $<expression> );
    make PAST::Op.new( $expr, :name('__index'), :pasttype('callmethod'), :node($/) );
}

method prefix_expression($/, $key) {
    make $( $/{$key} );
}

method simple_expression($/, $key) {
    make $( $/{$key} );
}

method Name($/) {
    our $?BLOCK;

    my $name := ~$/;
    my $scope;
    if $?BLOCK.symbol($name) {
        $scope := 'lexical';
    }
    else {
        $scope := 'package';
    }

    make PAST::Var.new( :name($name), :scope($scope), :viviself('Undef'), :node($/) );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method quote($/) {
    make PAST::Val.new( :value( $($<string_literal>) ), :node($/) );
}

method nil($/) {
    ## XXX does this work? Maybe get_global "nil"?
    make PAST::Val.new( :returns('Undef'), :node($/) );
}

method true($/) {
    # XXX change type into boolean
    make PAST::Val.new( :value('1'), :returns('Integer'), :node($/) );
}

method false($/) {
    # XXX change type into boolean
    make PAST::Val.new( :value('0'), :returns('Integer'), :node($/) );
}

method expression($/, $key) {
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

