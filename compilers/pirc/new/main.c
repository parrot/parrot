/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */


#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "pirparser.h"
#include "pircompiler.h"


/* use pthreads library to test thread safety.
   does not work currently on windows.
   The check for _MSC_VER is not correct but works for me.
*/
#ifndef _MSC_VER
#  define TEST_THREAD_SAFETY
#endif


#ifdef TEST_THREAD_SAFETY
#  include <pthread.h>
#  define NUM_THREADS 1
#endif


/* before including the lexer's header file, make sure to define this: */
#ifndef YY_NO_UNISTD_H
#  define YY_NO_UNISTD_H
#endif

#include "pirlexer.h"
/* include this after "pirlexer.h", as C<yyscan_t> structure must be defined first
 * which is done in "pirlexer.h"
 */
#include "piryy.h"


/*

=head1 FUNCTIONS

=over 4


=item C<static void
print_help(char const * const program_name)>

Routine to print usage of this program.

=cut

*/
static void
print_help(char const * const program_name)
{
    fprintf(stderr, "Usage: %s [options] <file>\n", program_name);
    fprintf(stderr, "Options:\n\n");
    /*fprintf(stderr, "  -E        pre-process\n"); */
    fprintf(stderr, "  -d        show debug messages of parser\n");
    fprintf(stderr, "  -h        show this help message\n");
    fprintf(stderr, "  -o <file> write output to the specified file. "
                    "Currently only works in combination with '-E' option\n");
}


/*

=item C<static FILE *
open_file(char const * const filename, char const * const mode)>

Function to open the file given by C<filename>, in the mode given by C<mode>
Microsoft visual studio provides a "safer" variant of fopen(); this
function hides the selection of the appropriate variant.

=cut

*/
static FILE *
open_file(char const * const filename, char const * const mode) {
    FILE *fp = NULL;

#ifdef _MSC_VER
    fopen_s(&fp, filename, mode);
#else
    fp = fopen(filename, mode);
#endif
    return fp;
}

/*
static void
print_data_sizes(void) {
    printf("size of symbol: %u\n", sizeof(symbol));
    printf("size of target: %u\n", sizeof(target));
    printf("size of sub:    %u\n", sizeof(subroutine));
    printf("size of stat:   %u\n", sizeof(statement));
}
*/

typedef struct parser_args {
    int   flexdebug;
    FILE *infile;
    char *filename;
    int   thr_id;

} parser_args;


/*

This will be the proper declaration after testing for thread-safety:

void parse_file(int flexdebug, FILE *infile, char * const filename)

*/
void *
parse_file(void *a) {
    yyscan_t     yyscanner;
    lexer_state *lexer     = NULL;

    /* unpack the arguments from the structure parser_args */
    parser_args *args      = (parser_args *)a;
    int          flexdebug = args->flexdebug;
    FILE        *infile    = args->infile;
    char        *filename  = args->filename;
    int          thr_id    = args->thr_id;

    /* create a yyscan_t object */
    yylex_init(&yyscanner);
    /* set debug flag */
    yyset_debug(flexdebug, yyscanner);
    /* set the input file */
    yyset_in(infile, yyscanner);
    /* set the extra parameter in the yyscan_t structure */
    lexer = new_lexer(filename);
    yyset_extra(lexer, yyscanner);
    /* go parse */
    yyparse(yyscanner, lexer);

    if (lexer->parse_errors == 0) {
        char outfile[20];
        sprintf(outfile, "output_thr_%d", thr_id);
        lexer->outfile = open_file(outfile, "w");
        if (lexer->outfile == NULL)
            fprintf(stderr, "Failed to open file %s\n", outfile);

        fprintf(stderr, "Parse successful!\n");
        print_subs(lexer);
        fclose(lexer->outfile);

        check_unused_symbols(lexer);
        free_subs(lexer);
    }
    else
        fprintf(stderr, "There were %d errors\n", lexer->parse_errors);

    fclose(infile);



    /* clean up after playing */
    release_resources(lexer);
    yylex_destroy(yyscanner);

    return NULL;

}



/*

=item C<int main(int argc, char *argv[])>

Main compiler driver.

=cut

*/
int
main(int argc, char *argv[]) {
    char const * const program_name = argv[0];
    int                flexdebug    = 0;
    char              *filename     = NULL;
    char              *outputfile   = NULL;

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
                exit(EXIT_FAILURE);
        }
        /* goto next command line argument */
        argv++;
        argc--;
    }

/* The following code is to test thread safety. If TEST_THREAD_SAFETY
 * is false, no threads are started; only the main thread will do
 * a parse.
 * For thread safety testing, the pthreads library is used.
 */
#ifdef TEST_THREAD_SAFETY
{
    pthread_t threads[NUM_THREADS];
    int i;
    for (i = 0; i < NUM_THREADS; i++) {
        FILE *infile = NULL;
        parser_args args;


        if (argc < 1) { /* no file specified, read from stdin */
            infile   = stdin;
            filename = NULL;
        }
        else {
            /* done handling arguments, open the file */
            infile   = open_file(argv[0], "r");
            filename = argv[0];
        }
        if (infile == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(EXIT_FAILURE);
        }

        args.flexdebug = flexdebug;
        args.infile    = infile;
        args.filename  = filename;
        args.thr_id    = i;

        pthread_create(&threads[i], NULL, parse_file, &args);

    }

    /* wait for all threads to finish */
    for (i = 0; i < NUM_THREADS; i++)
        pthread_join(threads[i], NULL);
}
#else
{
    parser_args args;
    FILE *infile = NULL;

    if (argc < 1) { /* no file specified, read from stdin */
        infile   = stdin;
        filename = NULL;
    }
    else {
        /* done handling arguments, open the file */
        infile   = open_file(argv[0], "r");
        filename = argv[0];
    }
    if (infile == NULL) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* pack all args for parse_file() */
    args.flexdebug = flexdebug;
    args.infile    = infile;
    args.filename  = filename;
    args.thr_id    = 0;

    parse_file(&args);
}
#endif

    return 0;
}



/*

=item C<int
yyerror(yyscan_t yyscanner, lexer_state * const  lexer, char const * const message, ...)>

Default parse error handling routine, that is invoked when the bison-generated
parser finds a syntax error.

=cut

*/
int
yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...) {
    char const * const current_token = yyget_text(yyscanner);
    va_list arg_ptr;

    fprintf(stderr, "\nError in file '%s' (line %d)\n\n", lexer->filename, yyget_lineno(yyscanner));

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    ++lexer->parse_errors;

    /* print current token if it doesn't contain a newline token. */
    if (!strstr(current_token, "\n"))
        fprintf(stderr, "\ncurrent token: '%s'", current_token);

    fprintf(stderr, "\n\n");

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
