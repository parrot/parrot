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
  : INT quit -> ^( PROGRAM INT )
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
   {
      channel = 99;
   }
 ;    
