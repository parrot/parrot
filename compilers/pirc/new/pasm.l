
%{


/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#define  YY_NO_UNISTD_H

#include "pasmparser.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>




/*

The C89 standard does not define a strdup() in the C library,
so define our own strdup. Function names beginning with "str"
are reserved (I think), so make it dupstr, as that is what it
does: duplicate a string.

*/
char *
dupstr(char const * const source) {
    char *newstring = (char *)calloc(strlen(source) + 1, sizeof (char));
    assert(newstring);
    strcpy(newstring, source);
    return newstring;
}

/*

See dupstr, except that this version takes the number of characters to be
copied. Easy for copying a string except the quotes.

*/
char *
dupstrn(char const * const source, size_t num_chars) {
    char *newstring = (char *)calloc(num_chars + 1, sizeof (char));
    assert(newstring);
    /* only copy num_chars characters */
    strncpy(newstring, source, num_chars);
    return newstring;
}

%}

ALPHA   [a-zA-Z_]
DIGIT   [0-9]
DIGITS  [0-9]+
ALNUM   ({ALPHA}|{DIGIT})
IDENT   {ALPHA}{ALNUM}*

EOL            \r?\n
DOT            [.]
HEX            0[xX][0-9A-Fa-f]+
OCT            0[oO][0-7]+
BIN            0[bB][01]+
WS             [\t\f\r\x1a ]
SIGN           [-+]
BIGINT         {SIGN}?{DIGITS}"L"
FLOATNUM       {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})
DQ_STRING       \"(\\.|[^"\\\n])*\"
SQ_STRING       \'[^'\n]*\'
Q_STRING       {SQ_STRING}|{DQ_STRING}

%option reentrant
%option noyywrap
%option bison-bridge
%option never-interactive
%option nounput
%option debug
%option prefix="pasm"
%option warn
%option outfile="pasmlexer.c"
%option header-file="pasmlexer.h"

%%

{EOL}[{WS}{EOL}]* { return TK_NL; }

"["            { return '['; }
"]"            { return ']'; }
","            { return ','; }
";"            { return ';'; }

".lex"         { return TK_LEX; }
".pcc_sub"     { return TK_PCC_SUB; }
".namespace"   { return TK_NAMESPACE; }

":init"        { return TK_FLAG_INIT; }
":anon"        { return TK_FLAG_ANON; }
":main"        { return TK_FLAG_MAIN; }
":load"        { return TK_FLAG_LOAD; }
":immediate"   { return TK_FLAG_IMMEDIATE; }
":postcomp"    { return TK_FLAG_POSTCOMP; }

"P"{DIGITS}    { yylval->sval = dupstr(yytext); return TK_PREG; }
"S"{DIGITS}    { yylval->sval = dupstr(yytext); return TK_SREG; }
"N"{DIGITS}    { yylval->sval = dupstr(yytext); return TK_NREG; }
"I"{DIGITS}    { yylval->sval = dupstr(yytext); return TK_IREG; }

{IDENT}        { /* must be a parrot op; PASM does not know about other identifiers. */
                 yylval->sval = dupstr(yytext);
                 return TK_PARROT_OP;
               }

{IDENT}":"     { yylval->sval = dupstr(yytext);
                 return TK_LABEL;
               }

[1-9]{DIGIT}*  { yylval->ival = atoi(yytext);
                 return TK_INTC;
               }

({HEX}|{OCT}|{BIN})   { yylval->ival = atoi(yytext); /* <<== does that work? */
                        return TK_INTC;
                      }

{FLOATNUM}     { yylval->nval = atof(yytext);
                 return TK_NUMC;
               }

{Q_STRING}     { yylval->sval = dupstr(yytext);
                 return TK_STRINGC;
               }

<<EOF>>        { yyterminate(); }

.              { fprintf(stderr, "Unknown character: '%s'\n", yytext); }

%%

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

