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

static UINTVAL
singlebyte_characters (const void *ptr, UINTVAL bytes) {
    return bytes;
}

static UINTVAL
singlebyte_decode (const void *ptr) {
    const byte_t *bptr = ptr;

    return *bptr;
}

static void *
singlebyte_encode (const void *ptr, UINTVAL c) {
    byte_t *bptr = (byte_t*)ptr;

    if (c > 255) {
        INTERNAL_EXCEPTION(INVALID_CHARACTER,
                           "Invalid character for single byte encoding\n");
    }

    *bptr = c;

    return bptr + 1;
}

static void *
singlebyte_skip_forward (void *ptr, UINTVAL n) {
    byte_t *bptr = (byte_t*)ptr;

    return bptr + n;
}

static void *
singlebyte_skip_backward (void *ptr, UINTVAL n) {
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
