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
    # XXX is a different block needed here? check JS scope rules.
    my $past := PAST::Block.new( :node($/), :blocktype('immediate') );
    $past.push( $( $<statements> ) );
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

method for2_statement($/) {
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}

method for3_statement($/) {
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}

method for4_statement($/) {
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}
method labelled_statement($/) {
    ## XXX handle the label in $<identifier>
    make $( $<statement> );
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


method switch_statement($/) {
    my $past := PAST::Stmts.new( :node($/) );
    my $expr := $( $<expression> );

    for $<case_block><case_clause> {
        # get the 'if' statement that implements the case semantics
        my $case := $($_);
        # set the switch expression as the second child of the
        # condition of the 'if' statement, which is the first child
        # at index 0.
        $case[0].push($expr);

        # add this case to the list of statements
        $past.push($case);
    }

    if $<case_block><default_clause> {
        my $defaultcase := $( $<case_block><default_clause>[0] );

        # XXX what to do with it? How to execute this only if the other
        # cases failed?
        $past.push($defaultcase);
    }

    make $past;
}


method case_clause($/) {
    ## XXX this needs rework.
    ## How to fall through the cases?
    ## How to exit when a "break" statement is parsed?
    ##
    my $expr := $( $<expression> );
    my $past := PAST::Op.new( :pasttype('if'), :node($/) );

    ## this is taken from rakudo:
    my $match_past := PAST::Op.new( :name('infix:~~'),
                                    :pasttype('call'),
                                    :node($/)
                                  );

    # set the "case" expression as the first child of the infix:~~
    # operator; the expression that is "matched" is available in
    # the method "switch_statement".
    $match_past.push($expr);

    # set the (incomplete) match_past as the condition for the
    # if statement. this will be completed in the top-level rule.
    $past.push($match_past);

    my $stmts := $( $<statements> );

    # set this block of statements as the 'if' block.
    $past.push($stmts);

    make $past;
}

method default_clause($/) {
    make $( $<statements> );
}

method statements($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method with_statement($/) {
    ## XXX incomplete
    my $past;

    my $expr := $( $<expression> );
    # call GetValue on $expr (ecmascript reference p.68)
    my $val  := PAST::Op.new( $expr, :name('GetValue'), :pasttype('call'), :node($/) );
    # call ToObject on this result
    my $obj  :=PAST::Op.new( $val, :name('ToObject'), :pasttype('call'), :node($/) );

    # XXX how to add this obj to the "scope chain"??
    my $stat := $( $<statement> );

    # XXX for now, set past just to stat.
    $past := $stat;

    make $past;
}

method primary_expression($/, $key) {
    # XXX handle "this"
    #if $key eq 'this' {
    #}
    #else {
        make $( $/{$key} );
    #}
}


method call_expression($/) {
    my $invocant := $( $<member_expression> );
    my $past     := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.push($invocant);

    my @args := $<arguments><assignment_expression>;
    for @args {
        $past.push( $($_) );
    }

    for $<post_call_expr> {
        my $postexpr := $( $_ );
        # XXX apply postexpr on $past
    }

    make $past;
}

method post_call_expr($/, $key) {
    make $( $/{$key} );
}

method assignment_expression($/) {
    my $past := $( $<conditional_expression> );

    # get number of lhs_expressions
    my $lhsexpr := +$<lhs_expression>;

    # assignments such as 'a=b=c' are evaluated from right to left
    # first c is assigned to b, that result (b) is assigned to a.
    # therefore, loop through the array backwards.
    while $lhsexpr != 0 {
        # generate the name of the assignment operator
        my $op  := 'infix:' ~ ~$<assignop>[$lhsexpr - 1];
        my $lhs := $( $<lhs_expression>[$lhsexpr - 1] );
        $past := PAST::Op.new( $lhs, $past, :name($op), :pasttype('call'), :node($/) );
        $lhsexpr := $lhsexpr - 1;
    }
    make $past;
}

method conditional_expression($/) {
    make $( $<logical_or_expression> );
}

method unary_expression($/) {
    my $past := $( $<postfix_expression> );
    my $unop := +$<unop> + 0;
    while $unop != 0 {
        # get the operators in reverse order, that is closest to
        # the operand (postfix_expression)
        my $op := $( $<unop>[$unop - 1] );
        # set the current $past as the operand for that operation
        $op.push($past);
        # and update $past for the next one (or for the make statement)
        $past := $op;
        $unop := $unop - 1;
    }
    make $past;
}

method unop($/) {
    # create a call op to invoke the specified unary operand.
    my $operator := 'prefix:' ~ ~$<op>;
    make PAST::Op.new( :name($operator), :pasttype('call'), :node($/) );
}

method postfix_expression($/) {
    my $past := $( $<lhs_expression> );
    if $<postfixop> {
        # create a string "postfix:++" or "postfix:--"
        my $postfixop := 'postfix:' ~ ~$<postfixop>[0];
        # create an invocation of this operator, providing
        # the <lhs_expression> as its operand
        $past := PAST::Op.new( $past,
                               :pasttype('call'),
                               :name($postfixop),
                               :node($/)
                             );
    }
    make $past;
}

method expression($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<assignment_expression> {
        $past.push( $( $_ ) );
    }
    make $past;
}

#######
method lhs_expression($/, $key) {
    make $( $/{$key} );
}

method member_expression($/) {
    my $member := $( $<member> );
    if $<arguments> {
        # $<member> is the invocant
        my $past := PAST::Op.new( $member, :pasttype('call'), :node($/) );
        my @args := $<arguments><assignment_expression>;
        for @args {
            $past.push( $($_) );
        }
        make $past;
    }
    else {
        make $member;
    }
}



method member($/) {
    my $past;
    if $<primary_expression> {
        $past := $( $<primary_expression> );
    }
    elsif $<function_expression> {
        $past := $( $<function_expression> );
    }

    for $<index> {
        my $idx := $( $_ );
        # XXX apply index on current $past
    }

    make $past;
}

method index($/, $key) {
    make $( $/{$key} );
}

method new_expression($/) {
    make $( $<member_expression> );
}

method identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :viviself('Undef'), :node($/) );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method builtin_literal($/) {
    # XXX handle "true", "false" and "null"
    my $past;
    make $past;
}

method object_literal($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.name('Object');
    for $<property> {
        $past.push( $($_) );
    }
    make $past;
}

method property($/) {
    ## TODO: a property is a key/value pair. The value must be passed as a parameter
    ## and passed as a :named parameter using the key as a name.
    ##
    ## XXX figure out whether this is the way to go, or to use "setattribute", so use
    ## parrot's actual object system instead of hashtables.
    ##
    ## How to solve this, as property_name can be a value and a variable (but I think this is
    ## is supposed to be an auto-quoted identifier). Check manual.
    ## For now: this is broken, but it's a start.
    my $key  := $( $<property_name> );
    #my $key  := PAST::Val.new( $prop, :returns('String'), :node($/) );
    my $val  := $( $<expression> );

    $val.named($key);
    make $val;
}


method property_name($/, $key) {
    my $propname := $( $/{$key} );
    my $past := PAST::Op.new( :inline('    $S0 = %0'), :node($/) );
    $past.push($propname);
    make $past;
}

method array_literal($/) {
    my $past := PAST::Op.new( :pasttype('call'), :name('Array'), :node($/) );

    make $past;
}

method element_list($/) {

}

method elision($/) {
    # return number of commas.
    my $value := +$<comma>;
    # print($value);
    make PAST::Val.new( :value($value), :returns('Integer'), :node($/) );
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

method logical_or_expression($/, $key) {
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

