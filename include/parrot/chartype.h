/* chartype.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

struct parrot_chartype_t;
typedef Parrot_UInt (*Parrot_CharType_Transcoder)
           (const struct parrot_chartype_t *from, 
            const struct parrot_chartype_t *to, 
            Parrot_UInt c);

/* &gen_from_enum(chartypes.pasm) subst(s/enum_(\w+)/uc($1)/e) */
enum {
    enum_chartype_usascii,
    enum_chartype_unicode,
    enum_chartype_MAX
};

/* &end_gen */

/*
 * Character code to digit value translation map
 */
struct chartype_digit_map_t {
    UINTVAL first_code;
    UINTVAL last_code;
    int first_value;
};

/*
 * Unicode mapping table
 * FIXME the design of this struct is not yet complete
 */
struct chartype_unicode_map_t;

/*
 * Transcoder table entry
 */
struct chartype_transcoder_entry_t {
    const char *from;
    const char *to;
    Parrot_CharType_Transcoder transcoder;
};


struct parrot_chartype_t {
    INTVAL index;
    const char *name;
    const char *default_encoding;
    Parrot_Int (*is_digit)
        (const struct parrot_chartype_t *type, Parrot_UInt c);
    Parrot_Int (*get_digit)
        (const struct parrot_chartype_t *type, Parrot_UInt c);
    const struct chartype_digit_map_t *digit_map;
    const struct chartype_unicode_map_t *unicode_map;
    /* These two are separate because they will be used most often */
    Parrot_CharType_Transcoder from_unicode;
    Parrot_CharType_Transcoder to_unicode;
    const struct chartype_transcoder_entry_t *transcoders;
};

#define Parrot_CharType struct parrot_chartype_t *

#ifdef PARROT_IN_CORE

#define CHARTYPE struct parrot_chartype_t

void chartype_init(void);
const CHARTYPE * chartype_lookup_index(INTVAL n);
INTVAL chartype_find_chartype(const char *name);

Parrot_Int chartype_is_digit_map1(const CHARTYPE* type, const UINTVAL c);
Parrot_Int chartype_get_digit_map1(const CHARTYPE* type, const UINTVAL c);
Parrot_Int chartype_is_digit_mapn(const CHARTYPE* type, const UINTVAL c);
Parrot_Int chartype_get_digit_mapn(const CHARTYPE* type, const UINTVAL c);
Parrot_UInt chartype_transcode_nop(const struct parrot_chartype_t *from, 
                                   const struct parrot_chartype_t *to, 
                                   Parrot_UInt c);

typedef Parrot_CharType_Transcoder CHARTYPE_TRANSCODER;

const Parrot_CharType Parrot_chartype_lookup(const char *name);

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
