/* unicode.c
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

/* FIXME - need a multi-range digit map */
struct chartype_digit_map_t unicode_digit_map = { 0x30, 0x39, 0 };

static struct chartype_transcoder_entry_t unicode_transcoders[] = {
    { NULL, NULL, NULL }
};


CHARTYPE unicode_chartype = {
    enum_chartype_unicode,
    "unicode",
    "utf32",
    chartype_is_digit_map1,          /* is_digit() */
    chartype_get_digit_map1,         /* get_digit() */
    &unicode_digit_map,              /* digit_map */
    NULL,                            /* unicode_map */
    &chartype_transcode_nop,         /* from_unicode() */
    &chartype_transcode_nop,         /* to_unicode() */
    NULL                             /* other transcoders */
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
