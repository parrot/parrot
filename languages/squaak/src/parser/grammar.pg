# Copyright (C) 2008, Parrot Foundation.
# $Id$


=begin overview

This is the grammar for Squaak written as a sequence of Perl 6 rules.

=end overview

grammar Squaak::Grammar is PCT::Grammar;

rule TOP {
    {*}                                      #= open
    <stat_or_def>*
    [ $ || <.panic: 'Syntax error'> ]
    {*}                                      #= close
}

rule stat_or_def {
    | <statement> {*}                        #= statement
    | <sub_definition> {*}                   #= sub_definition
}

rule statement {
    | <if_statement> {*}                     #= if_statement
    | <while_statement> {*}                  #= while_statement
    | <for_statement> {*}                    #= for_statement
    | <try_statement> {*}                    #= try_statement
    | <throw_statement> {*}                  #= throw_statement
    | <return_statement> {*}                 #= return_statement
    | <sub_call> {*}                         #= sub_call
    | <assignment> {*}                       #= assignment
    | <variable_declaration> {*}             #= variable_declaration
    | <do_block> {*}                         #= do_block
}

rule if_statement {
    'if' <expression> 'then' <block> ['else' <else=block>]? 'end'
    {*}
}

rule while_statement {
    'while' <expression> 'do' <block> 'end'
    {*}
}

rule for_statement {
    'for' <for_init> ',' <expression> [',' <step=expression>]? 'do'
    <statement>*
    'end'
    {*}
}

rule for_init {
    'var' <identifier> '=' <expression>
    {*}
}

rule try_statement {
    'try' <try=block> 'catch' <exception> <catch=block> 'end'
    {*}
}

rule exception {
    <identifier>
    {*}
}

rule throw_statement {
    'throw' <expression>
    {*}
}

rule return_statement {
    'return' <expression>
    {*}
}

rule block {
    {*}                                #= open
    <statement>*
    {*}                                #= close
}

rule do_block {
    'do' <block> 'end'
    {*}
}

rule assignment {
    <primary> '=' <expression>
    {*}
}

rule sub_definition {
    'sub' <identifier> <parameters>
    <statement>*
    'end'
    {*}
}

rule parameters {
    '(' [ <identifier> [',' <identifier>]* ]? ')'
    {*}
}

rule variable_declaration {
    'var' <identifier> ['=' <expression>]?
    {*}
}

rule sub_call {
    <primary> <arguments>
    {*}
}

rule arguments {
    '(' [ <expression> [',' <expression>]* ]? ')'
    {*}
}

rule primary {
    <identifier> <postfix_expression>*
    {*}
}

rule postfix_expression {
    | <key> {*}                      #= key
    | <member> {*}                   #= member
    | <index> {*}                    #= index
}

rule key {
    '{' <expression> '}'
    {*}
}

rule member {
    '.' <identifier>
    {*}
}

rule index {
    '[' <expression> ']'
    {*}
}

rule term {
   | <float_constant> {*}            #= float_constant
   | <integer_constant> {*}          #= integer_constant
   | <string_constant> {*}           #= string_constant
   | <hash_constructor> {*}          #= hash_constructor
   | <array_constructor> {*}         #= array_constructor
   | <sub_call> {*}                  #= sub_call
   | <primary> {*}                   #= primary
   | '(' <expression> ')' {*}        #= expression
}

rule hash_constructor {
    '{' [ <named_field> [',' <named_field>]* ]? '}'
    {*}
}

rule named_field {
    <string_constant> '=>' <expression>
    {*}
}

rule array_constructor {
    '[' [ <expression> [',' <expression>]* ]? ']'
    {*}
}

token identifier {
    <!keyword> <ident>
    {*}
}

token integer_constant {
    \d+
    {*}
}

token float_constant {
    [
    | \d+ '.' \d*
    | \d* '.' \d+
    ]
    {*}
}

token string_constant {
    \" <string_literal: '"'> \"
    {*}
}

token keyword {
    ['and'|'catch' |'do' |'else' |'end' |'for'|'if'   |'not'
    |'or' |'return'|'sub'|'throw'|'try' |'var'|'while']>>
}

rule expression is optable { ... }

proto 'infix:or'       is precedence('1')     is pasttype('unless') { ... }
proto 'infix:and'      is tighter('infix:or') is pasttype('if')     { ... }

proto 'infix:<'        is tighter('infix:and')                      { ... }
proto 'infix:<='       is equiv('infix:<')                          { ... }
proto 'infix:>'        is equiv('infix:<')                          { ... }
proto 'infix:>='       is equiv('infix:<')                          { ... }
proto 'infix:=='       is equiv('infix:<')                          { ... }
proto 'infix:!='       is equiv('infix:<')                          { ... }

proto 'infix:+'        is tighter('infix:<')  is pirop('add')     { ... }
proto 'infix:-'        is equiv('infix:+')    is pirop('sub')     { ... }

proto 'infix:..'       is equiv('infix:+')    is pirop('concat')  { ... }

proto 'infix:*'        is tighter('infix:+')  is pirop('mul')     { ... }
proto 'infix:%'        is equiv('infix:*')    is pirop('mod')     { ... }
proto 'infix:/'        is equiv('infix:*')    is pirop('div')     { ... }

proto 'prefix:not'     is tighter('infix:*')    is pirop('not')   { ... }
proto 'prefix:-'       is tighter('prefix:not') is pirop('neg')   { ... }

proto 'term:'          is tighter('prefix:-')  is parsed(&term)      { ... }


##  this <ws> rule treats # as "comment to eol"
##  you may want to replace it with something appropriate
token ws {
    <!ww>
    [ '#' \N* \n? | \s+ ]*
}
