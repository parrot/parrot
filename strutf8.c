/* strutf8.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the UTF-8 string routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/unicode.h"

const char Parrot_utf8skip[256] = {
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* ascii */
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* ascii */
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* ascii */
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* ascii */
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* bogus */
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, /* bogus */
2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2, /* scripts */
3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,6,6,6,6, /* cjk etc. */
};

/* Functions for handling strings in UTF-8 format */

/*=for api string_utf8 string_utf8_compute_strlen
   return the length of s
*/
static INTVAL
string_utf8_compute_strlen (STRING *s) {
    INTVAL strlen = 0;
    utf8_t *start = s->bufstart;
    utf8_t *end = start + s->bufused;

    while (start < end) {
        start += UTF8SKIP(start);
        strlen++;
    }

    if (start > end) {
        INTERNAL_EXCEPTION(MALFORMED_UTF8, "Unaligned end in UTF-8 string\n");
    }

    return strlen;
}

/*=for api string_utf8 string_utf8_max_bytes
   return the max bytes needed for x characters.
*/
static INTVAL
string_utf8_max_bytes (INTVAL x) {
    return x * UTF8_MAXLEN;
}

/*=for api string_utf8 string_utf8_concat
   concatenate two strings
*/
static STRING*
string_utf8_concat(struct Parrot_Interp *interpreter, STRING* a, STRING* b, INTVAL flags) {
    if (flags && a->encoding != b->encoding) {
	/* Transcode */
	STRING* t = b;
	b = string_make(interpreter, NULL, 0, enc_utf8, 0, 0);
	(Parrot_transcode_table[t->encoding->which][enc_utf8])(t, b);
    }
    /* b is now in UTF-8 format */
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((ptrcast_t)a->bufstart + a->bufused), b->bufstart, b->bufused);
    a->strlen = a->strlen + b->strlen;
    a->bufused = a->bufused + b->bufused;
    return a;
}

/*=for api string_utf8 string_utf8_chopn
   remove the last n characters from s
*/
static STRING*
string_utf8_chopn(STRING* s, INTVAL n) {
    utf8_t *start = s->bufstart;
    utf8_t *end = start + s->bufused;

    s->strlen -= n;

    while (end >= start && n--) {
        end--;
        while (end >= start && UTF8_IS_CONTINUATION(*end)) end--;
    }

    if (n > 0) {
        INTERNAL_EXCEPTION(MALFORMED_UTF8, "Malformed UTF-8 string\n");
    }

    s->bufused = end - start;

    return s;
}

/*=for api string_utf8 string_utf8_substr
   substring out length characters from src starting from offset
   and store in dest.  Grow dest if needed.  Return dest
*/
static STRING*
string_utf8_substr(STRING* src, INTVAL offset, INTVAL length, STRING* dest)
{
    utf8_t *start;
    utf8_t *end;

    if (dest->encoding->which != enc_utf8) {
        /* It is now, matey. */
        dest->encoding = &(Parrot_string_vtable[enc_utf8]);
    }

    /* Offset and length have already been "normalized" */
    string_grow(dest, length);
    dest->strlen = length;
    for (start = src->bufstart; offset > 0; offset--) start += UTF8SKIP(start);
    for (end = start; length > 0; length--) end += UTF8SKIP(end);
    mem_sys_memcopy(dest->bufstart, start, end - start);
    dest->bufused = end - start;

    return dest;
}

/*=for api string_utf8 string_utf8_compare
   compare two strings
*/
static INTVAL
string_utf8_compare(STRING* s1, STRING* s2) {
    utf8_t *s1start = s1->bufstart;
    utf8_t *s1end = s1start + s1->bufused;
    utf8_t *s2start = s2->bufstart;
    utf8_t *s2end = s2start + s2->bufused;
    INTVAL cmp = 0;

    while (cmp == 0 && s1start < s1end && s2start < s2end) {
        utf32_t c1 = *s1start++;
        utf32_t c2 = *s2start++;

        if (UTF8_IS_START(c1)) {
            INTVAL len = UTF8SKIP(s1start - 1);
            INTVAL count;

            c1 &= UTF8_START_MASK(len);
            for (count = 1; count < len; count++) {
                if (!UTF8_IS_CONTINUATION(*s1start)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF8,
                                       "Malformed UTF-8 string\n");
                }
                c1 = UTF8_ACCUMULATE(c1, *s1start++);
            }
        }

        if (UTF8_IS_START(c2)) {
            INTVAL len = UTF8SKIP(s2start - 1);
            INTVAL count;

            c2 &= UTF8_START_MASK(len);
            for (count = 1; count < len; count++) {
                if (!UTF8_IS_CONTINUATION(*s2start)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF8,
                                       "Malformed UTF-8 string\n");
                }
                c2 = UTF8_ACCUMULATE(c1, *s2start++);
            }
        }

        cmp = c1 - c2;
    }

    if (cmp == 0 && s1start < s1end) cmp = 1;
    if (cmp == 0 && s2start < s2end) cmp = -1;

    return cmp;
}

/*=for api string_utf8 string_utf8_vtable
   return the vtable for the native string
*/
STRING_VTABLE
string_utf8_vtable (void) {
    STRING_VTABLE sv = {
	enc_utf8,
	string_utf8_compute_strlen,
	string_utf8_max_bytes,
	string_utf8_concat,
	string_utf8_chopn,
	string_utf8_substr,
	string_utf8_compare,
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
