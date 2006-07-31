//
// jako.g
//
// Jako Grammar for ANTLR v3.0b3.
//
// Expressions, comments, and literals taken from or patterned after the c.g ANSI C ANTLR v3 grammar
// in the set of example grammars available from antlr.org on or about 2006-07-30.
//

grammar JakoParser;

options {
//    backtrack=true;
    memoize=true;
//    k=2;
}

semantic_unit
	:	 (directive  | module_definition | deferred | statement)+ ;

deferred
	:	declaration | definition ;

definition
	:	subroutine_definition;

subroutine_header
	:	'sub' type_name? plain_identifier option* '(' formal_argument_list ')' ;
	
subroutine_declaration
	: 	subroutine_header ';' ;
	
subroutine_definition
	:	subroutine_header block ;
	 
//
// Declarations:
//

declaration
	:	data_declaration | subroutine_declaration ;

data_declaration
	:	constant_declaration | variable_declaration;
	
constant_declaration
	:	'const' type_name plain_identifier '=' literal ';';

variable_declaration
	:	'var' type_name plain_identifier_list ( '=' expression )? ';';

plain_identifier_list
	:	plain_identifier ( ',' plain_identifier )* ;

//
// Definitions:
//

option
	:	':' plain_identifier ( '=' STRING_LITERAL )?
	;

formal_argument_list
	:
	|	type_name plain_identifier ( ',' type_name plain_identifier )*
	;
	
module_definition
	:	'module' identifier  option* '{' deferred+ '}'
	;

//
// Directives:
//
	
directive
	:	use_directive
	;

use_directive
	:	'use' identifier  ';'
	;

//
// Statements:
//

statement
	:	basic_statement statement_modifier? ';'
	|	while_statement
	|	if_statement
	;

basic_statement
	:	side_effect_statement
	|	return_statement
	|	loop_control_statement
	|	goto_statement
	;

statement_modifier
	:	'if' '(' expression ')' 
	| 	'unless' '(' expression ')'
	;
	
side_effect_statement
	:	expression
	;

goto_statement
	:	'goto' plain_identifier ;

//call_statement
//	:	call ;
//	
//call	:	identifier  '(' actual_argument_list ')' ;
//
//actual_argument_list
//	:	
//	|	expression ( ',' expression )* ;
	
while_statement	:	'while' '(' expression ')' block ( 'continue' block )? ;

if_statement
	:	'if' '(' expression ')' block ( 'else' block )? ;
	
return_statement
	:	'return' expression? ;

loop_control_statement
	:	( 'last' | 'next' ) plain_identifier? ;

//
// Expressions:
//

//value	:	 literal | lvalue ;

construction_expression
	:	'new' identifier  ;

argument_expression_list
	:	assignment_expression ( ',' assignment_expression )*
	;

additive_expression
	:	multiplicative_expression ( '+' multiplicative_expression | '-' multiplicative_expression )*
	;

multiplicative_expression
	:	unary_expression ( '*' unary_expression | '/' unary_expression | '%' unary_expression )*
	;

unary_expression
	: postfix_expression
	| '++' unary_expression
	| '--' unary_expression
	| unary_operator unary_expression
	;

postfix_expression
	:	primary_expression
	(	'[' expression ']'
	|	'(' ')'
	|	'(' argument_expression_list ')'
	|	'.' plain_identifier
	|	'++'
	|	'--'
	)*
	;

unary_operator
	:	'+'
	|	'-'
	|	'!'
	;

primary_expression
	:	identifier
	|	literal
	|	'(' expression ')'
	;

expression
	:	assignment_expression
	|	construction_expression
	;

assignment_expression
	:	lvalue assignment_operator assignment_expression
	;
	
lvalue
	:	unary_expression
	;

assignment_operator
	:	'='
	|	'*='
	|	'/='
	|	'%='
	|	'+='
	|	'-='
	|	'~='
	;

logical_or_expression
	:	logical_and_expression ( '||' logical_and_expression )*
	;

logical_and_expression
	:	inclusive_or_expression ( '&&' inclusive_or_expression )*
	;

inclusive_or_expression
	:	exclusive_or_expression ( '|' exclusive_or_expression )*
	;

exclusive_or_expression
	:	and_expression ( '^' and_expression )*
	;

and_expression
	:	equality_expression ( '&' equality_expression )*
	;

equality_expression
	:	relational_expression ( ( '==' | '!=' ) relational_expression )*
	;

relational_expression
	:	additive_expression ( ( '<' | '>' | '<=' | '>=' ) additive_expression )*
	;

//
// Basics:
//

label	:	LABEL ;
	
type_name
	:	'int' | 'str' | 'num' | 'pmc';

literal
    :   HEX_LITERAL
    |   OCTAL_LITERAL
    |   DECIMAL_LITERAL
    |	STRING_LITERAL
    |   FLOATING_POINT_LITERAL
    ;
	
block	:	'{' ( data_declaration | statement )* '}' ;

scoped_identifier
	:	NAME
	;

plain_identifier
	:	WORD
	;

identifier
	:	scoped_identifier
	|	plain_identifier
	;

//
// Tokens:
//

NAME	:	WORD ( '::' WORD )+ ;

WORD	:	LETTER (LETTER|'0'..'9')* ;

LABEL	:	WORD ':' ;

STRING_LITERAL
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

fragment
LETTER
	:	'$'
	|	'A'..'Z'
	|	'a'..'z'
	|	'_'
	;
	
HEX_LITERAL : '0' ('x'|'X') HexDigit+ ;

DECIMAL_LITERAL : '-'? ('0' | '1'..'9' '0'..'9'*) ;

OCTAL_LITERAL : '0' ('0'..'7')+ ;

fragment
HexDigit : ('0'..'9'|'a'..'f'|'A'..'F') ;

FLOATING_POINT_LITERAL
    :   '-'? ('0'..'9')+ '.' ('0'..'9')* Exponent? 
    |   '-'? '.' ('0'..'9')+ Exponent? 
    |   '-'? ('0'..'9')+ Exponent  
	;

fragment
Exponent : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   OctalEscape
    ;

fragment
OctalEscape
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UnicodeEscape
    :   '\\' 'u' HexDigit HexDigit HexDigit HexDigit
    ;

WS  :  (' '|'\r'|'\t'|'\u000C'|'\n') {channel=99;}
    ;

COMMENT
    :   '/*' ( options {greedy=false;} : . )* '*/' {channel=99;}
    ;

LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n' {channel=99;}
    ;

// ignore #line info for now
LINE_COMMENT_2
    : '#' ~('\n'|'\r')* '\r'? '\n' {channel=99;}
    ;
