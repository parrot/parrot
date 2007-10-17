%{
#include "pirparser.h"
#include <stdlib.h>

static int is_parrot_op(char *spelling);



/* datastructure to store the heredocs, nested please! */

typedef struct heredoc_info {
   char *contents;  /* contents of heredoc */
   char *delimiter; /* delimiter of heredoc */
   struct heredoc_info *next; /* this is a linked list, ptr to next */

} heredoc_info;


/* data structure for managing included files */

typedef struct file_info {
   char *filename;
   int line_nr;
   int line_pos;
   YY_BUFFER_STATE buffer;
   struct file_info *prev;

} file_info;

/* global! */
static file_info *current_file = NULL;

/*

=item static void push_file_info(file_info *info)

Store a file_info structure on a stack.

=cut

*/
static void
push_file_info(file_info *info) {
    info->prev = current_file;
    current_file = info;
}



/*

=item static file_info *pop_file_info(void)

Pop a file_info structure from a stack.

=cut

*/
static file_info *
pop_file_info(void) {
    if (current_file == NULL) {
        //fprintf(stderr, "pop_file_info(): returning NULL\n");
        return NULL;
    }
    else {
        file_info *returning = current_file;
        //fprintf(stderr, "pop_file_info(): returning info object\n");
        current_file = current_file->prev;
        //fprintf(stderr, "current_file is now NULL\n");
        return returning;
    }
}


static void
switch_to_file(file_info *info) {

    /* restore the buffer info */
    yylineno = info->line_nr;

    /* delete the current buffer (of the included file *)
    yy_delete_buffer(YY_CURRENT_BUFFER);
    /* close current file */
    fclose(yyin);

    /* switch back to previous file */
    yy_switch_to_buffer(info->buffer);

    /* and free all resources of the buffer */

    /*free(info->filename);
    */

    free(info);
    info = NULL;
}

/*

*/
static heredoc_info *
new_heredoc(void) {
    heredoc_info *heredoc = (heredoc_info *)malloc(sizeof(heredoc_info));
    /* do stuff */
    return heredoc;
}

static void
read_macro(void) {
    int next_token;

    /* get next token, this must be macro id */
    next_token = yylex();

    if (next_token != TK_IDENT) {
        yyerror("macro identifier expected after '.macro'");
    }

    /* read macro parameters, if any */

    /* read macro body */

    /* TODO */ ;

}

%}

ALPHA	       [a-zA-Z@_]
DIGIT          [0-9]
DIGITS         {DIGIT}+
ALNUM          {ALPHA}|{DIGIT}
DOT            [.]
HEX            0[xX][0-9A-Fa-f]+
OCT            0[oO][0-7]+
BIN            0[bB][01]+

SIGN           [-+]
BIGINT         {SIGN}?{DIGITS}"L"
FLOATNUM       {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})

DQ_STRING       \"(\\.|[^"\\\n])*\"
SQ_STRING       \'[^'\n]*\'
Q_STRING       {SQ_STRING}|{DQ_STRING}



%x HEREDOC
%x MACRO

/* use built-in line counter */
%option yylineno
%option stack

%%



[\t\r ]                    { /* ignore */; }
\n([\t\r\n ]|#.*\n)*       { return TK_NL; }


#.*\n          { /* skip line comments */ ; }

"<<"{Q_STRING} {
                    /* skip the "<<" and the quote */
                    char *heredoc_id = strdup(yytext + 2 + 1);
                    /* remove the closing quote */
                    heredoc_id[strlen(heredoc_id) - 1] = '\0';
                    printf("heredoc id: '%s'\n", heredoc_id);
                    //return TK_HEREDOC;

                    yy_push_state(HEREDOC);
                    /*
                    - read line by line
                    - each time, check whether line == delimiter
                    -- check for ^ start of line?
                    - when returning set the heredoc contents accessible to the parser in the %union.
                    - return TK_STRINGC?
                    */
               }


<HEREDOC>^.*$   { fprintf(stderr, "Heredoc delimiter: '%s'\n", yytext);

                          /* is this the heredoc delimiter? */
                          yy_pop_state();
                          return TK_STRINGC;
                        }

<HEREDOC>.*\n  { fprintf(stderr, "heredoc: '%s'\n", yytext); }


">>>="      { return TK_ASSIGN_USHIFT; }
">>>"       { return TK_USHIFT; }
">>="       { return TK_ASSIGN_RSHIFT; }
">>"        { return TK_RSHIFT; }
"<<"        { return TK_LSHIFT; }

".."        { return TK_DOTDOT; }
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
","         { return ','; }
"("         { return '('; }
")"         { return ')'; }
"["         { return '['; }
"]"         { return ']'; }
"."         { return '.'; }
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
"new"             { return TK_NEW; }
"n_operators"     { return TK_N_OPERATORS; }
"null"            { return TK_NULL; }
"unless"          { return TK_UNLESS; }

"int"             { return TK_INT; }
"num"		      { return TK_NUM; }
"pmc"		      { return TK_PMC; }
"string"	      { return TK_STRING; }

".arg"            { return TK_ARG; }
".const"          { return TK_CONST; }
".emit"           { return TK_EMIT; }
".endnamespace"   { return TK_ENDNAMESPACE; }
".end"            { return TK_END; }
".endm"           { ; }
".eom"            { return TK_EOM; }
".get_results"    { return TK_GET_RESULTS; }
".globalconst"    { return TK_GLOBALCONST; }
".HLL"            { return TK_HLL; }
".HLL_map"        { return TK_HLL_MAP; }
".invocant"       { return TK_INVOCANT; }
".lex"            { return TK_LEX; }
".loadlib"        { return TK_LOADLIB; }
".local"          { return TK_LOCAL; }
".macro"          { ; }
".meth_call"      { return TK_METH_CALL; }
".namespace"      { return TK_NAMESPACE; }
".nci_call"       { return TK_NCI_CALL; }
".param"	      { return TK_PARAM; }
".pcc_begin"      { return TK_PCC_BEGIN; }
".pcc_begin_return" { return TK_PCC_BEGIN_RETURN; }
".pcc_begin_yield"  { return TK_PCC_BEGIN_YIELD; }
".pcc_call"       { return TK_PCC_CALL; }
".pcc_end"        { return TK_PCC_END; }
".pcc_end_return" { return TK_PCC_END_RETURN; }
".pcc_end_yield"  { return TK_PCC_END_YIELD; }
".pragma"         { return TK_PRAGMA; }
".result"         { return TK_RESULT; }
".return"         { return TK_RETURN; }
".sub"            { return TK_SUB; }
".yield"          { return TK_YIELD; }

":anon"		 { return TK_FLAG_ANON; }
":init"      { return TK_FLAG_INIT; }
":load"      { return TK_FLAG_LOAD; }
":postcomp"  { return TK_FLAG_POSTCOMP; }
":immediate" { return TK_FLAG_IMMEDIATE; }
":main"      { return TK_FLAG_MAIN; }
":method"    { return TK_FLAG_METHOD; }
":lex"       { return TK_FLAG_LEX; }
":outer"     { return TK_FLAG_OUTER; }
":vtable"    { return TK_FLAG_VTABLE; }
":multi"     { return TK_FLAG_MULTI; }

":unique_reg" { return TK_FLAG_UNIQUE_REG; }
":optional"   { return TK_FLAG_OPTIONAL; }
":opt_flag"   { return TK_FLAG_OPT_FLAG; }
":slurpy"     { return TK_FLAG_SLURPY; }
":named"      { return TK_FLAG_NAMED; }
":flat"       { return TK_FLAG_FLAT; }


{Q_STRING}   { return TK_STRINGC; }

"P"{DIGIT}+  { return TK_PASM_PREG; }
"S"{DIGIT}+  { return TK_PASM_SREG; }
"N"{DIGIT}+  { return TK_PASM_NREG; }
"I"{DIGIT}+  { return TK_PASM_IREG; }

"$P"{DIGIT}+  { return TK_SYM_PREG; }
"$S"{DIGIT}+  { return TK_SYM_SREG; }
"$N"{DIGIT}+  { return TK_SYM_NREG; }
"$I"{DIGIT}+  { return TK_SYM_IREG; }

{ALPHA}{ALNUM}*":"    { return TK_LABEL; }
{ALPHA}{ALNUM}*       { return is_parrot_op(yytext) ? TK_PARROT_OP : TK_IDENT; }


{FLOATNUM}        { return TK_NUMC; }
{SIGN}?{DIGITS}   { return TK_INTC; }
{HEX}             { return TK_INTC; }
{BIN}             { return TK_INTC; }
{OCT}             { return TK_INTC; }

".include"   { int next_token, file_name_length;
               FILE *incl_file_ptr   = NULL;
               char *incl_file_name  = NULL;
               file_info *file_state = NULL;
               YY_BUFFER_STATE incl_file_buffer;

               /* get next token containing name of file being included */
               next_token = yylex();
               /* check that it's a string, if not return to parser */
               if (next_token != TK_STRINGC) {
                   return next_token;
               }

               /* retrieve name of file, remove quotes */
               file_name_length = yyleng - 2;
               incl_file_name = (char *)calloc(file_name_length + 1, sizeof(char));
               /* copy current token's characters, skip first character */
               strncpy(incl_file_name, yytext + 1, file_name_length);

               /* open the file */
               fprintf(stderr, "Opening file '%s'\n", incl_file_name);
               incl_file_ptr = fopen(incl_file_name, "r");

               /* after an include statement a newline is expected */
               next_token = yylex();
               if (next_token != TK_NL) {
                   yyerror("newline expected after \".include '<string>'\"\n");
               }

               /* save current file info */
               file_state = (file_info *)malloc(sizeof(file_info));
               file_state->buffer   = YY_CURRENT_BUFFER;
               file_state->filename = NULL; /* FIX */
               file_state->line_pos = 0; /* FIX */
               file_state->line_nr  = yylineno;
               file_state->prev     = NULL; /* initialize to NULL */

               /* store the info structure on the stack */
               push_file_info(file_state);

               /* a new file is being scanned, reset line number */
               yylineno = 1;

               if (incl_file_ptr == NULL) { /* opening file went wrong */
                   fprintf(stderr, "Error including file '%s'\n", incl_file_name);
               }
               else {
                   /* create a new buffer for the included file and switch to that file */
                   incl_file_buffer = yy_create_buffer(incl_file_ptr, YY_BUF_SIZE);
                   yy_switch_to_buffer(incl_file_buffer);

               }
             }

".constant"  { int next_token;
               char *constant_id;

               next_token = yylex();
               if (next_token != TK_IDENT) {
                  yyerror("identifier expected after '.constant'.");
               }
               /* store identifier */
               constant_id = strdup(yytext);

               /* read value */
               next_token = yylex();

               switch (next_token) {
                   case TK_INTC:
                   case TK_NUMC:
                   case TK_STRINGC:
                   case TK_SYM_PREG:
                   case TK_SYM_NREG:
                   case TK_SYM_IREG:
                   case TK_SYM_SREG:
                   case TK_PASM_PREG:
                   case TK_PASM_NREG:
                   case TK_PASM_IREG:
                   case TK_PASM_SREG:
                       /* store value by this constant's name */
                       /* copy yytext into some buffer */
                       break;
                   default:
                       yyerror("Constant value of '%s' must be a number, "
                               "string literal or register", constant_id);
                       break;
               }

               /* after the .constant declaration, a newline must be read */
               next_token = yylex();
               if (next_token != TK_NL) {
                   yyerror("newline expected after constant declaration");
               }

             }

".macro"            {  read_macro(); }


<MACRO>".endm"      { /* TODO */ ;

                      yy_pop_state();
                    }




[.]{ALNUM}    { /* check whether this token is a constant or a macro */
                /* TODO */

                /* not found, this is an unknown constant or macro. */
                yyerror("Undefined constant or macro");
              }


<<EOF>>		{  file_info *info = pop_file_info();

               if (info == NULL) {
                   /* this was the initial file given to Parrot */
                   yyterminate();
               }
               else { /* this file was included */
                   switch_to_file(info);
               }
            }

.	{ yyerror("Unexpected character"); }


%%


/*
 * Have yywrap return 1, so that the scanner will not
 * continue after an end of file.
 */
int yywrap() {
    return 1;
}

static int
is_parrot_op(char *spelling) {

    /* only "print" is recognized as a Parrot instruction */
    if (strcmp(spelling, "print") == 0)
        return 1;
    return 0;
}
