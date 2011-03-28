#! nqp
# Copyright (C) 2009-2011, Parrot Foundation.

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
    {*} #= start
    [ <op_body> || <.panic: "Fail to parse op body"> ]
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
token quote:sym<dblq> { <?["]> <quote_EXPR: ':qq'> }

proto rule op_macro { <...> }
rule op_macro:sym<goto offset>  { 'goto' 'OFFSET' '(' <arg=.EXPR> ')' }
rule op_macro:sym<expr offset>  { 'expr' 'OFFSET' '(' <arg=.EXPR> ')' }
rule op_macro:sym<goto address> { 'goto' 'ADDRESS' '(' <arg=.EXPR> ')' }
rule op_macro:sym<expr address> { 'expr' 'ADDRESS' '(' <arg=.EXPR> ')' }
rule op_macro:sym<goto next>    { 'goto' 'NEXT' '(' ')' }
rule op_macro:sym<expr next>    { 'expr' 'NEXT' '(' ')' }
rule op_macro:sym<restart next> { 'restart' 'NEXT' '(' ')' }

proto rule c_macro { <...> }

token c_macro:sym<define> {
    ^^ '#' \h* <sym> \h+ <name=.identifier> <c_macro_args>? <body=.nonl>?
}

token c_macro:sym<ifdef> {
    ^^ '#' \h* <sym> \h+ <name=.identifier> <.ws>
    <then=.mixed_content>
    [
    ^^ '#' 'else' <else=.mixed_content>
    ]?
    ^^ '#' 'endif'
}

token c_macro:sym<if> {
    ^^ '#' \h* <sym> \h+ <condition=.nonl> <.ws>
    <then=.mixed_content>
    [
    ^^ '#' 'else' <else=.mixed_content>
    ]?
    ^^ '#' 'endif'
}


token c_macro_args {
    '(' \h* <arg=.identifier>? [ \h* ',' \h* <arg=.identifier> ]* \h* ')'
}

token nonl {
    \N+
}


token identifier {
    <!keyword> <ident>
}

token keyword {
    [
    | 'for' |'while' | 'do'
    | 'if' | 'else'
    | 'case' | 'default'
    | 'break' | 'return' | 'continue'
    | 'goto' | 'expr' | 'restart'
    | 'OFFSET' | 'ADDRESS' | 'NEXT'
    ]>>
}


# Part of C grammar.

rule statement_list {
    [ <labeled_statement> <.eat_terminator> ]*
}

token labeled_statement {
    [
    | <label> <.ws> <statement>
    | <label>
    | <statement>
    ]
    <.ws>
    <?MARKER('endstmt')>
}

token statement {
    [
    | <c_macro>
    | <statement_control>
    | <blockoid>
    | <EXPR>
    ]
    <.ws>
    <?MARKER('endstmt')>
}

token label {
    [
    | 'case' <.ws> [ <integer> | <identifier> ] ':'
    | 'default:'
    | <identifier> ':'
    ]
}

proto rule statement_control { <...> }

rule statement_control:sym<if> {
    <sym> '(' <EXPR> ')'
    <then=.statement_or_block>
    [ 'else' <else=.statement_or_block> ]?
}

rule statement_control:sym<while> {
    <sym> '(' <condition=.EXPR> ')'
    <statement_list=.statement_or_block>
}

rule statement_control:sym<for> {
    <sym> '(' <init=.EXPR>? ';' <test=.EXPR>? ';' <step=.EXPR>? ')'
    <statement_list=.statement_or_block>
}

rule statement_control:sym<do-while> {
    'do' <blockoid> 'while' '(' <condition=.EXPR> ')'
}

# Not real "C" switch. Just close enough
rule statement_control:sym<switch> {
    <sym> '(' <test=.EXPR> ')' '{'
    <statement_list>
    '}'
}

rule statement_control:sym<break> { <sym> }
rule statement_control:sym<continue> { <sym> }

token statement_or_block {
    | <blockoid>
    | <labeled_statement> <.eat_terminator>
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

token infix:sym<,>   { <sym>  <O('%comma :pirop<,>')> }

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

token postcircumfix:sym<[ ]> {
    '[' <.ws> <EXPR> ']'
    <O('%methodop')>
}

#token postfix:sym«->» { <sym> <identifier> <O('%methodop :pirop<arrow>')> }
#token postfix:sym«.»  { <sym> <identifier> <O('%methodop :pirop<dotty>')> }
token infix:sym«->» { <sym> <O('%dotty :pirop<arrow>')> }
token infix:sym«.»  { <sym> <O('%dotty :pirop<dotty>')> }

# XXX Check precedence
token postfix:sym<--> { <sym> <O('%autoincrement :pirop<-->')> }
token postfix:sym<++> { <sym> <O('%autoincrement :pirop<++>')> }

rule arglist {
    | <arg> ** ','
    | <?>
}

token arg {
    | <EXPR('i=')>
    | <type_declarator>
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

token prefix:sym<+>   { <sym>  <![+]> <O('%symbolic_unary :pirop<+>')> }
token prefix:sym<->   { <sym>  <![>\-]> <O('%symbolic_unary :pirop<->')> }
token prefix:sym<!>   { <sym>  <O('%symbolic_unary :pirop<!>')> }
token prefix:sym<|>   { <sym>  <O('%symbolic_unary :pirop<|>')> }
token prefix:sym<&>   { <sym>  <O('%symbolic_unary :pirop<&>')> }
token prefix:sym<*>   { <sym>  <O('%symbolic_unary :pirop<*>')> }
token prefix:sym<~>   { <sym>  <O('%symbolic_unary :pirop<~>')> }

token prefix:sym<return> { <sym>  <O('%symbolic_unary :pirop<return>')> }

rule blockoid {
    '{' <mixed_content> '}'
}

rule mixed_content {
    <declarator>*
    <statement_list>
}

# Simplified parsing of declarator
rule declarator {
    <type_declarator=.pointerless_type> [ <declarator_name> ** ',' ] ';'
}

rule declarator_name {
     <pointer>* <variable=.ident> [ '[' <array_size=.integer> ']' ]? [ '=' <EXPR('i=')> ]?
}

rule pointer { <star> 'const'? }
token star { '*' }

rule pointerless_type {
    'struct'? 'const'? <identifier>
}

rule type_declarator {
    'struct'? 'const'? <identifier> <pointer>*
}

token eat_terminator {
    | ';'
    | <?MARKED('endstmt')>
    | $
}

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
    Ops::Compiler::Grammar.O(':prec<z=>, :assoc<unary>', '%methodop');
    Ops::Compiler::Grammar.O(':prec<y=>, :assoc<left>',  '%dotty');
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
