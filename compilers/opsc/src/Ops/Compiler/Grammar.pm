#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

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
regex op_body {
    '{'
    <body_word>*?
    ^^ '}'
}

#Process op body by breaking it into "words" consisting entirely of whitespace,
#alnums or a single punctuation, then checking for interesting macros (e.g $1
#or goto NEXT() ) in the midst of the words.
token body_word {
    [
    || <macro_param>
    || <op_macro>
    || <word>
    ]
}

token word {
    || <quote>
    || <ident>
    || <alnum>
    || <punct>
    || <ws>
}

proto token quote { <...> }
token quote:sym<apos> { <?[']> <quote_EXPR: ':q'>  }
token quote:sym<dblq> { <?["]> <quote_EXPR: ':q'> }

token macro_param {
    '$' $<num>=<integer> # Up to nine params.
}

rule op_macro {
    <macro_type> <macro_destination> '(' <body_word>*? ')'
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
    <.ident>
}

# ws handles whitespace, pod and perl and C comments
token ws {
  [
  | \s+
  | '#' \N*
  | ^^ '=' .*? \n '=cut'
  | '/*' .*? '*/'
  ]*
}


# vim: expandtab shiftwidth=4 ft=perl6:
