/* encoding.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the string encoding subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

extern const ENCODING singlebyte_encoding;
extern const ENCODING utf8_encoding;
extern const ENCODING utf16_encoding;
extern const ENCODING utf32_encoding;

static const ENCODING *encoding_array[enum_encoding_MAX];

static void
encoding_init(void)
{
    encoding_array[enum_encoding_singlebyte] = &singlebyte_encoding;
    encoding_array[enum_encoding_utf8] = &utf8_encoding;
    encoding_array[enum_encoding_utf16] = &utf16_encoding;
    encoding_array[enum_encoding_utf32] = &utf32_encoding;
}

const ENCODING *
encoding_lookup(const char *name)
{
    int i;

    if (!encoding_array[0])
        encoding_init();
  
    for (i=0; i<enum_encoding_MAX; i++) {
        if (strcmp(name, encoding_array[i]->name) == 0) {
            return encoding_array[i];
        }
    }
    internal_exception(INVALID_ENCODING, "Invalid encoding '%s'\n", name);
    return NULL;
}

const ENCODING *
encoding_lookup_index(INTVAL n)
{
    if (!encoding_array[0]) 
        encoding_init();
    return encoding_array[n];
}

INTVAL
encoding_by_encoding(const ENCODING *encoding) {
    int i;
    for (i = 0; i < enum_encoding_MAX && encoding_array[i]; i++) {
        if (encoding_array[i] == encoding) {
            return i;
        }
    }
    internal_exception(INVALID_ENCODING, "Invalid encoding pointer %p\n", encoding);
    return -1;
}

INTVAL
encoding_find_encoding(const char *name) 
{
    const ENCODING *enc = encoding_lookup(name);
    if (enc)
        return enc->index;
    else
        return -1;
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
