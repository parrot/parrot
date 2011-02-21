#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.

INIT { pir::load_bytecode('HLL.pbc'); }

grammar Ops::Compiler::Grammar is HLL::Grammar;

rule TOP {
    <body>
    [ $ || <.panic: 'Syntax error'> ]
}

rule body {
    [ <preamble> | <op> ]*
}

token preamble {
    <begin_preamble>
    <preamble_guts>
    <end_preamble>
}

regex preamble_guts {
    .*? <?end_preamble>
}

token begin_preamble {
    ^^'BEGIN_OPS_PREAMBLE'
}

token end_preamble {
    ^^'END_OPS_PREAMBLE'
}

rule op {
    <op_type>? 'op' <op_name=identifier>
    [ '(' <signature> ')' || <.panic: "Fail to parse signature"> ]
    <op_flag>*
    [ <op_body> || <.panic: "Fail to parse op body"> ]
    {*}
}

token op_type {
    [ 'inline' | 'function' ]
}

rule signature { [ [<.ws><op_param><.ws>] ** ',' ]? }

rule op_param {
    <op_param_direction> <op_param_type>
}

token op_param_direction {
    # Order is crucial. NQP doesn't support LTM yet.
    [
    | 'inout'
    | 'inconst'
    | 'invar'
    | 'in'
    | 'out'
    ]
}

token op_param_type {
    # Order is crucial. NQP doesn't support LTM yet.
    [
    | 'INTKEY'
    | 'INT'
    | 'NUM'
    | 'STR'
    | 'PMC'
    | 'KEY'
    | 'LABEL'
    ]
}

rule op_flag {
    ':' <identifier>
}

# OpBody starts with '{' and ends with single '}' on line.
token op_body {
    <?DEBUG>
    <blockoid>
}

proto token quote { <...> }
token quote:sym<apos> { <?[']> <quote_EXPR: ':q'>  }
token quote:sym<dblq> { <?["]> <quote_EXPR: ':q'> }

token macro_param {
    '$' $<num>=<integer> # Up to nine params.
}

rule op_macro {
    <macro_type> <macro_destination> '(' <arg=.EXPR>? ')'
}

token macro_type {
    [
    | 'goto'
    | 'expr'
    | 'restart'
    ]
}

token macro_destination {
    [
    | 'OFFSET'
    | 'ADDRESS'
    | 'NEXT'
    ]
}

token identifier {
    <!keyword> <ident>
}

token keyword {
    [
    |'for' |'if' |'while'
    ]>>
}


# Part of C grammar.

rule statement_list {
    [ <statement> <.eat_terminator> ]*
}

token statement {
    | <statement_control>
    | <op_macro>
    | <blockoid>
    | <EXPR> <.ws>
}


proto rule statement_control { <...> }

rule statement_control:sym<if> {
    <sym> '(' <EXPR> ')'
    <then=.statement>
    [ 'else' <else=.statement> ]?
}


token term:sym<name> { <identifier> }
token term:sym<int>  { <integer> }
token term:sym<str>  { <quote> }
token term:sym<float_constant_long> { # longer to work-around lack of LTM
    [
    | \d+ '.' \d*
    | \d* '.' \d+
    ]
}

token term:sym<reg> { <macro_param> }

# Assignment
token infix:sym<=>  { <sym>  <O('%assignment')> }

token infix:sym<,>  { <sym>  <O('%comma')> }

token postcircumfix:sym<( )> {
    '(' <.ws> <arglist> ')'
    <O('%methodop')>
}
token postcircumfix:sym<[ ]> {
    '[' <.ws> <EXPR>? ']'
    <O('%methodop')>
}

token arglist {
    <.ws>
    [
    | <EXPR('f=')>
    | <?>
    ]
}

# Casting. TODO Figure out precedence.
token prefix:sym<( )> {
    '(' <type_declarator> ')'
    <O('%casting')>
}


rule blockoid {
    '{'
    <declarator>*
    <statement_list>
    '}'
}

# Simplified parsing of declarator
rule declarator {
    <type_declarator> <variable=.ident> [ '=' <statement> ]? ';'
}

# No double poiners (for now?)
rule type_declarator {
    'const'? <.identifier> '*'? 'const'?
}

token eat_terminator {
    | ';'
    | <?terminator>
    | $
}

proto token terminator { <...> }

token terminator:sym<;> { <?[;]> }
token terminator:sym<}> { <?[}]> }


# ws handles whitespace, pod and perl and C comments
token ws {
  [
  | \s+
  | '#' \N*
  | ^^ '=' .*? \n '=cut'
  | '/*' .*? '*/'
  ]*
}

INIT {
    Ops::Compiler::Grammar.O(':prec<y=>, :assoc<unary>', '%methodop');
    Ops::Compiler::Grammar.O(':prec<x=>, :assoc<unary>', '%autoincrement');
    Ops::Compiler::Grammar.O(':prec<w=>, :assoc<unary>', '%casting');
    Ops::Compiler::Grammar.O(':prec<v=>, :assoc<unary>', '%symbolic_unary');
    Ops::Compiler::Grammar.O(':prec<u=>, :assoc<left>',  '%multiplicative');
    Ops::Compiler::Grammar.O(':prec<t=>, :assoc<left>',  '%additive');
    Ops::Compiler::Grammar.O(':prec<r=>, :assoc<left>',  '%concatenation');
    Ops::Compiler::Grammar.O(':prec<m=>, :assoc<left>',  '%relational');
    Ops::Compiler::Grammar.O(':prec<l=>, :assoc<left>',  '%tight_and');
    Ops::Compiler::Grammar.O(':prec<k=>, :assoc<left>',  '%tight_or');
    Ops::Compiler::Grammar.O(':prec<j=>, :assoc<right>', '%conditional');
    Ops::Compiler::Grammar.O(':prec<i=>, :assoc<right>', '%assignment');
    Ops::Compiler::Grammar.O(':prec<g=>, :assoc<list>, :nextterm<nulltermish>',  '%comma');
    Ops::Compiler::Grammar.O(':prec<f=>, :assoc<list>',  '%list_infix');
    Ops::Compiler::Grammar.O(':prec<e=>, :assoc<unary>', '%list_prefix');
}


# vim: expandtab shiftwidth=4 ft=perl6:
