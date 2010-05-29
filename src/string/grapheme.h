/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_GRAPHEME_H_GUARD
#define PARROT_GRAPHEME_H_GUARD

#if PARROT_HAS_ICU
#  include <unicode/uchar.h>

struct grapheme_t {
    UINTVAL  len;        /* Grapheme length in codepoints. */
    UChar32 *codepoints; /* UCS-4 codepoints that make up the grapheme */
    UINTVAL  hash;
};

typedef struct grapheme_t grapheme;

#endif /* PARROT_HAS_ICU */
#endif /* PARROT_GRAPHEME_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
