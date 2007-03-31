#include <stdio.h>
#include <stdlib.h>
#include "pirparser.h"
#include "pirout.h"    /* for PIR output    */
#include "pastout.h"   /* for PAST output   */


/* define output type: what kind of semantic routines
 * should be called in the parser? 
 */
typedef enum outputtypes {
		OUTPUT_NONE,    /* do nothing  */
		OUTPUT_PIR,     /* output PIR  */
		OUTPUT_PAST     /* output PAST */
		
} outputtype; 




/* main()
 *
 * Entry function for the PIR Compiler 'PIRC'
 *
 */
int
main(int argc, char **argv) {

    struct parser_state *p = NULL;
    pirvtable *vtable      = NULL;
    
    /* make this a commandline switch */
    int output;
    
    //output = OUTPUT_PAST;    
    output = OUTPUT_PIR;
    
    
    if (argc < 2) {
        fprintf(stderr, "usage: %s <file>\n", argv[0]);
        exit(1);
    }

    
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
        default:
            fprintf(stderr, "Unknown output type specified\n");
            exit(1);
    }
    
    
    /* create a new parser, specifying the file name and the vtable */
    p = new_parser(argv[1], vtable);

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
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
