// Copyright (C) 2006, The Perl Foundation.
// $Id$ 
 
// Plumhead with ANTLR3

// The starting rule is 'program'

grammar Plumhead;

options 
{
  output       = AST;
  ASTLabelType = CommonTree;
  k            = 2;
}

tokens 
{
  START_PHP;
  END_PHP;
  ARRAY;
  FUNCTION;
  PRINT;
  PROGRAM;
  STMTS;
  VAR;
} 

// Windows and Unix style newlines
NEWLINE : ('\r')? '\n'+ ;

// String literals are everything in double quotes, no escaping
STRING : '\"' ( ~'\"' )*  '\"' ;

LETTER : 'a'..'z' ;

fragment
INTEGER : ('0'..'9' | 'A' .. 'F' )+ ;

NUMBER
    : INTEGER ('.' INTEGER)?
    | '.' INTEGER
    ;

MINUS      : '-' ;
PLUS       : '+' ;

MUL_OP     : '*'  | '/'  | '%' ;
ASSIGN_OP  : '='  | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' ;
REL_OP     : '==' | '<=' | '>=' | '!=' | '<'  | '>' ;
INCR       : '++' ;
DECR       : '--' ;
// TODO: handle these 
Define     : 'define';
Break      : 'break';
START_PHP  : '<?php';
END_PHP    : '?>';

// quit at the end of program is required, make testing easier
Quit       : 'quit' ;    

Length     : 'length';
Return     : 'return';
For        : 'for';
If         : 'if';
While      : 'while';
Sqrt       : 'sqrt';
Scale      : 'scale';
Ibase      : 'ibase';
Obase      : 'obase';
Auto       : 'auto';
 
// ignore multiple-line comments
ML_COMMENT
  : '/*' ( options {greedy=false;} : . )* '*/'
    {
      $channel = HIDDEN;       // send into nirwana 
    }
  ;

// ignore whitespace
WS
  : ( ' ' | '\t' )+
    {
      $channel = HIDDEN;       // send into nirwana 
    }
  ;    

// TODO: Interactive mode when there is no 'quit'
// There are 26 named var, currently all of them are initialized to 0
program 
  : START_PHP
  ;

input_item 
  : semicolon_list NEWLINE!
  | function
  ;

semicolon_list 
  : statement? ( ';'! statement? )*
  ;

statement_list     
  : ( statement | NEWLINE! | ';'! )*
  ;

// TODO: use a semantic predicate, for deciding when not to print, ASSIGN_OP
statement
  : named_expression ASSIGN_OP^^ expression
  | expression -> ^( PRINT expression ) ^( PRINT NEWLINE )
  | STRING -> ^( PRINT STRING )
  | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) )
  | '{'! statement_list '}'!
  ;

// TODO: implement functions
function
  : Define LETTER '(' parameter_list? ')' '{' NEWLINE auto_define_list? statement_list '}' -> ^( FUNCTION LETTER )
  ;

// What is the difference between define_list and parameter_list ?
parameter_list       
  : define_list
  ;

auto_define_list
  : Auto define_list ( NEWLINE | ';' )
  ;

define_list
  : LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )*
  ;

argument_list
  : expression
  | LETTER '[' ']' ',' argument_list
  ;

relational_expression 
  : expression ( REL_OP^^ expression )?
  ;

return_expression
  : expression?
  ;

expression
  : adding_expression
  ;

named_expression
  : LETTER -> ^( VAR LETTER ) 
  ;

// The following are for getting precedence right

adding_expression
  : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* 
  ;

multiplying_expression
  : unary_expression ( MUL_OP^^ unary_expression )*
  ;

unary_expression
  : postfix_expression
  | MINUS postfix_expression -> ^( MUL_OP["*"] NUMBER["-1"] postfix_expression )
  | INCR named_expression    -> ^( ASSIGN_OP ^(VAR LETTER["a"]) ^( PLUS["+"] ^(VAR LETTER["a"]) NUMBER["1"] ) )
  | DECR named_expression    -> ^( ASSIGN_OP ^(VAR LETTER["a"]) ^( MINUS["-"] ^(VAR LETTER["a"]) NUMBER["1"] ) )
  ;

postfix_expression
  : NUMBER
  | named_expression
  | '(' expression ')' -> expression
  ;
