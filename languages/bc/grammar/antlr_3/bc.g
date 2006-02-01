/* $Id$
 *
 */
grammar BcParser;

options 
{
  output=AST;
  ASTLabelType=CommonTree;
}

tokens 
{
  PROGRAM;
} 


program 
  : INT WS quit WS -> ^( PROGRAM INT )
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
