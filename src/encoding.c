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
        return NULL;
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
