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

STRING_VTABLE 
string_native_vtable (void) {
    return (STRING_VTABLE) {
	string_native_compute_strlen,
	    };
}
