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
#define PARROT_CHARTYPE_H_GUARD

typedef Parrot_UInt (*Parrot_CharType_Transcoder)(Parrot_UInt c);

struct parrot_chartype_t {
    const char *name;
    const char *default_encoding;
    Parrot_CharType_Transcoder (*transcode_from)(const char *from);
    Parrot_CharType_Transcoder (*transcode_to)(const char *to);
    Parrot_Bool (*is_digit)(Parrot_UInt c);
    Parrot_Int (*get_digit)(Parrot_UInt c);
};

#define Parrot_CharType struct parrot_chartype_t *

const Parrot_CharType Parrot_chartype_lookup(const char *name);

#ifdef PARROT_IN_CORE

#define CHARTYPE struct parrot_chartype_t
typedef Parrot_CharType_Transcoder CHARTYPE_TRANSCODER;

#define chartype_lookup Parrot_chartype_lookup

CHARTYPE_TRANSCODER chartype_lookup_transcoder(const CHARTYPE *from, 
                                               const CHARTYPE *to);

#endif

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
