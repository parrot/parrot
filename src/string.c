/* string.c
 *
 * String handling code
 *
 */

#include "parrot.h"

STRING_VTABLE Parrot_string_vtable[enc_max];

STRING *
string_make(char *buffer, IV buflen, IV encoding, IV flags, IV type) {
    STRING *s = Sys_Allocate(sizeof(STRING));
    Sys_Memcopy(s->bufstart, buffer, buflen);
    s->encoding = encoding;
    s->buflen = buflen;
    s->flags = flags;
    string_compute_strlen(s);
    s->type = type;
    return s;
}

STRING *
string_grow_buffer(STRING* s, IV newsize);

/* Setup string vtables */
void
string_init(void) {
    Parrot_string_vtable[enc_native] = string_native_vtable();
}

/* vtable despatch functions */
IV
string_compute_strlen(STRING *s) {
    return (s->strlen = (Parrot_string_vtable[s->encoding].compute_strlen)(s));
}
