# Copyright (C) 2008, Parrot Foundation.
# $Id$


=begin comments

Squaak::Grammar::Actions - ast transformations for Squaak

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Squaak program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class Squaak::Grammar::Actions;

method TOP($/, $key) {
    our @?BLOCK;
    our $?BLOCK;

    if $key eq 'open' {
        ## create the top-level block here; any top-level variable
        ## declarations are entered into this block's symbol table.
        ## Note that TOP *must* deliver a PAST::Block with blocktype
        ## "declaration".
        $?BLOCK := PAST::Block.new( :blocktype('declaration'), :node($/) );
        $?BLOCK.symbol_defaults( :scope('package') );
        @?BLOCK.unshift($?BLOCK);
    }
    else {
        ## retrieve the block created in the "if" section in this method.
        my $past := @?BLOCK.shift();

        for $<stat_or_def> {
            $past.push($_.ast);
        }
        make $past;
    }
}

method stat_or_def($/, $key) {
    make $/{$key}.ast;
}

method statement($/, $key) {
    make $/{$key}.ast;
}

method if_statement($/) {
    my $cond := $<expression>.ast;
    my $then := $<block>.ast;
    my $past := PAST::Op.new( $cond, $then, :pasttype('if'), :node($/) );

    ## if there's an else clause, add it to the PAST node.
    if $<else> {
        $past.push( $<else>[0].ast );
    }
    make $past;
}

method while_statement($/) {
    my $cond := $<expression>.ast;
    my $body := $<block>.ast;
    make PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );
}

## for var <ident> = <expr1> , <expr2> do <block> end
##
## translates to:
## do
##   var <ident> = <expr1>
##   while <ident> <= <expr2> do
##     <block>
##     <ident> = <ident> + 1
##   end
## end
##
method for_statement($/) {
    our $?BLOCK;
    our @?BLOCK;

    my $init := $<for_init>.ast;

    ## cache the name of the loop variable
    my $itername := $init.name();

    ## create another PAST::Var node for the loop variable, this one is used
    ## for the loop condition; the node in $init has a isdecl(1) flag and a
    ## viviself object; $init represents the declaration of the loop var,
    ## $iter represents the loop variable in normal usage.
    my $iter := PAST::Var.new( :name($itername), :scope('lexical'), :node($/) );

    ## the body of the loop consists of the statements written by the user and
    ## the increment instruction of the loop iterator.

    my $body := @?BLOCK.shift();
    $?BLOCK  := @?BLOCK[0];
    for $<statement> {
        $body.push( $_.ast );
    }

    ## if a step was specified, use that; otherwise, use the default of +1.
    ## Note that a negative step will NOT work (unless YOU fix that :-) ).
    ##
    my $step;
    if $<step> {
        my $stepsize := $<step>[0].ast;
        $step := PAST::Op.new( $iter, $stepsize, :pirop('add'), :node($/) );
    }
    else { ## default is increment by 1
        $step := PAST::Op.new( $iter, :pirop('inc'), :node($/) );
    }
    $body.push($step);

    ## while loop iterator <= end-expression
    my $cond := PAST::Op.new( $iter, $<expression>.ast, :name('infix:<=') );
    my $loop := PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );

    make PAST::Stmts.new( $init, $loop, :node($/) );
}

method for_init($/) {
    our $?BLOCK;
    our @?BLOCK;

    ## create a new scope here, so that we can add the loop variable
    ## to this block here, which is convenient.
    $?BLOCK := PAST::Block.new( :blocktype('immediate'), :node($/) );
    @?BLOCK.unshift($?BLOCK);

    my $iter := $<identifier>.ast;
    ## set a flag that this identifier is being declared
    $iter.isdecl(1);
    $iter.scope('lexical');
    ## the identifier is initialized with this expression
    $iter.viviself( $<expression>.ast );

    ## enter the loop variable as a local into the symbol table.
    $?BLOCK.symbol($iter.name(), :scope('lexical'));

    make $iter;
}

method try_statement($/) {
    ## get the try block
    my $try := $<try>.ast;

    ## create a new PAST::Stmts node for the catch block;
    ## note that no PAST::Block is created, as this currently
    ## has problems with the exception object. For now this will do.
    my $catch := PAST::Stmts.new( :node($/) );
    $catch.push( $<catch>.ast );

    ## get the exception identifier;
    my $exc := $<exception>.ast;
    $exc.isdecl(1);
    $exc.scope('lexical');
    $exc.viviself( PAST::Val.new( :value(0) ) );

    ## generate instruction to retrieve the exception objct (and the exception message,
    ## that is passed automatically in PIR, this is stored into $S0 (but not used).
    my $pir := "    .get_results (%r)\n"
             ~ "    store_lex '" ~ $exc.name() ~ "', %r";

    $catch.unshift( PAST::Op.new( :inline($pir), :node($/) ) );
    ## do the declaration of the exception object as a lexical here:
    $catch.unshift( $exc );

    make PAST::Op.new( $try, $catch, :pasttype('try'), :node($/) );
}

method exception($/) {
    our $?BLOCK;

    my $exc := $<identifier>.ast;
    ## the exception identifier is local to the exception handler
    $?BLOCK.symbol($exc.name(), :scope('lexical'));
    make $exc;
}

method throw_statement($/) {
    make PAST::Op.new( $<expression>.ast, :pirop('throw'), :node($/) );
}

method block($/, $key) {
    our $?BLOCK; ## the current block
    our @?BLOCK; ## the scope stack

    if $key eq 'open' {
        $?BLOCK := PAST::Block.new( :blocktype('immediate'), :node($/) );
        @?BLOCK.unshift($?BLOCK);
    }
    else {
        ## retrieve the current block, remove it from the scope stack
        ## and restore the "current" block.
        my $past := @?BLOCK.shift();
        $?BLOCK  := @?BLOCK[0];

        for $<statement> {
            $past.push( $_.ast );
        }
        make $past
    }
}

method return_statement($/) {
    my $expr := $<expression>.ast;
    make PAST::Op.new( $expr, :pasttype('return'), :node($/) );
}

method do_block($/) {
    make $<block>.ast;
}

method assignment($/) {
    my $rhs := $<expression>.ast;
    my $lhs := $<primary>.ast;
    $lhs.lvalue(1);
    make PAST::Op.new( $lhs, $rhs, :pasttype('bind'), :node($/) );
}

method sub_definition($/) {
    our @?BLOCK;
    our $?BLOCK;

    ## note that $<parameters> creates a new PAST::Block.
    my $past := $<parameters>.ast;
    my $name := $<identifier>.ast;

    ## set the function name
    $past.name( $name.name() );
    for $<statement> {
        $past.push( $_.ast );
    }

    ## remove the block from the scope stack
    ## and restore the "current" block
    @?BLOCK.shift();
    $?BLOCK := @?BLOCK[0];

    $past.control('return_pir');
    make $past;
}

method variable_declaration($/) {
    our $?BLOCK;

    my $past := $<identifier>.ast;
    $past.isdecl(1);
    $past.scope('lexical');

    ## if there's an initialization value, use it to viviself the variable.
    if $<expression> {
        $past.viviself( $<expression>[0].ast );
    }
    else { ## otherwise initialize to undef.
        $past.viviself( 'Undef' );
    }

    ## cache this identifier's name
    my $name := $past.name();

    ## if the symbol is already declared, emit an error. Otherwise,
    ## enter it into the current block's symbol table.
    if $?BLOCK.symbol($name) {
        $/.panic("Error: symbol " ~ $name ~ " was already defined\n");
    }
    else {
        $?BLOCK.symbol($name, :scope('lexical'));
    }
    make $past;
}

method parameters($/) {
    our $?BLOCK;
    our @?BLOCK;

    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    for $<identifier> {
        my $param := $_.ast;
        $param.scope('parameter');
        $past.push($param);

        ## enter the parameter as a lexical into the block's symbol table
        $past.symbol($param.name(), :scope('lexical'));
    }

    ## set this block as the current block, and store it on the scope stack
    $?BLOCK := $past;
    @?BLOCK.unshift($past);

    make $past;
}

method sub_call($/) {
    my $invocant := $<primary>.ast;
    my $past     := $<arguments>.ast;
    ## set the invocant as the first child of the PAST::Op(:pasttype('call')) node
    $past.unshift( $invocant );
    make $past;
}

method arguments($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    for $<expression> {
        $past.push( $_.ast );
    }
    make $past;
}

method primary($/) {
    my $past := $<identifier>.ast ;
    for $<postfix_expression> {
        my $expr := $_.ast;
        ## set the current $past as the first child of $expr;
        ## $expr is either a key or an index; both are "keyed"
        ## variable access, where the first child is assumed
        ## to be the aggregate.
        $expr.unshift($past);
        $past := $expr;
    }
    make $past;
}

method postfix_expression($/, $key) {
    make $/{$key}.ast;
}

method key($/) {
    my $key := $<expression>.ast;

    make PAST::Var.new( $key, :scope('keyed'),
                              :vivibase('Hash'),
                              :viviself('Undef'),
                              :node($/) );

}

method member($/) {
    my $member := $<identifier>.ast;
    ## x.y is syntactic sugar for x{"y"}, so stringify the identifier:
    my $key    := PAST::Val.new( :returns('String'), :value($member.name()), :node($/) );

    ## the rest of this method is the same as method key() above.
    make PAST::Var.new( $key, :scope('keyed'),
                              :vivibase('Hash'),
                              :viviself('Undef'),
                              :node($/) );
}

method index($/) {
    my $index := $<expression>.ast;

    make PAST::Var.new( $index, :scope('keyed'),
                                :vivibase('ResizablePMCArray'),
                                :viviself('Undef'),
                                :node($/) );
}

method named_field($/) {
    my $past := $<expression>.ast;
    my $name := $<string_constant>.ast;
    ## the passed expression is in fact a named argument,
    ## use the named() accessor to set that name.
    $past.named($name);
    make $past;
}

method array_constructor($/) {
    ## use the parrot calling conventions to
    ## create an array,
    ## using the "anonymous" sub !array
    ## (which is not a valid Squaak name)
    my $past := PAST::Op.new( :name('!array'), :pasttype('call'), :node($/) );
    for $<expression> {
        $past.push( $_.ast );
    }
    make $past;
}

method hash_constructor($/) {
    ## use the parrot calling conventions to
    ## create a hash, using the "anonymous" sub
    ## !hash (which is not a valid Squaak name)
    my $past := PAST::Op.new( :name('!hash'), :pasttype('call'), :node($/) );
    for $<named_field> {
        $past.push( $_.ast );
    }
    make $past;
}

method term($/, $key) {
    make $/{$key}.ast;
}

method identifier($/) {
    my $name  := ~$/;
    ## instead of ~$/, you can also write ~$<ident>, as an identifier
    ## uses the built-in <ident> rule to match identifiers.
    make PAST::Var.new( :name($name), :viviself('Undef'), :node($/) );
}

method integer_constant($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}

method float_constant($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node($/) );
}

method string_constant($/) {
    make PAST::Val.new( :value( $<string_literal>.ast ), :returns('String'), :node($/) );
}

## Handle the operator precedence table.
method expression($/, $key) {
    if ($key eq 'end') {
        make $<expr>.ast;
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $_.ast );
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

