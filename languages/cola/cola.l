%{
/*
 * cola.l
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * The lexer. Grammar for Flex.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cola.h"
#include "parser.h"

extern long line;
int yyerror( char * );
%}

%option outfile="lexer.c"

LETTER		[a-zA-Z_]
DIGIT		[0-9]
LETTERDIGIT	[a-zA-Z0-9_]
STRINGCONSTANT	\"[^"\n]*["\n]

%%

[\n]			{	line++; }
\/\/.*\n		{	line++;	/* COMMENT */}


"__asm"			{	return(ASM);	}
"bool"			{	return(BOOL);	}
"break"			{	return(BREAK);	}
"byte"			{	return(BYTE);	}
"const"			{	return(CONST);	}
"continue"		{	return(CONTINUE);	}
"char"			{	return(CHAR);	}
"class"			{	return(CLASS);	}
"decimal"		{	return(DECIMAL);}
"double"		{	return(DOUBLE);	}
"else"			{	return(ELSE);	}
"false"			{	return(FALSE);	}
"float"			{	return(FLOAT);	}
"get"			{	return(GET);	}
"goto"			{	return(GOTO);	}
"for"			{	return(FOR);	}
"if"			{	return(IF);	}
"int"			{	return(INT);	}
"long"			{	return(LONG);	}
"namespace"		{	return(NAMESPACE);	}
"new"			{	return(NEW);	}
"null"			{	return(NULLVAL);}
"out"			{	return(OUT);	}
"object"		{	return(OBJECT);	}
"override"		{	return(OVERRIDE);	}
"public"		{	return(PUBLIC);	}
"private"		{	return(PRIVATE);	}
"protected"		{	return(PROTECTED);	}
"readonly"		{	return(READONLY);	}
"ref"			{	return(REF);	}
"return"		{	return(RETURN);	}
"set"			{	return(SET);	}
"sbyte"			{	return(SBYTE);	}
"short"			{	return(SHORT);	}
"static"		{	return(STATIC);	}
"string"		{	return(STRING);	}
"true"			{	return(TRUE);	}
"uint"			{	return(UINT);	}
"ulong"			{	return(ULONG);	}
"ushort"		{	return(USHORT);	}
"using"			{	return(USING);	}
"virtual"		{	return(VIRTUAL);}
"void"			{	return(VOID);	}
"while"			{	return(WHILE);	}


{LETTER}{LETTERDIGIT}*      {
                				Symbol * s;
                				s = new_symbol(IDENTIFIER, yytext);
                				s->line = line;
                				yylval.sym = s; 
                				return(IDENTIFIER);
                			}

{DIGIT}+"."{DIGIT}+         {	
                				Symbol * s = new_symbol(LITERAL, yytext);
                				s->type = t_float;
                				yylval.sym = s; 
                				return(LITERAL);
                			}

{DIGIT}+                    {	
                				Symbol * s = new_symbol(LITERAL, yytext);
                				s->type = t_int;
                				yylval.sym = s; 
                				return(LITERAL);
                			}

{STRINGCONSTANT}            {
                				Symbol * s = new_symbol(LITERAL, yytext);
                				s->type = t_string;
                				yylval.sym = s;
                				return(LITERAL);
                			}

"++"		{	return(INC);	}
"--"		{	return(DEC);	}
"||"		{	return(LOGICAL_OR);	}
"&&"		{	return(LOGICAL_AND);	}
"=="		{	return(LOGICAL_EQ);	}
"!="		{	return(LOGICAL_NE);	}
"<<"		{	return(LEFT_SHIFT);	}
">>"		{	return(RIGHT_SHIFT);	}
"."			{	return('.');	}
"["			{	return('[');	}
"]"			{	return(']');	}
","			{	return(',');	}
":"			{	return(':');	}
";"			{	return(';');	}
"<="		{	return(LOGICAL_LTE);	}
">="		{	return(LOGICAL_GTE);	}
"<"			{	return(LOGICAL_LT);	}
">"			{	return(LOGICAL_GT);	}
"("			{	return('(');	}
")"			{	return(')');	}
"{"			{	return('{');	}
"}"			{	return('}');	}
"="			{	return('=');	}
"+"			{	return('+');	}
"-"			{	return('-');	}
"/"			{	return('/');	}
"*"			{	return('*');	}
"!"			{	return('!');	}
"%"			{	return('%');	}
[\t\f ]+		;
.			{ /* ignore */		}
%%

#ifdef yywrap
#undef yywrap
#endif

int yywrap() {
	/* Add code here to open next source file and start scanning
	   yywrap returns 0 if scanning is to continue
	*/
	return 1;
}

