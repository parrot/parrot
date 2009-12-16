grammar abc::Grammar is HLL::Grammar;

=begin overview

The following is the grammar for abc written as a sequence of
Perl 6 rules.  In each of the rules, the special notation {*}
marks a point in the rule where the corresponding action in
abc::Grammar::Actions is to be invoked (see grammar-actions.pl).
These actions are then used to construct the ast nodes for
the program.

The #= markers at the ends of lines are used to distinguish
among multiple {*} actions within a rule, by passing the value
after the marker as a 'key' argument to the action method. Note
that there must be space between the #= marker and the key.

=end overview

rule TOP {
    ^ <statement_list>
    [ $ || <panic: 'Syntax error'> ]
}

rule statement_list {
    <statement>? [ ';' <statement>? ]*
}

proto token statement { <...> }
    # 'break'
    # 'continue'
    # 'halt'
    # 'return' [ '(' <EXPR> ')' ]?
token statement:sym<expr> { <EXPR> }


token statement:sym<if> {
    <sym> :s '(' <EXPR> ')' <statement> [ 'else' <statement> ]?
}


token statement:sym<while> {
    <sym> :s '(' <EXPR> ')' <statement>
}


token statement:sym<for> {
    <sym> :s '(' <EXPR> ';' <EXPR> ';' <EXPR> ')' <statement>
}


token statement:sym<compound> {
    :s '{' ~ '}' <statement_list>
}


token statement:sym<string> {
    <.before \"> <quote_EXPR: ':q'>
}


## recognize terms

proto token term { <...> }


token term:sym<float> {
    [
    | \d+ '.' \d*
    | '.' \d+
    ]
}

token term:sym<int> { \d+ }

token term:sym<variable> {
    $<name>=[ <[a..z]> <[_a..z0..9]>* ]
    [ '(' <EXPR> ')' ]?
}

token term:sym<circumfix> { '(' <.ws> <EXPR> ')' }

# OPS

## autoincrement
token postfix:sym<++> { <sym> <O('%unary')> }
token postfix:sym<--> { <sym> <O('%unary')> }
token prefix:sym<++>  { <sym> <O('%unary')> }
token prefix:sym<-->  { <sym> <O('%unary')> }

## negation
token prefix:sym<-> { <sym> <O('%unary, :pirop<neg>')> }

## exponentiation
token infix:sym<^> { <sym> <O('%exponentiation, :pirop<pow NN>')> }

## multiplicative
token infix:sym<*> { <sym> <O('%multiplicative, :pirop<mul>')> }
token infix:sym</> { <sym> <O('%multiplicative, :pirop<div>')> }
token infix:sym<%> { <sym> <O('%multiplicative, :pirop<mod>')> }

## additive
token infix:sym<+> { <sym> <O('%additive, :pirop<add>')> }
token infix:sym<-> { <sym> <O('%additive, :pirop<sub>')> }

## assignment
token infix:sym<=> { <sym> <O('%assignment, :pasttype<bind>')> }

## relational
token infix:sym<==> { <sym> <O('%relational, :pirop<iseq INn>')> }
token infix:sym<!=> { <sym> <O('%relational, :pirop<isne INn>')> }
token infix:sym«<»  { <sym> <O('%relational, :pirop<islt INn>')> }
token infix:sym«<=» { <sym> <O('%relational, :pirop<isle INn>')> }
token infix:sym«>»  { <sym> <O('%relational, :pirop<isgt INn>')> }
token infix:sym«>=» { <sym> <O('%relational, :pirop<isge INn>')> }

## boolean
token prefix:sym<!> { <sym> <O('%neg, :pirop<not>')> }
token infix:sym<&&> { <sym> <O('%and')> }
token infix:sym<||> { <sym> <O('%or')> }

INIT {
    NQP::Grammar.O(':prec<y=>, :assoc<unary>', '%unary');
    NQP::Grammar.O(':prec<w=>, :assoc<left>',  '%exponentiation');
    NQP::Grammar.O(':prec<u=>, :assoc<left>',  '%multiplicative');
    NQP::Grammar.O(':prec<t=>, :assoc<left>',  '%additive');
    NQP::Grammar.O(':prec<m=>, :assoc<right>', '%assignment');
    NQP::Grammar.O(':prec<n=>, :assoc<non>',   '%relational');
    NQP::Grammar.O(':prec<o=>, :assoc<unary>',  '%neg');
    NQP::Grammar.O(':prec<p=>, :assoc<left>',  '%and');
    NQP::Grammar.O(':prec<q=>, :assoc<left>',  '%or');
}

## vim: expandtab sw=4 ft=perl6
