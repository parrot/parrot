/* string.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api definitions for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* Basic string stuff - creation, enlargement, destruction, etc. */

/*=for api string string_init
 * set up the native string vtable
 */
void
string_init(void) {
    Parrot_string_vtable[enc_native] = string_native_vtable();
}

/*=for api string string_make
 * allocate memory for the string, copy information into it
 * and compute its string length
 */
STRING *
string_make(void *buffer, INTVAL buflen, INTVAL encoding, INTVAL flags, INTVAL type) {
    STRING *s = mem_sys_allocate(sizeof(STRING));
    s->bufstart = mem_sys_allocate(buflen);
    mem_sys_memcopy(s->bufstart, buffer, buflen);
    s->encoding = &(Parrot_string_vtable[encoding]);
    s->buflen = s->bufused = buflen;
    s->flags = flags;
    string_compute_strlen(s);
    s->type = type;
    return s;
}

/*=for api string string_grow
 * reallocate memory for the string if it is too small
 */
void
string_grow(STRING* s, INTVAL newsize) {
    INTVAL newsize_in_bytes = string_max_bytes(s, newsize);
    if (s->buflen < newsize_in_bytes) {
        s->bufstart = mem_sys_realloc(s->bufstart, newsize_in_bytes);
    }
    s->buflen = newsize_in_bytes;
}

/*=for api string string_destroy
 * free the strings memory
 */
void
string_destroy(STRING *s) {
    mem_sys_free(s->bufstart);
    mem_sys_free(s);
}

/* Ordinary user-visible string operations */

/*=for api string string_length
 * return the length of the string
 */
INTVAL
string_length(STRING* s) {
    return s->strlen;
}

/*=for api string string_copy
 * create a copy of the argument passed in
 */
STRING*
string_copy(STRING *s) {
    return string_make(s->bufstart, s->buflen, s->encoding->which, s->flags, s->type);
}

/* vtable despatch functions */

#define ENC_VTABLE(x) x->encoding

/*=for api string string_compute_strlen
 * get the string length of the string
 */
INTVAL
string_compute_strlen(STRING* s) {
    return (s->strlen = (ENC_VTABLE(s)->compute_strlen)(s));
}

/*=for api string string_max_bytes
 * get the maximum number of bytes needed by iv characters
 */
INTVAL
string_max_bytes(STRING* s, INTVAL iv) {
    return (ENC_VTABLE(s)->max_bytes)(iv);
}

/*=for api string string_concat
 * concatenate two strings
 */
STRING* 
string_concat(STRING* a, STRING* b, INTVAL flags) {
    return (ENC_VTABLE(a)->concat)(a, b, flags);
}

/*=for api string string_substr
 * substr out the offset of src for length and store it in d.  Also return d.
 * Allocate memory for d if necessary.
 */
STRING*
string_substr(STRING* src, INTVAL offset, INTVAL length, STRING** d) {
    STRING *dest;
    if (offset < 0) {
        offset = src->strlen + offset;
    }
    if (offset < 0 || offset > src->strlen-1) { /* 0 based... */
        INTERNAL_EXCEPTION(SUBSTR_OUT_OF_STRING,
                           "Cannot take substr outside string")
    }
    if (length < 0) {
        length = 0;
    }
    if (length > (src->strlen - offset) ) {
        length = src->strlen - offset;
    }
    if (!d || !*d) {
        dest = string_make(NULL, 0, src->encoding->which, 0, 0);
    }
    else {
        dest = *d;
    }
    return (ENC_VTABLE(src)->substr)(src, offset, length, dest);   
}

/*=for api string string_chopn
 * chop the last n bytes off of s.
 */
STRING*
string_chopn(STRING* s, INTVAL n) {
    if (n > s->strlen) {
        n = s->strlen;
    }
    if (n < 0) {
        n = 0;
    }
    return (ENC_VTABLE(s)->chopn)(s, n);
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





