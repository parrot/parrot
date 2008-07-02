// Copyright (C) 2006-2007, The Perl Foundation.
// $Id$
 
// PHP grammar for Pipp antlr3

// The starting rule is 'program'

grammar Pipp;

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
  SCALAR;
  ARRAY;
  FUNCTION;
  PREFIX;
}

@lexer::members
{
  public static boolean codeMode = false;
}

// real tokens
SEA                 : { !codeMode }?=>  (~'<')+ ;
CODE_START          :                   '<?php'                       { codeMode = true;  } ;
CODE_END            : {  codeMode }?=>  '?>' '\n'?                    { codeMode = false; } ;
WS                  : {  codeMode }?=>  ( ' ' | '\t' | '\r' | '\n' )+ { $channel = HIDDEN; } ;
DOUBLEQUOTE_STRING  : {  codeMode }?=>  '\"' ( ~'\"' )*  '\"' ;
SINGLEQUOTE_STRING  : {  codeMode }?=>  '\'' ( ~'\'' )*  '\'' ;
ECHO                : {  codeMode }?=>  'echo' ;
VAR_DUMP            : {  codeMode }?=>  'var_dump' ;
PAREN_OPEN          : {  codeMode }?=>  '(' ;
PAREN_CLOSE         : {  codeMode }?=>  ')' ;

fragment IDENT      : {  codeMode }?=>  ( 'a'..'z' | 'A'..'Z' | '_' )( 'a'..'z' | 'A'..'Z' | '_' | '0'..'9' )*;
VAR_NAME            : {  codeMode }?=>  '$' IDENT ;

fragment DIGITS     : {  codeMode }?=>  ( '0'..'9' )+ ;
INTEGER             : {  codeMode }?=>  DIGITS ;
NUMBER              : {  codeMode }?=>  DIGITS? '.' DIGITS ;

MINUS               : {  codeMode }?=>  '-' ;
PLUS                : {  codeMode }?=>  '+' ;
MUL_OP              : {  codeMode }?=>  '*'  | '/'  | '%' ;
BITWISE_OP          : {  codeMode }?=>  '|'  | '&' | '^' ;
ASSIGN_OP           : {  codeMode }?=>  '=' ;
REL_OP              : {  codeMode }?=>  '==' | '<=' | '>=' | '!=' | '<'  | '>' ;

IF                  : {  codeMode }?=>  'if' ;
ELSE                : {  codeMode }?=>  'else' ;


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
  : CODE_START statements CODE_END? -> ^( STMTS statements )
  ;

relational_expression 
  : expression ( REL_OP^ expression )?
  ;

statements
  : ( statement )*
  ;

statement
  : ECHO expression ';'                                             -> ^( ECHO expression )
  | VAR_DUMP PAREN_OPEN  expression PAREN_CLOSE ';'                 -> ^( VAR_DUMP expression )
  | IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1=statements '}'
    ( ELSE '{' s2=statements '}'                                    -> ^( IF relational_expression ^( STMTS $s1 ) ^( STMTS $s2 ) )
    |                                                               -> ^( IF relational_expression ^( STMTS $s1 ) )
    ) 
  | CODE_END SEA CODE_START                                         -> ^( ECHO NOQUOTE_STRING[$SEA] )
  | VAR_NAME ASSIGN_OP val=expression ';'                           -> ^( ASSIGN_OP SCALAR[$VAR_NAME] $val ) 
  | VAR_NAME '[' key=expression ']' ASSIGN_OP val=expression ';'    -> ^( ASSIGN_OP ^( ARRAY[$VAR_NAME] $key ) $val )
  ;

expression
  : DOUBLEQUOTE_STRING
  | SINGLEQUOTE_STRING
  | bitwise_expression
  | VAR_NAME '[' key=expression ']'    -> ^( ARRAY[$VAR_NAME] $key )
  | VAR_NAME                           -> SCALAR[$VAR_NAME]
  ;

bitwise_expression
  : adding_expression ( BITWISE_OP^ adding_expression )*
  ;

adding_expression
  : multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )* 
  ;

multiplying_expression
  : unary_expression ( MUL_OP^ unary_expression )*
  ;

unary_expression
  : postfix_expression
  | MINUS postfix_expression -> ^( PREFIX["-"] postfix_expression )
  ;

postfix_expression
  : NUMBER
  | INTEGER
  | PAREN_OPEN expression PAREN_CLOSE -> expression
  ;
