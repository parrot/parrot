#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0_mob.h"
#include "include/m0_mob_structures.h"
#include "include/m0_constants.h"
#include "include/m0_compiler_defines.h"

static int
parse_mob_header(    M0_Interp *interp, FILE *stream );

static int
parse_header_config( M0_Interp *interp, FILE *stream );

static int
parse_mob_dirseg(    M0_Interp *interp, FILE *stream );

static int
parse_mob_chunks(    M0_Interp *interp, FILE *stream );

static void
add_chunk( M0_Interp     *interp,   const    char *name,
           unsigned long  chunk_id, unsigned long  name_length );

static M0_Constants_Segment *
parse_mob_constants_segment( M0_Interp *interp, FILE *stream );

static M0_Metadata_Segment *
parse_mob_metadata_segment( M0_Interp *interp, FILE *stream );

static M0_Bytecode_Segment *
parse_mob_bytecode_segment( M0_Interp *interp, FILE *stream );

static void *
read_from_stream(         FILE *stream, size_t bytes );

static unsigned int
read_int_from_stream(     FILE *stream );

static unsigned long
read_long_from_stream(    FILE *stream );

static unsigned int
read_padding_from_stream( FILE *stream, size_t bytes );

static int
verify_mob_magic_number( M0_Interp *interp, FILE *stream );

static int
validate_mob_version( M0_Interp *interp, FILE *stream );

static int
validate_segment_identifier( M0_Interp *interp, FILE *stream,
                             unsigned int seg_id );

int
load_mob_file(M0_Interp *interp, const char *filename) {
    FILE *mob = fopen( filename, "r" );

    if (!mob)
        return 0;

    if (!parse_mob_header( interp, mob )) {
        fclose( mob );
        return 0;
    }

    if (!parse_mob_dirseg( interp, mob )) {
        fclose( mob );
        return 0;
    }

    if (!parse_mob_chunks( interp, mob ))
    {
        fclose( mob );
        return 0;
    }

    return fclose( mob ) == 0;
}

int
parse_mob_header( M0_Interp *interp, FILE *stream ) {
    if (!verify_mob_magic_number( interp, stream ))
        return 0;

    if (!validate_mob_version( interp, stream ))
        return 0;

    if (!parse_header_config( interp, stream ))
        return 0;

    return read_padding_from_stream( stream, 2 );
}

int
verify_mob_magic_number( M0_Interp *interp, FILE *stream ) {
    char      *magic     = (char *)read_from_stream( stream, 8 );
    const char header[8] = { 254, 77, 48, 66, 13, 10, 26, 10 };

    UNUSED(interp);

    if (strncmp( magic, header, 8 ) != 0) {
        fprintf( stderr, "Invalid M0B header\n" );
        free( magic );
        return 0;
    }

    free( magic );

    return 1;
}

int
validate_mob_version( M0_Interp *interp, FILE *stream ) {
    int version = read_int_from_stream( stream );

    if (version == 0) {
        interp->mob_version = 0;
        return 1;
    }

    fprintf( stderr, "Can't read m0b version %d\n", version );
    return 0;
}

int
parse_header_config( M0_Interp *interp, FILE *stream ) {
    interp->ireg_size     = read_int_from_stream( stream );
    interp->nreg_size     = read_int_from_stream( stream );
    interp->opcode_t_size = read_int_from_stream( stream );
    interp->pointer_size  = read_int_from_stream( stream );
    interp->endianness    = read_int_from_stream( stream );

    return 1;
}

int
parse_mob_dirseg( M0_Interp *interp, FILE *stream ) {
    if (!validate_segment_identifier( interp, stream, M0_DIR_SEG ))
        return 0;
    else {
        const unsigned long seg_entry_count = read_long_from_stream( stream );
        const unsigned long seg_byte_count  = read_long_from_stream( stream );
        unsigned long       chunks_found    = 0;
        UNUSED(seg_byte_count);

        for (; chunks_found < seg_entry_count; chunks_found++) {
            const unsigned long seg_offset  = read_long_from_stream( stream );
            const unsigned long name_length = read_long_from_stream( stream ); 
            const char         *name        =
                                read_from_stream( stream, name_length );

            UNUSED(seg_offset);

            add_chunk( interp, name, chunks_found, name_length);
        }
    }

    /* XXX: is m0b invalid if it has no chunks? */
    return 1;
}

void
add_chunk( M0_Interp *interp, const char *name, unsigned long chunk_id,
                                                unsigned long name_length) {
    M0_Chunk *chunk    = malloc( sizeof (M0_Chunk) );
    chunk->id          = chunk_id;
    chunk->name        = name;
    chunk->name_length = name_length;

    if (!interp->first_chunk)
        interp->first_chunk = chunk;
    else {
        interp->last_chunk->next = chunk;
        interp->last_chunk       = chunk;
    }
}

int
validate_segment_identifier( M0_Interp *interp, FILE *stream,
                             unsigned int seg_id ) {
    UNUSED(interp);
    return read_long_from_stream( stream ) == seg_id;
}

int
parse_mob_chunks( M0_Interp *interp, FILE *stream ) {
    M0_Chunk *chunk = interp->first_chunk;

    while (chunk) {
        chunk->constants = parse_mob_constants_segment( interp, stream );
        chunk->metadata  = parse_mob_metadata_segment(  interp, stream );
        chunk->bytecode  = parse_mob_bytecode_segment(  interp, stream );

        chunk            = chunk->next;
    }

    return 1;
}

M0_Constants_Segment *
parse_mob_constants_segment( M0_Interp *interp, FILE *stream ) {
    if (!validate_segment_identifier( interp, stream, M0_CONST_SEG ))
        return 0;
    else {
        const unsigned long   const_count = read_long_from_stream( stream );
        const unsigned long   byte_count  = read_long_from_stream( stream );
        unsigned long         i           = 0;
        M0_Constants_Segment *segment     =
                malloc( sizeof( M0_Constants_Segment ) );
        segment->consts = malloc( sizeof ( char * ) * const_count );
        segment->count  = const_count;

        UNUSED( byte_count );

        for (i = 0; i < const_count; i++) {
            const unsigned long length   = read_long_from_stream( stream );
            const char         *constant =
                         (const char *)read_from_stream( stream, length );

            if (constant)
                segment->consts[i] = constant;
        }

        return segment;
    }

    return NULL;
}

M0_Metadata_Segment *
parse_mob_metadata_segment( M0_Interp *interp, FILE *stream ) {
    if (!validate_segment_identifier( interp, stream, M0_META_SEG ))
        return 0;
    else {
        const unsigned long  entry_count = read_long_from_stream( stream );
        const unsigned long  byte_count  = read_long_from_stream( stream );
        unsigned long        i           = 0;
        M0_Metadata_Segment *segment     =
            malloc( sizeof( M0_Metadata_Segment) );
        segment->entries =
            malloc( sizeof( M0_Metadata_Entry * ) * entry_count );
        segment->count   = entry_count;

        UNUSED( byte_count );

        for (i = 0; i < entry_count; i++) {
            M0_Metadata_Entry *entry = malloc( sizeof( M0_Metadata_Entry ) );

            entry->offset            = read_long_from_stream( stream );
            entry->name_index        = read_long_from_stream( stream );
            entry->value_index       = read_long_from_stream( stream );

            segment->entries[i]      = entry;
        }

        return segment;
    }

    return NULL;
}

M0_Bytecode_Segment *
parse_mob_bytecode_segment( M0_Interp *interp, FILE *stream ) {
    if (!validate_segment_identifier( interp, stream, M0_BC_SEG ))
        return 0;
    else {
        M0_Bytecode_Segment *bytecode = malloc( sizeof (M0_Bytecode_Segment) );
        bytecode->op_count            = read_long_from_stream( stream );

        /* the order of these operations is important */
        bytecode->ops                 = (unsigned int *)
            read_from_stream( stream, read_long_from_stream( stream ) );

        return bytecode;
    }

    return NULL;
}

void *
read_from_stream( FILE *stream, size_t bytes ) {
    if (feof( stream ))
        return NULL;
    else {
        void *data = malloc( bytes );

        if (fread(data, 1, bytes, stream) != bytes) {
            free( data );
            return NULL;
        }

        return data;
    }
}

unsigned int
read_int_from_stream( FILE *stream ) {
    if (feof( stream ))
        return 0;
    else {
        int value = 0;

        if (fread( &value, 1, 1, stream) != 1)
            return 0;

        return value;
    }
}

unsigned long
read_long_from_stream( FILE *stream ) {
    if (feof( stream ))
        return 0;
    else {
        long value = 0;

        if (fread( &value, 4, 1, stream) != 1)
            return 0;

        return value;
    }
}

unsigned int
read_padding_from_stream( FILE *stream, size_t bytes ) {
    int value[2] = {0, 0};

    if (feof( stream ))
        return 0;

    return fread( &value, 1, bytes, stream ) == bytes;
}
