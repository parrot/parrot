/* strnative.c

   Functions for handling strings in native byte format
   "Native" in this context means the equivalent of "LANG=C": No
   fancy multi-byte stuff, this is plain old byte-at-a-time. But
   we don't make any assumptions about what those bytes *mean*.
*/

#include "parrot.h"

static IV 
string_native_compute_strlen (STRING *s) {
    return s->buflen;
}

static IV 
string_native_max_bytes (IV x) {
    return x;
}

static STRING*
string_native_concat(STRING* a, STRING* b, IV flags) {
    if (flags && a->encoding != b->encoding) {
        /* Transcode */
    }

    /* b is now in native format */
    string_grow(a, a->strlen + b->strlen);
    Sys_Memcopy(a->bufstart + a->strlen, b->bufstart, b->strlen);
    a->strlen = a->buflen = a->bufused = a->strlen + b->strlen;
    return a;
}

static STRING*
string_native_chopn(STRING* s, IV n) {
    s->bufused -= n;
    s->strlen -= n;
    return s;
}

STRING_VTABLE 
string_native_vtable (void) {
    return (STRING_VTABLE) {
	string_native_compute_strlen,
    string_native_max_bytes,
    string_native_concat,
    string_native_chopn,
	    };
}
