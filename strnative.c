/* strnative.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the native string routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* Functions for handling strings in native byte format
   "Native" in this context means the equivalent of "LANG=C": No
   fancy multi-byte stuff, this is plain old byte-at-a-time. But
   we don't make any assumptions about what those bytes *mean*.
*/

/*=for api string_native string_native_compute_strlen
   return the length of s
*/
static INTVAL 
string_native_compute_strlen (STRING *s) {
    return s->bufused;
}

/*=for api string_native string_native_max_bytes
   return the max bytes needed for x characters.
*/
static INTVAL 
string_native_max_bytes (INTVAL x) {
    return x;
}

/*=for api string_native string_native_concat
   concatenate two strings
*/
static STRING*
string_native_concat(STRING* a, STRING* b, INTVAL flags) {
    if (flags && a->encoding != b->encoding) {
	/* Transcode */
	STRING* t = b;
	b = string_make(NULL, 0, enc_native, 0, 0);
	(Parrot_transcode_table[t->encoding->which][enc_native])(t, b);
    }
    /* b is now in native format */
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((ptrcast_t)a->bufstart + a->strlen), b->bufstart, b->strlen);
    a->strlen = a->bufused = a->strlen + b->strlen;
    return a;
}

/*=for api string_native string_native_chopn
   remove the last n characters from s
*/
static STRING*
string_native_chopn(STRING* s, INTVAL n) {
    s->bufused -= n;
    s->strlen -= n;
    return s;
}

/*=for api string_native string_native_substr
   substring out length characters from src starting from offset
   and store in dest.  Grow dest if needed.  Return dest
*/
static STRING*
string_native_substr(STRING* src, INTVAL offset, INTVAL length, STRING* dest)
{
    if (dest->encoding->which != enc_native) {
        /* It is now, matey. */
        dest->encoding = &(Parrot_string_vtable[enc_native]);
    }
    
    /* Offset and length have already been "normalized" */
    string_grow(dest, length);
    mem_sys_memcopy(dest->bufstart, (void*)((ptrcast_t)src->bufstart + offset), length);
    dest->strlen = dest->bufused = length;
    
    return dest;
}

/*=for api string_native string_native_compare
   compare two strings
*/
static INTVAL
string_native_compare(STRING* s1, STRING* s2) {
    INTVAL cmp;

    if (s1->bufused < s2->bufused) {
        cmp = memcmp(s1->bufstart, s2->bufstart, s1->bufused);
        if (cmp == 0) cmp == -1;
    }
    else {
        cmp = memcmp(s1->bufstart, s2->bufstart, s2->bufused);
        if (cmp ==0 && s1->bufused > s2->bufused) cmp = 1;
    }

    return cmp;
}

/*=for api string_native string_native_vtable
   return the vtable for the native string
*/
STRING_VTABLE 
string_native_vtable (void) {
    STRING_VTABLE sv = {
	enc_native,
	string_native_compute_strlen,
	string_native_max_bytes,
	string_native_concat,
	string_native_chopn,
	string_native_substr,
	string_native_compare,
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
