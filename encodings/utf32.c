/* utf32.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
utf32_characters(const void *ptr, UINTVAL bytes)
{
    UNUSED(ptr);

    return bytes / 4;
}

static UINTVAL
utf32_decode(const void *ptr)
{
    const utf32_t *u32ptr = ptr;

    return *u32ptr;
}

static void *
utf32_encode(void *ptr, UINTVAL c)
{
    utf32_t *u32ptr = (utf32_t *)ptr;

    if (c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for UTF-32 encoding\n");
    }

    *u32ptr = c;

    return u32ptr + 1;
}

static const void *
utf32_skip_forward(const void *ptr, UINTVAL n)
{
    const utf32_t *u32ptr = (const utf32_t *)ptr;

    return u32ptr + n;
}

static const void *
utf32_skip_backward(const void *ptr, UINTVAL n)
{
    const utf32_t *u32ptr = (const utf32_t *)ptr;

    return u32ptr - n;
}

static UINTVAL
utf32_decode_and_advance(struct string_iterator_t *i)
{
    const utf32_t *u32ptr = (utf32_t *)((char *)i->str->strstart + i->bytepos);
    i->bytepos += 4;
    i->charpos++;
    return *u32ptr;
}

static void
utf32_set_position(struct string_iterator_t *i, Parrot_Int pos)
{
    i->charpos = pos;
    i->bytepos = pos * 4;
}

const ENCODING utf32_encoding = {
    enum_encoding_utf32,
    "utf32",
    4,
    utf32_characters,
    utf32_decode,
    utf32_encode,
    utf32_skip_forward,
    utf32_skip_backward,
    utf32_decode_and_advance,
    utf32_set_position
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
