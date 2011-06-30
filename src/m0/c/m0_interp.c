#include <stdio.h>
#include <stdlib.h>
#include "include/m0.h"

M0_Interp * new_interp();

M0_CallFrame * new_call_frame( M0_Interp *interp );

int load_mob( M0_Interp *interp, const char *filename );

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

    if (!mob)
        return 0;

    return fclose( mob );
}

int run_ops(M0_Interp *interp, M0_CallFrame *cf) {

}

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf) {
    free( cf );
}

void interp_free( M0_Interp *interp ) {
    free( interp );
}
