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

/* This list is based on Unicode 3.2 */
struct chartype_digit_map_t unicode_digit_map[] = {
   { 0x30, 0x39, 0 },       /* DIGIT ZERO..NINE */
   { 0x660, 0x669, 0 },     /* ARABIC-INDIC DIGIT ZERO..NINE */
   { 0x6F0, 0x6F9, 0 },     /* EXTENDED ARABIC-INDIC DIGIT ZERO..NINE */
   { 0x966, 0x96F, 0 },     /* DEVANAGARI DIGIT ZERO..NINE */
   { 0x9E6, 0x9EF, 0 },     /* BENGALI DIGIT ZERO..NINE */
   { 0xA66, 0xA6F, 0 },     /* GURMUKHI DIGIT ZERO..NINE */
   { 0xAE6, 0xAEF, 0 },     /* GUJARATI DIGIT ZERO..NINE */
   { 0xB66, 0xB6F, 0 },     /* ORIYA DIGIT ZERO..NINE */
   { 0xBE7, 0xBEF, 1 },     /* TAMIL DIGIT ONE..NINE */
   { 0xC66, 0xC6F, 0 },     /* TELUGU DIGIT ZERO..NINE */
   { 0xCE6, 0xCEF, 0 },     /* KANNADA DIGIT ZERO..NINE */
   { 0xD66, 0xD6F, 0 },     /* MALAYALAM DIGIT ZERO..NINE */
   { 0xE50, 0xE59, 0 },     /* THAI DIGIT ZERO..NINE */
   { 0xED0, 0xED9, 0 },     /* LAO DIGIT ZERO..NINE */
   { 0xF20, 0xF29, 0 },     /* TIBETAN DIGIT ZERO..NINE */
   { 0x1040, 0x1049, 0 },   /* MYANMAR DIGIT ZERO..NINE */
   { 0x1369, 0x1371, 1 },   /* ETHIOPIC DIGIT ONE..NINE */
   { 0x17E0, 0x17E9, 0 },   /* KHMER DIGIT ZERO..NINE */
   { 0x1810, 0x1819, 0 },   /* MONGOLIAN DIGIT ZERO..NINE */
   { 0xFF10, 0xFF19, 0 },   /* FULLWIDTH DIGIT ZERO..NINE */
   { 0x1D7CE, 0x1D7D7, 0 }, /* MATHEMATICAL BOLD DIGIT ZERO..NINE */
   { 0x1D7D8, 0x1D7E1, 0 }, /* MATHEMATICAL DOUBLE-STRUCK DIGIT ZERO..NINE */
   { 0x1D7E2, 0x1D7EB, 0 }, /* MATHEMATICAL SANS-SERIF DIGIT ZERO..NINE */
   { 0x1D7EC, 0x1D7F5, 0 }, /* MATHEMATICAL SANS-SERIF BOLD DIGIT ZERO..NINE */
   { 0x1D7F6, 0x1D7FF, 0 }, /* MATHEMATICAL MONOSPACE DIGIT ZERO..NINE */
   { 0, 0, -1 }
};

static struct chartype_transcoder_entry_t unicode_transcoders[] = {
    { NULL, NULL, NULL }
};

static INTVAL
unicode_is_charclass(const struct parrot_chartype_t *type, const Parrot_UInt c, 
                     const unsigned int class)
{
    switch (class) {
        case enum_charclass_digit:
            return chartype_is_digit_mapn(type, c, class);
    }
    internal_exception(INVALID_CHARCLASS, "Unknown character class <%d>\n", 
                       class);
    return 0;
}

CHARTYPE unicode_chartype = {
    enum_chartype_unicode,
    "unicode",
    "utf32",
    { 
        chartype_is_digit_mapn,      /* is_digit() */
        unicode_is_charclass         /* is_charclass() - slow version */
    },
    chartype_get_digit_mapn,         /* get_digit() */
    unicode_digit_map,               /* digit_map */
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
