/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pir.l


=head1 DESCRIPTION

This is a complete rewrite of the PIR lexical analyzer, as defined in IMCC.
Goal is to fix the issues with the current implementation of the PIR language.
Major issues are:

=over 4

=item Grammar is a bit messy, and has some problems, like disallowing line comments in .param declarations.

=item The lexer is messy and not re-entrant. The macro layer is a mess and unmaintainable.

=item No support for nested heredocs.

=item The comment:  "this is just a sign that we suck.  that's all." speaks for itself (imc.h)

=back

=cut

*/

%{
#include "pirparser.h"
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

static int is_parrot_op(char *spelling);

/* prevent compile warnings */
extern int yyerror(char *message);
extern int yylex(void);

/* datastructure to store the heredocs, nested please! */

typedef struct heredoc_info {
   char *contents;  /* contents of heredoc */
   char *delimiter; /* delimiter of heredoc */
   int line_nr;

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


/* data structure to store .constant definitions */
typedef struct constant_info {
    int line_declared;  /* line where the constant was declared */
    int token_type;     /* token type of the value */
    char *name;         /* name of the constant */
    char *value;        /* the value of the constant */

    struct constant_info *next; /* for now, linked list impl. */

} constant_info;


typedef struct macro_info {
    int line_declared;
    char *name;

} macro_info;


/* globals! TODO: store them in a struct for the compiler, which should be passed around. */
static file_info *current_file = NULL;
static constant_info *constant_defs = NULL;
static heredoc_info *heredocs = NULL;
static macro_info *macros = NULL;
static char *after_heredoc = NULL;
static YY_BUFFER_STATE file_buffer;


#define chop_yytext()   (yytext[--yyleng] = '\0')


/*

=over 4

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
        /* fprintf(stderr, "pop_file_info(): returning NULL\n"); */
        return NULL;
    }
    else {
        file_info *returning = current_file;
        /* fprintf(stderr, "pop_file_info(): returning info object\n"); */
        current_file = current_file->prev;
        /* fprintf(stderr, "current_file is now NULL\n"); */
        return returning;
    }
}


static void
switch_to_file(file_info *info) {

    /* restore the buffer info */
    yylineno = info->line_nr;

    /* delete the current buffer (of the included file *) */
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

static void
unshift_heredoc(heredoc_info *heredoc) {
    heredoc->next = heredocs;
    heredocs      = heredoc;
}

static heredoc_info *
shift_heredoc(void) {
    heredoc_info *returning = heredocs;
    if (returning == NULL) {
        fprintf(stderr, "shift_heredoc(): queue is empty!\n");
    }
    else {
        heredocs = heredocs->next;
    }
    return returning;
}


/*

=item static heredoc_info *new_heredoc(void)

=cut

*/
static void
new_heredoc(char *delimiter, int line) {
    heredoc_info *heredoc = (heredoc_info *)malloc(sizeof (heredoc_info));
    heredoc->delimiter = delimiter;
    heredoc->line_nr   = line;
    unshift_heredoc(heredoc);
}


/*

=item static constant_info *find_constant(char *name)

=cut

*/
static constant_info *
find_constant(char *name) {

    constant_info *iter = constant_defs;

    while (iter != NULL) {
        if (strcmp(iter->name, name) == 0) {
            return iter;
        }
        iter = iter->next;
    }
    return NULL;
}

/*

=item static void define_constant(char *name, char *value, int token_type, int line)

=cut

*/
static void
define_constant(char *name, char *value, int token_type, int line) {
    constant_info *info = (constant_info *)malloc(sizeof (constant_info));
    if (info == NULL) {
        fprintf(stderr, "Failed to allocate memory for constant definition.\n");
        exit(1);
    }
    /* create the constant definition */
    info->line_declared = line;
    info->name          = name;
    info->value         = value;
    info->token_type    = token_type;

    /* for now, just use linked list. Later we'll use a hash */
    info->next    = constant_defs;
    constant_defs = info;
}

/*

=item static macro_info *find_macro(char *name)

=cut

*/
static macro_info *
find_macro(char *name) {
    return NULL;
}


/*

=item static void read_macro(void)

=cut

*/
static void
read_macro(void) {
    int next_token;
    int next_char;
    macro_info *macro;


    /* get next token, this must be macro id */
    next_token = yylex();

    /* check that there's a macro identifier token */
    if (next_token != TK_IDENT) {
        yyerror("macro identifier expected after '.macro'");
    }

    /* read macro parameters, if any */
    /*
    next_char = input();
    if (next_char == '(') {


    }
    */
    /* read macro body */

    macro = (macro_info *)malloc(sizeof (macro_info));
    macro->name = strdup(yytext);
}


/*

=back

=cut

*/
#define print_state(); { if (YYSTATE == 0) fprintf(stderr, "State INITIAL\n"); if (YYSTATE == 1) fprintf(stderr, "State HEREDOC1\n"); if (YYSTATE == 2) fprintf(stderr, "State HEREDOC2\n"); if (YYSTATE == 3) fprintf(stderr, "State HEREDOC3\n"); if (YYSTATE == 4) fprintf(stderr, "State SCANSTRING\n"); }



%}

ALPHA          [a-zA-Z@_]
DIGIT          [0-9]
DIGITS         {DIGIT}+
ALNUM          {ALPHA}|{DIGIT}
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

LINECOMMENT    [#].*\n

/* start state for HEREDOC scanning */
%x HEREDOC1
%x HEREDOC2
%x HEREDOC3
%s SCANSTRING

/* start state for macro scanning */
%x MACRO

/* use built-in line counter */
%option yylineno

/* support pushing/popping of start states */
%option stack

/* make sure yytext is a pointer */
%pointer

%%



[\t\r ]                            { fprintf(stderr, "whitespace: "); print_state(); /* ignore */; }

{EOL}([\t\r\n ]|{LINECOMMENT})*    { /* a set of continuous newlines yields a single newline token. */
                                     fprintf(stderr, "EOL and whitespace\n");
                                     print_state();

                                     return TK_NL;
                                   }

{LINECOMMENT}                      { /* skip line comments */ ; }



"<<"{Q_STRING} {
                    /* skip the "<<" and the quote, so skip 3 characteres */
                    char *heredoc_id = strdup(yytext + 3);

                    fprintf(stderr, "<<Q_STRING: "); print_state();

                    /* check the length of the quoted string. Note that the close quote
                           * was copied in the call to strdup(), so that's why heredoc_id is
                           * at least 1.
                           */
                    if (strlen(heredoc_id) == 1) {
                        yyerror("heredoc delimiter cannot be an empty string");
                    }
                    else {
                        /* remove the closing quote */
                        heredoc_id[strlen(heredoc_id) - 1] = '\0';
                        printf("<<STRINGC::heredoc id: '%s'\n", heredoc_id);

                        /* store the heredoc delimiter in a FIFO data structure, such as a queue */
                        new_heredoc(heredoc_id, yylineno);

                        yy_push_state(HEREDOC1);
                    }
               }



<SCANSTRING><<EOF>> { unsigned char dummy_char;
                      fprintf(stderr, "scanstring::EOF\n");

                      /* End of the "rest" string, switch back to normal buffer and state. */
                      fprintf(stderr, "<SCANSTRING><<EOF>>: [%s]\n", yytext);
                      yy_switch_to_buffer(file_buffer);

                      /* after_heredoc was allocated when the first <<STRINGC was scanned, free it now */

                      /* clear global file_buffer temp. TODO: put global into some lexer state struct */
                      file_buffer = NULL;

                      /* we reached the end of the saved string, and just switched back to
                             * the file. However, there may be more whitespace or newlines, so skip these now
                             */
                      dummy_char = input();
                      while (isspace(dummy_char) || dummy_char == '\n') {
                         dummy_char = input();
                      }

                      /* we just read one character too much; this is not a space/'\n', so put it back */
                      unput(dummy_char);

                      yy_pop_state();


                    }

<HEREDOC1>.*{EOL}  { /* This state saves the string after the <<STRINGC heredoc delimiter argument.
                              After saving the rest of the line, effectively, taking it away from the file input
                              state HEREDOC2 is activated, in which the heredoc string can be scanned.
                              After the heredoc string is scanned (until the delimiter is encountered), the
                              string that was saved here is scanned.
                           */


                     if (after_heredoc != NULL) {
                        /* before allocating new memory to after_heredoc, free the old buffer */
                        fprintf(stderr, "after_heredoc is not null: [%s]\n", after_heredoc);
                        free(after_heredoc);
                     }
                     after_heredoc = strdup(yytext);

                     BEGIN(HEREDOC2);


               }

<HEREDOC3>.*{EOL}   { fprintf(stderr, "<HEREDOC3>! '%s'\n", yytext);

}

<HEREDOC2>{EOL}  {
                    fprintf(stderr, "<HEREDOC2>{EOL}: '%s'\n", yytext);

                 }

<HEREDOC2>.*   {

                  heredoc_info *heredoc = shift_heredoc();

                  fprintf(stderr, "<HEREDOC2>.*: shifted heredoc: '%s'\n", heredoc->delimiter);

                  /* remove newline character */
                  chop_yytext();

                  if (strcmp(yytext, heredoc->delimiter) == 0) {

                      fprintf(stderr, "<HEREDOC2>.*: Found delimiter: '%s'\n", yytext);

                      /* we found the delimiter, save the current buffer, because we will first continue
                             * scanning the "after_heredoc" buffer.
                             */


                      BEGIN(SCANSTRING);

                      file_buffer = YY_CURRENT_BUFFER;
                      yy_scan_string(after_heredoc);


                      fprintf(stderr, "<HEREDOC2>.*: Going to scan string: '%s'\n", after_heredoc);
                      return TK_STRINGC;
                  }
                  else {
                      unshift_heredoc(heredoc);
                      fprintf(stderr, "<HEREDOC2>.*: Delimiter not found ('%s')\n", yytext);

                  }
                }



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
","         { fprintf(stderr, "Token ','\n"); yytext = ","; print_state(); fprintf(stderr, "State: %d\n", YYSTATE); return ','; }
"("         { return '('; }
")"         { fprintf(stderr, "Token ')'\n"); yytext = ")"; print_state(); fprintf(stderr, "State: %d\n", YYSTATE); return ')'; }
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
"num"             { return TK_NUM; }
"pmc"             { return TK_PMC; }
"string"          { return TK_STRING; }

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
".param"          { return TK_PARAM; }
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

":anon"      { return TK_FLAG_ANON; }
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
{ALPHA}{ALNUM}*       { fprintf(stderr, "TK_IDENT/TK_PARROT_OP\n"); return is_parrot_op(yytext) ? TK_PARROT_OP : TK_IDENT; }


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
               /* check that it's a string, if not return to parser, maybe it can do something with it. */
               if (next_token != TK_STRINGC) {
                   return next_token;
               }

               /* retrieve name of file, remove 2 quote characters. */
               file_name_length = yyleng - 2;
               incl_file_name   = (char *)calloc(file_name_length + 1, sizeof (char));

               /* copy current token's characters, skip first character */
               strncpy(incl_file_name, yytext + 1, file_name_length);

               /* open the file */
               fprintf(stderr, "Including file '%s'\n", incl_file_name);
               incl_file_ptr = fopen(incl_file_name, "r");

               /* after an include statement a newline is expected */
               next_token = yylex();
               if (next_token != TK_NL) {
                   yyerror("newline expected after \".include '<string>'\"\n");
               }

               /* save current file info */
               file_state = (file_info *)malloc(sizeof (file_info));
               file_state->buffer   = YY_CURRENT_BUFFER;
               file_state->filename = NULL; /* FIX */
               file_state->line_pos = 0; /* FIX */
               file_state->line_nr  = yylineno;
               file_state->prev     = NULL; /* initialize to NULL */

               /* store the current file's info structure on the stack, we'll continue scanning it later. */
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
               char *constant_value;

               next_token = yylex();
               if (next_token != TK_IDENT) {
                  yyerror("identifier expected after '.constant'.");
               }
               /* store identifier */
               constant_id = strdup(yytext);

               /* read next token, which contains the value */
               next_token = yylex();

               /* only these token types are allowed for constant values: */
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
                       constant_value = strdup(yytext);
                       define_constant(constant_id, constant_value, next_token, yylineno);
                       break;
                   default:
                       yyerror("Constant value must be a number, string literal or register");
                       break;
               }

               /* after the .constant declaration, a newline must be read */
               next_token = yylex();
               if (next_token != TK_NL) {
                   yyerror("newline expected after constant declaration");
               }

             }

".macro"            {  /* macro definition */
                       read_macro();

                    }


<MACRO>".endm"      { /* end of macro definition; TODO */ ;

                      yy_pop_state();
                    }



{WS}[.]{ALNUM}    { /* Check whether this token is a constant or a macro.
                     * Note that there must be whitespace before the dot, otherwise
                     * in "x.y", ".y" is matched, which is wrong.
                     */

                    /* because of the whitespace in front of this matched token, we need to skip this,
                     * yytext contains 1 or more space characters, so find out how many these are.
                     */
                    constant_info *constant;
                    int num_spaces = 1; /* there is at least one space, so we don't have to check that one */

                    /* as long as yytext + num_spaces points to a space character, increment num_spaces */
                    while (isspace((unsigned char) *(yytext + num_spaces))) {
                        ++num_spaces;
                    }
                    /* give the name of the constant, skipping the whitespace prefix, and skip the prefix dot. */
                    constant = find_constant(yytext + num_spaces + 1);

                    if (constant != NULL) { /* found the constant */
                        fprintf(stderr, "Constant '%s' found, value = '%s', token = '%d'\n",
                                constant->name, constant->value, constant->token_type);

                        /* make the value of the constant available to the parser */
                        yytext = constant->value;
                        /* return the type of token that the constant value represents */
                        return constant->token_type;
                    }
                    else { /* not found, try macro */
                        macro_info *macro;

                        macro = find_macro(yytext + num_spaces + 1);

                        if (macro != NULL) {

                            /* TODO: how do we know how big a buffer we need? IMCC defines fixed size of 4KB. */
                            char *expansion_buffer = (char *)calloc(1, sizeof (char));

                            /* read input for parameters */

                            /* expand the macro into a string buffer */

                            /* and scan that string buffer. */
                            YY_BUFFER_STATE state = yy_scan_string(expansion_buffer);
                            yy_delete_buffer(state);

                            /* free the buffer */
                            free(expansion_buffer);
                        }
                        else {
                            /* not found, this is an unknown constant or macro. */
                            yyerror("Undefined constant or macro");
                        }
                    }

                  }



<<EOF>>     {   /* get the file info structure of the .include-ing file, if any */
                file_info *info = pop_file_info();


               if (info == NULL) {
                   /* this was the initial file given to Parrot */
                   yyterminate();
               }
               else { /* this file was included */
                   switch_to_file(info);
               }
            }

.   { yyerror("Unexpected character"); }

<HEREDOC1,HEREDOC2>. { yyerror("Unexpected character(2)"); }

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

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
