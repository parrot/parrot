/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "pirparser.h"
#include "pircompiler.h"
#include "piremit.h"
#include "piryy.h"
#include "pirlexer.h"
#include "pirheredoc.h"
#include "pirregalloc.h"
#include "piremit.h"

/* global variable to set parser in debug mode.
 * It is not clear to me whether the global can be replaced
 * by a parser-specific flag.
 */
#ifdef YYDEBUG

extern int yypirdebug = 0;

#endif



/* XXX use pthreads library to test thread safety.
   does not work currently on windows.
   The check for _MSC_VER is not correct but works for me.
*/

/*
#ifndef _MSC_VER
#  define TEST_THREAD_SAFETY
#endif
*/

#ifdef TEST_THREAD_SAFETY
#  include <pthread.h>
#  define NUM_THREADS 1
#endif

void * process_file(void *a);

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
    fprintf(stderr, "Options:\n\n"
    "  -b        generate bytecode\n"
    "  -d        show debug messages of parser\n"
    "  -E        run heredoc and macro preprocessors only\n"
    "  -h        show this help message\n"
    "  -H        heredoc preprocessing only\n"
    "  -m <size> specify initial macro buffer size; default is 4096 bytes\n"
    "  -n        no output, only print 'ok' if successful\n"
    "  -o <file> write output to the specified file. "
    "Currently only works in combination with '-E' option\n"
    "  -p        pasm output\n"
    "  -r        activate the register allocator for improved register usage\n"
    "  -S        do not perform strength reduction\n"
    "  -v        verbose mode\n"
    "  -W        show warning messages\n"
#ifdef YYDEBUG
    "  -y        debug bison-generated parser\n"
#endif
    );
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
    int   flags;

} parser_args;


/*

This will be the proper declaration after testing for thread-safety:

void parse_file(int flexdebug, FILE *infile, char * const filename, int flags)

*/

void init_scanner_state(yyscan_t yyscanner);

void
parse_file(int flexdebug, FILE *infile, char * const filename, int flags, int thr_id,
           unsigned macro_size)
{
    yyscan_t     yyscanner;
    lexer_state *lexer     = NULL;

    /* create a yyscan_t object */
    yypirlex_init(&yyscanner);
    /* set debug flag */
    yypirset_debug(flexdebug, yyscanner);
    /* set the input file */
    yypirset_in(infile, yyscanner);
    /* set the extra parameter in the yyscan_t structure */
    lexer = new_lexer(filename, flags);
    lexer->macro_size = macro_size;

    /* initialize the scanner state */
    init_scanner_state(yyscanner);

    if (strstr(filename, ".pasm")) { /* PASM mode */
        SET_FLAG(lexer->flags, LEXER_FLAG_PASMFILE);
    }

    yypirset_extra(lexer, yyscanner);
    /* and store the yyscanner in the lexer, so they're close buddies */
    lexer->yyscanner = yyscanner;
    /* go parse */
    yypirparse(yyscanner, lexer);

    if (lexer->parse_errors == 0) {
        char outfile[20];
        sprintf(outfile, "output_thr_%d", thr_id);
        lexer->outfile = open_file(outfile, "w");
        if (lexer->outfile == NULL) {
            fprintf(stderr, "Failed to open file %s\n", outfile);
            lexer->outfile = stdout;
        }

        if (TEST_FLAG(lexer->flags, LEXER_FLAG_NOOUTPUT)) /* handy for testing the compiler */
            fprintf(stdout, "ok\n");
        else if (TEST_FLAG(lexer->flags, LEXER_FLAG_PREPROCESS))
            emit_pir_subs(lexer);
        else if (TEST_FLAG(lexer->flags, LEXER_FLAG_OUTPUTPBC))
            emit_pbc(lexer);
        else
            /*
            fprintf(stderr, "Parse successful!\n");
            */
            print_subs(lexer);


        fclose(lexer->outfile);

        if (TEST_FLAG(lexer->flags, LEXER_FLAG_WARNINGS))
            check_unused_symbols(lexer);

    }

    /* there may have been errors during the instruction generation, check again here. */
    if (lexer->parse_errors > 0)
        fprintf(stderr, "There were %d errors\n", lexer->parse_errors);

    fclose(infile);


    /* XXX just want to make sure pirc doesn't segfault when doing bytecode stuff. */
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_OUTPUTPBC))
        fprintf(stderr, "pirc ok\n");

    /* clean up after playing */
    release_resources(lexer);
    yypirlex_destroy(yyscanner);

}

/*

Parse a PIR string.

*/
void
parse_string(char *pirstring, int flags, int pasminput, unsigned macro_size) {
    yyscan_t yyscanner;
    lexer_state *lexer = NULL;


    /* create a yyscan_t object */
    yypirlex_init(&yyscanner);

    yypirset_debug(0, yyscanner);


    /* set the extra parameter in the yyscan_t structure */
    lexer = new_lexer("<pir string>", flags);
    lexer->macro_size = macro_size;
    yypirset_extra(lexer, yyscanner);
    lexer->yyscanner = yyscanner;

    /* initialize the scanner state */
    init_scanner_state(yyscanner);

    /* set the scanner to a string buffer and go parse */
    yypir_scan_string(pirstring, yyscanner);

    if (pasminput) { /* PASM mode */
        SET_FLAG(lexer->flags, LEXER_FLAG_PASMFILE);
    }


    yypirparse(yyscanner, lexer);

    if (lexer->parse_errors == 0) {

        print_subs(lexer);

        if (TEST_FLAG(lexer->flags, LEXER_FLAG_WARNINGS))
            check_unused_symbols(lexer);
    }

    /* there may have been errors during the instruction generation, check again here. */
    if (lexer->parse_errors > 0)
        fprintf(stderr, "There were %d errors\n", lexer->parse_errors);

    /* XXX just want to make sure pirc doesn't segfault when doing bytecode stuff. */
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_OUTPUTPBC)) {
        emit_pbc(lexer);
    }


    fprintf(stderr, "ok\n");
    /* clean up after playing */
    release_resources(lexer);

       /* clean up after playing */
    yypirlex_destroy(yyscanner);


}

/*

temporary function for the thread-testing code.
Unpack the arguments and invoke parse_file().

*/
void *
process_file(void *a) {


    /* unpack the arguments from the structure parser_args */
    parser_args *args      = (parser_args *)a;
    int          flexdebug = args->flexdebug;
    FILE        *infile    = args->infile;
    char        *filename  = args->filename;
    int          thr_id    = args->thr_id;
    int          flags     = args->flags;

    parse_file(flexdebug, infile, filename, flags, thr_id, INIT_MACRO_SIZE);

    return NULL;
}




/*

=item C<int
main(int argc, char *argv[])>

Main compiler driver.

=cut

*/
int
main(int argc, char *argv[]) {
    char const * const program_name = argv[0];
    int                flexdebug    = 0;
    int                flags        = 0;
    char              *filename     = NULL;
    char              *outputfile   = NULL;
    unsigned           macrosize    = INIT_MACRO_SIZE;


    /* skip program name */
    argc--;
    argv++;


    /* XXX test the parse_string() function. */
    /*
    parse_string(".sub main :main\nprint 42\n.end\n", LEXER_FLAG_OUTPUTPBC, 0, INIT_MACRO_SIZE);
    return 0;
    */


    /* XXX very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO. */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            case 'b':
                SET_FLAG(flags, LEXER_FLAG_OUTPUTPBC);
                break;
            case 'E':
                SET_FLAG(flags, LEXER_FLAG_PREPROCESS);
                break;
            case 'f':
                flexdebug = 1;
                break;
            case 'h':
                print_help(program_name);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
            case 'H':
                SET_FLAG(flags, LEXER_FLAG_HEREDOCONLY);
                break;
            case 'm':
                if (argc > 1) {
                    argc--;
                    argv++;
                    macrosize = atoi(argv[0]);
                }
                else {
                    fprintf(stderr, "Missing argument for option '-m'\n");
                    exit(EXIT_FAILURE);
                }
                break;
            case 'n':
                SET_FLAG(flags, LEXER_FLAG_NOOUTPUT);
                break;
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
            case 'p':
                SET_FLAG(flags, LEXER_FLAG_EMIT_PASM);
                break;
            case 'r':
                SET_FLAG(flags, LEXER_FLAG_REGALLOC);
                break;
            case 'S':
                SET_FLAG(flags, LEXER_FLAG_NOSTRENGTHREDUCTION);
                break;
            case 'v':
                SET_FLAG(flags, LEXER_FLAG_VERBOSE);
                break;
            case 'W':
                SET_FLAG(flags, LEXER_FLAG_WARNINGS);
                break;
/* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'y':
                yypirdebug = 1;
                break;
#endif
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
        args.flags     = flags;

        pthread_create(&threads[i], NULL, process_file, &args);

    }

    /* wait for all threads to finish */
    for (i = 0; i < NUM_THREADS; i++)
        pthread_join(threads[i], NULL);
}
#else
{
    /* non-thread testing code; this is the normal case */
    FILE *file = NULL;

    if (argc < 1) {
        fprintf(stderr, "pirc: no input specified\n");
        exit(EXIT_FAILURE);
    }

    /* if user requested only to process heredocs, send output to stdout and return. */
    if (TEST_FLAG(flags, LEXER_FLAG_HEREDOCONLY)) {
        process_heredocs(argv[0], stdout);
        return 0;
    }

    file = fopen("heredoc.out", "w");
    process_heredocs(argv[0], file);
    fclose(file);
    /* done handling arguments, open the file */
    file     = open_file("heredoc.out", "r");
    filename = argv[0];

    if (file == NULL) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    parse_file(flexdebug, file, filename, flags, 0, macrosize);

}
#endif

    return 0;
}



/*

=item C<int
yypirerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...)>

Default parse error handling routine, that is invoked when the bison-generated
parser finds a syntax error.

=cut

*/
PARROT_IGNORABLE_RESULT
int
yypirerror(yyscan_t yyscanner, NOTNULL(lexer_state * const lexer),
        NOTNULL(char const * const message), ...)
{
    char const * const current_token = yypirget_text(yyscanner);
    va_list arg_ptr;

    fprintf(stderr, "\nError in file '%s' (line %d)\n\t", lexer->filename,
            yypirget_lineno(yyscanner));

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    ++lexer->parse_errors;

    /* print current token if it doesn't contain a newline token. */
    if (!strstr(current_token, "\n"))
        fprintf(stderr, "\n\tcurrent token: '%s'", current_token);

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
