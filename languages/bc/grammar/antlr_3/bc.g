// Copyright (C) 2006, The Perl Foundation.
// $Id$ 
 
// Parse bc with ANTLR3
// This grammar is derived from <http://www.funet.fi/pub/doc/posix/p1003.2/d11.2/4.3>


grammar BcParser;

options 
{
  output       = AST;
  ASTLabelType = CommonTree;
}

tokens 
{
  PROGRAM;
  UNARY_MINUS;
} 

program 
  : input_item quit -> ^( PROGRAM input_item )
  ;

input_item
  : expression +
  ;

expression
  : INT
  | '-' expression -> ^( UNARY_MINUS expression )
  ;

INT
 : ('0'..'9')+
 ;

// quit is required, make testing easier
quit
  : 'quit'
  ;    

// ignore multiple-line comments


ML_COMMENT
  : '/*'
    ( options {greedy=false;} : . )*
    '*/'
    {
      channel = 99;       // send into nirwana 
    }
	;

WS
  : (   ' '
      |   '\t'
      |   '\r'
      |   '\n'
    )+
    {
      channel = 99;       // send into nirwana 
    }
  ;    
