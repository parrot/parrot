/*
Copyright (C) 2008 The Perl Foundation.
$Id$

=head1 NAME

languages/pipp/src/pipp_hash.c - core functions and data structs for the
PHPArray PMC

=head1 DESCRIPTION

A hashtable contains an array of bucket indexes. Buckets are nodes in a
linked list, each containing a C<void *> key and value. During hash
creation, the type of the value can be set.  All keys are stored as STRINGs.

=head2 Initialization and Finalization Functions

=over 4

=cut

*/

#include "pipp_hash.h"

/*

=item C<PippHashTable* pipp_hash_create(INTERP, size)>

Create and initialize a new PippHash with at least C<size> buckets.

=cut

*/


PippHashTable* pipp_hash_create(PARROT_INTERP, UINTVAL size) {
    UINTVAL        real_size;
    PippHashTable *ht;

    real_size = size;
    NEXT_POW_2(real_size);

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

=item C<void pipp_hash_destroy(INTERP, PippHashTable *ht)>

Non-recursively free all memory used by this PippHash.

=cut

*/

void pipp_hash_destroy(PARROT_INTERP, PippHashTable *ht) {

   pipp_hash_empty(interp, ht);
   mem_sys_free(ht->buckets);
   mem_sys_free(ht);
}

/*

=item C<void pipp_hash_empty(PARROT_INTERP, PippHashTable *ht)>

Delete all items from this PippHash, leaving the size unchanged.

=cut

*/

void pipp_hash_empty(PARROT_INTERP, PippHashTable *ht) {
   PippBucket *b1, *b2;

   b1 = ht->tableHead;
   while (b1 != NULL) {
       b2 = b1;
       b1 = b1->tableNext;
       mem_sys_free(b2);
   }
   memset(ht->buckets, '\0', ht->capacity);
   ht->tableHead = NULL;
   ht->tableTail = NULL;
   ht->elementCount = 0;
   ht->nextIndex = 0;
}

/*

=back

=head2 Debugging Functions

=over 4

=item C<void pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht)>

Iterate through the PippHash, making sure that everything's sane.  This
function is intended only for internal debugging.  If anything's goofy, a
exception with a descriptive message is thrown.

=cut

*/

void pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht) {
    UINTVAL     count_tbl_fw, count_tbl_bk, count_bkt_ord, element_count, i;
    PippBucket *curr_bkt, *cmp_bkt;
    STRING     *curr_key;

    element_count = ht->elementCount;

    /* Check that ht->buckets points to a valid location. */
    dprintf("checking that buckets looks sane...\n");
    if (ht->buckets == NULL && ht->capacity != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: buckets is null in a non-empty hash");

    /* Check that capacity < elementCount and that elementCount is accurate. */
    if (ht->capacity <= ht->elementCount && ht->elementCount)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: element count >= capacity");

    /* Iterate through the table forward and backwards. */
    dprintf("checking element count by table order...\n");
    curr_bkt = ht->tableHead;
    count_tbl_fw = 0;
    while (element_count && (curr_bkt = curr_bkt->tableNext))
        count_tbl_fw++;

    curr_bkt = ht->tableTail;
    count_tbl_bk = 0;
    while (element_count && (curr_bkt = curr_bkt->tablePrev))
        count_tbl_bk++;

    if (count_tbl_fw != count_tbl_bk)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Backwards table order count"
                " is different from forward table order count.");
    if (count_tbl_fw != element_count)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Table order count is different "
                "from ht->elementCount.");

    /* Iterate by bucket order. */
    dprintf("checking element count by bucket order...\n");
    count_bkt_ord = 0;
    for (i = 0; i < ht->capacity; i++) {
        curr_bkt = ht->buckets[i];
        while (curr_bkt) {
            curr_bkt = curr_bkt->bucketNext;
            count_bkt_ord++;
            dprintf("found a pair in bucket #%d\n", i);
        }
    }

    if (count_bkt_ord != element_count)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Bucket order count is different "
                "from ht->elementCount.");

    /*Look for duplicate keys using a naive n^2 algorithm.  Performance isn't a
     *big concern, since this code won't be called very often.
     */
    dprintf("looking for duplicate keys...\n");
    if (ht->elementCount) {
        curr_bkt = ht->tableHead;
        curr_key = curr_bkt->key;
        while (curr_bkt != ht->tableTail) {
            cmp_bkt = curr_bkt->tableNext;
            while (cmp_bkt != NULL) {
                if (string_equal(interp, curr_bkt->key, cmp_bkt->key))
                    Parrot_ex_throw_from_c_args(interp, NULL, -1,
                            "PHPArray corruption: PHPArray contains duplicate keys.");
                cmp_bkt = cmp_bkt->tableNext;
            }
            curr_bkt = curr_bkt->tableNext;
        }
    }

    /* check that internalPointer is sane */
    dprintf("checking that ht->internalPointer points to something in this PHPArray...\n");
    if (ht->internalPointer != NULL) {
        curr_bkt = ht->tableHead;
        while (curr_bkt != NULL && curr_bkt != ht->internalPointer)
            curr_bkt = curr_bkt->tableNext;
        if (curr_bkt != ht->internalPointer)
            Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "PHPArray corruption: ht->internalPointer doesn't point to "
                    "an element of this PHPArray.");
    }
    dprintf("All sanity checks passed.\n");
}

/*

=back

=head2 Miscellaneous Housekeeping Functions

=over 4

=item C<void pipp_hash_renumber(INTERP, PippHashTable *ht)>

Renumber all numerically-indexed elements of this PippHash, starting from 0.
Numbering is done according to insertion order.

=cut

*/

void pipp_hash_renumber(PARROT_INTERP, PippHashTable *ht) {

    INTVAL curr_index = 0;
    PippBucket *bkt;

    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        if (bkt->key_is_int) {
            bkt->key = string_from_int(interp, curr_index);
            curr_index++;
        }
    }
    ht->nextIndex = curr_index;
}

/*

=item C<void pipp_hash_rehash(INTERP, PippHashTable *ht)>

Recalculate the hash of each element, potentially placing it in another bucket.
This is used when a PippHash grows and has its hashMask changed.

=cut

*/

void pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht) {

    INTVAL index;
    PippBucket *bkt;

    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        index = bkt->hashValue & ht->hashMask;
        BUCKET_LIST_PREPEND(bkt, ht->buckets[index]);
    }
}


/*

=item C<void pipp_hash_resize(INTERP, PippHashTable *ht, INTVAL resize)>

Increase the capacity and number of buckets of this PippHash.  It's a very good
idea to rehash after resizing.

=cut

*/

void pipp_hash_resize(PARROT_INTERP, PippHashTable *ht, INTVAL new_size) {

    NEXT_POW_2(new_size);
    ht->capacity = new_size;
    ht->buckets = mem_realloc_n_typed(ht->buckets, new_size, PippBucket*);
    ht->hashMask = new_size - 1;

}

/*

=back

=head2 Hash Manipulation Functions

=over 4

=item C<PippBucket* pipp_hash_get_bucket(INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return a pointer to it.  Otherwise
return NULL.

=cut

*/

PippBucket* pipp_hash_get_bucket(PARROT_INTERP, PippHashTable *ht, STRING *key){
    INTVAL key_hash, bucket_idx;
    PippBucket *bucket;

    key_hash = string_hash(interp, key, PIPP_HASH_SEED);
    bucket = ht->buckets[key_hash & ht->hashMask];

    while (bucket != NULL && !string_equal(interp, bucket->key, key))
        bucket = bucket->bucketNext;
    if (bucket)
        return bucket;
    return NULL;
}

/*

=item C<PMC* pipp_hash_get(PARROT_INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return the value of that bucket.
Otherwise return NULL.

=cut

*/

PMC* pipp_hash_get(PARROT_INTERP, PippHashTable *ht, STRING *key) {
    PippBucket *bucket;

    bucket = pipp_hash_get_bucket(interp, ht, key);
    if (bucket)
        return bucket->value;
    return PMCNULL;
}



/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
