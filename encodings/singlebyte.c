/* singlebyte.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
singlebyte_characters(const void *ptr, UINTVAL bytes)
{
    UNUSED(ptr);

    return bytes;
}

static UINTVAL
singlebyte_decode(const void *ptr)
{
    return *(const byte_t *)ptr;
}

static void *
singlebyte_encode(void *ptr, UINTVAL c)
{
    byte_t *bptr = (byte_t *)ptr;

    if (c > 255) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for single byte encoding\n");
    }

    *bptr = (byte_t)c;

    return bptr + 1;
}

static const void *
singlebyte_skip_forward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    return bptr + n;
}

static const void *
singlebyte_skip_backward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    return bptr - n;
}

const ENCODING singlebyte_encoding = {
    enum_encoding_singlebyte,
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
