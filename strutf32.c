/* strutf32.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the UTF-32 string routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* Functions for handling strings in UTF-32 format */

/*=for api string_utf32 string_utf32_compute_strlen
   return the length of s
*/
static INTVAL
string_utf32_compute_strlen (STRING *s) {
    return s->buflen / 4;
}

/*=for api string_utf32 string_utf32_max_bytes
   return the max bytes needed for x characters.
*/
static INTVAL
string_utf32_max_bytes (INTVAL x) {
    return x * 4;
}

/*=for api string_utf32 string_utf32_concat
   concatenate two strings
*/
static STRING*
string_utf32_concat(STRING* a, STRING* b, INTVAL flags) {
    if (flags && a->encoding != b->encoding) {
        /* Transcode */
	STRING* t = b;
	b = string_make(NULL, 0, enc_utf32, 0, 0);
	(Parrot_transcode_table[t->encoding->which][enc_utf32])(t, b);
    }
    /* b is now in UTF-32 format */
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((ptrcast_t)a->bufstart + a->bufused), b->bufstart, b->bufused);
    a->strlen = a->strlen + b->strlen;
    a->bufused = a->bufused + b->bufused;
    return a;
}

/*=for api string_utf32 string_utf32_chopn
   remove the last n characters from s
*/
static STRING*
string_utf32_chopn(STRING* s, INTVAL n) {
    s->bufused -= n * 4;
    s->strlen -= n * 4;
    return s;
}

/*=for api string_utf32 string_utf32_substr
   substring out length characters from src starting from offset
   and store in dest.  Grow dest if needed.  Return dest
*/
static STRING*
string_utf32_substr(STRING* src, INTVAL offset, INTVAL length, STRING* dest)
{
    if (dest->encoding->which != enc_utf32) {
        /* It is now, matey. */
        dest->encoding = &(Parrot_string_vtable[enc_utf32]);
    }

    /* Offset and length have already been "normalized" */
    string_grow(dest, length);
    mem_sys_memcopy(dest->bufstart, (void*)((ptrcast_t)src->bufstart + offset * 4), length * 4);
    dest->strlen = length;
    dest->bufused = length * 4;

    return dest;
}

/*=for api string_utf32 string_utf32_vtable
   return the vtable for the native string
*/
STRING_VTABLE
string_utf32_vtable (void) {
    STRING_VTABLE sv = {
	enc_utf32,
	string_utf32_compute_strlen,
	string_utf32_max_bytes,
	string_utf32_concat,
	string_utf32_chopn,
	string_utf32_substr,
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
