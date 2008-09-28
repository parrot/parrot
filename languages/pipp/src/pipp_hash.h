/*
Copyright (C) 2008 The Perl Foundation.
$Id$
*/

#ifndef PARROT_PIPP_HASH_H_GUARD
#define PARROT_PIPP_HASH_H_GUARD

#include <stdio.h>
#include "parrot/parrot.h"

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

PippHashTable* PippHash_create(PARROT_INTERP,  UINTVAL size);

#endif /* PARROT_PIPP_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

