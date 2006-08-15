// Copyright (C) 2006, The Perl Foundation.
// $Id$ 
 
// Parse bc with ANTLR3

// This grammar is derived from 
// http://www.opengroup.org/onlinepubs/000095399/utilities/bc.html

// The starting rule is 'program'

grammar BcParser;

options 
{
  output       = AST;
  ASTLabelType = CommonTree;
  k            = 2;
}

tokens 
{
  PRINT;
  PROGRAM;
  SAY;
  UNARY_MINUS;
  VAR;
} 

// TODO: Interactive mode when there is no 'quit'
program 
  : input_item+ Quit NEWLINE -> ^( PROGRAM input_item+)
  ;

input_item 
  : semicolon_list NEWLINE!
  ;

semicolon_list 
  : statement? ( (SEMICOLON!)+ statement? )*
  ;

// TODO:  STRING -> ^( PRINT STRING )
statement
  : named_expression ASSIGN_OP^^ expression
    |
    expression -> ^( SAY expression )
    |
    STRING -> ^( PRINT STRING )
  ;

expression
  : adding_expression
  ;

named_expression
  : LETTER -> ^( VAR LETTER ) 
  ;


adding_expression
  : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression)* 
  ;

multiplying_expression
  : unary_expression ( MUL_OP^^ unary_expression )*
  ;

unary_expression
  : postfix_expression
    |
    MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression )
  ;

postfix_expression
  : NUMBER
    |
    named_expression
    |     
    '(' expression ')' -> expression
  ;

NUMBER
  : INTEGER ('.' INTEGER)?
    |
    '.' INTEGER
  ;

fragment
INTEGER
  : ('0'..'9' | 'A' .. 'F' )+
  ;

MINUS
  : '-'
  ;

PLUS
  : '+'
  ;

MUL_OP
  : '*' | '/' | '%'
  ;

SEMICOLON
  : ';'
  ;

ASSIGN_OP
  : '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' 
  ;

INCR_DECR
  : '++' | '--'
  ;

// quit is required, make testing easier
Quit
  : 'quit'
  ;    

// ignore multiple-line comments
ML_COMMENT
  : '/*' ( options {greedy=false;} : . )* '*/'
    {
      channel = 99;       // send into nirwana 
    }
  ;

// ignore whitespace
WS
  : ( ' ' | '\t' )+
    {
      channel = 99;       // send into nirwana 
    }
  ;    

// Windows and Unix style newlines
NEWLINE
  : ('\r')? '\n'+
  ;

// String literals are everything in double quotes, no escaping
STRING
  : '\"' ( ~'\"' )*  '\"'
  ;

LETTER
  : 'a'..'z'
  ;
  
