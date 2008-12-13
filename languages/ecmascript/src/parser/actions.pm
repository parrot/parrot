# Copyright (C) 2008, The Perl Foundation.
# $Id$
class JS::Grammar::Actions;

method TOP($/, $key) {
    our $?BLOCK;
    our @?BLOCK;

    if $key eq 'open' {
        ## create a 'global' current block and stuff it into the scope stack.
        $?BLOCK := PAST::Block.new( :blocktype('declaration'), :node($/) );
        @?BLOCK.unshift($?BLOCK);
    }
    elsif $key eq 'close' {
        # retrieve the current block from the scope stack
        my $past := @?BLOCK.shift();
        for $<source_element> {
            $past.push( $( $_ ) );
        }
        make $past;
    }
}

method source_element($/, $key) {
    make $( $/{$key} );
}

method function_common($/) {
    our @?BLOCK;
    our $?BLOCK;

    my $past := $( $<formal_parameter_list> );

    ## only after having parsed the block can we get its PAST;
    ## this is just a Stmts node, the function body.
    $past.push( $( $<block> ) );

    ## remove the current block from the scope stack; restore
    ## the current block to the "previous" block, at the top of
    ## the stack (position 0).
    @?BLOCK.shift();
    $?BLOCK := @?BLOCK[0];

    $past.control('return_pir');

    make $past;
}

method formal_parameter_list($/) {
    our $?BLOCK;
    our @?BLOCK;

    ## the only place for formal parameters to live is in a function
    ## block object, so create it here already. It can be decorated
    ## with other function stuff when handling function_common.
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );

    ## set the 'current' block to this $past, and stuff it onto the
    ## scope stack (in case of nested functions).
    $?BLOCK := $past;
    @?BLOCK.unshift($past);

    for $<identifier> {
        my $parameter := $( $_ );
        $parameter.scope('parameter');
        ## register the parameter as a local variable.
        $?BLOCK.symbol( $parameter.name(), :scope('lexical') );
        $past.push($parameter);
    }
    make $past;
}

method function_declaration($/) {
    my $past := $( $<function_common> );
    $past.name( $( $<identifier> ).name() );
    make $past
}

method function_expression( $/) {
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

method statements($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method block($/) {
    ## Just any block does not define a different scope, so don't
    ## create a PAST::Block. In cases where this is needed (functions)
    ## a block can be wrapped around this Stmts node.
    make $( $<statements> );
}

method if_statement($/) {
    my $cond := $( $<expression> );
    my $then := $( $<statement> );
    my $past := PAST::Op.new( $cond, $then, :pasttype('if'), :node($/) );
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

## for1_statement: for ( <init>? ; <cond>? ; <step>? ) <statement>
##
## translates to:
##
## <init>
## while (<cond>) {
##   <statement>
##   <step>
## }
##
method for1_statement($/) {
    my $body := $( $<statement> );

    ## if there's a step, create a new compound statement node,
    ## which consists of the pair ($body, $step).
    if $<step> {
        my $step := $( $<step>[0] );
        $body := PAST::Stmts.new( $body, $step, :node($/) );
    }

    ## if there's a condition, get that expression; if there is none,
    ## a 'true' condition is implicit, so create this value, in this
    ## case the number '1'.
    my $cond;
    if $<cond> {
        $cond := $( $<cond>[0] );
    }
    else {
        $cond := PAST::Val.new( :value('1'), :returns('Integer'), :node($/) );
    }

    ## now create a while loop, giving it the condition and body.
    my $loop := PAST::Op.new( $cond, $body, :pasttype('while'), :node($/) );

    ## if there's an init step, it is evaluated before the loop, so
    ## create a compound statement node ($init, $loop).
    if $<init> {
        my $init := $( $<init>[0] );
        make PAST::Stmts.new( $init, $loop, :node($/) );
    }
    else {
        make $loop;
    }
}

method for2_statement($/) {
    # XXX todo
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}

method for3_statement($/) {
    # XXX todo
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}

method for4_statement($/) {
    # XXX todo
    my $past;
    my $body := $( $<statement> );
    $past := $body;
    make $past;
}

method labelled_statement($/) {
    # XXX labels dont work properly.
    my $label   := $( $<identifier> ).name() ~ ':' ;
    my $labelop := PAST::Op.new( :inline($label), :node($/) );
    my $stat    := $( $<statement> );
    make PAST::Stmts.new( $labelop, $stat, :node($/) );
}

method continue_statement($/) {
    # XXX todo
    my $jumpop := '    goto LXXX';
    make PAST::Op.new( :inline($jumpop), :node($/) );
}

method break_statement($/) {
    # XXX todo
    my $jumpop := '    goto LXXX';
    make PAST::Op.new( :inline($jumpop), :node($/) );
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
        ## the finally block, if present, is always executed.
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
   my $catchpir := "    .get_results (%r)\n    store_lex '" ~ $exid.name() ~ "', %r";
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
    my $past := PAST::Op.new( :pasttype('return'), :node($/) );
    if $<expression> {
        my $expr := $( $<expression>[0] );
        $past.push($expr);
    }
    make $past;
}

method variable_statement($/) {
    ## each variable declared in this statement becomes a separate PIR
    ## statement; therefore create a Stmts node.
    my $past := PAST::Stmts.new( :node($/) );
    for $<variable_declaration> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method variable_declaration($/) {
    our $?BLOCK;

    my $var  := $( $<identifier> );
    my $name := $var.name();
    $var.isdecl(1);
    $var.scope('lexical');

    if $?BLOCK.symbol( $name ) {
        ## XXX warning of duplicate declaration?
    }
    else { ## enter it if it's not there yet
        $?BLOCK.symbol( $name, :scope('lexical') );
    }

    ## handle initialization value
    if $<assignment_expression> {
        my $initval := $( $<assignment_expression>[0] );
        $var.viviself($initval);
    }
    else {
        $var.viviself('Undef'); # XXX should be JavaScript undefined.
    }

    make $var;
}

method empty_statement($/) {
    ## to prevent special cases for the empty statement, just create a comment.
    make PAST::Op.new( :node($/), :inline('    # empty statement') );
}

method expression_statement($/) {
    make $( $<expression> );
}

method switch_statement($/) {
    # XXX fix this.
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
    make $( $/{$key} );
}

method regular_expression_literal ($/) {
    make PAST::Val.new( :value( ~$<regular_expression_literal> ), :node($/) );
}

method this($/) {
    ## XXX wait for PAST support for 'self'
    ## load 'self' into a register; when this PAST node is used as a child somewhere
    ## this register will be used. This step is superfluous, but PAST does not support
    ## PIR's 'self' special variable.
    make PAST::Op.new( :inline('    %r = self'), :node($/) );
}

method call_expression($/) {
    my $invocant := $( $<member_expression> );

    ## the $<arguments> rule already creates a :pasttype('call') node.
    my $past := $( $<arguments> );
    $past.unshift($invocant);

    for $<post_call_expr> {
        my $postexpr := $( $_ );

        ## the $invocant of this $postexpr is $past; set it as the first
        ## child, so that it is evaluated first, and then invoked.
        $postexpr.unshift($past);

        ## make it work in a chain, like foo()()()(); In case the loop ends
        ## here, $postexpr is the argument to "make"; otherwise, it's unshifted
        ## onto the next $postexpr as the first child.
        $past := $postexpr;
    }

    make $past;
}

method post_call_expr($/, $key) {
    make $( $/{$key} );
}

method assignment_expression_X($/) {
    my $past := $( $<conditional_expression> );

    ## get number of lhs_expressions
    my $lhsexpr := +$<lhs_expression>;

    ## assignments such as 'a=b=c' are evaluated from right to left
    ## first c is assigned to b, that result (b) is assigned to a.
    ## therefore, loop through the array backwards.
    while $lhsexpr != 0 {
        $lhsexpr := $lhsexpr - 1;

        ## generate the name of the assignment operator: 'infix:<operator>'
        my $op  := 'infix:' ~ ~$<assignop>[$lhsexpr];
        my $lhs := $( $<lhs_expression>[$lhsexpr] );

        ## invoke this operator-sub, with $lhs and the $past so far as left/right operands.

        if $op eq 'infix:=' {          # XXX += and friends won't work this way; solve that
            $past   := PAST::Op.new( $lhs, $past, :pasttype('bind'), :node($/) );
        }
        else {
            $past   := PAST::Op.new( $lhs, $past, :name($op), :pasttype('call'), :node($/) );
        }

        ## maybe a lookup table, mapping "+=" to "add" etc.

    }
    make $past;
}

method conditional_expression($/) {
    my $past  := $( $<logical_or_expression> );

    ## handle the "? :" ternary operator if present
    if $<then> {
        $past := PAST::Op.new(  $past,
                                $( $<then>[0] ),
                                $( $<else>[0] ),
                                :pasttype('if'),
                                :node($/) );
    }
    make $past;
}

method unary_expression($/) {
    my $past := $( $<postfix_expression> );
    my $unop := +$<unop>;

    while $unop != 0 {
        ## get the operators in reverse order, that is closest to
        ## the operand (postfix_expression)
        $unop  := $unop - 1;
        my $op := $( $<unop>[$unop] );

        ## set the current $past as the operand for that operation
        $op.push($past);

        ## and update $past for the next one (or for the make statement)
        $past := $op;
    }
    make $past;
}

method unop($/) {
    ## create a call op to invoke the specified unary operand.
    ## this unary operator is named 'prefix:<operator>'.
    my $operator := 'prefix:' ~ ~$<op>;
    make PAST::Op.new( :name($operator), :pasttype('call'), :node($/) );
}

method postfix_expression($/) {
    my $past := $( $<lhs_expression> );
    if $<postfixop> {
        ## create a string "postfix:++" or "postfix:--"
        my $postfixop := 'postfix:' ~ ~$<postfixop>[0];

        ## create an invocation of this operator, providing
        ## the <lhs_expression> as its operand
        $past := PAST::Op.new( $past,
                               :pasttype('call'),
                               :name($postfixop),
                               :node($/)
                             );
    }
    make $past;
}

method arguments($/) {
    ## an arguments node always implies a function call;
    ## create it here; unshift the invocant later when it's available.
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );

    ## push all arguments onto this 'call' op.
    for $<assignment_expression> {
        $past.push( $($_) );
    }
    make $past;
}

method expression($/) {
    ## and expression is a comma-separated list of assignment_expressions;
    ## in other words, just a list of statements. Coincidentally, the
    ## result of the last assignment_expression is returned, which is
    ## exactly what is specified by ECMAScript.
    my $past := PAST::Stmts.new( :node($/) );
    for $<assignment_expression> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method lhs_expression($/, $key) {
    make $( $/{$key} );
}

method member_expressionX($/) {
    my $member := $( $<member_prefix> );

    ## if there are any arguments, $member is invoked with these arguments.
    if $<arguments> {
        ## the <arguments> node creates the :pasttype('call') op
        my $past := $( $<arguments> );

        ## set $member as the first child which implies it's the invocant.
        $past.unshift($member);
        make $past;
    }
    else {
        make $member;
    }
}

method member_expression($/) {
    my $past := $( $<member_prefix> );

    ## for each index, $past acts as the invocant or main object on
    ## which some operation is executed; therefore $past must be the
    ## first child, so unshift it. Then, $past is assigned this result
    ## preparing for either the next index or as argument for 'make'.
    for $<member_suffix> {
        my $idx := $( $_ );
        $idx.unshift($past);
        $past := $idx;
    }

    make $past;
}

method member_prefix($/, $key) {
    make $( $/{$key} );
}

method member_suffix($/, $key) {
    ## get the index expression
    my $idx := $( $/{$key} );

    ## create a keyed access operation, setting the expression as a child
    ## the object to be indexed will be unshifted on this node, effectively
    ## acting as the container (the first child). Neat huh?
    my $past := PAST::Var.new( $idx, :scope('keyed'), :node($/) );

    ## XXX Maybe an index should be handled by an operation, so that the
    ## past must become a PAST::Op( :pasttype('call') ... ). Think of this later.
    make $past;
}

method identifier_field($/) {
    ## an identifier field is an identifier that is auto-quoted; it's a field
    ## as in: foo.bar, which means foo["bar"]. Therefore, make a string from
    ## this identifier.
    my $id := $( $<identifier> );
    make PAST::Val.new( :returns('String'), :value($id.name()), :node($/) );
}

method new_expression($/) {
    ## get the invocant of 'new'
    my $past := $( $<member_expression> );

    ## for each occurrence of 'new', create a 'call' op, giving the current
    ## past as argument. This is done 'inside out', so the last 'new' is invoked
    ## first, so to say.
    for $<sym> {
        $past := PAST::Op.new( $past, :name('new'), :pasttype('call'), :node($/) );
    }
    make $past;
}

method identifier($/) {
    our $?BLOCK;
    my $name := ~$/;
    my $scope;
    ## try to find the current identifier in the current block's symbol table;
    ## if present, the scope is lexical, otherwise it's 'package'.
    if $?BLOCK.symbol( $name ) {
        $scope := 'lexical';
    }
    else {
        $scope := 'package';
    }
    make PAST::Var.new( :name($name),
                        :scope($scope),
                        :node($/)
                        ,:viviself('Undef') );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method builtin_literal($/, $key) {
    make $( $/{$key} );
}

method true($/) {
    # XXX change this into type a ECMAScript type, 'Boolean' or whatever
    make PAST::Val.new( :returns('Integer'), :value('1'), :node($/) );
}

method false($/) {
    # XXX change this into type 'Boolean' or whatever
    make PAST::Val.new( :returns('Integer'), :value('0'), :node($/) );
}

method null($/) {
    # XXX would this work?
    make PAST::Var.new( :name('null'), :scope('package'), :node($/) );
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

    ## XXX my $key  := PAST::Val.new( $prop, :returns('String'), :node($/) );
    my $val  := $( $<assignment_expression> );

    $val.named($key);
    make $val;
}


method property_name($/, $key) {
    ## XXX
    my $propname := $( $/{$key} );
    my $past := PAST::Op.new( :inline('    $S0 = %0'), :node($/) );
    $past.push($propname);
    make $past;
}

method array_literal($/) {
    ## XXX todo
    my $past := PAST::Op.new( :pasttype('call'), :name('Array'), :node($/) );

    make $past;
}

method element_list($/) {
    ## XXX todo
}

method elision($/) {
    ## return number of commas.
    my $value := +$<comma>;
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

#method logical_or_expression($/, $key) {
method assignment_expression($/, $key) {
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

