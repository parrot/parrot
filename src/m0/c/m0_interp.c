#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0.h"
#include "include/m0_mob.h"
#include "include/m0_constants.h"
#include "include/m0_compiler_defines.h"

static M0_Interp *
new_interp();

static M0_CallFrame *
new_call_frame( M0_Interp *interp );

static int
run_ops( M0_Interp *interp, M0_CallFrame *cf );

static void
call_frame_free( M0_Interp *interp, M0_CallFrame *cf );

static void
interp_free( M0_Interp *interp );

static void
m0_chunk_free( M0_Chunk *chunk );

int
main( int argc, const char *argv[]) {
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
new_call_frame( M0_Interp *interp ) {
    UNUSED(interp);
    return malloc( sizeof (M0_CallFrame) );
}

int
run_ops( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);
    UNUSED(cf);
    return 0;
}

void
call_frame_free( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);
    free( cf );
}

void
interp_free( M0_Interp *interp ) {
    M0_Chunk *chunk = interp->first_chunk;

    while (chunk) {
        M0_Chunk *next = chunk->next;
        m0_chunk_free( chunk );
        chunk = next;
    }

    free( interp );
}

void
m0_chunk_free( M0_Chunk *chunk ) {
    if (chunk->constants) {
        unsigned long count = chunk->constants->count;
        unsigned long i     = 0;
        for (i = 0; i < count; i++) {
            if( chunk->constants->consts[i] )
                free( (char *)chunk->constants->consts[i] );
        }

        free( chunk->constants->consts );
        free( chunk->constants );
    }
    free( (char *)chunk->name );
    free( chunk );
}
