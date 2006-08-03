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
}


tokens 
{
  PROGRAM;
} 


program 
  : input_item+ quit -> ^( PROGRAM input_item+)
  ;


input_item 
  : semicolon_list
  ;

semicolon_list 
  : statement ( ';'! statement )*
  ;


statement
  : expression
    |
    STRING
  ;

expression
  : adding_expression
  ;


adding_expression
  : multiplying_expression ( (PLUS^^ | MINUS^^) multiplying_expression)* 
  ;


multiplying_expression
  : NUMBER
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

// quit is required, make testing easier
quit
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
  : ( ' ' | '\t' | '\r' | '\n')+
    {
      channel = 99;       // send into nirwana 
    }
  ;    

// Windows and Unix style newlines
fragment
NEWLINE
  : ('\r')? '\n'+
  ;


// String literals are everything in double quotes, no escaping
STRING
  : '\"' ( ~'\"' )*  '\"'
  ;

