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

static const CHARTYPE *string_native_type;
static const CHARTYPE *string_unicode_type;

/* Basic string stuff - creation, enlargement, destruction, etc. */

/*=for api string string_init
 * set up the native string vtable
 */
void
string_init(void) {
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
}

/*=for api string string_make
 * allocate memory for the string, copy information into it
 * and compute its string length
 */
STRING *
string_make(struct Parrot_Interp *interpreter, void *buffer, INTVAL buflen, const ENCODING *encoding, INTVAL flags, const CHARTYPE *type) {
    STRING *s = new_string_header(interpreter);

    if (!type) {
      type = string_native_type;
    }

    if (!encoding) {
      encoding = encoding_lookup(type->default_encoding);
    }

    s->bufstart = mem_sys_allocate(buflen);
    mem_sys_memcopy(s->bufstart, buffer, buflen);
    s->encoding = encoding;
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
    free_string(s);
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
string_copy(struct Parrot_Interp *interpreter, STRING *s) {
    return string_make(interpreter, s->bufstart, s->bufused, s->encoding, s->flags, s->type);
}

/*=for api string string_transcode
 * create a transcoded copy of the argument passed in
 */
STRING*
string_transcode(struct Parrot_Interp *interpreter, STRING *src, const ENCODING *encoding, const CHARTYPE *type, STRING *dest) {
    if (!dest) {
        dest = string_make(interpreter, NULL, 0, encoding, 0, type);
    }
    else {
        dest->encoding = encoding;
        dest->type = type;
    }

    string_grow(dest, src->strlen);

    if (src->encoding == dest->encoding && src->type == dest->type) {
        mem_sys_memcopy(dest->bufstart, src->bufstart, src->bufused);

        dest->bufused = src->bufused;
    }
    else {
        CHARTYPE_TRANSCODER transcoder1 = NULL;
        CHARTYPE_TRANSCODER transcoder2 = NULL;
        char *srcstart;
        char *srcend;
        char *deststart;
        char *destend;

        if (src->type != dest->type) {
            transcoder1 = chartype_lookup_transcoder(src->type, dest->type);
            if (!transcoder1) {
                transcoder1 = chartype_lookup_transcoder(src->type, string_unicode_type);
                transcoder2 = chartype_lookup_transcoder(string_unicode_type, dest->type);
            }
        }

        srcstart = src->bufstart;
        srcend = srcstart + src->bufused;
        deststart = dest->bufstart;
        destend = deststart + dest->buflen;

        while (srcstart < srcend) {
            INTVAL c = src->encoding->decode(srcstart);

            if (transcoder1) c = transcoder1(c);
            if (transcoder2) c = transcoder2(c);

            deststart = dest->encoding->encode(deststart, c);

            srcstart = src->encoding->skip_forward(srcstart, 1);
        }

        dest->bufused = destend - deststart;
    }

    dest->strlen = src->strlen;

    return dest;
}

/* vtable despatch functions */

/*=for api string string_compute_strlen
 * get the string length of the string
 */
INTVAL
string_compute_strlen(STRING* s) {
    s->strlen = s->encoding->characters(s->bufstart, s->bufused);
    return s->strlen;
}

/*=for api string string_max_bytes
 * get the maximum number of bytes needed by iv characters
 */
INTVAL
string_max_bytes(STRING* s, INTVAL iv) {
    return iv * s->encoding->max_bytes;
}

/*=for api string string_concat
 * concatenate two strings
 */
STRING*
string_concat(struct Parrot_Interp *interpreter, STRING* a, STRING* b, INTVAL flags) {
    if (a->type != b->type || a->encoding != b->encoding) {
        b = string_transcode(interpreter, b, a->encoding, a->type, NULL);
    }
    string_grow(a, a->strlen + b->strlen);
    mem_sys_memcopy((void*)((ptrcast_t)a->bufstart + a->bufused), b->bufstart, b->bufused);
    a->strlen = a->strlen + b->strlen;
    a->bufused = a->bufused + b->bufused;
    return a;
}

/*=for api string string_substr
 * substr out the offset of src for length and store it in d.  Also return d.
 * Allocate memory for d if necessary.
 */
STRING*
string_substr(struct Parrot_Interp *interpreter, STRING* src, INTVAL offset, INTVAL length, STRING** d) {
    STRING *dest;
    char *substart;
    char *subend;
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
        dest = string_make(interpreter, NULL, 0, src->encoding, 0, src->type);
    }
    else {
        dest = *d;
    }
    substart = src->encoding->skip_forward(src->bufstart, offset);
    subend = src->encoding->skip_forward(substart, length);
    string_grow(dest, length);
    mem_sys_memcopy(dest->bufstart, substart, subend - substart);
    dest->bufused = subend - substart;
    dest->strlen = length;
    return dest;
}

/*=for api string string_chopn
 * chop the last n bytes off of s.
 */
STRING*
string_chopn(STRING* s, INTVAL n) {
    char *bufstart = s->bufstart;
    char *bufend = bufstart + s->bufused;
    if (n > s->strlen) {
        n = s->strlen;
    }
    if (n < 0) {
        n = 0;
    }
    bufend = s->encoding->skip_backward(bufend, n);
    s->bufused = bufend - bufstart;
    s->strlen = s->strlen - n;
    return s;
}

/*=for api string string_compare
 * compare two strings.
 */
INTVAL
string_compare(struct Parrot_Interp *interpreter, STRING* s1, STRING* s2) {
    char *s1start;
    char *s1end;
    char *s2start;
    char *s2end;
    INTVAL cmp = 0;

    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type, NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type, NULL);
    }

    s1start = s1->bufstart;
    s1end = s1start + s1->bufused;
    s2start = s2->bufstart;
    s2end = s2start + s2->bufused;

    while (cmp == 0 && s1start < s1end && s2start < s2end) {
        INTVAL c1 = s1->encoding->decode(s1start);
        INTVAL c2 = s2->encoding->decode(s2start);

        cmp = c1 - c2;

        s1start = s1->encoding->skip_forward(s1start, 1);
        s2start = s2->encoding->skip_forward(s2start, 1);
    }

    if (cmp == 0 && s1start < s1end) cmp = 1;
    if (cmp == 0 && s2start < s2end) cmp = -1;

    return cmp;
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





