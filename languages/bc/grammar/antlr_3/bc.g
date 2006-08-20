// Copyright (C) 2006, The Perl Foundation.
// $Id$ 
 
// Parse bc with ANTLR3

// This grammar is derived from 
// http://www.opengroup.org/onlinepubs/000095399/utilities/bc.html

// The starting rule is 'program'

grammar BcParser;

options 
{
  output       = AST;
  ASTLabelType = CommonTree;
  k            = 2;
}

tokens 
{
  ARRAY;
  PRINT;
  PROGRAM;
  STMTS;
  VAR;
} 

// Windows and Unix style newlines
NEWLINE : ('\r')? '\n'+ ;

// String literals are everything in double quotes, no escaping
STRING : '\"' ( ~'\"' )*  '\"' ;

LETTER : 'a'..'z' ;

fragment
INTEGER : ('0'..'9' | 'A' .. 'F' )+ ;

NUMBER
  : INTEGER ('.' INTEGER)?
    |
    '.' INTEGER
  ;

MINUS      : '-' ;
PLUS       : '+' ;

MUL_OP     : '*' | '/' | '%' ;
ASSIGN_OP  : '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' ;
REL_OP     : '==' | '<=' | '>=' | '!=' | '<' | '>' ;
INCR       : '++' ;
DECR       : '--' ;
// TODO: handle these 
Define     : 'define';
Break      : 'break';

// quit at the end of program is required, make testing easier
Quit       : 'quit' ;    

Length     : 'length';
Return     : 'return';
For        : 'for';
If         : 'if';
While      : 'while';
Sqrt       : 'sqrt';
Scale      : 'scale';
Ibase      : 'ibase';
Obase      : 'obase';
Auto       : 'auto';
 
// ignore multiple-line comments
ML_COMMENT
  : '/*' ( options {greedy=false;} : . )* '*/'
    {
      channel = 99;       // send into nirwana 
    }
  ;

// ignore whitespace
WS
  : ( ' ' | '\t' )+
    {
      channel = 99;       // send into nirwana 
    }
  ;    

// TODO: Interactive mode when there is no 'quit'
// There are 26 named var, currently all of them are initialized to 0
program 
  : input_item+ Quit NEWLINE -> ^( PROGRAM 
                                   ^( ASSIGN_OP ^(VAR LETTER["a"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["b"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["c"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["d"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["e"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["f"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["g"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["h"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["i"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["j"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["k"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["l"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["m"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["n"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["o"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["p"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["q"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["r"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["s"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["t"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["u"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["v"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["w"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["x"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["y"]) NUMBER["0"] )
                                   ^( ASSIGN_OP ^(VAR LETTER["z"]) NUMBER["0"] )
                                   input_item+
                                )
  ;

input_item 
  : semicolon_list NEWLINE!
    |
    function
  ;

semicolon_list 
  : statement? ( ';'! statement? )*
  ;

statement_list     
  : statement? ( ( NEWLINE | ';' ) statement? )*
  ;

// TODO: use a semantic predicate, for deciding when not to print, ASSIGN_OP
statement
  : named_expression ASSIGN_OP^^ expression
    |
    expression -> ^( PRINT expression ) ^( PRINT NEWLINE )
    |
    STRING -> ^( PRINT STRING )
    | 
    If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) )
  ;

// TODO: implement functions
function
  : Define LETTER '(' parameter_list? ')' '{' NEWLINE auto_define_list? statement_list '}'
  ;

parameter_list       
  : LETTER
    |
    define_list ',' LETTER
  ;

auto_define_list
  : Auto define_list ( NEWLINE | ';' )
  ;

define_list
  : LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )*
  ;

argument_list
  : expression
    |
    LETTER '[' ']' ',' argument_list
  ;

relational_expression 
  : expression ( REL_OP^^ expression )?
  ;

return_expression
  : expression?
  ;

expression
  : adding_expression
  ;

named_expression
  : LETTER -> ^( VAR LETTER ) 
  ;

// The following are for getting precedence right

adding_expression
  : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* 
  ;

multiplying_expression
  : unary_expression ( MUL_OP^^ unary_expression )*
  ;

unary_expression
  : postfix_expression
    |
    MINUS postfix_expression -> ^( MUL_OP["*"] NUMBER["-1"] postfix_expression )
    |
    INCR named_expression -> ^( ASSIGN_OP ^(VAR LETTER["a"]) ^( PLUS["+"] ^(VAR LETTER["a"]) NUMBER["1"] ) )
    |
    DECR named_expression -> ^( ASSIGN_OP ^(VAR LETTER["a"]) ^( MINUS["-"] ^(VAR LETTER["a"]) NUMBER["1"] ) )
  ;

postfix_expression
  : NUMBER
    |
    named_expression
    |     
    '(' expression ')' -> expression
  ;
