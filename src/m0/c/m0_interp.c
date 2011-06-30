#include <stdio.h>
#include <stdlib.h>
#include "include/m0.h"

M0_Interp * new_interp();

M0_CallFrame * new_call_frame( M0_Interp *interp );

int load_mob( M0_Interp *interp, const char *filename );

int run_ops( M0_Interp *interp, M0_CallFrame *cf );

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf );

void interp_free( M0_Interp *interp );

int parse_mob_header(    M0_Interp *interp, FILE *stream );
int parse_header_config( M0_Interp *interp, FILE *stream );
int parse_mob_dirseg(    M0_Interp *interp, FILE *stream );

void *        read_from_stream(         FILE *stream, size_t bytes );
unsigned int  read_int_from_stream(     FILE *stream );
unsigned long read_long_from_stream(    FILE *stream );
unsigned int  read_padding_from_stream( FILE *stream, size_t bytes );

static int
verify_mob_magic_number( M0_Interp *interp, FILE *stream );

static int
validate_mob_version( M0_Interp *interp, FILE *stream );

static int
validate_segment_identifier( M0_Interp *interp, FILE *stream, int seg_id );

int main( int argc, const char *argv[]) {
    M0_Interp *interp = new_interp();

    if (!interp)
        exit(1);

    if (argc < 2) {
        fprintf( stderr, "Usage: m0 <filename.mob>\n" );
        interp_free( interp );
        exit(1);
    }

    if (!load_m0b( interp, argv[1] )) {
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
    return malloc( sizeof (M0_Interp) );
}

M0_CallFrame *
new_call_frame(M0_Interp *interp) {
    return malloc( sizeof (M0_CallFrame) );
}

int
load_m0b(M0_Interp *interp, const char *filename) {
    FILE *mob = fopen( filename, "r" );
    int   status;

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

    fclose( mob );
    return status;
}

int run_ops(M0_Interp *interp, M0_CallFrame *cf) {

}

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf) {
    free( cf );
}

void interp_free( M0_Interp *interp ) {
    free( interp );
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

int parse_mob_dirseg( M0_Interp *interp, FILE *stream ) {
    if (!validate_segment_identifier( interp, stream, M0_DIR_SEG ))
        return 0;
    else {
        unsigned long seg_entry_count = read_long_from_stream( stream );
        unsigned long seg_byte_count  = read_long_from_stream( stream );
    }
}

int
validate_segment_identifier( M0_Interp *interp, FILE *stream, int seg_id ) {
    return read_long_from_stream( stream ) == seg_id;
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
