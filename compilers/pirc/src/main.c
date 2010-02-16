/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
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
#include "pircapi.h"

/* global variable to set parser in debug mode.
 * It is not clear to me whether the global can be replaced
 * by a parser-specific flag.
 */
#ifdef YYDEBUG

extern int yypirdebug = 0;

#endif

/* HEADERIZER HFILE: none */

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

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void print_help(ARGIN(char const * const program_name))
        __attribute__nonnull__(1);

static void runcode(PARROT_INTERP, int argc, ARGIN(char *argv[]))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_print_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(program_name))
#define ASSERT_ARGS_runcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 FUNCTIONS

=over 4


=item C<static void print_help(char const * const program_name)>

Routine to print usage of this program.

=cut

*/
static void
print_help(ARGIN(char const * const program_name))
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
    "  -o <file> write output to the specified file.\n"
    "  -p        pasm output\n"
    "  -r        activate the register allocator for improved register usage\n"
    "  -S        do not perform strength reduction\n"
    "  -v        verbose mode\n"
    "  -W        show warning messages\n"
    "  -x        execute code after compilation\n"
#ifdef YYDEBUG
    "  -y        debug bison-generated parser\n"
#endif
    );
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

temporary function for the thread-testing code.
Unpack the arguments and invoke parse_file().

*/
PARROT_CAN_RETURN_NULL
void *
process_file(ARGIN(void *a))
{


    /* unpack the arguments from the structure parser_args */
    parser_args *args      = (parser_args *)a;
    int          flexdebug = args->flexdebug;
    FILE        *infile    = args->infile;
    char        *filename  = args->filename;
    int          thr_id    = args->thr_id;
    int          flags     = args->flags;
    PARROT_INTERP          = Parrot_new(NULL);

    parse_file(interp, flexdebug, infile, filename, flags, thr_id, INIT_MACRO_SIZE, NULL);

    return NULL;
}


/*

=item C<static void runcode(PARROT_INTERP, int argc, char *argv[])>

This function runs the code in the interpreter's (in C<PARROT_INTERP>)
code segment.

=cut

*/
static void
runcode(PARROT_INTERP, int argc, ARGIN(char *argv[]))
{

    /* runs :init functions */
    PackFile_fixup_subs(interp, PBC_MAIN, NULL);

    Parrot_runcode(interp, argc, argv);
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
    int                flags        = 0;
    int                execute      = 0;
    char              *filename     = NULL;
    char              *outputfile   = NULL;
    const char        *hdocoutfile  = NULL;
    unsigned           macrosize    = INIT_MACRO_SIZE;
    PARROT_INTERP                   = Parrot_new(NULL);

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
            case 'x':
                execute = 1;
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

    if (outputfile != NULL && TEST_FLAG(flags, LEXER_FLAG_HEREDOCONLY)) {
        file = open_file(outputfile, "w");
        process_heredocs(interp, argv[0], file);
        fclose(file);
        return 0;
    }
    else if (TEST_FLAG(flags, LEXER_FLAG_HEREDOCONLY)) {
        process_heredocs(interp, argv[0], stdout);
        return 0;
    }
    else {
        hdocoutfile = "hdoctemp";
        file = open_file(hdocoutfile, "w");
        process_heredocs(interp, argv[0], file);
        fclose(file);
    }


    /* done handling arguments, open the file */
    file     = open_file(hdocoutfile, "r");
    filename = argv[0];

    if (file == NULL) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    parse_file(interp, flexdebug, file, filename, flags, 0, macrosize, outputfile);
/*
    fprintf(stderr, "done\n");
*/

    if (execute)
        runcode(interp, argc, argv);

}
#endif

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
