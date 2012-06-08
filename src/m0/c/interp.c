#define M0_SOURCE
#include "m0.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void
m0_chunk_free( M0_Chunk *chunk );

void
m0_chunk_free_constants( M0_Constants_Segment *constants );

void
m0_chunk_free_metadata( M0_Metadata_Segment *metadata );

void
m0_chunk_free_bytecode( M0_Bytecode_Segment *bytecode );

static M0_String *string_from_cstring(const char *cstring, int32_t encoding)
{
    size_t size = strlen(cstring) + 1;
    if(size > (uint32_t)-1)
        return NULL;

    M0_String *string = malloc(sizeof *string + size);
    if(!string) return NULL;

    string->size = (uint32_t)size;
    string->encoding = encoding;
    memcpy(string->bytes, cstring, size);

    return string;
}


M0_Interp *
new_interp() {
    M0_Interp *interp      = calloc( 1, sizeof (M0_Interp) );
    M0_Config *config      = calloc( 1, sizeof (M0_Config) );
    (*config)[CFG_REGSZ]      = 8;
    (*config)[CFG_CFSZ]       = sizeof( M0_CallFrame );

    (*interp)[CONFIG]         = (uint64_t)(uintptr_t)config;
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
    frame->registers[CONSTS] = (uint64_t)(uintptr_t)((M0_Chunk*)(uintptr_t) ((*interp)[CHUNKS]))->constants;
    frame->registers[CF]	 = (uint64_t)(uintptr_t)frame;
    frame->registers[INTERP] = (uint64_t)(uintptr_t)interp;

    return frame;
}

void
call_frame_free( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);
    free( cf );
}

void
interp_free( M0_Interp *interp ) {
    M0_Chunk *chunk = (M0_Chunk*)(uintptr_t)((*interp)[CHUNKS]);

    while (chunk) {
        M0_Chunk *next = chunk->next;
        m0_chunk_free( chunk );
        chunk = next;
    }
    free( ((void *)(uintptr_t)(*interp)[CONFIG]) );
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
            free( (void *)(uintptr_t)constants->consts[i] );
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

bool
m0_interp_parse_cargs( M0_Interp *interp, int argc, char **argv )
{
    assert(argc > 0);

    // skip first arg (executable name)
    --argc, ++argv;

    // no parsing for now: just convert to m0 strings
    uint64_t *interp_argv = malloc(argc * sizeof *interp_argv);
    if (!interp_argv)
        return 0;

    int i = 0;
    for (; i < argc; ++i) {
        M0_String *arg_string = string_from_cstring(argv[i], M0_ENC_UNKNOWN);
        if (!arg_string)
            goto FAIL;

        interp_argv[i] = (uint64_t)(uintptr_t)arg_string;
    }

    (*interp)[ARGC] = argc;
    (*interp)[ARGV] = (uint64_t)(uintptr_t)interp_argv;

    return 1;

FAIL:
    while (i--)
        free( (void *)(uintptr_t)interp_argv[i] );

    return 0;
}

/* vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
*/
