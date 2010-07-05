/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */



#include "pirparser.h"
#include "pircompiler.h"
#include "piremit.h"
#include "piryy.h"
#include "pirlexer.h"
#include "pircapi.h"

/* HEADERIZER HFILE: compilers/pirc/src/pircapi.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=head1 DESCRIPTION

This file implements the API for PIRC. A program that wants to use
PIRC's services should use only these functions.

=head1 FUNCTIONS

=over 4

=cut

*/


void init_scanner_state(yyscan_t yyscanner);


static Parrot_mutex eval_nr_lock;
static INTVAL       eval_nr  = 0;

/*

=item C<FILE * open_file(char const * const filename, char const * const mode)>

Function to open the file given by C<filename>, in the mode given by C<mode>
Microsoft visual studio provides a "safer" variant of fopen(); this
function hides the selection of the appropriate variant.

=cut

*/

PARROT_CAN_RETURN_NULL
FILE *
open_file(ARGIN(char const * const filename), ARGIN(char const * const mode))
{
    ASSERT_ARGS(open_file)
    FILE *fp = NULL;

#ifdef _MSC_VER
    fopen_s(&fp, filename, mode);
#else
    fp = fopen(filename, mode);
#endif
    return fp;
}

/*

=item C<void parse_file(PARROT_INTERP, int flexdebug, FILE *infile, char * const
filename, int flags, int thr_id, unsigned macro_size, char * const outputfile)>

This will be the proper declaration after testing for thread-safety:

void parse_file(int flexdebug, FILE *infile, char * const filename, int flags,
                char * const outputfile)

=cut

*/

void
parse_file(PARROT_INTERP, int flexdebug, ARGIN(FILE *infile),
           ARGIN(char * const filename), int flags,
           int thr_id, unsigned macro_size,
           ARGMOD_NULLOK(char * const outputfile))
{
    ASSERT_ARGS(parse_file)
    yyscan_t     yyscanner;
    lexer_state *lexer     = NULL;

    /* create a yyscan_t object */
    yypirlex_init(&yyscanner);
    /* set debug flag */
    yypirset_debug(flexdebug, yyscanner);
    /* set the input file */
    yypirset_in(infile, yyscanner);
    /* set the extra parameter in the yyscan_t structure */
    lexer = new_lexer(interp, filename, flags);
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
            emit_pir_subs(lexer, outputfile);
        else if (TEST_FLAG(lexer->flags, LEXER_FLAG_OUTPUTPBC))
            emit_pbc(lexer, outputfile);
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
/*
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_OUTPUTPBC))
        fprintf(stderr, "pirc ok\n");
*/

    /* clean up after playing */
    release_resources(lexer);
    yypirlex_destroy(yyscanner);

}


/*

=item C<void parse_string(PARROT_INTERP, char *pirstring, int flags, int
pasminput, unsigned macro_size)>

Parse a PIR string.

=cut

*/
void
parse_string(PARROT_INTERP, ARGIN(char *pirstring), int flags, int pasminput,
    unsigned macro_size)
{
    ASSERT_ARGS(parse_string)
    yyscan_t            yyscanner;
    lexer_state        *lexer = NULL;
    char                name[64];
    PackFile_ByteCode  *old_cs, *new_cs;
    INTVAL              eval_number;


    if (eval_nr == 0)
        MUTEX_INIT(eval_nr_lock);

    LOCK(eval_nr_lock);
    eval_number = ++eval_nr;
    UNLOCK(eval_nr_lock);

    snprintf(name, sizeof (name), "EVAL_" INTVAL_FMT, eval_number);

    new_cs = PF_create_default_segs(interp, Parrot_str_new(interp, name, strlen(name)), 0);
    old_cs = Parrot_switch_to_cs(interp, new_cs, 0);

    /* create a yyscan_t object */
    yypirlex_init(&yyscanner);

    yypirset_debug(0, yyscanner);


    /* set the extra parameter in the yyscan_t structure */
    lexer = new_lexer(interp, name, flags);
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
        emit_pbc(lexer, NULL);
    }

/*
    fprintf(stderr, "ok\n");
*/

    /* clean up after playing */
    release_resources(lexer);

    /* clean up after playing */
    yypirlex_destroy(yyscanner);


}

/*

=item C<PackFile_ByteCode * pirc_compile_file(PARROT_INTERP, const char
*filename, STRING **error_message)>

Returns NULL.

=cut

*/

PARROT_CAN_RETURN_NULL
PackFile_ByteCode *
pirc_compile_file(SHIM_INTERP, SHIM(const char *filename),
    SHIM(STRING **error_message))
{
    ASSERT_ARGS(pirc_compile_file)
    return NULL;
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


