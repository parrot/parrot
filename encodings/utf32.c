/* utf32.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the UTF-32 encoding routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/unicode.h"

#if 0
typedef unsigned long utf32_t;
#endif

static UINTVAL
utf32_characters (const void *ptr, UINTVAL bytes) {
    return bytes / 4;
}

static UINTVAL
utf32_decode (const void *ptr) {
    const utf32_t *u32ptr = ptr;

    return *u32ptr;
}

static void *
utf32_encode (const void *ptr, UINTVAL c) {
    utf32_t *u32ptr = (utf32_t*)ptr;

    if (c < 0 || c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        INTERNAL_EXCEPTION(INVALID_CHARACTER,
                           "Invalid character for UTF-32 encoding\n");
    }

    *u32ptr = c;

    return u32ptr + 1;
}

static void *
utf32_skip_forward (const void *ptr, UINTVAL n) {
    utf32_t *u32ptr = (utf32_t*)ptr;

    return u32ptr + n;
}

static void *
utf32_skip_backward (const void *ptr, UINTVAL n) {
    utf32_t *u32ptr = (utf32_t*)ptr;

    return u32ptr - n;
}

const ENCODING utf32_encoding = {
    "utf32",
    4,
    utf32_characters,
    utf32_decode,
    utf32_encode,
    utf32_skip_forward,
    utf32_skip_backward
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
