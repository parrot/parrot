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
WS         : ( ' ' | '\t' | '\r' | '\n' )+ ;    
STRING     : '\"' ( ~'\"' )*  '\"' ;
ECHO       : 'echo' ;

program 
  : s1=sea code s2=sea WS? -> ^( PROGRAM $s1 code $s2 )
  ;

sea
  : SEA -> ^( ECHO STRING[$SEA] )
  ;

code
  : CODE_START statements WS? CODE_END WS? -> statements
  ;

statements
  : ( statement )+
  ;

statement
  : WS? ECHO WS? STRING WS? ';' -> ^( ECHO STRING )
  ;
