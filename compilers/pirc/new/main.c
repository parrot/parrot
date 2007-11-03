/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "pirparser.h"
#include "pircompiler.h"

/* before including the lexer's header file, make sure to define this: */
#ifndef YY_NO_UNISTD_H
#  define YY_NO_UNISTD_H
#endif

#include "pirlexer.h"

extern int yyparse(yyscan_t yyscanner, lexer_state * const lexer);
extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message);



/*

=head1 FUNCTIONS

=over 4


=item C<syntax_error>

wrapper function for yyerror. This is useful, so that if yyerror's
signature changes, calls to syntax_error in the lexer do not need
to be updated.

*/
void
syntax_error(yyscan_t yyscanner, lexer_state *lexer, char *message) {
    yyerror(yyscanner, lexer, message);
}

/*

=item C<print_help>

Routine to print usage of this program.

*/
static void
print_help(char const * const program_name) {

    fprintf(stderr, "Usage: %s [options] <files>\n", program_name);
    fprintf(stderr, "Options:\n\n");
    /*fprintf(stderr, "  -E        pre-process\n"); */
    fprintf(stderr, "  -d        show debug messages of parser\n");
    fprintf(stderr, "  -h        show this help message\n");
    fprintf(stderr, "  -o <file> write output to the specified file. "
                    "Currently only works in combination with '-E' option\n");
}


/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {
    char const * const program_name = argv[0];
    int total_errors  = 0;
    int flexdebug     = 0;
    char *outputfile  = NULL;
    yyscan_t yyscanner;

    if (argc < 2) {
        print_help(program_name);
        exit(EXIT_FAILURE);
    }

    /* skip program name */
    argc--;
    argv++;

    /* very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO. */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            /* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'd':
                yydebug = 1;
                break;
#endif
            case 'f':
                flexdebug = 1;
                break;
            case 'h':
                print_help(program_name);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
            case 'o':
                if (argc > 1) { /* there must be at least 2 more args,
                                         the output file, and an input */
                    argc--;
                    argv++;
                    outputfile = argv[0];
                }
                else {
                    fprintf(stderr, "Missing argument for option '-o'\n");
                    exit(EXIT_FAILURE);
                }
                break;
            default:
                fprintf(stderr, "Unknown option: '%c'\n", argv[0][1]);
                break;
        }
        /* goto next command line argument */
        argv++;
        argc--;
    }

    if (argc < 1) {
        fprintf(stderr, "No input file specified\n");
        exit(EXIT_FAILURE);
    }


    /* compile all files specified on the command line */
    while (argc > 0) {
        FILE *infile       = NULL;
        lexer_state *lexer = NULL;

        fprintf(stderr, "Processing file '%s'\n", argv[0]);

        /* done handling arguments, open the file */
        infile = fopen(argv[0], "r");

        if (infile == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(EXIT_FAILURE);
        }

        /* create a yyscan_t object */
        yylex_init(&yyscanner);
        /* set debug flag */
        yyset_debug(flexdebug, yyscanner);
        /* set the input file */
        yyset_in(infile, yyscanner);
        /* set the extra parameter in the yyscan_t structure */
        lexer = new_lexer(argv[0]);
        yyset_extra(lexer, yyscanner);

        fprintf(stderr, "compiling %s\n", argv[0]);
        yyparse(yyscanner, lexer);

            /* update total error count */
        total_errors += lexer->parse_errors;

        if (lexer->parse_errors == 0) {
            fprintf(stderr, "Parse successful!\n");
        }
        else {
            fprintf(stderr, "There %s %d %s in file '%s'\n", lexer->parse_errors > 1 ? "were" :
                    "was", lexer->parse_errors, lexer->parse_errors > 1 ? "errors" : "error",
                    lexer->filename);
        }

        /* clean up after playing */
        yylex_destroy(yyscanner);

        argc--;
        argv++;
    }

    if (total_errors > 0) {
        fprintf(stderr, "There were %d parse errors in all files\n", total_errors);
    }

    /* go home! */
    return 0;
}



/*

=item C<yyerror>

Parse error handling routine.

*/
int
yyerror(yyscan_t yyscanner, lexer_state * const  lexer, char const * const message) {
    char const * const text = yyget_text(yyscanner);
    lexer->parse_errors++;

    fprintf(stderr, "\nError in file '%s' (line %d)\n%s ",
            lexer->filename, lexer->line_nr, message);

    /* print current token if it's not a newline (or \r\n on windows) */
    /* the following should be fixed; the point is not to print the token if
     * it's a newline, that looks silly.
     */
    if (strcmp(text, "\r\n") != 0 || strcmp(text, "\n") == 0) {
        fprintf(stderr, "('%s')\n\n", text);
    }
    else {
        fprintf(stderr, "\n\n");
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
