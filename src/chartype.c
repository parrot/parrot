/* chartype.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the string character type subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

extern const CHARTYPE usascii_chartype;
extern const CHARTYPE unicode_chartype;

const CHARTYPE *
chartype_lookup(const char *name)
{
    if (strcmp(name, "usascii") == 0) {
        return &usascii_chartype;
    }
    else if (strcmp(name, "unicode") == 0) {
        return &unicode_chartype;
    }
    else {
        return NULL;
    }
}

CHARTYPE_TRANSCODER
chartype_lookup_transcoder(const CHARTYPE *from, const CHARTYPE *to)
{
    CHARTYPE_TRANSCODER transcoder;

    if ((transcoder = from->transcode_to(to->name)) == NULL) {
        transcoder = to->transcode_from(from->name);
    }

    return transcoder;
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
