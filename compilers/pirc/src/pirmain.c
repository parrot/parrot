/*

=head1 NAME

pirmain.c - Main file for PIR Compiler PIRC.

=cut

*/
#include <stdio.h>
#include <stdlib.h>
#include "pirparser.h"
#include "pirout.h"    /* for PIR output  */
#include "pastout.h"   /* for PAST output */
#include "pirvtable.h" /* vtable api      */
#include "jsonout.h"   /* for json output */
#include "pbcout.h"    /* for PBC output  */




/* command argument switches */
typedef enum pirc_flags {
        PIRC_VERBOSE     = 0,
        PIRC_DEBUG       = 1,

} pirc_flag;


/* define output type: what kind of semantic routines
 * should be called in the parser?
 */
typedef enum outputtypes {
        OUTPUT_NONE,    /* do nothing  */
        OUTPUT_PIR,     /* output PIR  */
        OUTPUT_PAST,    /* output PAST */
        OUTPUT_JSON,    /* output JSON */
        OUTPUT_PBC      /* output PBC  */

} outputtype;


/*

=head1 FUNCTIONS

=over 4

=item print_help()

=cut

*/
static void
print_help(void) {
    fprintf(stderr, "Usage: pirc [options] <file>\n");
    fprintf(stderr, "\tGeneral:\n");
    fprintf(stderr, "\t-d  debug messages (not implemented yet)\n");
    fprintf(stderr, "\t-h  print this help message\n");
    fprintf(stderr, "\t-v  verbose (not implemented yet)\n");
    fprintf(stderr, "\n\tOutput:\n");
    fprintf(stderr, "\t-r  print PIR output\n");
    fprintf(stderr, "\t-p  print PAST output\n");
    fprintf(stderr, "\t-j  print JSON output\n");
    fprintf(stderr, "\t-b  print PBC output (not implemented)\n");
    fprintf(stderr, "\n");
}


/*

=item main()

Entry function for the PIR Compiler 'PIRC'

=cut

*/
int
main(int argc, char **argv) {
    struct parser_state *p = NULL;        /* create a parser */
    pirvtable *vtable      = NULL;        /* create a vtable for semantic actions */
    int flags              = 0;           /* argument parsing */
    outputtype output      = OUTPUT_NONE; /* what kind of output? */

    /* skip program name */
    argv++;
    argc--;

    /* process options */
    while (argc-- > 0) {
        char opt;

        if (argv[0][0] != '-') break; /* stop if there's only a '-' */
        else opt = argv[0][1];   /* get the option letter */

        switch (opt) {
            case 'd':
                flags |= PIRC_DEBUG;
                break;
            case 'h':
                print_help();
                break;
            case 'v':
                flags |= PIRC_VERBOSE;
                break;
            case 'p':
                output = OUTPUT_PAST;
                break;
            case 'r':
                output = OUTPUT_PIR;
                break;
            case 'j':
                output = OUTPUT_JSON;
                break;
            case 'b':
                output = OUTPUT_PBC;
                break;
            default:
                fprintf(stderr, "Unknown option: '%c'\n", opt);
                print_help();
                exit(1);
        }
        /* get next commandline argument */
        argv++;
        argc--;
    }


    if (argv[0] == NULL) {
        fprintf(stderr, "No file specified. Try -h for help.\n");
        exit(1);
    }

    /* create a vtable based on the desired output */
    switch (output) {
        case OUTPUT_NONE:
            /* just create an empty vtable, the default implementation does nothing */
            vtable = new_pirvtable();
            break;
        case OUTPUT_PIR:
            vtable = init_pir_vtable();
            break;
        case OUTPUT_PAST:
            vtable = init_past_vtable();
            break;
        case OUTPUT_JSON:
            vtable = init_json_vtable();
            break;
        case OUTPUT_PBC:
            vtable = init_pbc_vtable();
            break;
        default:
            fprintf(stderr, "Unknown output type specified\n");
            exit(1);
    }


    /* create a new parser, specifying the file name and the vtable */
    p = new_parser(argv[0], vtable);

    /* start parsing */
    TOP(p);

    /* check for errors */
    if (get_parse_errors(p)) {
        fprintf(stderr, "\nThere were %d errors.\n", get_parse_errors(p));
    }
    else {
        fprintf(stderr, "\nparsed successfully.\n");
    }

    /* clean up and exit */
    exit_parser(p);
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



