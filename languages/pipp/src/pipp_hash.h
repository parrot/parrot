/*
Copyright (C) 2008 The Perl Foundation.
$Id$
*/

#ifndef PARROT_PIPP_HASH_H_GUARD
#define PARROT_PIPP_HASH_H_GUARD

#include "parrot/parrot.h"

/*arbitrary choice, as long as it stays constant */
#define PIPP_HASH_SEED 0xF0848EED

#define PIPP_DEBUG

#ifdef PIPP_DEBUG
#  define dprintf(...) { \
    char *dbg = getenv("PMCDEBUG"); \
    if (dbg && strlen(dbg)) { \
        STRING *pstr = Parrot_sprintf_c(interp, __VA_ARGS__);  \
        char *str = string_to_cstring(interp, pstr);           \
        fprintf(stderr, "%s", str);        \
        string_cstring_free(str);   \
    } \
}
#else
#  define dprintf(...)
#endif

#define PMC_type(pmc) ((pmc)->vtable->base_type)

#define BUCKET_LIST_PREPEND(b, list) \
    if ((list) == NULL) {                 \
        (list) = (b);                       \
        (b)->bucketNext = NULL;           \
        (b)->bucketPrev = NULL;           \
    }                                   \
    else {                              \
        (list)->bucketPrev = (b);           \
        (b)->bucketNext = (list);           \
        (b)->bucketPrev = NULL;           \
        (list) = (b);                       \
    }

#define TABLE_LIST_PREPEND(b, list)  \
    if ((list)->tableHead == NULL) {      \
        (list)->internalPointer = (b);      \
        (list)->tableHead = (b);            \
        (list)->tableTail = (b);            \
    }                                   \
    else {                              \
        (list)->tableHead->tablePrev = (b); \
        (b)->tableNext = (list)->tableHead; \
        (b)->tablePrev = NULL;            \
        (list)->tableHead = (b);            \
    }

#define TABLE_LIST_APPEND(b, list)   \
    if ((list)->tableHead == NULL) {      \
        (list)->internalPointer = (b);      \
        (list)->tableHead = (b);            \
        (list)->tableTail = (b);            \
    }                                   \
    else {                              \
        (list)->tableTail->tableNext = (b); \
        (b)->tablePrev = (list)->tableTail; \
        (b)->tableNext = NULL;            \
        (list)->tableTail = (b);            \
    }

#define TABLE_LIST_DELETE(b, list)  \
        (list)->internalPointer = (b)->tableNext;      \
    if ((list)->tableHead == (b))        \
        (list)->tableHead = (b)->tableNext; \
    else \
        (b)->tablePrev->tableNext = (b)->tableNext;     \
    if ((list)->tableTail == (b))        \
        (list)->tableTail = (b)->tablePrev; \
    else  \
        (b)->tableNext->tablePrev = (b)->tablePrev;     \

#define BUCKET_LIST_DELETE(b, list)  \
        if ((list) == (b))        \
        (list) = (b)->bucketNext; \
    else \
        (b)->bucketPrev->bucketNext = (b)->bucketNext;     \
    if ((b)->bucketNext != NULL)        \
        (b)->bucketNext->bucketPrev = (b)->bucketPrev; \

/* find the highest power of 2 where p >= i */
/* XXX: should have one more iteration on 64-bit systems */
#define NEXT_POW_2(i) \
    (i)--;\
    (i) = ((i) >> 1)  | (i);\
    (i) = ((i) >> 2)  | (i);\
    (i) = ((i) >> 4)  | (i);\
    (i) = ((i) >> 8)  | (i);\
    (i) = ((i) >> 16) | (i);\
    (i)++;\

/* Using KEY_hash_iterator_FLAGS causes Parrot_Key_nextkey_keyed try using
 * Special Magic in Parrot_Key_nextkey_keyed() intended for Hash PMCs. */

#define KEY_pipp_iterator_FLAG PObj_private7_FLAG

typedef struct pipp_bucket {
    struct pipp_bucket * bucketPrev;
    struct pipp_bucket * bucketNext;
    struct pipp_bucket * tablePrev;
    struct pipp_bucket * tableNext;
    PMC                * value;
    STRING             * key;
    INTVAL               hashValue;
    INTVAL               keyIsInt;
    INTVAL               keyInt;
} PippBucket;

typedef struct pipp_hash_table {
    PippBucket ** buckets;
    PippBucket *  tableHead;
    PippBucket *  tableTail;
    PippBucket *  internalPointer;
    PMC        *  iter;
    UINTVAL       elementCount;
    UINTVAL       capacity;
    UINTVAL       hashMask;
    INTVAL        nextIndex;
} PippHashTable;

/* Yay for the semipredicate problem. */
typedef struct pipp_is_int {
    INTVAL intval;
    char   isInt;
} PippIsInt;

typedef enum {
    PIPS_START,
    PIPS_INT_CHAR,
    PIPS_REJECT,
    PIPS_ACCEPT
} PippIntParserState;

PippHashTable* pipp_hash_create(PARROT_INTERP, UINTVAL size);
void           pipp_hash_destroy(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_empty(PARROT_INTERP, PippHashTable *ht);

void           pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht);

void           pipp_hash_renumber(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht);
void           pipp_hash_resize(PARROT_INTERP, PippHashTable *ht, INTVAL new_size);

PippBucket*    pipp_hash_get_bucket(PARROT_INTERP, PippHashTable *ht, STRING *key);
PMC*           pipp_hash_get(PARROT_INTERP, PippHashTable *ht, STRING *key);
PippBucket*    pipp_hash_put(PARROT_INTERP, PippHashTable *ht, STRING *key, PMC *value);
INTVAL         pipp_hash_find(PARROT_INTERP, PippHashTable *ht, STRING *key);
void           pipp_hash_delete(PARROT_INTERP, PippHashTable *ht, STRING *key);

PippBucket*    pipp_hash_push(PARROT_INTERP, PippHashTable *ht, PMC *p_val);
PMC*           pipp_hash_pop(PARROT_INTERP, PippHashTable *ht);
PMC*           pipp_hash_shift(PARROT_INTERP, PippHashTable *ht);
PippBucket*    pipp_hash_unshift(PARROT_INTERP, PippHashTable *ht, PMC *p_val);

void           pipp_hash_visit(PARROT_INTERP, PippHashTable *ht, visit_info *info);
void           pipp_hash_freeze(PARROT_INTERP, PippHashTable *ht, visit_info *info);
void           pipp_hash_thaw(PARROT_INTERP, PippHashTable *ht, visit_info *info);

PippIsInt*     pipp_hash_get_intval(PARROT_INTERP, STRING *key);

#endif /* PARROT_PIPP_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

