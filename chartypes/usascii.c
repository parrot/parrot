/* usascii.c
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

static INTVAL
usascii_transcode_from_unicode(INTVAL c) {
    if (c < 0 || c > 127) {
        internal_exception(INVALID_CHARACTER, "Invalid character for US-ASCII");
    }
    return c;
}

static CHARTYPE_TRANSCODER
usascii_transcode_from(const char *from) {
    if (strcmp(from, "unicode") == 0) {
        return &usascii_transcode_from_unicode;
    }
    else {
        return NULL;
    }
}

static INTVAL
usascii_transcode_to_unicode(INTVAL c) {
    return c;
}

static CHARTYPE_TRANSCODER
usascii_transcode_to(const char *to) {
    if (strcmp(to, "unicode") == 0) {
        return &usascii_transcode_to_unicode;
    }
    else {
        return NULL;
    }
}

static BOOLVAL
usascii_is_digit(INTVAL c) {
    return (BOOLVAL)(isdigit(c));
}

static INTVAL
usascii_get_digit(INTVAL c) {
    return c - '0';
}

const CHARTYPE usascii_chartype = {
    "usascii",
    "singlebyte",
    usascii_transcode_from,
    usascii_transcode_to,
    usascii_is_digit,
    usascii_get_digit
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
