/* singlebyte.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the single byte encoding routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

typedef unsigned char byte_t;

static INTVAL
singlebyte_characters (const void *ptr, INTVAL bytes) {
    return bytes;
}

static INTVAL
singlebyte_decode (const void *ptr) {
    const byte_t *bptr = ptr;

    return *bptr;
}

static void *
singlebyte_encode (void *ptr, INTVAL c) {
    byte_t *bptr = ptr;

    if (c < 0 || c > 255) {
        INTERNAL_EXCEPTION(INVALID_CHARACTER,
                           "Invalid character for single byte encoding\n");
    }

    *bptr = c;

    return bptr + 1;
}

static void *
singlebyte_skip_forward (const void *ptr, INTVAL n) {
    byte_t *bptr = (byte_t*)ptr;

    return bptr + n;
}

static void *
singlebyte_skip_backward (const void *ptr, INTVAL n) {
    byte_t *bptr = (byte_t*)ptr;

    return bptr - n;
}

const ENCODING singlebyte_encoding = {
    "singlebyte",
    1,
    singlebyte_characters,
    singlebyte_decode,
    singlebyte_encode,
    singlebyte_skip_forward,
    singlebyte_skip_backward
};

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
