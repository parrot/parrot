/* encoding.c
 *  Copyright: (When this is determined...it will go here)
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

const ENCODING *
encoding_lookup(const char *name)
{
    if (strcmp(name, "singlebyte") == 0) {
        return &singlebyte_encoding;
    }
    else if (strcmp(name, "utf8") == 0) {
        return &utf8_encoding;
    }
    else if (strcmp(name, "utf16") == 0) {
        return &utf16_encoding;
    }
    else if (strcmp(name, "utf32") == 0) {
        return &utf32_encoding;
    }
    else {
        internal_exception(INVALID_ENCODING, "Invalid encoding '%s'\n", name);
        return NULL;
    }
}

const ENCODING *
encoding_lookup_index(INTVAL n)
{
    if (!encoding_array[0]) {
        encoding_array[enum_encoding_singlebyte] = &singlebyte_encoding;
        encoding_array[enum_encoding_utf8] = &utf8_encoding;
        encoding_array[enum_encoding_utf16] = &utf16_encoding;
        encoding_array[enum_encoding_utf32] = &utf32_encoding;
    }
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
    if (strcmp(name, "singlebyte") == 0) {
        return enum_encoding_singlebyte;
    }
    else if (strcmp(name, "utf8") == 0) {
        return enum_encoding_utf8;
    }
    else if (strcmp(name, "utf16") == 0) {
        return enum_encoding_utf16;
    }
    else if (strcmp(name, "utf32") == 0) {
        return enum_encoding_utf32;
    }
    else {
        internal_exception(INVALID_ENCODING, "Invalid encoding '%s'\n", name);
        return 0;
    }
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
