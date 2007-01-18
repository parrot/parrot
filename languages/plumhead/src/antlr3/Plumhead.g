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
}

@lexer::members
{
  public static boolean codeMode = false;
}

// real tokens
SEA        :  { !codeMode }?=> (~'<')+ ;
CODE_START :  '<?php' { codeMode = true; } ;
CODE_END   :  { codeMode }?=> '?>' { codeMode = false; } ;
WS
  : { codeMode }?=> 
    ( ' ' | '\t' | '\r' | '\n' )+
    {
      $channel = HIDDEN;       // send into nirwana 
    }
  ;
STRING     : { codeMode }?=> '\"' ( ~'\"' )*  '\"' ;
ECHO       : { codeMode }?=> 'echo' ;

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


// productions

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
