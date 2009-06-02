# Copyright (C) 2007, Parrot Foundation.
# $Id$

=head1 NAME

abc::Grammar::Actions - ast transformations for abc

=head1 DESCRIPTION

This file contains the methods that are used by the parse
grammar to build the PAST representation of an abc program.
Each method below corresponds to a rule in F<grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the
method.

Some hopefully helpful hints for reading this file:

=over 4

=item

It often helps to refer to the rules in F<grammar.pg> when
looking at the corresponding methods here.

=item

Within a method, C<< $<foo> >> refers to the named capture C<foo>
within the C< $/ > match object.  Normally this is either another
match object or an array of match objects.

=item

The C<make> function and C< .ast > are used to set and retrieve
the I<result object> for a match.  Here, we use the result object
to hold the ast representation of any given match.  So, in the
code below, whenever you see an expression like C<< $<foo>.ast >>,
we're really saying "the ast of C<< <foo> >>".

=back

=cut

class abc::Grammar::Actions;

##  The ast of the entire program is the ast of the
##  top-level <statement_list>.
method TOP($/) {
    make $<statement_list>.ast;
}


##  statement_list:
##    All of the individual statements are held in $<statement>
##    (which is an array).  We start by creating an empty
##    PAST::Stmts node, and then loop through all of the
##    statements, adding the ast of each statement to the
##    PAST::Stmts  node.
method statement_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $_.ast );
    }
    make $past;
}


##  statement:
##    In the parse grammar, we've set up $key to tell us the
##    name of whatever subrule was matched by this statement.
##    We can then use $key to quickly get the subrule's ast
##    with $/{$key}.ast .
##
##    bc(1) expression statements also have special semantics
##    which we handle here.  If a statement is an expression
##    other than assignment, then the value of the expression
##    is also assigned to the C<last> variable and the value
##    printed with a newline.
##    Similarly, if the statement consists of a simple string, it's
##    displayed on the output.
method statement($/, $key) {
    my $past := $/{$key}.ast;
    if ($key eq 'expression' && ~$past.name() ne 'infix:=') {
        my $last := PAST::Var.new( :name('last'),
                                   :scope('package'),
                                   :lvalue(1) );
        $past := PAST::Op.new( $last,
                               $past,
                               :pasttype('bind') );
        $past := PAST::Op.new( $past,
                               :name('saynum'),
                               :pasttype('call') );
    }
    if ($key eq 'string') {
        $past := PAST::Op.new( $past, :pirop('print'));
    }
    make $past;
}


##  if_statement:
##    After parsing an if statement, the conditional
##    expression will be in $<expression>, the "then"
##    statement will be in $<statement>[0], and any
##    "else" statement will be in $<statement>[1].
##    So, we just obtain the asts of these subrule
##    matches and set them as the children of a
##    PAST::Op node with a pasttype of 'if'.
method if_statement($/) {
    my $past := PAST::Op.new( $<expression>.ast,
                              $<statement>[0].ast,
                              :pasttype('if'),
                              :node( $/ ) );
    if ( $<statement>[1] ) {
        $past.push( $<statement>[1].ast );
    }
    make $past;
}


##  while_statement:
##    This is basically the same as if_statement above, except
##    we use a pasttype of 'while'.
method while_statement($/) {
    make PAST::Op.new( $<expression>.ast,
                       $<statement>.ast,
                       :pasttype('while'),
                       :node($/) );
}


##  for_statement:
##    A bc(1) for statement has the form
##        for( expr0 ; expr1 ; expr2 ) body;
##    We transform this into an ast structure that looks like
##        expr0; while (expr1) { body; expr2; }
method for_statement($/) {
    my $past := PAST::Stmts.new( :node($/) );

    #  add the initial "expr0;" node
    $past.push( $<expression>[0].ast );

    #  create the "{ body; expr2; }" part
    my $body := PAST::Stmts.new( $<statement>.ast, $<expression>[2].ast );

    #  now create the "while (expr1) { body; expr2; }" part
    $past.push( PAST::Op.new( $<expression>[1].ast, $body, :pasttype('while')));

    make $past;
}


##  compound_statement:
##    A compound statement is just a list of statements, so we
##    return the ast of its embedded <statement_list>.
method compound_statement($/) {
    make $<statement_list>.ast;
}


##  string:
##    The <string_literal> subrule (inherited from PCT::Grammar)
##    will have set its result object to the string representation
##    of whatever literal we found.  So, we just use this as
##    the value of a PAST::Val node.
method string($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}


##  expression:
##    This is one of the more complex transformations, because
##    our grammar is using the operator precedence parser here.
##    As each node in the expression tree is reduced by the
##    parser, it invokes this method with the operator node as
##    the match object and a $key of 'reduce'.  We then build
##    a PAST::Op node using the information provided by the
##    operator node.  (Any traits for the node are held in $<top>.)
##    Finally, when the entire expression is parsed, this method
##    is invoked with the expression in $<expr> and a $key of 'end'.
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


##  term:
##    Like 'statement' above, the $key has been set to let us know
##    which term subrule was matched.
method term($/, $key) {
    make $/{$key}.ast;
}

##  float/integer:
##    For floating point and integer constants, we simply create
##    a PAST::Val node with the value of the constant.  But, because
##    Parrot's Floats don't know how to properly stringify to ints,
##    we have to use the string representation of the value
##    and tell the compiler what type of value to return.
method float($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node( $/ ) );
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}


##  variable:
##    The <variable> rule is used to match both simple
##    variables ("a") and unary function calls ("a(0)").
##    Once again, the $key tells us what sort of match we have.
##
##    If it's a simple variable, we create a PAST::Var node
##    with the name of the variable and a scope of 'package'.
##    The :viviself('Float') option says that this variable
##    should be initialized as a Float if it doesn't already
##    exist.
##
##    If it's a function call, we create a PAST::Op node
##    to call the subroutine given by $<name> and passing
##    the value of $<expression> as an argument.  The
##    available subroutines are held in F<builtins.pir>.
method variable($/, $key) {
    my $past;
    if ($key eq 'var') {
        $past := PAST::Var.new( :name( ~$<name> ),
                                :scope('package'),
                                :viviself('Float'),
                                :node( $/ )
                              );
    }
    if ($key eq 'call') {
        $past := PAST::Op.new( $<expression>.ast,
                               :name( ~$<name> ),
                               :pasttype('call'),
                               :node( $/ )
                             );
    }
    make $past;
}
