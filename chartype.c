/* chartype.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

static const CHARTYPE **chartype_array = NULL;
static int chartype_count = 0;

static void
chartype_init(void)
{
    chartype_count = enum_chartype_MAX;
    chartype_array = mem_sys_allocate(sizeof(CHARTYPE*) * chartype_count);
    chartype_array[enum_chartype_unicode] = &unicode_chartype;
    chartype_array[enum_chartype_usascii] = &usascii_chartype;
}

const CHARTYPE *
chartype_lookup(const char *name)
{
    int i;

    if (!chartype_array)
        chartype_init();
  
    for (i=0; i<chartype_count; i++) {
        if (chartype_array[i] && !strcmp(name, chartype_array[i]->name)) {
            return chartype_array[i];
        }
    }
    internal_exception(INVALID_CHARTYPE, "Invalid chartype '%s'\n", name);
    return NULL;
}

const CHARTYPE *
chartype_lookup_index(INTVAL n)
{
    if (!chartype_array)
        chartype_init();
    return chartype_array[n];
}

INTVAL
chartype_by_chartype(const CHARTYPE *chartype) {
    int i;
    if (!chartype_array)
        chartype_init();
    for (i = 0; i < chartype_count; i++) {
        if (chartype_array[i] == chartype) {
            return i;
        }
    }
    internal_exception(INVALID_CHARTYPE, "Invalid chartype pointer %p\n", chartype);
    return -1;
}

INTVAL
chartype_find_chartype(const char *name) 
{
    const CHARTYPE *type = chartype_lookup(name);
    if (type)
        return type->index;
    else
        return -1;
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
