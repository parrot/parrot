%{

/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*
 * This pre-processor processes all heredoc strings into
 * normal strings. Newline characters are escaped.
 * POD comments and line comments are filtered out.
 *
 */

/* TODO:
   - there's a weirdness in the SAVELINE state; we need to duplicate
     the yytext string twice, otherwise things go wrong badly.

   - it might be interesting to improve memory handling to make things
     a bit more efficient.

 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parrot/string_funcs.h"
#include "parrot/parrot.h"

/* keep Microsoft Visual Studio compiler happy */
#define YY_NO_UNISTD_H

/* declare the prototype of yylex */
#define YY_DECL int yylex( yyscan_t yyscanner)


extern char *yyget_text(yyscan_t yyscanner);
extern void  yyset_in(FILE *fp, yyscan_t yyscanner);
extern int   yylex_destroy(yyscan_t yyscanner);
extern int   yylex(yyscan_t yyscanner);


/* all globals are collected in this structure which
 * is set in yyscan_t's "extra" field, available through
 * yy{get,set}_extra() function.
 */
typedef struct global_state {
    int             errors;
    char           *heredoc;       /* heredoc string buffer */
    char           *linebuffer;    /* buffer to save the 'rest of the line'
                                      before scanning a heredoc */
    char           *delimiter;     /* buffer to save the delimiter of the
                                      heredoc string being scanned */
    char           *filename;      /* name of the file being scanned */
    YY_BUFFER_STATE file_buffer;   /* needed to store the ref. to the file
                                      when scanning a string buffer */

} global_state;

/* accessor methods for setting and getting the lexer_state */
#define YY_EXTRA_TYPE  struct global_state *

extern YY_EXTRA_TYPE  yyget_extra(yyscan_t scanner);
extern void           yyset_extra(YY_EXTRA_TYPE lexer , yyscan_t scanner);

#define output stdout

/* macro to chop off the last character, typically a newline character,
 * but can also be something else
 */
#define chop_yytext()   (yytext[--yyleng] = '\0')


/*

=head1 FUNCTIONS

=over 4

=item C<static void
lex_error(yyscan_t yyscanner, char const * const message, ...)>

Emit an error message.

=cut

*/
static void
lex_error(yyscan_t yyscanner, char const * const message, ...) {
    global_state * const state  = yyget_extra(yyscanner);
    int                  lineno = yyget_lineno(yyscanner);
    va_list              arg_ptr;

    fprintf(stderr, "\nHeredoc pre-processor error in '%s' (line %d): ", state->filename, lineno);

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    puts("");

    ++state->errors;
}


/*

=item C<char *
dupstr(char * const source)>

The C89 standard does not define a dupstr() in the C library,
so define our own dupstr. Function names beginning with "str"
are reserved (I think), so make it dupstr, as that is what it
does: duplicate a string.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
char *
dupstr(char * const source) {
    char *newstring = (char *)mem_sys_allocate((strlen(source) + 1) * sizeof (char));
    strcpy(newstring, source);
    return newstring;
}


void
printrules(void) {
    extern int ctr[];
    int i;
    for (i = 0; i < YY_NUM_RULES; i++)
        fprintf(output, "#rule %d was used %d times\n", i, ctr[i]);
}


/*

=item C<init_global_state>

create and initialize a global_state structure, containing all 'global'
variables that are needed during the scanning.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static global_state *
init_global_state(char * const filename) {
    global_state *state = (global_state *)mem_sys_allocate(sizeof (global_state));
    state->filename    = filename;
    state->heredoc     = NULL;
    state->linebuffer  = dupstr("");
    state->delimiter   = NULL;
    state->file_buffer = NULL;
    state->errors      = 0;
    return state;
}

/*

=item C<destroy_global_state>

free all memory of the global state structure.

=cut

*/
static void
destroy_global_state(global_state *state) {
    if (state->linebuffer)
        mem_sys_free(state->linebuffer);
    if (state->heredoc)
        mem_sys_free(state->heredoc);

    mem_sys_free(state);
    state = NULL;
}


/*

=item C<static void
scanfile(char * const filename)>

=cut

*/
static void
scanfile(char * const filename) {
    yyscan_t      yyscanner;
    global_state *state = NULL;
    FILE         *fp;

    /* open the file */
    fp = fopen(filename, "r");

    if (fp == NULL) {
        fprintf(stderr, "error opening file '%s'\n", filename);
        exit(EXIT_FAILURE);
    }

    /* initialize a yyscan_t object */
    yylex_init(&yyscanner);
    /* set the scanner to a string buffer and go parse */
    yyset_in(fp, yyscanner);

    state = init_global_state(filename);

    yyset_extra(state, yyscanner);

    /* the lexer never returns anything, only call it once. Don't give a YYSTYPE object. */
    yylex(yyscanner);

    /* clean up after playing */
    yylex_destroy(yyscanner);

    destroy_global_state(state);

}
/*

=item C<int
main(int argc, char *argv[])>

Entry point of the heredoc pre-processor.

=cut

*/
int
main(int argc, char *argv[]) {
    /* check for proper usage */
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    scanfile(argv[1]);

    return 0;
}


/*

=back

=cut

*/


/*

using this we can check how often each rule is executed.
XXX this should be removed at some point (globals!)

*/

int ctr[YY_NUM_RULES];

int num_rules = YY_NUM_RULES;

#define YY_USER_ACTION    do { ++ctr[yy_act]; } while (0);


%}

%option reentrant
%option noyywrap
%option nounput

%option never-interactive

%option stack
%option debug
%option warn
%option noyy_top_state
%option outfile="hdocprep.c"
%option prefix="hd_pre"
%option yylineno

%pointer

%x POD
%x HEREDOC
%x HEREDOC2
%x SAVELINE
%x SAVELINE2
%x SCANSTRING
%x INCLUDE

ALPHA          [a-zA-Z@_]
DIGIT          [0-9]
DIGITS         {DIGIT}+
ALNUM          {ALPHA}|{DIGIT}
IDENT          {ALPHA}{ALNUM}*
WS             [\t\f\r\x1a ]
EOL            \r?\n
DQ_STRING       \"(\\.|[^"\\\n])*\"
SQ_STRING       \'[^'\n]*\'
Q_STRING       {SQ_STRING}|{DQ_STRING}
NEWLINE        {EOL}({WS}|{EOL})*
LINECOMMENT    [#].*{EOL}

%%

<*>{LINECOMMENT}       { /* ignore line comments */ }

<INITIAL>^"=".*{EOL}   { yy_push_state(POD, yyscanner); }


<POD>^"=cut".*{EOL}    { /* end of POD comment */
                         yy_pop_state(yyscanner);
                       }

<POD>.*{EOL}           { /* ignore pod comments */ }

<POD><<EOF>>           { /* we're scanning a POD comment, but encountered end-of-file. */
                         lex_error(yyscanner, "POD comment not closed!");
                         yyterminate();
                       }

<SCANSTRING>{EOL}      { /* don't do anything */ }

<SCANSTRING>.          { /* echo everything when scanning the string. */
                         fprintf(output, "%s", yytext);
                       }

<SCANSTRING><<EOF>>    { /* end of saved string */
                         global_state *state = yyget_extra(yyscanner);
                         PARROT_ASSERT(state->file_buffer);
                         yy_switch_to_buffer(state->file_buffer, yyscanner);

                         /* clear the temp. variable; file_buffer is only used to temporarily
                          * store a reference to the current buffer when we switch from file
                          * to string scanning; after finishing scanning the string (which
                          * is now, as we just scanned <<EOF>>), we switch back to the file
                          * buffer.
                          */
                         state->file_buffer = NULL;

                         BEGIN(INITIAL);

                       }


<SCANSTRING>"<<"{Q_STRING} { /* 2nd and later heredoc argument */
                             global_state *state = yyget_extra(yyscanner);
                             /* yyleng - (4 (for << and 2 quotes), + 1 for NULL character = 3) */
                             state->delimiter = (char *)mem_sys_allocate((yyleng - 4 + 1)
                                                                         * sizeof (char));

                             PARROT_ASSERT(state->delimiter);

                             strncpy(state->delimiter, yytext + 3, yyleng - 4);
                             state->delimiter[yyleng - 4] = '\0';

                             state->heredoc = dupstr("");


                             BEGIN(SAVELINE2);
                           }

<INITIAL>"<<"{Q_STRING} { /* only copy the string after "<<'" and skip the last quote too */
                         global_state *state = yyget_extra(yyscanner);
                         /* allocate storage for the delimiter, skip the << and quote characters. */
                         state->delimiter    = (char *)mem_sys_allocate((yyleng - 4 + 1)
                                                                        * sizeof (char));
                         PARROT_ASSERT(state->delimiter);

                         strncpy(state->delimiter, yytext + 3, yyleng - 4);
                         state->delimiter[yyleng - 4] = '\0';

                         /*
                         state->delimiter = dupstr(state->delimiter);
                         */


                         state->heredoc = dupstr("");

/*
                         fprintf(stderr, "intial Q string: [%s]\n", state->delimiter);
*/
                         BEGIN(SAVELINE);
                        }

<SAVELINE>.*{EOL}      { /* this state is used when reading the first heredoc delimiter
                          * argument. Save the rest of the line and go scan the heredoc.
                          */
                         global_state *state = yyget_extra(yyscanner);

                         PARROT_ASSERT(state->linebuffer != NULL);

                         state->linebuffer = (char *)mem_sys_allocate((strlen(yytext) + 1) * sizeof (char));

                         strcpy(state->linebuffer, yytext);
                         state->linebuffer = dupstr(state->linebuffer);

                         /*
                         fprintf(stderr, "saveline eol: [%s]\n", state->linebuffer);
                         dupstr(yytext);
                         */

                         BEGIN(HEREDOC);
                       }

<SAVELINE2>.*{EOL}     { /* this state is used when reading the 2nd and later heredoc
                            delimiter arguments. Save the rest of the line and go scan
                            the heredoc string. First, though, switch back to the file,
                            because <SAVELINE2> state is activated when reading a string.
                          */
                         global_state *state = yyget_extra(yyscanner);

                         /*state->linebuffer = dupstr(yytext);
                         */
                         state->linebuffer = (char *)mem_sys_allocate((yyleng + 1) * sizeof (char));
                         strcpy(state->linebuffer, yytext);
                         state->linebuffer = dupstr(state->linebuffer);

                         yy_switch_to_buffer(state->file_buffer, yyscanner);

                         BEGIN(HEREDOC);
                       }

<HEREDOC>{EOL}         { /* Scan a newline character, append this to the heredoc, but
                            escape it.
                          */
                         global_state *state = yyget_extra(yyscanner);

                         int           len   = strlen(state->heredoc);
                         char *temp;

                         /*fprintf(stderr, "heredoc eol: len so far is: %d\n", len);
                         */

                         /* length of heredoc + 1 for NULL character + 2 for escaped '\n' */
                         temp  = (char *)mem_sys_allocate((len + 4) * sizeof (char));


                         sprintf(temp, "%s\\n%c", state->heredoc, '\0');
                         state->heredoc = temp;


                       }

<HEREDOC>.*        { /* scan heredoc string contents */

                         global_state *state = yyget_extra(yyscanner);

                         /* on windows remove the '\r' character */
                         if (yytext[yyleng - 1] == '\r') {
                            chop_yytext();
                         }

                         if (STREQ(yytext, state->delimiter)) {

                            fprintf(output, "\"%s\"", state->heredoc);

                               /* free the delimiter memory */
                            mem_sys_free(state->delimiter);

                            state->delimiter = NULL;

                            PARROT_ASSERT(state->heredoc != NULL);

                           /* mem_sys_free(state->heredoc);
                            */

                            state->heredoc = dupstr("");

                            /* save the current buffer, because we go scan the
                             * rest of the string that was saved in <SAVELINE(2)>.
                             */
                            state->file_buffer = YY_CURRENT_BUFFER;

                            BEGIN(SCANSTRING);

                            PARROT_ASSERT(state->linebuffer != NULL);

                            yy_scan_string(state->linebuffer, yyscanner);
                         }
                         else {
                            /* save this heredoc string line */
                            char * const thisline = (char *)mem_sys_allocate((yyleng + 1)
                                                                             * sizeof (char));
                            strcpy(thisline, yytext);

                            state->heredoc = strcat(state->heredoc, thisline);
                         }
                       }

<HEREDOC><<EOF>>       { /* End of file while reading a heredoc string. This is bad. */

                         lex_error(yyscanner, "end of file while reading heredoc string '%s'",
                                   yyget_extra(yyscanner)->delimiter);

                         yyterminate();
                       }


<<EOF>>                { /* end of file */
                         yyterminate();
                       }

<INITIAL>{EOL}+        { /* we only want to print a single newline instead of all newlines. */
                         fprintf(output, "\n");
                       }



<INITIAL>.             { /* just echo everything else */
                         fprintf(output, "%s", yytext);
                       }

".include"             { /* .include directives must be handled here */
                         yy_push_state(INCLUDE, yyscanner);
                       }

<INCLUDE>{WS}          { /* skip whitespace */ }

<INCLUDE>{Q_STRING}    { /* include this file */
                         char * const filename = dupstr(yytext);

                         filename[strlen(filename) - 1] = '\0';
                         scanfile(filename + 1);

                       }

<INCLUDE>{EOL}         { yy_pop_state(yyscanner); }


<*>{EOL}               { /* do nothing. */ }

%%


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


