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

#include <parrot/parrot.h>
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

extern struct nodeType_t *top_node;

%}

%union {
    int t;
    char *s;
    struct nodeType_t *n;
}

%token <s> STRINGC INTC FLOATC USTRINGC
%token <t> IDENTIFIER

%type <n> program nodes node term

%pure_parser

%start program
%expect 2

%%

program: nodes          { top_node = $$; }
     | error { pr_error(@1, "Bug"); YYABORT; }
     ;
nodes: node
     | nodes node       { $$ = IMCC_append_node(interp, $1, $2, &@1); }
     | term
     ;

node: IDENTIFIER '(' nodes ')'   { $$ = IMCC_new_node(interp, $1, $3, &@1); }
	;

term: /* empty */	{ $$ = 0; }
    | STRINGC		{ $$ = IMCC_new_const_node(interp, $1, 'S', &@1); }
    | INTC              { $$ = IMCC_new_const_node(interp, $1, 'I', &@1); }
    | FLOATC            { $$ = IMCC_new_const_node(interp, $1, 'N', &@1); }
    | USTRINGC          { $$ = IMCC_new_const_node(interp, $1, 'U', &@1); }
    ;

%%

static void
pr_error(YYLTYPE l, const char *s)
{
    fprintf(stdout, "%s at line %d col %d\n",
	    s, l.first_line, l.first_column);
}

