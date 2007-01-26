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

// virtual tokens
tokens 
{
  PROGRAM;
  NOQUOTE_STRING;
  STMTS;
}

@lexer::members
{
  public static boolean codeMode = false;
}

// real tokens
SEA        :  { !codeMode }?=> (~'<')+ ;
CODE_START :  '<?php'              { codeMode = true; } ;
CODE_END   :  { codeMode }?=> '?>' '\n'? { codeMode = false; } ;
WS
  : { codeMode }?=> 
    ( ' ' | '\t' | '\r' | '\n' )+
    {
      $channel = HIDDEN;       // send into nirwana 
    }
  ;
DOUBLEQUOTE_STRING  : { codeMode }?=> '\"' ( ~'\"' )*  '\"' ;
SINGLEQUOTE_STRING  : { codeMode }?=> '\'' ( ~'\'' )*  '\'' ;
ECHO                : { codeMode }?=> 'echo' ;

fragment
INTEGER : { codeMode }?=> ('0'..'9' )+ ;

NUMBER
    :{ codeMode }?=>  INTEGER ('.' INTEGER)?
    | '.' INTEGER
    ;

MINUS      :{ codeMode }?=>  '-' ;
PLUS       :{ codeMode }?=>  '+' ;
MUL_OP     :{ codeMode }?=>  '*'  | '/'  | '%' ;
REL_OP     :{ codeMode }?=>  '==' | '<=' | '>=' | '!=' | '<'  | '>' ;

IF         :{ codeMode }?=>  'if' ;
ELSE       :{ codeMode }?=>  'else' ;

// productions

program 
  : sea_or_code -> ^( PROGRAM sea_or_code )
  ;

sea_or_code
  : ( sea | code )+ 
  ;

sea
  : SEA -> ^( ECHO NOQUOTE_STRING[$SEA] )
  ;

code
  : CODE_START statements CODE_END -> statements
  ;

relational_expression 
  : expression ( REL_OP^^ expression )?
  ;

statements
  : ( statement )*
  ;

statement
  : ECHO^^ expression ';'! 
  | IF '(' relational_expression ')' '{' s1=statements '}'
    ( ELSE '{' s2=statements '}' -> ^( IF relational_expression ^( STMTS $s1 ) ^( STMTS $s2 ) )
    |                           -> ^( IF relational_expression ^( STMTS $s1 ) )
    ) 
  | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] )
  ;

expression
  : DOUBLEQUOTE_STRING
  | SINGLEQUOTE_STRING
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
