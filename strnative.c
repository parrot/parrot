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
static IV 
string_native_compute_strlen (STRING *s) {
    return s->buflen;
}

/*=for api string_native string_native_max_bytes
   return the max bytes needed for x characters.
*/
static IV 
string_native_max_bytes (IV x) {
    return x;
}

/*=for api string_native string_native_concat
   concatenate two strings
*/
static STRING*
string_native_concat(STRING* a, STRING* b, IV flags) {
    if (flags && a->encoding != b->encoding) {
	/* Transcode */
    }
    
    /* b is now in native format */
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((IV)a->bufstart + a->strlen), b->bufstart, b->strlen);
    a->strlen = a->bufused = a->strlen + b->strlen;
    return a;
}

/*=for api string_native string_native_chopn
   remove the last n characters from s
*/
static STRING*
string_native_chopn(STRING* s, IV n) {
    s->bufused -= n;
    s->strlen -= n;
    return s;
}

/*=for api string_native string_native_substr
   substring out length characters from src starting from offset
   and store in dest.  Grow dest if needed.  Return dest
*/
static STRING*
string_native_substr(STRING* src, IV offset, IV length, STRING* dest)
{
    if (dest->encoding->which != enc_native) {
        /* It is now, matey. */
        dest->encoding = &(Parrot_string_vtable[enc_native]);
    }
    
    /* Offset and length have already been "normalized" */
    string_grow(dest, length);
    mem_sys_memcopy(dest->bufstart, (void*)((IV)src->bufstart + offset), length);
    dest->strlen = dest->bufused = length;
    
    return dest;
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
