/*
Copyright (C) 2008 The Perl Foundation.
$Id$
*/

#ifndef PARROT_PIPP_HASH_H_GUARD
#define PARROT_PIPP_HASH_H_GUARD

#include "parrot/parrot.h"

#define PIPP_DEBUG

#ifdef PIPP_DEBUG
#  define dprintf(...) { \
    char *dbg = getenv("PMCDEBUG"); \
    if (dbg && strlen(dbg)) { \
        STRING *pstr = Parrot_sprintf_c(interp, __VA_ARGS__);  \
        char *str = string_to_cstring(interp, pstr);           \
        printf("%s", str);        \
        string_cstring_free(str);   \
    } \
}
#else
#  define dprintf(...)
#endif


typedef struct pipp_bucket {
    struct pipp_bucket * bucketPrev;
    struct pipp_bucket * bucketNext;
    struct pipp_bucket * tablePrev;
    struct pipp_bucket * tableNext;
    PMC                * value;
    STRING             * key;
    INTVAL             * hashval;
} PippBucket;

typedef struct pipp_hash_table {
    PippBucket ** buckets;
    PippBucket *  tableHead;
    PippBucket *  tableTail;
    PippBucket *  internalPointer;
    UINTVAL       elementCount;
    UINTVAL       capacity;
    UINTVAL       hashMask;
    INTVAL        nextIndex;
} PippHashTable;

PippHashTable* pipp_hash_create(PARROT_INTERP, UINTVAL size);
void           pipp_hash_destroy(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_empty(PARROT_INTERP, PippHashTable *ht);

void           pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht);

void           pipp_hash_renumber(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_resize(PARROT_INTERP, PippHashTable *ht, INTVAL new_size);

PippBucket*    pipp_hash_get_bucket(PARROT_INTERP, PippHashTable *ht, PMC *key);
PMC*           pipp_hash_get(PARROT_INTERP, PippHashTable *ht, PMC *key);
PippBucket*    pipp_hash_set(PARROT_INTERP, PippHashTable *ht, PMC *key, PMC *value);
INTVAL         pipp_hash_find(PARROT_INTERP, PippHashTable *ht, PMC *key);
void           pipp_hash_delete(PARROT_INTERP, PippHashTable *ht, PMC *key);

#endif /* PARROT_PIPP_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

