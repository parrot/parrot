/* usascii.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

struct chartype_digit_map_t usascii_digit_map = { 0x30, 0x39, 0 };

static UINTVAL
usascii_transcode_from_unicode(UINTVAL c)
{
    if (c > 127) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for US-ASCII");
    }
    return c;
}

CHARTYPE usascii_chartype = {
    enum_chartype_usascii,
    "usascii",
    "singlebyte",
    chartype_is_digit_map1,          /* is_digit() */
    chartype_get_digit_map1,         /* get_digit() */
    &usascii_digit_map,              /* digit_map */
    NULL,                            /* unicode_map */
    &usascii_transcode_from_unicode, /* from_unicode() */
    &chartype_transcode_nop,         /* to_unicode() */
    NULL                             /* transcoders */
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
