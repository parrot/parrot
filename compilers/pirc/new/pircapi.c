/*
 * $Id$
 * Copyright (C) 2009, The Perl Foundation.
 */



#include "pirparser.h"
#include "pircompiler.h"
#include "piremit.h"
#include "piryy.h"
#include "pirlexer.h"
#include "pircapi.h"

/*

=head1 DESCRIPTION


=head1 FUNCTIONS

=over 4

=cut

*/


void init_scanner_state(yyscan_t yyscanner);


/*

=item C<FILE *
open_file(char const * const filename, char const * const mode)>

Function to open the file given by C<filename>, in the mode given by C<mode>
Microsoft visual studio provides a "safer" variant of fopen(); this
function hides the selection of the appropriate variant.

=cut

*/
FILE *
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

This will be the proper declaration after testing for thread-safety:

void parse_file(int flexdebug, FILE *infile, char * const filename, int flags,
                char * const outputfile)

*/



void
parse_file(int flexdebug, FILE *infile, char * const filename, int flags, int thr_id,
           unsigned macro_size, char * const outputfile)
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
            emit_pir_subs(lexer, outputfile);
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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


