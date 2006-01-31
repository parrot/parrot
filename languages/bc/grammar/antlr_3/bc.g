/* $Id$
 *
 */
grammar BcParser;

options 
{
  output=AST;
  ASTLabelType=CommonTree;
}

  /* PROGRAM; */



program 
  : INT WS quit WS
  ;

INT
 : ('0'..'9')+
 ;

quit
 : 'quit'
 ;    

WS
 : (   ' '
     |   '\t'
     |   '\r'
     |   '\n'
   )+
 ;    
