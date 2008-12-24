# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

Pipp::Grammar::Actions - AST transformations for Pipp

This file contains the methods that are used by the parse grammar
to build the PAST representation of a Pipp program.
Each method below corresponds to a rule in F<src/pct/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

=cut

class Pipp::Grammar::Actions;

method TOP($/, $key) {
    our @?BLOCK; # A stack of PAST::Block
    our $?BLOCK; # The current block. Used for managing the symbol table. 
   
    if $key eq 'open' {
        $?BLOCK := PAST::Block.new(
                       :node($/),
                       :hll('pipp')
                   );
        
        # set up scope 'package' for the superglobals
        # TODO: use a loop
        $?BLOCK.symbol_defaults( :scope('lexical') );
        $?BLOCK.symbol( :scope('package'), '$_GET' );
        $?BLOCK.symbol( :scope('package'), '$_POST' );
        $?BLOCK.symbol( :scope('package'), '$_SERVER' );
        $?BLOCK.symbol( :scope('package'), '$_GLOBALS' );
        $?BLOCK.symbol( :scope('package'), '$_FILES' );
        $?BLOCK.symbol( :scope('package'), '$_COOKIE' );
        $?BLOCK.symbol( :scope('package'), '$_SESSION' );
        $?BLOCK.symbol( :scope('package'), '$_REQUEST' );
        $?BLOCK.symbol( :scope('package'), '$_ENV' );
        @?BLOCK.unshift($?BLOCK);
    }
    else {
        # retrieve the block created in the "if" section in this method.
        my $past := @?BLOCK.shift();

        # a PHP script consists of a list of statements
        for $<sea_or_code> {
            $past.push( $($_) );
        }

        make $past;
    }
}

method sea_or_code($/, $key) {
    make $( $/{$key} );
}

# The sea, text, surrounding the island, code, is printed out
method SEA($/) {
    make PAST::Op.new(
             PAST::Val.new(
                 :value(~$/),
                 :returns('PhpString')
             ),
             :name('echo'),
             :node($/)
         );
}

method code_short_tag($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method code_echo_tag($/) {
    my $past := PAST::Stmts.new( :node($/) );

    my $echo := $( $<arguments> );
    $echo.name( 'echo' );
    $past.push( $echo );

    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method code_script_tag($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method block($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }

    make $past;
}

method statement($/, $key) {
    make $( $/{$key} );
}

method inline_sea_short_tag($/) {
   make PAST::Op.new(
            PAST::Val.new(
                :value(~$<SEA_empty_allowed>),
                :returns('PhpString')
            ),
            :name('echo'),
            :node($/)
        );
}

method namespace_statement($/) {
    our $?NS := ~$<NAMESPACE_NAME>; 
    my $past := PAST::Op.new(
                    :pasttype('call'),
                    :name('echo'),
                    :node($/),
                    PAST::Val.new(
                        :value('Encountered namespace: ' ~ $?NS ~ "\n"),
                        :returns('PhpString'),
                    ),
                );
    make $past;
}

method return_statement($/) {
    my $past := PAST::Op.new(
                   :name('return'),
                   :pasttype('call'),
                   :node( $/ ),
                   $( $/<expression> )
               );

    make $past;
}

method require_once_statement($/) {
    my $past := PAST::Op.new(
                   :name('require'),
                   :pasttype('call'),
                   :node( $/ ),
                   $( $/<quote> )
               );

    make $past;
}

method echo_statement($/) {
    my $past := $( $<arguments> );
    $past.name( 'echo' );

    make $past;
}

method expression_statement($/) {
    make $( $<expression> );
}

method function_call($/) {
    my $past := $( $<arguments> );
    $past.name( ~$<FUNCTION_NAME> );

    make $past;
}

method method_call($/) {
    my $past := PAST::Op.new(
                    :name( ~$<METHOD_NAME> ),
                    :pasttype( 'callmethod' ),
                    :name( ~$<METHOD_NAME> ),
                    $( $<var> )
                );

    make $past;
}

method constructor_call($/) {
    my $past := PAST::Op.new(
                    :name( 'new' ),
                    :pasttype( 'callmethod' ),
                    PAST::Var.new(
                        :name( ~$<CLASS_NAME> ),
                        :scope( 'package' ),
                    )
                );

    make $past;
}

method constant($/) {
    make PAST::Op.new(
             :name('constant'),
             PAST::Val.new(
                 :returns('PhpString'),
                 :value( ~$<CONSTANT_NAME> ),
             )
         );
}

# can be mergerd with constant
method class_constant($/) {
    make PAST::Op.new(
             :name('constant'),
             PAST::Val.new(
                 :returns('PhpString'),
                 :value( ~$/ ),
             )
         );
}

# class constants could probably also be set in a class init block
method class_constant_definition($/) {
    my $past := PAST::Block.new( :name('class_constant_definition') );
    my $loadinit := $past.loadinit();
    $loadinit.unshift(
       PAST::Op.new(
           :pasttype('call'),
           :name('define'),
           :node( $/ ),
           PAST::Val.new(
               :value( 'Foo::' ~ ~$<CONSTANT_NAME> ),
               :returns('PhpString'),
           ),
           $( $<literal> ),
       )
    );

    make $past;
}

method arguments($/) {
    my $past := PAST::Op.new(
                    :pasttype('call'),
                    :node($/)
                );
    for $<expression> {
        $past.push( $($_) );
    }

    make $past;
}

method conditional_expression($/) {
    my $past := PAST::Op.new(
                    $( $<expression> ),
                    $( $<block> ),
                    :node($/)
                );
    make $past;
}

method do_while_statement($/) {
    my $past := PAST::Op.new(
                    $( $<expression> ),
                    $( $<block> ),
                    :pasttype('repeat_while'),
                    :node($/)
                );
    make $past;
}

method if_statement($/) {
    my $past := $( $<conditional_expression> );
    $past.pasttype('if');
        
    my $else := undef;
    if +$<else_clause> {
        $else := $( $<else_clause>[0] );
    }
    my $first_eif := undef;
    if +$<elseif_clause> {
        my $count := +$<elseif_clause> - 1;
        $first_eif := $( $<elseif_clause>[$count] );
        while $count != 0 {
            my $eif := $( $<elseif_clause>[$count] );
            $count--;
            my $eifchild := $( $<elseif_clause>[$count] );
            if ($else) {
                $eif.push($else);
            }
            $eif.push($eifchild);
        }
        if $else && +$<elseif_clause> == 1 {
            $first_eif.push($else);
        }
     }

     if $first_eif {
         $past.push($first_eif);
     }
     elsif $else {
         $past.push($else);
     }

     make $past;
}

method else_clause($/) {
    make $( $<block> );
}

method elseif_clause($/) {
    my $past := $( $<conditional_expression> );
    $past.pasttype('if');

    make $past;
}

method var_assign($/) {
    make PAST::Op.new(
             $( $<var> ),
             $( $<expression> ),
             :pasttype('bind'),
         );
}

method array_elem($/) {
    my $past_var_name := $( $<VAR_NAME> );
    $past_var_name.scope('package');
    $past_var_name.viviself('PhpArray');

    make PAST::Var.new(
             $past_var_name,
             $( $<expression> ),
             :scope('keyed'),
             :viviself('PhpNull'),
             :lvalue(1)
         );
}

method var($/, $key) {
    make $( $/{$key} );
}

method VAR_NAME($/) {
    our $?PIPP_CURRENT_SCOPE;
    our $?BLOCK;

    my $isdecl;
    if $?BLOCK.symbol( ~$/ ) {
        # symbol is already present
        $isdecl := 0;
    }
    else {
        $isdecl := 1;
        $?BLOCK.symbol(
            ~$/,
            :scope( $?PIPP_CURRENT_SCOPE ?? $?PIPP_CURRENT_SCOPE !! 'package' )
        );
    }

    make PAST::Var.new(
             :scope( $?PIPP_CURRENT_SCOPE ?? $?PIPP_CURRENT_SCOPE !! 'package' ),
             :name(~$/),
             :viviself('PhpNull'),
             :lvalue(1),
         );
}

method this($/) {
    make PAST::Op.new(
             :inline( "%r = self" )
         );
}

method member($/) {
    make PAST::Op.new(
             :inline( "%r = self" )
         );
}


method while_statement($/) {
    my $past := $( $<conditional_expression> );
    $past.pasttype('while');
    make $past;
}

method for_statement($/) {
    my $init  := $( $<var_assign> );
    my $cond  := $( $<expression>[0] );
    my $work  := PAST::Stmts.new( $( $<block> ), $( $<expression>[1] ) );
    
    my $while := PAST::Op.new(
                       $cond,
                       $work,
                       :pasttype('while'),
                 );

    make PAST::Stmts.new( $init, $while );
}


# Handle the operator precedence table.
method expression($/, $key) {
    if ($key eq 'end') {
        make $( $<expr> );
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


method term($/, $key) {
    make $( $/{$key} );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method TRUE($/) {
    make PAST::Val.new(
             :value( 1 ),
             :returns('PhpBoolean'),
             :node($/)
         );
}

method FALSE($/) {
    make PAST::Val.new(
             :value( 0 ),
             :returns('PhpBoolean'),
             :node($/)
         );
}

method NULL($/) {
    make PAST::Val.new(
             :value( 0 ),
             :returns('PhpNull'),
             :node($/)
         );
}

method INTEGER($/) {
    make PAST::Val.new(
             :value( ~$/ ),
             :returns('PhpInteger'),
             :node($/)
         );
}

method NUMBER($/) {
    make PAST::Val.new(
             :value( +$/ ),
             :returns('PhpFloat'),
             :node($/)
         );
}

method function_definition($/) {

    # PHP has two scopes: local to functions and global
    our $?PIPP_CURRENT_SCOPE := 'lexical';

    # note that $<param_list> creates a new PAST::Block.
    my $past := $( $<param_list> );
    # TODO: set $?BLOCK

    $past.name( ~$<FUNCTION_NAME> );
    $past.control('return_pir');
    $past.push( $( $<block> ) );

    $?PIPP_CURRENT_SCOPE := '';

    make $past;
}

# nested functions are not supported yet
method ENTER_FUNCTION_DEF($/) {
    our $?PIPP_CURRENT_SCOPE;
    $?PIPP_CURRENT_SCOPE := 'lexical';
}
method EXIT_FUNCTION_DEF($/) {
    our $?PIPP_CURRENT_SCOPE;
    $?PIPP_CURRENT_SCOPE := 'package';
}

method class_method_definition($/) {

    # note that $<param_list> creates a new PAST::Block.
    my $past := $( $<param_list> );
    # TODO: set $?BLOCK

    $past.name( ~$<METHOD_NAME> );
    $past.blocktype( 'method' );
    $past.control('return_pir');
    $past.push( $( $<block> ) );

    make $past;
}

method param_list($/) {

    my $past := PAST::Block.new(
                    :blocktype('declaration'),
                    :node($/)
                );
    # TODO: set $?BLOCK
    my $arity := 0;
    for $<VAR_NAME> {
        my $param := $( $_ );
        $param.scope('parameter');
        $past.push($param);

        # enter the parameter as a lexical into the block's symbol table
        # TODO: lexical by default
        $past.symbol(
             :scope('lexical'),
             $param.name()
        );
        $arity++;
    }
    $past.arity( $arity );

    make $past;
}

method class_definition($/, $key) {
    our @?BLOCK; # A stack of PAST::Block
    our $?BLOCK; # The current block. Used for managing the symbol table. 

    if $key eq 'open' {
        # TODO: set $?BLOCK
    }
    else {
        # TODO: put this into the 'if' branch
        $?BLOCK := PAST::Block.new(
                       :node($/),
                       :blocktype('declaration'),
                       :pirflags( ':init :load' )
                   );
        @?BLOCK.unshift($?BLOCK);
        my $past := @?BLOCK.shift();
        $past.namespace( $<CLASS_NAME><ident> );
        $past.push( PAST::Stmts.new(
                        PAST::Op.new(
                            :inline(   "$P0 = get_root_global ['parrot'], 'P6metaclass'\n"
                                     ~ "$P2 = $P0.'new_class'('" ~ $<CLASS_NAME> ~ "')\n" ),
                            :pasttype( 'inline' )
                        )
                    )
        );

        # nothing to do for $<const_definition,
        # setup of class constants is done in the 'loadinit' node
        for $<class_constant_definition> {
           $past.push( $($_) );
        }

        # TODO: set $?BLOCK
        my $methods_block := PAST::Block.new( :blocktype('immediate') );
        for $<class_member_definition> {
            $methods_block.symbol(
                ~$_<VAR_NAME><ident>,
                :scope('attribute')
            );
        }
        for $<class_method_definition> {
            $methods_block.push( $($_) );
        }
        $past.push( $methods_block );

        make $past;
    }
}


method quote($/) {
    make $( $<quote_expression> );
}

method quote_expression($/, $key) {
    my $past;
    if $key eq 'quote_regex' {
        our $?NS;
        # TODO: set $?BLOCK
        $past := PAST::Block.new(
            $<quote_regex>,
            :compiler('PGE::Perl6Regex'),
            :namespace($?NS),
            :blocktype('declaration'),
            :node( $/ )
        );
    }
    elsif $key eq 'quote_concat' {
        if +$<quote_concat> == 1 {
            $past := $( $<quote_concat>[0] );
        }
        else {
            $past := PAST::Op.new(
                :name('list'),
                :pasttype('call'),
                :node( $/ )
            );
            for $<quote_concat> {
                $past.push( $($_) );
            }
        }
    }
    make $past;
}

method quote_concat($/) {
    my $terms := +$<quote_term>;
    my $count := 1;
    my $past := $( $<quote_term>[0] );
    while ($count != $terms) {
        $past := PAST::Op.new(
            $past,
            $( $<quote_term>[$count] ),
            :pirop('concat'),
            :pasttype('pirop')
        );
        $count := $count + 1;
    }
    make $past;
}

method quote_term($/, $key) {
    my $past;
    if ($key eq 'literal') {
        $past := PAST::Val.new(
            :value( ~$<quote_literal> ),
            :returns('PhpString'),
            :node($/)
        );
    }
    else {
        $past := $( $/{ $key } );
    }

    make $past;
}

method curly_interpolation($/) {
    make $( $<var> );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
