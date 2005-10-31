%{
/*
 * ast.l
 *
 * Ast lexer
 *
 * Copyright (C) 2004-2005 The Perl Foundation.  All Rights Reserved.
 *
 * The tokenizer.
 */

#ifdef AST_TEST
typedef void Interp;
#include <string.h>
#define str_dup strdup
#else
#include <parrot/parrot.h>
extern char* str_dup(char *);
#endif
#include "ast.h"

#define YY_DECL int ASTlex(YYSTYPE *valp, YYLTYPE *locp, Interp *interp)

YY_DECL;


#define DUP_AND_RET(valp, token)             \
  do {                                       \
      if (valp) (valp)->s = str_dup(yytext); \
      return token;                          \
  } while (0)

#define YY_USER_ACTION set_loc(locp, yytext, yyleng);
static int line, col;
#define YY_USER_INIT line = col = 1;

static void
set_loc(YYLTYPE *l, char const *tok, size_t len)
{
    l->first_line = line;
    l->first_column = col;
    l->last_line = line;
    col += len;
    l->last_column = col;
}

%}

%option never-interactive
%option nounput

LETTER          [a-zA-Z_@]
DIGIT           [0-9]
DIGITS          {DIGIT}+
HEX		0x[0-9A-Fa-f]+
BIN             0b[01]+
DOT		[.]
SIGN            [-+]
BIGINT          {SIGN}?{DIGITS}"L"
FLOATNUM        {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})
LETTERDIGIT     [a-zA-Z0-9_]
LABELLETTERDIGIT     ([a-zA-Z0-9_@]|"::")
ID              {LETTER}{LABELLETTERDIGIT}*
STRINGCONSTANT  \"(\\\"|[^"\n]*)*\"
ENCCHAR         {LETTER}|{DIGIT}|"-"
ENCCHARS        {ENCCHAR}*
ENC             {LETTER}{ENCCHARS}":"
UNICODE         {ENC}{STRINGCONSTANT}
CHARCONSTANT    \'[^'\n]*\'
RANKSPEC        \[[,]*\]
EOL		\r?\n
WS              [\t\f\r\x1a ]
SP              [ ]


%%

"#".*{EOL}	/* skip comments */ {++line; col=1; }
{EOL}             { ++line; col=1; }

{WS}+		/* eat white space */ ;
"Py_Module"        {
			valp->t = IMCC_find_node_nr(yytext);
			return MODULE;
		   }
"PCC_Sub"          {
			valp->t = IMCC_find_node_nr(yytext);
			return PCCSUB;
		   }
"Function"         {
			valp->t = IMCC_find_node_nr(yytext);
			return FUNCTION;
		   }
{ID}		   {
			valp->t = IMCC_find_node_nr(yytext);
			if (valp->t)
			    return IDENTIFIER;
			DUP_AND_RET(valp, NAME);
		   }
{FLOATNUM}         DUP_AND_RET(valp, FLOATC);
{SIGN}?{DIGIT}+    DUP_AND_RET(valp, INTC);
{HEX}              DUP_AND_RET(valp, INTC);
{BIN}              DUP_AND_RET(valp, INTC);

{BIGINT}         {
	valp->s = str_dup(yytext);
        valp->s[strlen(valp->s) - 1] = '\0'; /* trailing 'L' */
        return(STRINGC); /* no BIGINT native format yet */
    }

{STRINGCONSTANT} {
	valp->s = str_dup(yytext);
        return(STRINGC); /* XXX delete quotes, -> emit, pbc */
    }

{UNICODE} {
        char *p = strchr(yytext, '"');
	valp->s = str_dup(p);    /* enc:"..." */
        /* TODO pass charset */
        return(USTRINGC); /* XXX delete quotes, -> emit, pbc */
    }
{CHARCONSTANT} {
        valp->s = str_dup(yytext); /* XXX delete quotes, -> emit, pbc */
        return(STRINGC);
    }

.	return *yytext;

<<EOF>>           yyterminate();

%%

int yywrap(void) { return 1; }
