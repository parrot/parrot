/* chartype.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string character type subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARTYPE_H_GUARD)
#define PARROT_ENCODING_H_GUARD

typedef UINTVAL (*CHARTYPE_TRANSCODER)(UINTVAL c);

typedef struct {
    const char *name;
    const char *default_encoding;
    CHARTYPE_TRANSCODER (*transcode_from)(const char *from);
    CHARTYPE_TRANSCODER (*transcode_to)(const char *to);
    BOOLVAL (*is_digit)(UINTVAL c);
    INTVAL (*get_digit)(UINTVAL c);
} CHARTYPE;

const CHARTYPE *
chartype_lookup(const char *name);

CHARTYPE_TRANSCODER
chartype_lookup_transcoder(const CHARTYPE *from, const CHARTYPE *to);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
