// Copyright (C) 2006, The Perl Foundation.
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
  START_CODE;
} 

// tokens
SEA        : 'start_sea' ( options {greedy=false;} : . )* 'end_sea' ;
PHP_CODE   : '<?php' ( options {greedy=false;} : . )* '?>' ;
NEWLINE    : '\n' ;

program 
  : SEA PHP_CODE SEA NEWLINE -> ^( START_CODE )
  ;
