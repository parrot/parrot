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

#include <parrot/config.h>

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
 * Character classifications 
 */
/* 
 &gen_from_template(include/parrot/charclass.h)
  match{enum_charclass_(\w+)}
  eval{{
    if ($1 eq 'SLOW') {
        $var{slow} = 1;
    }
    elsif ($1 eq 'MAX') {
    }
    elsif ($var{slow}) {
      print "#define Parrot_char_is_$1(ct,c) \\\n";
      print " ct->is_charclass[enum_charclass_SLOW](ct,c,enum_charclass_$1)\n";
    }
    else {
      print "#define Parrot_char_is_$1(ct,c) \\\n";
      print " ct->is_charclass[enum_charclass_$1](ct,c,enum_charclass_$1)\n";
    }
  }}
 */
enum {
    enum_charclass_digit,
    enum_charclass_SLOW,
    enum_charclass_alnum,
    enum_charclass_alpha,
    enum_charclass_ascii,
    enum_charclass_blank,
    enum_charclass_cntrl,
    enum_charclass_graph,
    enum_charclass_lower,
    enum_charclass_print,
    enum_charclass_punct,
    enum_charclass_space,
    enum_charclass_upper,
    enum_charclass_xdigit,
    enum_charclass_MAX
};
/* &end_gen */

/* Generated file containing access macros */
#include "parrot/charclass.h"

typedef Parrot_Int (*Parrot_is_charclass)
           (const struct parrot_chartype_t *type,
            const Parrot_UInt c,
            const unsigned int charclass);

/*
 * Character code to digit value translation map
 */
struct chartype_digit_map_t {
    Parrot_UInt first_code;
    Parrot_UInt last_code;
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
    Parrot_Int index;
    const char *name;
    const char *default_encoding;
    Parrot_is_charclass is_charclass[enum_charclass_SLOW+1];
    Parrot_Int (*get_digit)
        (const struct parrot_chartype_t *type, Parrot_UInt c);
    const struct chartype_digit_map_t *digit_map;
    const struct chartype_unicode_map_t *unicode_map;
    /* These two are separate because they will be used most often */
    Parrot_CharType_Transcoder from_unicode;
    Parrot_CharType_Transcoder to_unicode;
    const struct chartype_transcoder_entry_t *transcoders;
};

typedef struct parrot_chartype_t* Parrot_CharType;
typedef const struct parrot_chartype_t* Parrot_Const_CharType;

#ifdef PARROT_IN_CORE

#define CHARTYPE struct parrot_chartype_t

void chartype_init(void);
void chartype_destroy(void);
const CHARTYPE * chartype_lookup_index(INTVAL n);
INTVAL chartype_find_chartype(const char *name);

Parrot_Int chartype_is_digit_map1(const CHARTYPE* type, const UINTVAL c,
                                  const unsigned int class);
Parrot_Int chartype_is_digit_mapn(const CHARTYPE* type, const UINTVAL c,
                                  const unsigned int class);
Parrot_Int chartype_get_digit_map1(const CHARTYPE* type, const UINTVAL c);
Parrot_Int chartype_get_digit_mapn(const CHARTYPE* type, const UINTVAL c);
Parrot_UInt chartype_transcode_nop(const struct parrot_chartype_t *from,
                                   const struct parrot_chartype_t *to,
                                   Parrot_UInt c);

typedef Parrot_CharType_Transcoder CHARTYPE_TRANSCODER;

Parrot_Const_CharType Parrot_chartype_lookup(const char *name);

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
