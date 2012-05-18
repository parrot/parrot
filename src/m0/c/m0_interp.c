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
    int        i;
    uint64_t*     interp_argv;

    if (!interp)
        exit(1);

#ifdef M0_DEBUGGER
    debugger(argc, argv,  interp, NULL, NULL, -1);
#endif
    (*interp)[ARGC] = argc - 1;
    interp_argv = (uint64_t*) malloc((argc-1) * sizeof(uint64_t));

    // encode cli arguments as M0 strings, skipping the first (name of the interp)
    for (i = 1; i < argc; i++) {
        const char *arg = argv[i];
        uint32_t    m0_arg_const_len = strlen(arg) + 4 + 4 + 1; // byte count + encoding + string bytes + terminal null
        uint32_t    m0_arg_len       = strlen(arg) + 1;
        uint32_t    m0_arg_encoding  = 0;
        char       *m0_arg_const     = (char*) malloc(m0_arg_const_len * sizeof(char));
        memcpy(&(m0_arg_const[0]), &m0_arg_len, sizeof(uint32_t));
        memcpy(&(m0_arg_const[4]), &m0_arg_encoding, sizeof(uint32_t));
        memcpy(&(m0_arg_const[8]), arg, m0_arg_len * sizeof(char));
        interp_argv[i-1] = m0_arg_const;
    }
    (*interp)[ARGV] = interp_argv;

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
    M0_Interp *interp      = calloc( 1, sizeof (M0_Interp) );
    M0_Config *config      = calloc( 1, sizeof (M0_Config) );
    (*config)[CFG_REGSZ]      = 8;
    (*config)[CFG_CFSZ]       = sizeof( M0_CallFrame );

    (*interp)[CONFIG]         = (uint64_t)config;
    return interp;
}

M0_CallFrame *
new_call_frame( M0_Interp *interp ) {
    M0_CallFrame *frame = malloc( sizeof (M0_CallFrame) );
    unsigned int i;
    for(i = 0; i < 256; i++)
        frame->registers[i] = (uint64_t)0;

    /* this is a silly minimal hack for now */
    frame->registers[CHUNK]  = (uint64_t)(*interp)[CHUNKS];
    frame->registers[PC]     = (uint64_t)0;
    frame->registers[CONSTS] = (uint64_t)((M0_Chunk*) ((*interp)[CHUNKS]))->constants;
    frame->registers[CF]	 = (uint64_t)frame;
    frame->registers[INTERP] = (uint64_t)interp;

    return frame;
}

void
call_frame_free( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);
    free( cf );
}

void
interp_free( M0_Interp *interp ) {
    M0_Chunk *chunk = (M0_Chunk*)((*interp)[CHUNKS]);

    while (chunk) {
        M0_Chunk *next = chunk->next;
        m0_chunk_free( chunk );
        chunk = next;
    }
    free( ((void *)(*interp)[CONFIG]) );
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
        if ( constants->consts[i] && constants->pointers[i])
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

/* vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
*/
