/* unicode.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the US-ASCII character type routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static CHARTYPE_TRANSCODER
unicode_transcode_from(const char *from) {
    return from ? (CHARTYPE_TRANSCODER)NULL : (CHARTYPE_TRANSCODER)NULL; /* NOTE: This cheat silences unused var warnings on gcc */
}

static CHARTYPE_TRANSCODER
unicode_transcode_to(const char *to) {
    return to ? (CHARTYPE_TRANSCODER)NULL : (CHARTYPE_TRANSCODER)NULL; /* NOTE: This cheat silences unused var warnings on gcc */
}

static BOOLVAL
unicode_is_digit(INTVAL c) {
    return (BOOLVAL)(isdigit(c) ? 1 : 0); /* FIXME - Other code points are also digits */
}

static INTVAL
unicode_get_digit(INTVAL c) {
    return c - '0'; /* FIXME - many more digits than this... */
}

const CHARTYPE unicode_chartype = {
    "unicode",
    "utf32",
    unicode_transcode_from,
    unicode_transcode_to,
    unicode_is_digit,
    unicode_get_digit
};

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
