// Copyright (C) 2006-2007, The Perl Foundation.
// $Id$ 
 
// Plumhead with ANTLR3

// The starting rule is 'program'

grammar Plumhead;

options 
{
  output       = AST;
  ASTLabelType = CommonTree;
}

tokens 
{
  PROGRAM;
}
// virtual tokens

// real tokens
SEA        : 'start_sea' ( options {greedy=false;} : . )* 'end_sea' ;
CODE_START : '<?php' ;
CODE_END   : '?>' ;
WS
  : ( ' ' | '\t' | '\r' | '\n' )+
    {
      $channel = HIDDEN;       // send into nirwana 
    }
  ;
STRING     : '\"' ( ~'\"' )*  '\"' ;
ECHO       : 'echo' ;

fragment
INTEGER : ('0'..'9' )+ ;

NUMBER
    : INTEGER ('.' INTEGER)?
    | '.' INTEGER
    ;

MINUS      : '-' ;
PLUS       : '+' ;
MUL_OP     : '*'  | '/'  | '%' ;
REL_OP     : '==' | '<=' | '>=' | '!=' | '<'  | '>' ;


program 
  : s1=sea code s2=sea -> ^( PROGRAM $s1 code $s2 )
  ;

sea
  : SEA -> ^( ECHO STRING[$SEA] )
  ;

code
  : CODE_START statements CODE_END -> statements
  ;

statements
  : ( statement )+
  ;

statement
  : ECHO expression ';' -> ^( ECHO expression )
  ;

expression
  : STRING
  | adding_expression
  ;

adding_expression
  : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* 
  ;

multiplying_expression
  : unary_expression ( MUL_OP^^ unary_expression )*
  ;

unary_expression
  : postfix_expression
  | MINUS postfix_expression -> ^( MUL_OP["n_mul"] NUMBER["-1"] postfix_expression )
  ;

postfix_expression
  : NUMBER
  | '(' expression ')' -> expression
  ;
