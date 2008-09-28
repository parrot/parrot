/*
Copyright (C) 2008 The Perl Foundation.
$Id$
*/

#include "pipp_hash.h"

PippHashTable* PippHash_create(PARROT_INTERP, UINTVAL size) {
    UINTVAL        real_size;
    PippHashTable *ht;

    real_size = size;
    /* find the highest power of 2 where x >= size */
    real_size--;
    real_size = (real_size >> 1)  | real_size;
    real_size = (real_size >> 2)  | real_size;
    real_size = (real_size >> 4)  | real_size;
    real_size = (real_size >> 8)  | real_size;
    real_size = (real_size >> 16) | real_size;
    real_size++;

    ht = mem_allocate_zeroed_typed(PippHashTable);

    ht->buckets = mem_allocate_n_zeroed_typed(real_size, PippBucket*);
    ht->capacity = real_size;
    ht->hashMask = real_size - 1;
    ht->elementCount = 0;
    ht->nextIndex = 0;
    ht->tableHead = NULL;
    ht->tableTail = NULL;

    return ht;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

