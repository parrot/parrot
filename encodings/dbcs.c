/* dbcs.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the DBCS encoding routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *     All byte values above 127 are assumed to be lead bytes
 *     skip_backward cannot be implemented for DBCS
 *  References:
 */

#include "parrot/parrot.h"

typedef unsigned char byte_t;

static UINTVAL
dbcs_characters(const void *ptr, UINTVAL bytes)
{
    const byte_t *bptr = ptr;
    const byte_t *end = bptr + bytes;
    UINTVAL characters = 0;

    while (bptr < end) {
        if (*bptr > 127) 
            bptr += 2;
        else
            bptr++;
        characters++;
    }

    return characters;
}

static UINTVAL
dbcs_decode(const void *ptr)
{
    byte_t byte1 = *(const byte_t *)ptr;
    if (byte1 < 128)
        return byte1;
    else {
        byte_t byte2 = *((const byte_t *)ptr+1);
        return (byte1 << 8) | byte2;
    }
}

static void *
dbcs_encode(void *ptr, UINTVAL c)
{
    byte_t *bptr = (byte_t *)ptr;

    if (c < 128)
        *bptr++ = (byte_t)c;
    else {
        if (c >> 8 > 255 || c >> 8 < 128) {
            internal_exception(INVALID_CHARACTER,
                               "Invalid character for DBCS encoding\n");
        }
        else {
            *bptr++ = c >> 8;
            *bptr++ = c & 0xFF;
        }
    }

    return bptr;
}

static const void *
dbcs_skip_forward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    while (n--) {
        if (*bptr > 127)
            bptr += 2;
        else
            bptr++;
    }

    return bptr;
}

static const void *
dbcs_skip_backward(const void *ptr, UINTVAL n)
{
    internal_exception(INVALID_OPERATION,
                       "Undefined operation for DBCS encoding\n");
    return ptr;
}

const ENCODING dbcs_encoding = {
    enum_encoding_dbcs,
    "dbcs",
    1,
    dbcs_characters,
    dbcs_decode,
    dbcs_encode,
    dbcs_skip_forward,
    dbcs_skip_backward
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
