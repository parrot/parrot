%{
/*
 * ast.y
 *
 * AST parser
 *
 * Copyright (C) 2004 by leo
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "../imcc/imc.h"
#include "ast.h"
#include "astparser.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * we use a pure parser with the interpreter as a parameter
 * this still doesn't make the parser reentrant, there are too
 * many globals around.
 * These globals should go into one structure, which could be
 * attached to the interpreter
 */
static void pr_error(YYLTYPE loc, const char *s);
#undef yyerror
#define yyerror(s) pr_error(yylloc, s)

int yylex(YYSTYPE*, YYLTYPE*, Interp*);

#define YYPARSE_PARAM interp
#define YYLEX_PARAM interp

%}

%union {
    int t;
    char *s;
    struct nodeType_t *n;
}

%token <s> STRINGC INTC FLOATC USTRINGC NAME
%token <t> IDENTIFIER MODULE PCCSUB FUNCTION

%type <n> program nodes nodes0 node const var opcode
%type <t> type

%pure_parser

%start program

%%

program: nodes          { IMCC_INFO(interp)->top_node = $$; }
     | error { pr_error(@1, "Bug"); YYABORT; }
     ;

nodes0: nodes
     | /* empty */	{ $$ = 0; }
     ;

nodes: node
     | nodes node       { $$ = IMCC_append_node(interp, $1, $2, &@1); }
     | const
     | var
     | opcode
     ;

node: IDENTIFIER '(' nodes0 ')'   { $$ = IMCC_new_node(interp, $1, $3, &@1); }
    | FUNCTION          { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
                 '(' nodes ')'  { $$ = IMCC_new_node(interp, $1, $4, &@1);
		                  $$->unit = cur_unit;
		                  cur_unit = cur_unit->prev; }
    | MODULE            { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
                 '(' nodes ')'  { $$ = IMCC_new_node(interp, $1, $4, &@1); }
    | PCCSUB            { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
                 '(' nodes ')'  { $$ = IMCC_new_node(interp, $1, $4, &@1); }
	;

const:
      STRINGC		{ $$ = IMCC_new_const_node(interp, $1, 'S', &@1); }
    | INTC              { $$ = IMCC_new_const_node(interp, $1, 'I', &@1); }
    | FLOATC            { $$ = IMCC_new_const_node(interp, $1, 'N', &@1); }
    | USTRINGC          { $$ = IMCC_new_const_node(interp, $1, 'U', &@1); }
    ;

var: type NAME          { $$ = IMCC_new_var_node(interp, $2, $1, &@2); }
   ;

type: ':' 		{ $$ = 'P'; }
    ;

opcode:  NAME          { $$ = IMCC_new_const_node(interp, $1, 'o', &@1); }
   ;

%%

static void
pr_error(YYLTYPE l, const char *s)
{
    fprintf(stdout, "%s at line %d col %d\n",
	    s, l.first_line, l.first_column);
}

