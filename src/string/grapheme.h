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

#define MIN_TABLE_LENGTH 1

struct grapheme_table_t {
    UINTVAL size; /* Total table size, in graphemes. */
    UINTVAL used; /* Number of slots used from the table. */
    grapheme graphemes[MIN_TABLE_LENGTH];
    /*
     * Not really a static array. When we need a bigger table, we just allocate
     * a bigger structure and keep going after the 'end' of the array.
     */
};

typedef struct grapheme_table_t grapheme_table;


#endif /* PARROT_HAS_ICU */
#endif /* PARROT_GRAPHEME_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
