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

// real tokens
SEA        : 'start_sea' ( options {greedy=false;} : . )* 'end_sea' ;
CODE_START : '<?php' ;
CODE_END   : '?>' ;
WS         : ( ' ' | '\t' | '\r' | '\n' )+ ;    
STRING     : '\"' ( ~'\"' )*  '\"' ;
ECHO       : 'echo' ;

program 
  : sea code sea WS? -> code
  ;

sea
  : SEA
  ;

code
  : CODE_START statements WS? CODE_END -> ^( CODE_START statements )
  ;

statements
  : ( statement )+
  ;

statement
  : WS? ECHO WS? STRING WS? ';' -> ^( ECHO STRING )
  ;
