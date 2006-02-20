// Copyright: 2006 The Perl Foundation.  All Rights Reserved.
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
} 

program 
  : input_item quit -> ^( PROGRAM input_item )
  ;

input_item
  : INT
  ;

INT
 : ('0'..'9')+
 ;

// quit is required, make testing easier
quit
  : 'quit'
  ;    

WS
  : (   ' '
      |   '\t'
      |   '\r'
      |   '\n'
    )+
    {
      channel = 99;
    }
  ;    
