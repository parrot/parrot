#include <stdio.h>
#include <stdlib.h>
#include "pirparser.h"

/* main()
 *
 * Entry function for the PIR Compiler 'PIRC'
 *
 */
int
main(int argc, char **argv) {

    struct parser_state *p = NULL;

    if (argc < 2) {
        fprintf(stderr, "usage: %s <file>\n", argv[0]);
        exit(1);
    }

    /* create a new parser, specifying the file name */
    p = new_parser(argv[1]);

    /* start parsing */
    TOP(p);

    /* check for errors */
    if (get_parse_errors(p) == 0) printf("parse successful\n");
    else fprintf(stderr, "There were %d errors.\n", get_parse_errors(p));

    /* clean up and exit */
    exit_parser(p);
    return 0;
}
