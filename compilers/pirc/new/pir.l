%{

/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 NAME

pir.l

=head1 DESCRIPTION

This is a complete rewrite of the PIR lexical analyzer, as defined in IMCC.
Goal is to fix the issues with the current implementation of the PIR language.

The current approach is to create a three-pass compiler, but if any optimizations
in this schedule can be made, then this is preferred. This needs more experimentation.

The first pass is the heredoc pre-processor, which converts all heredoc strings into
normal strings (they are "flattened). Furthermore, this phase strips all comments, both
POD and line comments.

The second pass is the macro pre-processor, which handles the C<.macro>, C<.macro_const>
and C<.include> directives. The resulting output is the file that can be fed into the
actual PIR parser.

The third pass is then the PIR parsing phase. It takes the output of the macro pre-processor,
which contains no heredoc strings and macros. For that reason, the PIR lexer is very
simple and straightforward.

Each of the phases can be easily implemented. When they must be combined, the complexity
grows quickly. Therefore, this approach, which is probably not the most efficient, is
easier to maintain, and preferable.


=cut

*/

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include "pirparser.h"
#include "pircompiler.h"
#include "pirsymbol.h"

/* Windows doesn't have <unistd.h> */
#define YY_NO_UNISTD_H

/* define the type of the extra field in the yyscan_t object that is passed around */
#define YY_EXTRA_TYPE  struct lexer_state *

/* accessor methods for setting and getting the lexer_state */
extern YY_EXTRA_TYPE yyget_extra(yyscan_t scanner);
extern void yyset_extra(YY_EXTRA_TYPE lexer, yyscan_t scanner);

/* accessor method to get yytext */
extern char *yyget_text(yyscan_t yyscanner);

/* declaration of yylex */
extern int yylex(YYSTYPE *yylval, yyscan_t yyscanner);

/* declaration of yyerror */
extern void yyerror(yyscan_t yyscanner, lexer_state * const lexer, char *message);



/* keep MSVC happy */
#ifndef YY_MAIN
#  define YY_MAIN 0
#endif

/* keep MSVC happy */
#ifndef YY_ALWAYS_INTERACTIVE
#  define YY_ALWAYS_INTERACTIVE 0
#endif



/* Parrot can check out whether the specified text is the name of an op.
 * We define a dummy function for now; replace this later.
 */
static int is_parrot_op(char const * const spelling);



#define DEBUG1
/* think of a smarter way to do this; only print when DEBUG is defined */
#ifdef DEBUG
#  define printdebug fprintf
#else
#  define printdebug noprint
void noprint(FILE *fp, char *format, ...) { }
#endif



/*

=over 4

=item C<dupstr>

The C89 standard does not define a strdup() in the C library,
so define our own strdup. Function names beginning with "str"
are reserved (I think), so make it dupstr, as that is what it
does: duplicate a string.

=cut

*/
static char *
dupstr(char const * const source) {
    char *newstring = (char *)calloc(strlen(source) + 1, sizeof (char));
    assert(newstring);
    strcpy(newstring, source);
    return newstring;
}

/*

=item C<dupstrn>

See dupstr, except that this version takes the number of characters to be
copied. Easy for copying a string except the quotes.

=cut

*/
static char *
dupstrn(char const * const source, size_t num_chars) {
    char *newstring = (char *)calloc(num_chars + 1, sizeof (char));
    assert(newstring);
    /* only copy num_chars characters */
    strncpy(newstring, source, num_chars);
    return newstring;
}


/*

=item C<new_lexer>

constructor for a lexer. It's very important to initialize all fields.

=cut

*/
lexer_state *
new_lexer(char * const filename) {
    lexer_state *lexer   = (lexer_state *)malloc(sizeof (lexer_state));
    assert(lexer != NULL);

    /* clear all fields */
    memset(lexer, 0, sizeof (lexer_state));

    lexer->filename      = filename;
    /*
    lexer->parse_errors  = 0;
    lexer->current_ns    = NULL;
    lexer->subs          = NULL;
    lexer->curtarget     = NULL;
    lexer->curarg        = NULL;
    lexer->globals       = NULL;
    lexer->constants     = NULL;
    */

    printdebug(stderr, "Constructing new lexer\n");

    return lexer;
}

/*

=back

=cut

*/




%}

ALPHA          [a-zA-Z@_]
DIGIT          [0-9]
DIGITS         {DIGIT}+
ALNUM          {ALPHA}|{DIGIT}

IDENT          {ALPHA}{ALNUM}*

DOT            [.]
HEX            0[xX][0-9A-Fa-f]+
OCT            0[oO][0-7]+
BIN            0[bB][01]+
WS             [\t\f\r\x1a ]
EOL            \r?\n

SIGN           [-+]
BIGINT         {SIGN}?{DIGITS}"L"
FLOATNUM       {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})

DQ_STRING       \"(\\.|[^"\\\n])*\"
SQ_STRING       \'[^'\n]*\'
Q_STRING       {SQ_STRING}|{DQ_STRING}


/* make sure yytext is a pointer */
%pointer

/* slightly more efficient when this option is set; our parser is not interactive anyway. */
%option never-interactive

/* define output file */
%option outfile="pirlexer.c"

%option header-file="pirlexer.h"

%option nounput

/* use flex' built-in capability for line counting */
%option yylineno

/* make the scanner re-entrant */
%option reentrant

/* needed for bison interaction. I forgot details. */
%option bison-bridge

/* make yywrap() always return true. */
%option noyywrap

/* always show warnings if something's wrong with our spec. */
%option warn

/* create a scanner in debug mode */
%option debug


%%


{WS}             { /* ignore whitespace */ }

#.*\n            { /* ignore line comments */ }

{EOL}[\t\r\n ]*  { /* a set of continuous newlines yields a single newline token. */
                   return TK_NL;
                 }

">>>="      { return TK_ASSIGN_USHIFT; }
">>>"       { return TK_USHIFT; }
">>="       { return TK_ASSIGN_RSHIFT; }
">>"        { return TK_RSHIFT; }
"<<"        { return TK_LSHIFT; }
"=>"        { return TK_ARROW; }
"=="        { return TK_EQ; }
"!="        { return TK_NE; }
"<="        { return TK_LE; }
">="        { return TK_GE; }
"<"         { return TK_LT; }
">"         { return TK_GT; }

"//"        { return TK_FDIV; }
"&&"        { return TK_AND; }
"||"        { return TK_OR; }
"~~"        { return TK_XOR; }

"+"         { return '+'; }
"%"         { return '%'; }
"*"         { return '*'; }
"/"         { return '/'; }
"!"         { return '!'; }
"~"         { return '~'; }
"-"         { return '-'; }
"("         { return '('; }
")"         { return ')'; }
","         { return ','; }
"["         { return '['; }
"]"         { return ']'; }

{WS}"."{WS} { /* if the dot is surrounded by whitespace, it's a concatenation operator */
              return TK_CONC;
            }

{WS}"."     { /* $P0 .$P1 means concatenation */
              return TK_CONC;
            }

"."{WS}     { /* $P0. $P1 means concatenation */
              return TK_CONC;
            }

"."         { /* at this point all dot-whitespace combinations have been covered;
               * so we can be sure that the dot does not have any surrounding
               * whitespace: that's the method-call dot, as in $P0.$P1().
               */
               return '.';
            }

"="         { return '='; }
";"         { return ';'; }

"+="        { return TK_ASSIGN_INC; }
"-="        { return TK_ASSIGN_DEC; }
"/="        { return TK_ASSIGN_DIV; }
"*="        { return TK_ASSIGN_MUL; }
"%="        { return TK_ASSIGN_MOD; }
"**="       { return TK_ASSIGN_POW; }
"|="        { return TK_ASSIGN_BOR; }
"&="        { return TK_ASSIGN_BAND; }
"//="       { return TK_ASSIGN_FDIV; }
"~="        { return TK_ASSIGN_BNOT; }
".="        { return TK_ASSIGN_CONC; }

"if"              { return TK_IF; }
"goto"            { return TK_GOTO; }
"unless"          { return TK_UNLESS; }
"null"            { return TK_NULL; }

"set"             { return TK_PARROT_SET; }
"add"             { return TK_PARROT_ADD; }
"sub"             { return TK_PARROT_SUB; }
"mul"             { return TK_PARROT_MUL; }
"div"             { return TK_PARROT_DIV; }
"fdiv"            { return TK_PARROT_FDIV; }

"int"             { return TK_INT; }
"num"             { return TK_NUM; }
"pmc"             { return TK_PMC; }
"string"          { return TK_STRING; }

".arg"            { return TK_ARG; }
".const"          { return TK_CONST; }
".end"            { return TK_END; }

".get_results"    { return TK_GET_RESULTS; }
".globalconst"    { return TK_GLOBALCONST; }
".HLL"            { return TK_HLL; }
".HLL_map"        { return TK_HLL_MAP; }
".invocant"       { return TK_INVOCANT; }
".lex"            { return TK_LEX; }
".loadlib"        { return TK_LOADLIB; }
".local"          { return TK_LOCAL; }

".meth_call"      { return TK_METH_CALL; }
".namespace"      { return TK_NAMESPACE; }
".nci_call"       { return TK_NCI_CALL; }
".param"          { return TK_PARAM; }
".begin_call"     { return TK_BEGIN_CALL; }
".begin_return"   { return TK_BEGIN_RETURN; }
".begin_yield"    { return TK_BEGIN_YIELD; }
".call"           { return TK_CALL; }
".end_call"       { return TK_END_CALL; }
".end_return"     { return TK_END_RETURN; }
".end_yield"      { return TK_END_YIELD; }
".result"         { return TK_RESULT; }
".return"         { return TK_RETURN; }
".sub"            { return TK_SUB; }
".yield"          { return TK_YIELD; }

":anon"       { return TK_FLAG_ANON; }
":init"       { return TK_FLAG_INIT; }
":load"       { return TK_FLAG_LOAD; }
":postcomp"   { return TK_FLAG_POSTCOMP; }
":immediate"  { return TK_FLAG_IMMEDIATE; }
":main"       { return TK_FLAG_MAIN; }
":method"     { return TK_FLAG_METHOD; }
":lex"        { return TK_FLAG_LEX; }
":outer"      { return TK_FLAG_OUTER; }
":vtable"     { return TK_FLAG_VTABLE; }
":multi"      { return TK_FLAG_MULTI; }
":lexid"      { return TK_FLAG_LEXID; }
":instanceof" { return TK_INSTANCEOF; }

":unique_reg" { return TK_FLAG_UNIQUE_REG; }
":optional"   { return TK_FLAG_OPTIONAL; }
":opt_flag"   { return TK_FLAG_OPT_FLAG; }
":slurpy"     { return TK_FLAG_SLURPY; }
":named"      { return TK_FLAG_NAMED; }
":flat"       { return TK_FLAG_FLAT; }
":invocant"   { return TK_FLAG_INVOCANT; }


{Q_STRING}   { /* copy the string, remove the quotes. */
               yylval->sval = dupstrn(yytext + 1, yyleng - 2);
               return TK_STRINGC;
             }

"$P"{DIGIT}+  { yylval->ival = atoi(yytext + 2); return TK_PREG; }
"$S"{DIGIT}+  { yylval->ival = atoi(yytext + 2); return TK_SREG; }
"$N"{DIGIT}+  { yylval->ival = atoi(yytext + 2); return TK_NREG; }
"$I"{DIGIT}+  { yylval->ival = atoi(yytext + 2); return TK_IREG; }

{IDENT}":"    { /* make the label Id available in the parser. remove the ":" first. */
                yylval->sval = dupstrn(yytext, yyleng - 1);
                return TK_LABEL;
              }

{IDENT}       { /* identifier; can be a global (sub or const), local or parrot op */
                lexer_state *lexer = yyget_extra(yyscanner);
                symbol      *sym   = find_symbol(lexer, yytext);
                constant    *con;

                /* if the id was declared as a local, return the pointer to the symbol
                 * node. Note that .locals can "hide" opcodes.
                 */
                if (sym != NULL) {
                    yylval->symb = sym;
                    return TK_SYMBOL;
                }

                /* maybe it was a declared .const; if that's the case, then that .const's
                 * value is returned as if the literal constant was parsed.
                 */
                con = find_constant(lexer, yytext);
                if (con != NULL) {
                    switch (con->type) {
                        case INT_TYPE:
                            yylval->ival = con->val.ival;
                            return TK_INTC;
                        case NUM_TYPE:
                            yylval->dval = con->val.nval;
                            return TK_NUMC;
                        case STRING_TYPE:
                            yylval->sval = con->val.sval;
                            return TK_STRINGC;
                        case PMC_TYPE:
                        case UNKNOWN_TYPE:
                        default:
                            fprintf(stderr, "invalid constant type!\n");
                    }
                }

                /* at this point we need to duplicate the string */
                yylval->sval = dupstr(yytext);

                /* at this point it was no local or constant; check whether it's an op. */
                if (is_parrot_op(yytext))
                    return TK_PARROT_OP;

                /* just an identifier; at this point it can be a label identifier or a
                 * constant/local being defined.
                 */
                return TK_IDENT;
              }


{FLOATNUM}        { yylval->dval = atof(yytext); return TK_NUMC; }
{SIGN}?{DIGITS}   { yylval->ival = atoi(yytext); return TK_INTC; }
{HEX}             { yylval->ival = atoi(yytext); return TK_INTC; }
{BIN}             { yylval->ival = atoi(yytext); return TK_INTC; }
{OCT}             { yylval->ival = atoi(yytext); return TK_INTC; }




.      { /* any character not covered in the rules above is an error. */
         yyerror(yyscanner, yyget_extra(yyscanner), "Unexpected character");
       }


<<EOF>>     { /* end of file, stop scanning. */
              yyterminate();
            }

%%

/*

=head1 AUX. FUNCTIONS

=over 4

=item C<static int
is_parrot_op(char const * const spelling)>

=cut

*/
static int
is_parrot_op(char const * const spelling)
{
    /* only these are currently recognized as a Parrot instruction */
    char const * ops[] = {
        "print",
        "new",
        "newclass",
        "end",
        "set",
        "find_global",
        "set_hll_global",
        "get_hll_global",
        "setfile",
        "setline",
        "add",
        "sub",
        NULL
    };


    char const **iter = ops;

    while (*iter != NULL) {
        if (strcmp(spelling, *iter) == 0)
            return 1;
        iter++;
    }

    return 0;
}

/*

=back

=cut

*/




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
