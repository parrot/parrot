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

=head2 Functions

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

=item C<void pipp_hash_destroy(INTERP, PippHashTable* ht)

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
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
