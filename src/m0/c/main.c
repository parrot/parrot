#define M0_SOURCE
#include "m0.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int
main( int argc, char *argv[]) {
    if (argc < 2) {
        fprintf( stderr, "Usage: m0 <filename.mob>\n" );
        exit( EXIT_FAILURE );
    }

    M0_Interp *interp = new_interp();
    if (!interp)
        exit( EXIT_FAILURE );

    if (!m0_interp_parse_cargs( interp, argc, argv ))
        exit( EXIT_FAILURE );

    if (!m0_mob_load_file( interp, argv[1] )) {
        fprintf( stderr, "Could not load m0b file: '%s'\n", argv[1] );
        interp_free( interp );
        exit( EXIT_FAILURE );
    }

    M0_CallFrame *cf = new_call_frame( interp );
    run_ops( interp, cf );

    call_frame_free( interp, cf );
    interp_free( interp );

    exit( EXIT_SUCCESS );
}
