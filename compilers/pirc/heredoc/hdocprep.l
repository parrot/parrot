%{

/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*
 * This pre-processor processes all heredoc strings into
 * normal strings. Newline characters are escaped.
 * POD comments and line comments are filtered out as well.
 *
 */

/* TODO:
 * - improve memory management
 * - use a buffer of a certain (large) size, instead of resizing on each
 *   line, which is not efficient. Only resize if realsize > fixedsize.
 */

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

#define YY_NO_UNISTD_H

#define YY_DECL int yylex( yyscan_t yyscanner)

extern char *yyget_text(yyscan_t yyscanner);
extern void  yyset_in(FILE *fp, yyscan_t yyscanner);
extern int   yylex_destroy(yyscan_t yyscanner);
extern int   yylex( yyscan_t yyscanner);

/* all globals are collected in this structure which
 * is set in yyscan_t's "extra" field, available through
 * yy{get,set}_extra() function.
 */
typedef struct global_state {
    int   line;
    char *heredoc;
    char *linebuff;
    char *delimiter;
    char *filename;
    YY_BUFFER_STATE file_buffer;

} global_state;

/* accessor methods for setting and getting the lexer_state */
#define YY_EXTRA_TYPE  struct global_state *
extern YY_EXTRA_TYPE  yyget_extra(yyscan_t scanner);
extern void yyset_extra(YY_EXTRA_TYPE lexer , yyscan_t scanner);

#define output stdout
/* macro to chop off the last character, typically a newline character,
 * but can also be something else
 */
#define chop_yytext()   (yytext[--yyleng] = '\0')


/*

=head1 FUNCTIONS

=over 4

=item C<lex_error>

Emit an error message.

=cut

*/
static void
lex_error(char *msg, global_state *state) {
    fprintf(stderr, "\nHeredoc pre-processor error");
    fprintf(stderr, " in '%s' (line %d): %s\n", state->filename, state->line, msg);
}


/*

=item C<main>

Entry point of the heredoc pre-processor.

=cut

*/
int
main(int argc, char *argv[]) {
    FILE *fp = NULL;
    yyscan_t yyscanner;
    global_state *state = NULL;

    /* check for proper usage */
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* open the file */
    fp = fopen(argv[1], "r");
    if (fp == NULL) {
        fprintf(stderr, "error opening file '%s'\n", argv[1]);
        exit(EXIT_FAILURE);
    }

    /* initialize a yyscan_t object */
    yylex_init(&yyscanner);
    /* set the scanner to a string buffer and go parse */
    yyset_in(fp, yyscanner);

    state = (global_state *)malloc(sizeof (global_state));
    assert(state != NULL);
    state->line      = 1;
    state->filename  = argv[1];
    state->heredoc   = NULL;
    state->linebuff  = NULL;
    state->delimiter = NULL;
    yyset_extra(state, yyscanner);

    /* the lexer never returns, only call it once. Don't give a YYSTYPE object. */
    yylex(yyscanner);

    /* clean up after playing */
    yylex_destroy(yyscanner);
    free(state);
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



/* after a rule is matched, execute this block of code to keep track of the line no. */
#define YY_USER_ACTION   {                                               \
                           global_state *state = yyget_extra(yyscanner); \
                           ++ctr[yy_act];                                \
                           do {                                          \
                               char *iter = yytext;                      \
                               while (*iter != '\0') {                   \
                                   if (*iter == '\n')                    \
                                       state->line++;                    \
                                   iter++;                               \
                               }                                         \
                           }                                             \
                           while (0);                                    \
                         }


%}

%option reentrant
%option noyywrap
%option never-interactive
%option nounput
%option stack
%option debug
%option noyy_top_state
%option outfile="hdocprep.c"
%option prefix="hd_pre"


%x POD
%x HEREDOC
%x HEREDOC2
%x SAVELINE
%x SAVELINE2
%x SCANSTRING

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

^"=".*{EOL}            { yy_push_state(POD, yyscanner); }

<POD>.*                { /* ignore pod comments */ }

<POD>{NEWLINE}         { /* skip newlines */}

<POD>^"=cut".*{EOL}+   { /* end of POD comment */
                         yy_pop_state(yyscanner);
                       }

<POD><<EOF>>           { /* we're scanning a POD comment, but encountered end-of-file. */
                         lex_error("POD comment not closed!", yyget_extra(yyscanner));
                         yyterminate();
                       }

<SCANSTRING>.          { /* echo everything when scanning the string. */
                         fprintf(output, "%s", yytext);
                       }

<SCANSTRING>{EOL}      { /* don't do anything */

                       }

<SCANSTRING><<EOF>>    { /* end of saved string */
                         global_state *state = yyget_extra(yyscanner);
                         assert(state->file_buffer);
                         yy_switch_to_buffer(state->file_buffer, yyscanner);
                         /* clear the temp. variable */
                         state->file_buffer = NULL;
                         BEGIN(INITIAL);
                         fprintf(output, "\nsetline %d\n", state->line);
                       }


<SCANSTRING>"<<"{Q_STRING} { /* 2nd and later heredoc argument */
                             global_state *state = yyget_extra(yyscanner);
                             state->delimiter    = (char *)calloc(yyleng - 4 + 1, sizeof (char));
                             assert(state->delimiter);
                             strncpy(state->delimiter, yytext + 3, yyleng - 4);

                             state->heredoc = strdup("");
                             BEGIN(SAVELINE2);
                           }

"<<"{Q_STRING}         { /* only copy the string after "<<'" and skip the last quote too */
                         global_state *state = yyget_extra(yyscanner);
                         state->delimiter    = (char *)calloc(yyleng - 4 + 1, sizeof (char));
                         assert(state->delimiter);
                         strncpy(state->delimiter, yytext + 3, yyleng - 4);
                         state->heredoc = strdup("");
                         BEGIN(SAVELINE);
                       }


<SAVELINE>.*{EOL}      { /* this state is used when reading the first heredoc delimiter
                            argument. Save the rest of the line and go scan the heredoc.
                          */
                         global_state *state = yyget_extra(yyscanner);
                         state->linebuff     = strdup(yytext);
                         BEGIN(HEREDOC);
                       }

<SAVELINE2>.*{EOL}     { /* this state is used when reading the 2nd and later heredoc
                            delimiter arguments. Save the rest of the line and go scan
                            the heredoc string. First, though, switch back to the file,
                            because <SAVELINE2> state is activated when reading a string.
                          */
                         global_state *state = yyget_extra(yyscanner);
                         state->linebuff     = strdup(yytext);
                         yy_switch_to_buffer(state->file_buffer, yyscanner);
                         BEGIN(HEREDOC);
                       }

<HEREDOC>{EOL}         { /* Scan a newline character, append this to the heredoc, but
                            escape it.
                          */
                         global_state *state = yyget_extra(yyscanner);
                         int len             = strlen(state->heredoc);
                         char *temp          = (char *)calloc(len + 1 + 2, sizeof (char));
                         assert(temp != NULL);
                         strcpy(temp, state->heredoc);

/* somehow this fails on windows
                         if (heredoc)
                            free(heredoc);
*/
                         state->heredoc = temp;

                         assert(state->heredoc != NULL);

                         /* translate "\n" to a "\" and "n" character */
                         state->heredoc[len]     = '\\';
                         state->heredoc[len + 1] = 'n';
                         state->heredoc[len + 2] = '\0';
                       }

<HEREDOC>.*            { /* scan heredoc string contents */

                         global_state *state = yyget_extra(yyscanner);
                         /* on windows remove the '\r' character */
                         if (yytext[yyleng - 1] == '\r') {
                           chop_yytext();
                         }

                         if (strcmp(yytext, state->delimiter) == 0) {
                            int heredoc_length = strlen(state->heredoc);
                            char *hdstring     = (char *)calloc(heredoc_length + 3, sizeof (char));
                            assert(hdstring != NULL);

                            sprintf(hdstring, "\"%s\"", state->heredoc);
                            fprintf(output, "%s", hdstring);


                            /* free the delimiter memory */
                            free(state->delimiter);
                            state->delimiter = NULL;

                            /* free the just allocated memory */
                            free(hdstring);
                            hdstring = NULL;

                            /*
                            assert(heredoc != NULL);
                            free(heredoc);
                            */
                            state->heredoc = strdup("");

                            /* save the current buffer, because we go scan the
                               rest of the string that was saved in <SAVELINE(2)>.
                             */
                            state->file_buffer = YY_CURRENT_BUFFER;
                            BEGIN(SCANSTRING);
                            assert(state->linebuff != NULL);
                            yy_scan_string(state->linebuff, yyscanner);
                         }
                         else {
                            /* save this heredoc string line */
                            char *line     = strdup(yytext);
                            state->heredoc = strcat(state->heredoc, line);
                         }
                       }

<HEREDOC><<EOF>>       { /* End of file while reading a heredoc string. This is bad. */
                         global_state *state = yyget_extra(yyscanner);
                         fprintf(stderr,
                                 "\nError: end of file while reading heredoc string '%s'\n",
                                 state->delimiter);
                         yyterminate();
                       }

<*>.                   { /* just echo everything else */
                         /*fprintf(stderr, "<*>.: [%s]\n", yytext); */
                         fprintf(output, "%s", yytext);
                       }

<<EOF>>                { /* end of file */
                         yyterminate();
                       }



%%





/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


