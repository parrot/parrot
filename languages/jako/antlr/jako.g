grammar JakoParser;

//options {
//
//}

semantic_unit
	:	 (directive  | module_definition | deferred | statement)+ ;

deferred
	:	declaration | definition;
	
directive
	:	use_directive;

declaration
	:	constant_declaration
	|	variable_declaration
	| 	subroutine_declaration;

constant_declaration
	:	'const' type_name IDENTIFIER '=' literal ';';

variable_declaration
	:	type_name IDENTIFIER ';';

subroutine_declaration
	:	'sub' type_name? IDENTIFIER option* '(' formal_argument_list ')' ';';

option	:	':' IDENTIFIER ('=' STRING_LITERAL)?;

formal_argument_list
	:
	| type_name IDENTIFIER (',' type_name IDENTIFIER)*;
	
definition
	:	;
	
module_definition
	:	'module' IDENTIFIER '{' deferred+ '}';
	
type_name
	:	'int' | 'str' | 'num' | 'pmc';

use_directive
	:	'use' IDENTIFIER ';';

scoped_name	:	IDENTIFIER '::' IDENTIFIER;

name	:	scoped_name | IDENTIFIER;

statement
	:labeled_statement |	call;
	
labeled_statement
	:	IDENTIFIER ':' statement;
	
call	:	name '(' ')' ';';

literal
    :   HEX_LITERAL
    |   OCTAL_LITERAL
    |   DECIMAL_LITERAL
    |	STRING_LITERAL
    |   FLOATING_POINT_LITERAL
    ;
    
IDENTIFIER
	:	LETTER (LETTER|'0'..'9')*
	;
	
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

DECIMAL_LITERAL : ('0' | '1'..'9' '0'..'9'*) ;

OCTAL_LITERAL : '0' ('0'..'7')+ ;

fragment
HexDigit : ('0'..'9'|'a'..'f'|'A'..'F') ;

FLOATING_POINT_LITERAL
    :   ('0'..'9')+ '.' ('0'..'9')* Exponent? 
    |   '.' ('0'..'9')+ Exponent? 
    |   ('0'..'9')+ Exponent  
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
