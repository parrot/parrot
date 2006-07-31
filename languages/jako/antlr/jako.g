grammar JakoParser;

//options {
//
//}

semantic_unit
	:	 (directive  | module_definition | deferred | statement)+ ;

deferred
	:	declaration | definition ;

definition
	:	subroutine_definition;

subroutine_header
	:	'sub' type_name? IDENTIFIER option* '(' formal_argument_list ')' ;
	
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
	:	'const' type_name IDENTIFIER '=' literal ';';

variable_declaration
	:	'var' type_name identifier_list ( '=' expression )? ';';

identifier_list
	:	IDENTIFIER ( ',' IDENTIFIER )* ;

//
// Definitions:
//

option	:	':' IDENTIFIER ( '=' STRING_LITERAL )? ;

formal_argument_list
	:
	| type_name IDENTIFIER ( ',' type_name IDENTIFIER )* ;
	
module_definition
	:	'module' IDENTIFIER option* '{' deferred+ '}' ;

//
// Directives:
//
	
directive
	:	use_directive;

use_directive
	:	'use' name ';';

//
// Statements:
//

statement
	:	basic_statement statement_modifier? ';' | while_statement | if_statement ;

basic_statement
	:	call_statement
	|	assignment_statement
	|	return_statement
	|	loop_control_statement
	|	arithmetic_immediate_statement
	|	string_concat_statement
	|	goto_statement
	;

statement_modifier
	:	'if' '(' expression ')' 
	| 	'unless' '(' expression ')' ;
	
arithmetic_immediate_statement
	:	increment_statement | decrement_statement | arithmetic_assign_statement ;

increment_statement
	:	lvalue '++' ;
	
decrement_statement
	:	lvalue '--' ;

arithmetic_assign_statement
	:	lvalue arithmetic_assign_operator expression ;

arithmetic_assign_operator
	:	'+=' | '-=' | '*=' | '%=' ;

goto_statement
	:	'goto' IDENTIFIER ;

call_statement
	:	call ;
	
call	:	name '(' actual_argument_list ')' ;

actual_argument_list
	:	
	|	expression ( ',' expression )* ;
	
assignment_statement
	:	lvalue '=' expression ;

string_concat_statement
	:	value '~=' value ;
	
while_statement	:	'while' '(' expression ')' block ( 'continue' block )? ;

if_statement
	:	'if' '(' expression ')' block ( 'else' block )? ;
	
return_statement
	:	'return' expression? ;

loop_control_statement
	:	( 'last' | 'next' ) IDENTIFIER? ;

//
// Expressions:
//
	
expression
	:	value
	|	call
	|	relational_expression
	|	arithmetic_expression
	|	construction_expression
	;

value	:	 literal | lvalue ;

construction_expression
	:	'new' IDENTIFIER ;
	
relational_expression 
	:	value relational_operator value ;

arithmetic_expression
	:	value arithmetic_operator value ;

//
// Operators:
//
	
relational_operator
	:	'<' | '<=' | '==' | '>=' | '>' | '!=' ;

arithmetic_operator
	:	'+' | '-' | '*' | '/' | '%' ;

//
// Basics:
//

name	:	IDENTIFIER ( '::' IDENTIFIER )* ;

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

lvalue	:	IDENTIFIER ( '[' expression ']' )? ;
	
block	:	'{' ( data_declaration | statement )* '}' ;

//
// Tokens:
//

IDENTIFIER
	:	LETTER (LETTER|'0'..'9')*
	;

LABEL	:	':' IDENTIFIER ;

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
