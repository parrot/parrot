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


/* these are globals. Remove them and make this thing reentrant */
#define output stdout

int line = 1;
char *heredoc   = NULL;
char *linebuff  = NULL;
char *delimiter = NULL;
YY_BUFFER_STATE file_buffer;


/*

Emit an error message.

*/
static void
lex_error(char *msg) {
    fprintf(stderr, "Heredoc pre-processor error: %s\n", msg);
}


/*

*/
int
main(int argc, char *argv[]) {
    FILE *fp = NULL;
    yyscan_t yyscanner;


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

    /* the lexer never returns, only call it once. Don't give a YYSTYPE object. */
    yylex(yyscanner);



    /* clean up after playing */
    yylex_destroy(yyscanner);
    return 0;
}




/*
using this we can check how often each rule is executed.
*/

int ctr[YY_NUM_RULES];

int num_rules = YY_NUM_RULES;



/* after a rule is matched, execute this block of code to keep track of the line no. */
#define YY_USER_ACTION   { ++ctr[yy_act];             \
                         do {                         \
                              char *iter = yytext;    \
                              while (*iter != '\0') { \
                                  if (*iter == '\n')  \
                                      line++;         \
                                  iter++;             \
                              }                       \
                         }                            \
                         while (0);                   \
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

LINECOMMENT    [#].*\n


%%



^"=".*{EOL}            { yy_push_state(POD, yyscanner); }

<POD>.*                { /* ignore pod comments */ }

<POD>{NEWLINE}         { /* skip newlines */}

<POD>^"=cut".*{EOL}+   { /* end of POD comment */
                         yy_pop_state(yyscanner);
                       }

<POD><<EOF>>           { /* we're scanning a POD comment, but encountered end-of-file. */
                         lex_error("POD comment not closed!");
                         yyterminate();
                       }

<SCANSTRING>.          { /* echo everything when scanning the string. */
                         fprintf(output, "%s", yytext);
                       }

<SCANSTRING>{EOL}      { /* don't do anything */

                       }

<SCANSTRING><<EOF>>    { /* end of saved string */
                         assert(file_buffer);
                         yy_switch_to_buffer(file_buffer, yyscanner);
                         /* clear the temp. variable */
                         file_buffer = NULL;
                         BEGIN(INITIAL);
                       }


<SCANSTRING>"<<"{Q_STRING} { /* 2nd and later heredoc argument */
                             delimiter = (char *)calloc(yyleng - 4 + 1, sizeof (char));
                             assert(delimiter);
                             strncpy(delimiter, yytext + 3, yyleng - 4);

                             heredoc = strdup("");
                             BEGIN(SAVELINE2);
                           }

"<<"{Q_STRING}         { /* only copy the string after "<<'" and skip the last quote too */
                         delimiter = (char *)calloc(yyleng - 4 + 1, sizeof (char));
                         assert(delimiter);
                         strncpy(delimiter, yytext + 3, yyleng - 4);
                         /*
                         fprintf(stderr, "Found delimiter: [%s]\n",  delimiter);
                         */
                         heredoc = strdup("");
                         BEGIN(SAVELINE);
                       }


<SAVELINE>.*{EOL}      { /* this state is used when reading the first heredoc delimiter
                            argument. Save the rest of the line and go scan the heredoc.
                          */
                         linebuff = strdup(yytext);
                         /*
                         fprintf(stderr, "Saveline: [%s]\n", linebuff);
                         */
                         BEGIN(HEREDOC);
                       }

<SAVELINE2>.*{EOL}     { /* this state is used when reading the 2nd and later heredoc
                            delimiter arguments. Save the rest of the line and go scan
                            the heredoc string. First, though, switch back to the file,
                            because <SAVELINE2> state is activated when reading a string.
                          */
                         linebuff = strdup(yytext);
                         yy_switch_to_buffer(file_buffer, yyscanner);
                         BEGIN(HEREDOC);
                       }

<HEREDOC>{EOL}         { /* Scan a newline character, append this to the heredoc, but
                            escape it.
                          */
                         int len = strlen(heredoc);
                         char *temp = (char *)calloc(len + 1 + 2, sizeof (char));
                         assert(temp != NULL);
                         strcpy(temp, heredoc);

/* somehow this fails on windows
                         if (heredoc)
                            free(heredoc);
*/
                         heredoc = temp;

                         assert(heredoc != NULL);

                         /* translate "\n" to a "\" and "n" character */
                         heredoc[len] = '\\';
                         heredoc[len + 1] = 'n';
                         heredoc[len + 2] = '\0';
                       }

<HEREDOC>.*            { /* scan heredoc string contents */

                         /* on windows remove the '\r' character */

                         if (yytext[yyleng - 1] == '\r') {
                           yytext[yyleng - 1] = '\0';
                         }

                         if (strcmp(yytext, delimiter) == 0) {
                            char *hdstring = (char *)calloc(strlen(heredoc) + 3, sizeof (char));
                            assert(hdstring != NULL);

                            sprintf(hdstring, "\"%s\"", heredoc);
                            fprintf(output, "%s", hdstring);


                            /* free the delimiter memory */
                            free(delimiter);
                            delimiter = NULL;

                            /* free the just allocated memory */
                            free(hdstring);
                            hdstring = NULL;

                            /*
                            assert(heredoc != NULL);
                            free(heredoc);
                            */
                            heredoc = strdup("");

                            /* save the current buffer, because we go scan the
                               rest of the string that was saved in <SAVELINE(2)>.
                             */
                            file_buffer = YY_CURRENT_BUFFER;
                            BEGIN(SCANSTRING);
                            assert(linebuff != NULL);
                            yy_scan_string(linebuff, yyscanner);
                         }
                         else {
                            /* save this heredoc string line */
                            char *line = strdup(yytext);
                            heredoc = strcat(heredoc, line);
                         }
                       }

<HEREDOC><<EOF>>       { /* End of file while reading a heredoc string. This is bad. */
                         fprintf(stderr, "\nError: end of file while reading heredoc string '%s'\n", delimiter);
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


