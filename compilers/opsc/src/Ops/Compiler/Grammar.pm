#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.

INIT { pir::load_bytecode('HLL.pbc'); }

grammar Ops::Compiler::Grammar is HLL::Grammar;

rule TOP {
    <body>
    <.pod_ws>
    [ $ || <.panic: 'Syntax error'> ]
}

rule body {
    [
        <.pod_ws>
        [
        | <preamble>
        | <op>
        ]
    ]*
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
    <op_type>? 'op' <op_name=ident>
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
    #<?DEBUG>
    <blockoid>
}

proto token quote { <...> }
token quote:sym<apos> { <?[']> <quote_EXPR: ':q'>  }
token quote:sym<dblq> { <?["]> <quote_EXPR: ':q'> }

proto rule op_macro { <...> }
rule op_macro:sym<goto offset>  { 'goto' 'OFFSET' '(' <arg=.EXPR> ')' }
rule op_macro:sym<expr offset>  { 'expr' 'OFFSET' '(' <arg=.EXPR> ')' }
rule op_macro:sym<goto address> { 'goto' 'ADDRESS' '(' <arg=.EXPR> ')' }
rule op_macro:sym<expr address> { 'expr' 'ADDRESS' '(' <arg=.EXPR> ')' }
rule op_macro:sym<goto next>    { 'goto' 'NEXT' '(' ')' }
rule op_macro:sym<expr next>    { 'expr' 'NEXT' '(' ')' }
rule op_macro:sym<restart next> { 'restart' 'NEXT' '(' ')' }

# Eat c_macro till next non-whitespace char.
token c_macro {
    ^^ '#' \N+ <.ws>
}

token identifier {
    <!keyword> <ident>
}

token keyword {
    [
    | 'for' |'if' |'while'
    | 'case' | 'default'
    | 'goto' | 'expr' | 'restart'
    | 'OFFSET' | 'ADDRESS' | 'NEXT'
    ]>>
}


# Part of C grammar.

rule statement_list {
    [ <statement> <.eat_terminator> ]*
}

token statement {
    [
    | <c_macro>
    | <statement_control>
    | <blockoid>
    | <EXPR> <.ws>
    ]
    <?MARKER('endstmt')>
}


proto rule statement_control { <...> }

rule statement_control:sym<if> {
    <sym> '(' <EXPR> ')'
    <then=.statement>
    [ 'else' <else=.statement> ]?
}

rule statement_control:sym<while> {
    <sym> '(' <condition=.EXPR> ')'
    <statement>
}

rule statement_control:sym<for> {
    <sym> '(' <init=.EXPR>? ';' <test=.EXPR>? ';' <step=.EXPR>? ')'
    <statement>
}

rule statement_control:sym<do> {
    <sym> <blockoid> 'while' '(' <condition=.EXPR> ')'
}

# Not real "C" switch. Just close enough
rule statement_control:sym<switch> {
    <sym> '(' <test=.EXPR> ')' '{'
    <switch_case>*
    <switch_default>?
    '}'
}

rule switch_case {
    'case' [ <identifier> | <integer>] ':' <statement_list>
}

rule switch_default {
    'default' ':' <statement_list>
}


# HACK to support for INT_FMT "\n"
token term:sym<concatenate_strings> { # Long-long name as LTM workaround
    <identifier> \s+ <quote>
}

token term:sym<call> {
    <identifier> <.ws> '(' <arglist> ')'
}
token term:sym<int>  { <integer> ('u'|'U'|'l'|'L')* }
token term:sym<str>  { <quote> }
token term:sym<float_constant_long> { # longer to work-around lack of LTM
    [
    | \d+ '.' \d*
    | \d* '.' \d+
    ]
}

token term:sym<reg>   {
    '$' $<num>=<integer> # Up to nine params.
}

token term:sym<macro> { <op_macro>    }

# Variable name.
token term:sym<identifier>  {
    <identifier> <!before <ws> '('>
}

# Assignment and other operations.
# Basically, we are cheating using "pirop" to store original op.
token infix:sym<=>  { <sym>  <O('%assignment :pirop<=>')> }
token infix:sym<|=> { <sym>  <O('%assignment :pirop<|=>')> }
token infix:sym<&=> { <sym>  <O('%assignment :pirop<&=>')> }
token infix:sym<^=> { <sym>  <O('%assignment :pirop<^=>')> }

token infix:sym<+=> { <sym>  <O('%assignment :pirop<+=>')> }
token infix:sym<-=> { <sym>  <O('%assignment :pirop<-=>')> }
token infix:sym<*=> { <sym>  <O('%assignment :pirop<*=>')> }
token infix:sym</=> { <sym>  <O('%assignment :pirop</=>')> }

token infix:sym«>>=» { <sym>  <O('%assignment :pirop<shr_assign>')> }
token infix:sym«<<=» { <sym>  <O('%assignment :pirop<shl_assign>')> }

token infix:sym<,>  { <sym>  <O('%comma')> }

token infix:sym<*>    { <sym>  <O('%multiplicative :pirop<*>')> }
token infix:sym</>    { <sym>  <O('%multiplicative :pirop</>')> }
token infix:sym<%>    { <sym>  <O('%multiplicative :pirop<%>')> }

token infix:sym<+>    { <sym>  <O('%additive :pirop<+>')> }
token infix:sym<->    { <sym>  <!before '>' > <O('%additive :pirop<->')> }

token infix:sym«==»   { <sym>  <O('%relational :pirop<==>')> }
token infix:sym«!=»   { <sym>  <O('%relational :pirop<!=>')> }
token infix:sym«<=»   { <sym>  <O('%relational :pirop<le>')> }
token infix:sym«>=»   { <sym>  <O('%relational :pirop<ge>')> }
token infix:sym«<»    { <sym>  <O('%relational :pirop<lt>')> }
token infix:sym«>»    { <sym>  <O('%relational :pirop<gt>')> }

token infix:sym<&>    { <sym>  <O('%tight_and :pirop<&>')> }
token infix:sym<^>    { <sym>  <O('%tight_and :pirop<^>')> }   # XXX Check precedence
token infix:sym<|>    { <sym>  <O('%tight_or :pirop<|>')> }

token infix:sym<&&>   { <sym>  <O('%tight_and :pirop<&&>')> }
token infix:sym<||>   { <sym>  <O('%tight_or :pirop<||>')> }

token infix:sym«<<»   { <sym>  <O('%multiplicative :pirop<shl>')> }
token infix:sym«>>»   { <sym>  <O('%multiplicative :pirop<shr>')> }

token infix:sym<?:> {
    '?'
    <.ws>
    <EXPR('i=')>
    ':'
    <O('%conditional, :reducecheck<ternary>')>
}

token postcircumfix:sym<( )> {
    '(' <.ws> <arglist> ')'
    <O('%methodop')>
}

token postcircumfix:sym<[ ]> {
    '[' <.ws> <EXPR>? ']'
    <O('%methodop')>
}

token postfix:sym«->» { <sym> <identifier> <O('%methodop')> }
token postfix:sym«.»  { <sym> <identifier> <O('%methodop')> }

# XXX Check precedence
token postfix:sym<--> { <sym> <O('%methodop')> }
token postfix:sym<++> { <sym> <O('%methodop')> }

token arglist {
    <.ws>
    [
    | <EXPR('f=')>
    | <type_declarator> <.ws> ',' <.ws> <EXPR('f=')>
    | <type_declarator>
    | <?>
    ]
}

# Casting. TODO Figure out precedence.
token prefix:sym<( )> {
    '(' <type_declarator> ')'
    <O('%casting')>
}
token circumfix:sym<( )> {
    '(' <.ws> <EXPR> ')'
    <O('%methodop')>        # XXX Check precedence
}

token prefix:sym<+>   { <sym>  <O('%symbolic_unary')> }
token prefix:sym<->   { <sym>  <![>]> <O('%symbolic_unary')> }
token prefix:sym<!>   { <sym>  <O('%symbolic_unary')> }
token prefix:sym<|>   { <sym>  <O('%symbolic_unary')> }
token prefix:sym<&>   { <sym>  <O('%symbolic_unary')> }
token prefix:sym<*>   { <sym>  <O('%symbolic_unary')> }
token prefix:sym<~>   { <sym>  <O('%symbolic_unary')> }


rule blockoid {
    '{'
    <declarator>*
    <statement_list>
    '}'
}

# Simplified parsing of declarator
rule declarator {
    <type_declarator> <variable=.ident> [ '[' <array_size=.integer> ']' ]? [ '=' <statement> ]? ';'
}

# No double poiners (for now?)
rule type_declarator {
    'struct'? 'const'? <identifier> '*'* 'const'? <?before [ <identifier> | ',' | ')' ] >
}

token eat_terminator {
    | ';'
    | <?terminator>
    | <?MARKED('endstmt')>
    | $
}

proto token terminator { <...> }

token terminator:sym<;> { <?[;]> }
token terminator:sym<}> { <?[}]> }

token pod_ws {
  [
  | \s+
  | '#' \N*
  | ^^ '=' .*? \n '=cut'
  ]*
}

# ws handles whitespace and C comments
token ws {
  [
  | \s+
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
