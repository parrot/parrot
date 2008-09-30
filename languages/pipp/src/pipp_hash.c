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
    PippIsInt  *isInt;

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

    /* Make sure buckets with keyIsInt are sane. */
    dprintf("Checking that cached keyInt values are consistent...\n");
    curr_bkt = ht->tableHead;
    while (element_count && (curr_bkt = curr_bkt->tableNext)) {
        isInt = pipp_hash_get_intval(interp, curr_bkt->key);
        if (isInt->isInt != curr_bkt->keyIsInt)
            Parrot_ex_throw_from_c_args(interp, NULL, -1, "PHPArray corruption: "
                    "A key is confused about if it's an int");
        if (curr_bkt->keyIsInt && curr_bkt->keyInt != isInt->intval)
            Parrot_ex_throw_from_c_args(interp, NULL, -1, "PHPArray corruption: "
                    "An int key has an incorrect value cached.");
    }

    /*Look for duplicate keys using a naive n^2 algorithm.  Performance isn't a
     *big concern, since this code won't be called very often.  */
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

    INTVAL curr_idx = 0;
    PippBucket *bkt;

    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        if (bkt->keyIsInt) {
            bkt->key     = string_from_int(interp, curr_idx);
            bkt->keyInt = curr_idx;
            curr_idx++;
        }
    }
    ht->nextIndex = curr_idx;

    /* If any indicies have changed, we need to rehash. */
    if (curr_idx)
        pipp_hash_rehash(interp, ht);
}

/*

=item C<void pipp_hash_rehash(INTERP, PippHashTable *ht)>

Recalculate the hash of each element, potentially placing it in another bucket.
This is used when a PippHash grows and has its hashMask changed.

=cut

*/

void pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht) {

    INTVAL bucket_idx;
    PippBucket *bkt;

    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        bucket_idx = bkt->hashValue & ht->hashMask;
        BUCKET_LIST_PREPEND(bkt, ht->buckets[bucket_idx]);
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
    ht->buckets  = mem_realloc_n_typed(ht->buckets, new_size, PippBucket*);
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
    bucket   = ht->buckets[key_hash & ht->hashMask];

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

=item C<PippBucket* pipp_hash_put(PARROT_INTERP, PippHashTable *ht, STRING *key, PMC *value)>

Store C<value>, indexed by C<key>, in the hash.  Return the bucket where
C<value> was stored.

=cut

*/

PippBucket* pipp_hash_put(PARROT_INTERP, PippHashTable *ht, STRING *key, PMC *value) {
    PippIsInt  *isInt;
    PippBucket *first_bucket, *curr_bucket;
    INTVAL      key_hash, bucket_idx;

    key_hash     = string_hash(interp, key, PIPP_HASH_SEED);
    bucket_idx   = key_hash & ht->hashMask;
    curr_bucket  = ht->buckets[bucket_idx];
    first_bucket = curr_bucket;
    isInt        = pipp_hash_get_intval(interp, key);

    /* If buckets[i] is empty or the item was not found create a new bucket.
     * Otherwise replace the values in the existing bucket.  */

    while (curr_bucket != NULL && !string_equal(interp, curr_bucket->key, key))
        curr_bucket = curr_bucket->bucketNext;

    /* If buckets[i] is empty or the key isn't there ... */
    if (curr_bucket == NULL) {

        first_bucket = mem_allocate_zeroed_typed(PippBucket);

        first_bucket->key       = key;
        first_bucket->value     = value;
        first_bucket->hashValue = key_hash;
        first_bucket->keyIsInt  = isInt->isInt;

        if (first_bucket->keyIsInt)
            first_bucket->keyInt = isInt->intval;

        BUCKET_LIST_PREPEND(first_bucket, ht->buckets[bucket_idx]);
        TABLE_LIST_APPEND(first_bucket, ht);
        curr_bucket = first_bucket;
    }
    /* Replace the contents of an existing bucket. */
    else {
        curr_bucket->key       = key;
        curr_bucket->value     = value;
        curr_bucket->hashValue = key_hash;
        curr_bucket->keyIsInt  = isInt->isInt;

        if (curr_bucket->keyIsInt)
            curr_bucket->keyInt = isInt->intval;
    }

    mem_sys_free(isInt);
    return curr_bucket;
}

/*

=item C<PippBucket* pipp_hash_find(INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return 1.  Otherwise return 0.

=cut

*/

INTVAL pipp_hash_find(PARROT_INTERP, PippHashTable *ht, STRING *key){
    return pipp_hash_get_bucket(interp, ht, key) != NULL;
}

/*

=item C<void pipp_hash_delete(INTERP, PippHashTable *ht, STRING *key)>

If there's a bucket in this hash with the key C<key>, it is deleted.  If
there's no matching bucket, nothing happens.

=cut

*/

void pipp_hash_delete(PARROT_INTERP, PippHashTable *ht, STRING *key){
    PippBucket *b;
    INTVAL      bucket_idx;

    b = pipp_hash_get_bucket(interp, ht, key);

    if (b != NULL) {
        bucket_idx = ht->hashMask & b->hashValue;
        TABLE_LIST_DELETE(b, ht);
        BUCKET_LIST_DELETE(b, ht->buckets[bucket_idx]);
        mem_sys_free(b);
    }
}

/*

=back

=head2 Miscellaneous Helper Functions

=over 4

=item C<PippIsInt* pipp_hash_get_intval(PARROT_INTERP, STRING *s)>

If C<s> looks like an INTVAL (i.e. /^([-]?[1-9][0-9]|0)*$/) and doesn't cause an
overflow, return a PippIsInt where C<p->intval> contains the INTVAL and
C<p->isInt> is true.  Otherwise, return a PippIsInt where C<p->isInt> is false
and C<p->intval> is undefined.

=cut

*/

PippIsInt* pipp_hash_get_intval(PARROT_INTERP, STRING *key) {
    PippIsInt          *isInt;
    INTVAL              overflow_check;
    UINTVAL             key_len, curr_idx, curr_char, negate;
    PippIntParserState  state;

    isInt    = mem_allocate_zeroed_typed(PippIsInt);
    key_len  = string_length(interp, key);
    curr_idx     = 0;
    isInt->isInt = 1;

    state = PIPS_START;
    /* This is basically equivalient to matching against /^([-]?[1-9][0-9]*|0)$/ */
    while (curr_idx < key_len) {
        curr_char = string_index(interp, key, curr_idx);
        switch (state) {
            case PIPS_START:
                if (curr_char == '-') {
                    negate = 1;
                    state  = PIPS_INT_CHAR;
                }
                else if (curr_char == '0' && key_len == 1) {
                    isInt->intval = 0;
                    isInt->isInt  = 1;
                    return isInt;
                }
                else if (curr_char >= '1' && curr_char <= '9') {
                    isInt->intval = curr_char - '0';
                    state         = PIPS_INT_CHAR;
                }
                else
                    state = PIPS_REJECT;
                break;

            case PIPS_INT_CHAR:
                if (curr_char >= '0' && curr_char <= '9') {
                    overflow_check  = isInt->intval;
                    overflow_check *= 10;
                    overflow_check += (curr_char - '0');
                    if (overflow_check > isInt->intval)
                        isInt->intval = overflow_check;
                    else
                        state = PIPS_REJECT;
                }
                else
                    state = PIPS_REJECT;
                break;

            case PIPS_ACCEPT:
                isInt->isInt = 1;
                return isInt;

            case PIPS_REJECT:
            default:
                isInt->isInt = 0;
                return isInt;

        }
        curr_idx++;
    }
    if (state == PIPS_REJECT) {
        isInt->isInt = 0;
        return isInt;
    }
    if (negate)
        isInt->intval = 0 - isInt->intval;
    return isInt;
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
