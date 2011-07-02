#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0.h"
#include "include/m0_mob.h"
#include "include/m0_ops.h"
#include "include/m0_constants.h"
#include "include/m0_compiler_defines.h"

static M0_Interp *
new_interp();

static M0_CallFrame *
new_call_frame( M0_Interp *interp );

static void
call_frame_free( M0_Interp *interp, M0_CallFrame *cf );

static void
interp_free( M0_Interp *interp );

static void
m0_chunk_free( M0_Chunk *chunk );

void
m0_chunk_free_constants( M0_Constants_Segment *constants );

void
m0_chunk_free_metadata( M0_Metadata_Segment *metadata );

void
m0_chunk_free_bytecode( M0_Bytecode_Segment *bytecode );

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
    if (chunk->constants)
        m0_chunk_free_constants( chunk->constants );

    if (chunk->metadata)
        m0_chunk_free_metadata( chunk->metadata );

    if (chunk->bytecode)
        m0_chunk_free_bytecode( chunk->bytecode );

    free( (char *)chunk->name );
    free( chunk );
}

void
m0_chunk_free_constants( M0_Constants_Segment *constants )
{
    const unsigned long count = constants->count;
    unsigned       long i     = 0;

    for (i = 0; i < count; i++) {
        if ( constants->consts[i] )
            free( (void *)constants->consts[i] );
    }

    free( constants->consts );
    free( constants );
}

void
m0_chunk_free_metadata( M0_Metadata_Segment *metadata )
{
    const unsigned long count = metadata->count;
    unsigned       long i     = 0;

    for (i = 0; i < count; i++) {
        if ( metadata->entries[i] )
            free( (void *)metadata->entries[i] );
    }

    free( metadata->entries );
    free( metadata );
}

void
m0_chunk_free_bytecode( M0_Bytecode_Segment *bytecode )
{
    if (bytecode->ops)
        free( bytecode->ops );

    free( bytecode );
}
