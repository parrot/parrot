/* strutf16.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the UTF-16 string routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/unicode.h"

/* Functions for handling strings in UTF-16 format */

/*=for api string_utf16 string_utf16_compute_strlen
   return the length of s
*/
static INTVAL
string_utf16_compute_strlen (STRING *s) {
    INTVAL strlen = 0;
    utf16_t *start = s->bufstart;
    utf16_t *end = start + s->bufused / sizeof(utf16_t);

    while (start < end) {
        start += UTF16SKIP(start);
        strlen++;
    }

    if (start > end) {
        INTERNAL_EXCEPTION(MALFORMED_UTF16, "Unaligned end in UTF-16 string\n");
    }

    return strlen;
}

/*=for api string_utf16 string_utf16_max_bytes
   return the max bytes needed for x characters.
*/
static INTVAL
string_utf16_max_bytes (INTVAL x) {
    return x * UTF16_MAXLEN;
}

/*=for api string_utf16 string_utf16_concat
   concatenate two strings
*/
static STRING*
string_utf16_concat(STRING* a, STRING* b, INTVAL flags) {
    if (flags && a->encoding != b->encoding) {
	/* Transcode */
	STRING* t = b;
	b = string_make(NULL, 0, enc_utf16, 0, 0);
	(Parrot_transcode_table[t->encoding->which][enc_utf16])(t, b);
    }
    /* b is now in UTF-16 format */
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((ptrcast_t)a->bufstart + a->bufused), b->bufstart, b->bufused);
    a->strlen = a->strlen + b->strlen;
    a->bufused = a->bufused + b->bufused;
    return a;
}

/*=for api string_utf16 string_utf16_chopn
   remove the last n characters from s
*/
static STRING*
string_utf16_chopn(STRING* s, INTVAL n) {
    utf16_t *start = s->bufstart;
    utf16_t *end = start + s->bufused;

    s->strlen -= n;

    while (end >= start && n--) {
        end--;
        if (UNICODE_IS_LOW_SURROGATE(*end)) {
            end--;
            if (!UNICODE_IS_HIGH_SURROGATE(*end)) {
                INTERNAL_EXCEPTION(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }
        }
        else if (UNICODE_IS_HIGH_SURROGATE(*end)) {
            INTERNAL_EXCEPTION(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }
    }

    if (n > 0) {
        INTERNAL_EXCEPTION(MALFORMED_UTF16, "Malformed UTF-16 string\n");
    }

    s->bufused = end - start;

    return s;
}

/*=for api string_utf16 string_utf16_substr
   substring out length characters from src starting from offset
   and store in dest.  Grow dest if needed.  Return dest
*/
static STRING*
string_utf16_substr(STRING* src, INTVAL offset, INTVAL length, STRING* dest)
{
    utf16_t *start;
    utf16_t *end;

    if (dest->encoding->which != enc_utf16) {
        /* It is now, matey. */
        dest->encoding = &(Parrot_string_vtable[enc_utf16]);
    }

    /* Offset and length have already been "normalized" */
    string_grow(dest, length);
    dest->strlen = length;
    for (start = src->bufstart; offset > 0; offset--) start += UTF16SKIP(start);
    for (end = start; length > 0; length--) end += UTF16SKIP(end);
    mem_sys_memcopy(dest->bufstart, start, end - start);
    dest->bufused = end - start;

    return dest;
}

/*=for api string_utf16 string_utf16_compare
   compare two strings
*/
static INTVAL
string_utf16_compare(STRING* s1, STRING* s2) {
    utf16_t *s1start = s1->bufstart;
    utf16_t *s1end = s1start + s1->bufused / sizeof(utf16_t);
    utf16_t *s2start = s2->bufstart;
    utf16_t *s2end = s2start + s2->bufused / sizeof(utf16_t);
    INTVAL cmp = 0;

    while (cmp == 0 && s1start < s1end && s2start < s2end) {
        utf32_t c1 = *s1start++;
        utf32_t c2 = *s2start++;

        if (UNICODE_IS_HIGH_SURROGATE(c1)) {
            c1 = UNICODE_DECODE_SURROGATE(c1, *s1start++);
        }
        if (UNICODE_IS_HIGH_SURROGATE(c2)) {
            c2 = UNICODE_DECODE_SURROGATE(c2, *s2start++);
        }

        cmp = c1 - c2;
    }

    if (cmp == 0 && s1start < s1end) cmp = 1;
    if (cmp == 0 && s2start < s2end) cmp = -1;

    return cmp;
}

/*=for api string_utf16 string_utf16_vtable
   return the vtable for the native string
*/
STRING_VTABLE
string_utf16_vtable (void) {
    STRING_VTABLE sv = {
	enc_utf16,
	string_utf16_compute_strlen,
	string_utf16_max_bytes,
	string_utf16_concat,
	string_utf16_chopn,
	string_utf16_substr,
	string_utf16_compare,
    };
    return sv;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
