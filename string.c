/* string.c
 *
 * String handling code
 *
 */

#include "parrot.h"

static STRING_VTABLE Parrot_string_vtable[enc_max];

/* Basic string stuff - creation, enlargement, destruction, etc. */

void
string_init(void) {
    Parrot_string_vtable[enc_native] = string_native_vtable();
}

STRING *
string_make(void *buffer, IV buflen, IV encoding, IV flags, IV type) {
    STRING *s = Sys_Allocate(sizeof(STRING));
    s->bufstart = Sys_Allocate(buflen);
    Sys_Memcopy(s->bufstart, buffer, buflen);
    s->encoding = encoding;
    s->buflen = s->bufused = buflen;
    s->flags = flags;
    string_compute_strlen(s);
    s->type = type;
    return s;
}

void
string_grow(STRING* s, IV newsize) {
    IV newsize_in_bytes = string_max_bytes(s, newsize);
    if (s->buflen < newsize_in_bytes)
        Sys_Realloc(s->bufstart, newsize_in_bytes);
    s->buflen = newsize_in_bytes;
}

void
string_destroy(STRING *s) {
    Sys_Free(s->bufstart);
    Sys_Free(s);
}

/* Ordinary user-visible string operations */

IV
string_length(STRING* s) {
    return s->strlen;
}

STRING*
string_copy(STRING *s) {
    return string_make(s->bufstart, s->buflen, s->encoding, s->flags, s->type);
}

/* vtable despatch functions */

#define ENC_VTABLE(x) Parrot_string_vtable[x->encoding]

IV
string_compute_strlen(STRING* s) {
    return (s->strlen = (ENC_VTABLE(s).compute_strlen)(s));
}

IV
string_max_bytes(STRING* s, IV iv) {
    return (ENC_VTABLE(s).max_bytes)(iv);
}

STRING* 
string_concat(STRING* a, STRING* b, IV flags) {
    return (ENC_VTABLE(a).concat)(a, b, flags);
}

STRING*
string_chopn(STRING* s, IV n) {
    if (n > s->strlen)
        n = s->strlen;
    return (ENC_VTABLE(s).chopn)(s, n);
}
