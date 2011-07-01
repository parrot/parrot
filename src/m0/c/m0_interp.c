#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0.h"
#include "include/m0_mob.h"
#include "include/m0_constants.h"
#include "include/m0_compiler_defines.h"

M0_Interp * new_interp();

M0_CallFrame * new_call_frame( M0_Interp *interp );

int run_ops( M0_Interp *interp, M0_CallFrame *cf );

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf );

void interp_free( M0_Interp *interp );

int main( int argc, const char *argv[]) {
    M0_Interp *interp = new_interp();

    if (!interp)
        exit(1);

    if (argc < 2) {
        fprintf( stderr, "Usage: m0 <filename.mob>\n" );
        interp_free( interp );
        exit(1);
    }

    if (!load_mob_file( interp, argv[1] )) {
        fprintf( stderr, "Could not load m0b file: '%s'\n", argv[1] );
        interp_free( interp );
        exit( 1 );
    }
    else {
        M0_CallFrame *cf = new_call_frame( interp );
        run_ops( interp, cf );

        call_frame_free( interp, cf );
        interp_free( interp );

        exit( 0 );
    }
}

M0_Interp *
new_interp() {
    return calloc( 1, sizeof (M0_Interp) );
}

M0_CallFrame *
new_call_frame(M0_Interp *interp) {
    UNUSED(interp);
    return malloc( sizeof (M0_CallFrame) );
}

int run_ops(M0_Interp *interp, M0_CallFrame *cf) {
    UNUSED(interp);
    UNUSED(cf);
    return 0;
}

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf) {
    UNUSED(interp);
    free( cf );
}

void interp_free( M0_Interp *interp ) {
    M0_Chunk *chunk = interp->first_chunk;

    while (chunk) {
        M0_Chunk *next = chunk->next;
        free( (char *)chunk->name );
        free( chunk );
        chunk = next;
    }

    free( interp );
}
