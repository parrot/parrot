/* encoding.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string encoding subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENCODING_H_GUARD)
#define PARROT_ENCODING_H_GUARD

/* &gen_from_enum(encodings.pasm) subst(s/enum_(\w+)/uc($1)/e) */
enum {
    enum_encoding_singlebyte,
    enum_encoding_utf8,
    enum_encoding_utf16,
    enum_encoding_utf32,
    enum_encoding_dbcs,
    enum_encoding_MAX
};

/* &end_gen */

struct string_iterator_t;

struct parrot_encoding_t {
    INTVAL index;
    const char *name;
    Parrot_UInt max_bytes;
    Parrot_UInt(*characters) (const void *ptr, Parrot_UInt bytes);
    Parrot_UInt(*decode) (const void *ptr);
    void *(*encode) (void *ptr, Parrot_UInt c);
    const void *(*skip_forward) (const void *ptr, Parrot_UInt n);
    const void *(*skip_backward) (const void *ptr, Parrot_UInt n);
    Parrot_UInt(*decode_and_advance) (struct string_iterator_t *i);
    void (*set_position)(struct string_iterator_t *i, Parrot_Int pos);
};

typedef struct parrot_encoding_t* Parrot_Encoding;
typedef const struct parrot_encoding_t* Parrot_Const_Encoding;

Parrot_Const_Encoding Parrot_encoding_lookup(const char *name);

#ifdef PARROT_IN_CORE

#define ENCODING struct parrot_encoding_t

#define encoding_lookup Parrot_encoding_lookup

#endif

void encoding_init(void);
void encoding_destroy(void);
const ENCODING *encoding_lookup_index(INTVAL n);

INTVAL encoding_find_encoding(const char *name);

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
