# Copyright (C) 2008, The Perl Foundation.
# $Id$
class JS::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :node($/), :blocktype('declaration') );
    for $<source_element> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method source_element($/, $key) {
    make $( $/{$key} );
}

method function_common($/) {
    my $past := $( $<block> );
    $past.blocktype('declaration');

    if $<formal_parameter_list> {
        my @params := $<formal_parameter_list>[0]<identifier>;
        for @params {
            my $param := $( $_ );
            $param.scope('parameter');
            $past.push($param);
        }
    }
    make $past;
}

method function_declaration($/) {
    my $past := $( $<function_common> );
    $past.name( $( $<identifier> ).name() );
    make $past
}

method function_expression($/) {
    my $past := $( $<function_common> );
    if $<identifier> {
        my $id := $( $<identifier>[0] );
        # set id as a property

        # set attributes DontDelete and ReadOnly; see ref.pdf, p.83.
    }
    make $past;
}

method statement($/, $key) {
    make $( $/{$key} );
}

method block($/) {
    my $past := PAST::Block.new( :node($/), :blocktype('immediate') );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method if_statement($/) {
    my $past := PAST::Op.new( :pasttype('if'), :node($/) );
    $past.push( $( $<expression> ) );
    $past.push( $( $<statement> ) );
    if $<else> {
        $past.push( $( $<else>[0] ) );
    }
    make $past;
}

method do_while_statement($/) {
    my $cond := $( $<expression> );
    my $block := $( $<statement> );
    make PAST::Op.new( $cond, $block, :pasttype('repeat_while'), :node($/) );
}

method while_statement($/) {
    my $cond := $( $<expression> );
    my $block := $( $<statement> );
    make PAST::Op.new( $cond, $block, :pasttype('while'), :node($/) );
}

method for1_statement($/) {
    my $body := $( $<statement> );
    if $<step> {
        my $step := $( $<step>[0] );
        $body := PAST::Stmts.new( $body, $step, :node($/) );
    }

    my $cond;
    if $<cond> {
        $cond := $( $<cond>[0] );
    }
    else {
        $cond := PAST::Val.new( :value('1'), :returns('Integer'), :node($/) );
    }

    my $loop := PAST::Op.new( $cond,
                              $body,
                              :pasttype('while'),
                              :node($/) );

    if $<init> {
        my $init := $( $<init>[0] );
        make PAST::Stmts.new( $init, $loop, :node($/) );
    }
    else {
        make $loop;
    }
}

method try_statement($/) {
    my $past := PAST::Op.new( :pasttype('try'), :node($/) );
    my $tryblock := $( $<block> );
    $past.push($tryblock);

    if $<catch> {
        my $catchblock := $( $<catch> );
        $past.push($catchblock);
    }
    if $<finally> {
        # the finally block, if present, is always executed. # what about scope?
        my $finallyblock := $( $<finally> );
        $past := PAST::Stmts.new( $past, $finallyblock, :node($/) );
    }
    make $past;
}

method catch($/) {
   my $past := $( $<block> );
   my $exid := $( $<identifier> );

   ##  Add a catch node to the try op that captures the
   ##  exception object into the declared identifier. Thanks to Rakudo for this trick.
   my $catchpir := "    .get_results (%r, $S0)\n    store_lex '" ~ $exid.name() ~ "', %r";
   $past.unshift( PAST::Op.new( :inline( $catchpir ) ) );

   make $past;
}

method finally($/) {
    make $( $<block> );
}

method throw_statement($/) {
    my $expr := $( $<expression> );
    make PAST::Op.new( $expr, :inline('    throw %0'), :node($/) );
}

method return_statement($/) {
    if $<expression> {
        my $expr := $( $<expression>[0] );
        make PAST::Op.new( $expr, :inline('    .return (%0)'), :node($/) );
    }
    else {
        make PAST::Op.new( :inline('    .return ()'), :node($/) );
    }
}

method variable_statement($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<variable_declaration> {
        $past.push( $($_) );
    }
    make $past;
}

method variable_declaration($/) {
    my $var := $( $<identifier> );
    $var.isdecl(1);
    $var.scope('package'); # fix this; change into lexical should we add this to a symbol table?
    if $<assignment_expression> {
        my $initval := $( $<assignment_expression>[0] );
        $var.viviself($initval);
    }
    else {
        $var.viviself('Undef');
    }
    make $var;
}

method empty_statement($/) {
    make PAST::Op.new( :node($/), :inline('    # no-op') );
}

method expression_statement($/) {
    make $( $<expression> );
}

method primary_expression($/, $key) {
    make $( $/{$key} );
}

method member_expression($/) {
    make $( $<primary_expression> );
}

method call_expression($/) {
    my $invocant := $( $<member_expression> );
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.push($invocant);

    my @args := $<arguments><assignment_expression>;
    for @args {
        $past.push( $($_) );
    }
    make $past;
}

method assignment_expression($/) {
    make $( $<primary_expression> );
}


method expression($/) {
   #make $( $<oexpr> );
   make $( $<primary_expression> );
}

method identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method builtin_literal($/) {
    my $past;
    make $past;
}

method object_literal($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.name('ctor');
    for $<property> {
        $past.push( $($_) );
    }
    make $past;
}

method property($/) {
    ## TODO: a property is a key/value pair. The value must be passed as a parameter
    ## and passed as a :named parameter using the key as a name.
    ## How to solve this, as property_name can be a value and a variable (but I think this is
    ## is supposed to be an auto-quoted identifier). Check manual.
    ## For now: this is broken, but it's a start.
    my $prop := $( $<property_name> );
    my $key := PAST::Val.new( $prop.value(), :returns('String'), :node($/) );
    my $val := $( $<expression> );

    $val.named($key);
    make $val;
}


method property_name($/, $key) {
    make $( $/{$key} );
}

method str_literal($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method floating_point_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node( $/ ) );
}

method numeric_literal($/,$key) {
    make $( $/{$key} );
}

method integer_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method hex_integer_literal($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method decimal_literal($/, $key) {
    make $( $/{$key} );
}

method oexpr($/, $key) {
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